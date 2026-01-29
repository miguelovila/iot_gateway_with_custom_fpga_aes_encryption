#ifndef UDP_DRIVER_H
#define UDP_DRIVER_H

#include "xil_types.h"
#include "xllfifo.h"

/*
 * Minimal raw UDP/IP/Ethernet driver.
 *
 * Builds and parses raw Ethernet frames over an AXI Ethernet + FIFO path.
 * No ARP, no fragmentation, broadcast-only TX.
 */

#define MAX_PACKET_SIZE 1600

/** Raw UDP/IP/Ethernet header (42 bytes). */
typedef struct __attribute__((packed)) {
    /* Ethernet (14 bytes) */
    u8  DestMac[6];
    u8  SrcMac[6];
    u16 EtherType;

    /* IPv4 (20 bytes) */
    u8  VerIhl;
    u8  Tos;
    u16 TotalLength;
    u16 Id;
    u16 FlagsFragOffset;
    u8  Ttl;
    u8  Protocol;
    u16 HeaderChecksum;
    u32 SrcIp;
    u32 DestIp;

    /* UDP (8 bytes) */
    u16 SrcPort;
    u16 DestPort;
    u16 UdpLength;
    u16 UdpChecksum;
} UdpPacketHeader;

/** Store network identity (MAC, IPs, ports) for subsequent TX/RX. */
void Udp_Init(u8 *my_mac, u32 my_ip, u32 dest_ip, u16 src_port, u16 dest_port);

/** Transmit a UDP payload as a broadcast Ethernet frame. */
void Udp_Send(XLlFifo *FifoInstance, char *payload, u32 payload_len);

/**
 * Non-blocking receive. Reads one frame from the FIFO, strips headers,
 * and copies the UDP payload into buffer.
 *
 * @return Number of payload bytes received, or 0 if nothing available.
 */
int Udp_Receive(XLlFifo *FifoInstance, char *buffer, u32 max_len);

#endif
