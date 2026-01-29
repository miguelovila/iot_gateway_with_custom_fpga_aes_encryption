#ifndef ADT7420_DRIVER_H
#define ADT7420_DRIVER_H

#include "xil_types.h"

/*
 * ADT7420 digital temperature sensor driver (via Xilinx AXI IIC).
 *
 * Uses polled XIic_Send / XIic_Recv for I2C transfers.
 * Default 13-bit resolution (0.0625 °C per LSB).
 */

/* ADT7420 register addresses */
#define ADT7420_REG_TEMP   0x00   /* Temperature value MSB (+ LSB at 0x01) */
#define ADT7420_REG_STATUS 0x02
#define ADT7420_REG_CONFIG 0x03
#define ADT7420_REG_ID     0x0B

/* Common I2C addresses (depends on A0/A1 pin strapping) */
#define ADT7420_ADDR_A0_A1_LOW  0x48
#define ADT7420_ADDR_A0_HIGH    0x49
#define ADT7420_ADDR_A1_HIGH    0x4A
#define ADT7420_ADDR_A0_A1_HIGH 0x4B

/**
 * Initialize the IIC controller and store the sensor slave address.
 *
 * @param iic_device_id  Xilinx IIC device ID (typically 0).
 * @param sensor_addr    7-bit I2C address of the ADT7420.
 * @return XST_SUCCESS on success.
 */
int Adt7420_Init(u16 iic_device_id, u8 sensor_addr);

/**
 * Read the raw 16-bit temperature register.
 *
 * The returned value is in the ADT7420 native format (13-bit mode):
 *   bits [15:3] = 13-bit two's-complement temperature
 *   bits [2:0]  = flag / status bits
 *
 * To convert:  temp_celsius = (raw >> 3) / 16.0
 *
 * @param raw  Output: raw register value (MSB << 8 | LSB).
 * @return XST_SUCCESS on success, XST_FAILURE on I2C error.
 */
int Adt7420_ReadRaw(u16 *raw);

#endif
