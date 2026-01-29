#include "adt7420_driver.h"
#include "adxl362_driver.h"
#include "aes_driver.h"
#include "gpio_driver.h"
#include "platform.h"
#include "sleep.h"
#include "udp_driver.h"
#include "xaxiethernet.h"
#include "xil_printf.h"
#include "xllfifo.h"
#include "xparameters.h"

//#define DEBUG

#ifdef DEBUG
#define DBG(fmt, ...) xil_printf(fmt, ##__VA_ARGS__)
#else
#define DBG(fmt, ...)
#endif

/* Hardware base addresses */
#define FIFO_BASE XPAR_AXI_ETHERNET_0_FIFO_BASEADDR
#define ETH_BASE XPAR_AXI_ETHERNET_0_BASEADDR
#define LEDS_BASE XPAR_AXI_GPIO_LEDS_BASEADDR
#define BUTTONS_BASE XPAR_AXI_GPIO_BUTTONS_BASEADDR
#define SWITCHES_BASE XPAR_AXI_GPIO_SWITCHES_BASEADDR
#define AES_BASE XPAR_AXI_CUSTOM_AES_ACCEL_BASEADDR
#define IIC_DEVICE_ID 0
#define SPI_DEVICE_ID 0
#define TEMP_SENSOR_ADDR ADT7420_ADDR_A0_A1_HIGH /* 0x4B */

#ifndef XPAR_CPU_CORE_CLOCK_FREQ_HZ
#define XPAR_CPU_CORE_CLOCK_FREQ_HZ 100000000U
#endif

/* Network */
#define SRC_IP ((192 << 24) | (168 << 16) | (1 << 8) | 10)
#define DEST_IP ((192 << 24) | (168 << 16) | (1 << 8) | 255)

/* Sensor packet: 1 byte plaintext type + 16 bytes encrypted (one AES block) */
#define PKT_TYPE_SENSOR 0x01
#define AES_BLOCK_SIZE 16
#define WIRE_PKT_SIZE (1 + AES_BLOCK_SIZE)

/* AES-128 encryption key (pre-shared with receiver, mutable via 'K' command) */
static u8 aes_key[16] = {0x2B, 0x7E, 0x15, 0x16, 0x28, 0xAE, 0xD2, 0xA6,
                         0xAB, 0xF7, 0x15, 0x88, 0x09, 0xCF, 0x4F, 0x3C};

XLlFifo FifoInstance;
XAxiEthernet EthInstance;

/** Convert a hex ASCII character to its 4-bit value. Returns -1 on error. */
static int hex_nibble(char c) {
  if (c >= '0' && c <= '9')
    return c - '0';
  if (c >= 'A' && c <= 'F')
    return c - 'A' + 10;
  if (c >= 'a' && c <= 'f')
    return c - 'a' + 10;
  return -1;
}

/** Read the 64-bit RISC-V mcycle counter (handles 32-bit rollover). */
u64 get_time_cycles(void) {
  u32 lo, hi, hi2;
  do {
    asm volatile("csrr %0, mcycleh" : "=r"(hi));
    asm volatile("csrr %0, mcycle" : "=r"(lo));
    asm volatile("csrr %0, mcycleh" : "=r"(hi2));
  } while (hi != hi2);
  return ((u64)hi << 32) | lo;
}

/**
 * Build a 16-byte sensor payload (to be encrypted).
 *
 * Layout (plaintext, before AES):
 *   [0]    sequence number
 *   [1-2]  LED state    (big-endian u16)
 *   [3-4]  switch state (big-endian u16)
 *   [5]    button state (bits [4:0])
 *   [6-7]  temperature  (big-endian u16, ADT7420 raw 13-bit)
 *   [8-9]  accel X      (big-endian s16, ADXL362 12-bit, 1 mg/LSB)
 *   [10-11] accel Y     (big-endian s16)
 *   [12-13] accel Z     (big-endian s16)
 *   [14-15] reserved (zero)
 *
 * The packet type byte is prepended in plaintext BEFORE this block on the wire.
 */
static void build_sensor_payload(u8 *pkt, u8 seq, u16 leds, u16 switches,
                                 u8 buttons, u16 temp_raw, s16 accel_x,
                                 s16 accel_y, s16 accel_z) {
  for (int i = 0; i < AES_BLOCK_SIZE; i++)
    pkt[i] = 0;
  pkt[0] = seq;
  pkt[1] = (leds >> 8) & 0xFF;
  pkt[2] = leds & 0xFF;
  pkt[3] = (switches >> 8) & 0xFF;
  pkt[4] = switches & 0xFF;
  pkt[5] = buttons & 0x1F;
  pkt[6] = (temp_raw >> 8) & 0xFF;
  pkt[7] = temp_raw & 0xFF;
  pkt[8] = (accel_x >> 8) & 0xFF;
  pkt[9] = accel_x & 0xFF;
  pkt[10] = (accel_y >> 8) & 0xFF;
  pkt[11] = accel_y & 0xFF;
  pkt[12] = (accel_z >> 8) & 0xFF;
  pkt[13] = accel_z & 0xFF;
}

int main(void) {
  init_platform();

  /* Ethernet & FIFO */
  XLlFifo_Config *FifoConfig = XLlFfio_LookupConfig(FIFO_BASE);
  XLlFifo_CfgInitialize(&FifoInstance, FifoConfig, FifoConfig->BaseAddress);
  XLlFifo_IntClear(&FifoInstance, 0xFFFFFFFF);

  XAxiEthernet_Config *EthConfig = XAxiEthernet_LookupConfig(ETH_BASE);
  XAxiEthernet_CfgInitialize(&EthInstance, EthConfig, EthConfig->BaseAddress);
  XAxiEthernet_Reset(&EthInstance);
  usleep(100000);

  u32 Options = XAxiEthernet_GetOptions(&EthInstance);
  Options |= XAE_TRANSMITTER_ENABLE_OPTION;
  Options |= XAE_RECEIVER_ENABLE_OPTION;
  Options |= XAE_PROMISC_OPTION;
  XAxiEthernet_SetOptions(&EthInstance, Options);
  XAxiEthernet_Start(&EthInstance);

  u8 my_mac[6] = {0x00, 0x0A, 0x35, 0x00, 0x01, 0x02};
  Udp_Init(my_mac, SRC_IP, DEST_IP, 5000, 6000);

  /* GPIO */
  Leds_Init(LEDS_BASE);
  Buttons_Init(BUTTONS_BASE);
  Switches_Init(SWITCHES_BASE);

  /* AES */
  Aes_Init(AES_BASE);

  /* Temperature sensor */
  Adt7420_Init(IIC_DEVICE_ID, TEMP_SENSOR_ADDR);

  /* Accelerometer */
  Adxl362_Init(SPI_DEVICE_ID);

  /* Main loop state */
  char rx_buffer[100];
  u8 seq = 0;
  u32 send_delay_ms = 500;
  u64 tLast = get_time_cycles();

  xil_printf("System ready. Listening on port 6000...\r\n");

  while (1) {
    /* RX: command processing */
    int len = Udp_Receive(&FifoInstance, rx_buffer, 99);

    if (len > 0) {
      rx_buffer[len] = '\0';
      DBG("RX: %s\r\n", rx_buffer);

      /*
       * Command protocol (ASCII over UDP):
       *   L<n>              Toggle LED n (0-15)
       *   D<ms>             Set TX interval in milliseconds
       *   K<32 hex chars>   Set AES-128 key (e.g. K2B7E...3C)
       */
      if (rx_buffer[0] == 'L' || rx_buffer[0] == 'l') {
        if (rx_buffer[1] == 'R' || rx_buffer[1] == 'r') {
            Leds_Shift_Right()
            DBG("CMD: LED shifted rigt\r\n");
        } else if (rx_buffer[1] == 'L' || rx_buffer[1] == 'l') {
            Leds_Shift_Left();
            DBG("CMD: LED shifted left\r\n");
        } else {
          int led = 0;
          for (int i = 1; i < len; i++) {
            if (rx_buffer[i] >= '0' && rx_buffer[i] <= '9')
              led = led * 10 + (rx_buffer[i] - '0');
          }
          if (led >= 0 && led <= 15) {
            Leds_Toggle((u16)(1 << led));
            DBG("CMD: LED %d toggled -> 0x%04x\r\n", led, Leds_Get());
          }
        }
      } else if (rx_buffer[0] == 'D' || rx_buffer[0] == 'd') {
        int new_delay = 0;
        for (int i = 1; i < len; i++) {
          if (rx_buffer[i] >= '0' && rx_buffer[i] <= '9')
            new_delay = new_delay * 10 + (rx_buffer[i] - '0');
        }
        if (new_delay > 0) {
          send_delay_ms = new_delay;
          DBG("CMD: Delay -> %d ms\r\n", send_delay_ms);
        }
      } else if (rx_buffer[0] == 'K' || rx_buffer[0] == 'k') {
        if (len >= 33) {
          u8 new_key[16];
          int valid = 1;
          for (int i = 0; i < 16; i++) {
            int hi = hex_nibble(rx_buffer[1 + i * 2]);
            int lo = hex_nibble(rx_buffer[2 + i * 2]);
            if (hi < 0 || lo < 0) {
              valid = 0;
              break;
            }
            new_key[i] = (u8)((hi << 4) | lo);
          }
          if (valid) {
            for (int i = 0; i < 16; i++)
              aes_key[i] = new_key[i];
            DBG("CMD: AES key updated\r\n");
          }
        }
      }
    }

    /* TX: send encrypted sensor state at configured interval */
    u64 tNow = get_time_cycles();
    u64 elapsed = tNow - tLast;
    u64 required = (u64)XPAR_CPU_CORE_CLOCK_FREQ_HZ * send_delay_ms / 1000;

    if (elapsed >= required) {
      u16 leds = Leds_Get();
      u16 switches = Switches_Get();
      u8 buttons = Buttons_Get();
      u16 temp_raw = 0;
      Adt7420_ReadRaw(&temp_raw);

      s16 accel_x = 0, accel_y = 0, accel_z = 0;
      Adxl362_ReadXYZ(&accel_x, &accel_y, &accel_z);

      u8 pkt[AES_BLOCK_SIZE];
      u8 enc[AES_BLOCK_SIZE];
      build_sensor_payload(pkt, seq, leds, switches, buttons, temp_raw, accel_x,
                           accel_y, accel_z);
      Aes_Encrypt(aes_key, pkt, enc);

      /* Wire format: [type (plaintext)] [encrypted 16 bytes] */
      u8 wire[WIRE_PKT_SIZE];
      wire[0] = PKT_TYPE_SENSOR;
      for (int i = 0; i < AES_BLOCK_SIZE; i++)
        wire[1 + i] = enc[i];
      Udp_Send(&FifoInstance, (char *)wire, WIRE_PKT_SIZE);

      DBG("TX [%d]: leds=0x%04x sw=0x%04x btn=0x%02x temp=0x%04x ax=%d ay=%d "
          "az=%d\r\n",
          seq, leds, switches, buttons, temp_raw, accel_x, accel_y, accel_z);
      seq++;
      tLast = tNow;
    }
  }

  cleanup_platform();
  return 0;
}
