#include "udp_driver.h"
#include "xil_io.h"

static u8  CFG_SrcMac[6];
static u32 CFG_SrcIp;
static u32 CFG_DestIp;
static u16 CFG_SrcPort;
static u16 CFG_DestPort;

#define ETH_HDR_LEN 14
#define IP_HDR_LEN  20
#define UDP_HDR_LEN 8
#define TOTAL_HDR   (ETH_HDR_LEN + IP_HDR_LEN + UDP_HDR_LEN)

static u8 RxFrameRaw[MAX_PACKET_SIZE];

static u16 calc_ip_checksum(u16 *header, u32 length) {
    u32 sum = 0;
    while (length > 1) {
        sum += *header++;
        length -= 2;
    }
    if (length > 0)
        sum += *(u8 *)header;

    while (sum >> 16)
        sum = (sum & 0xFFFF) + (sum >> 16);

    return (u16)(~sum);
}

static u16 htons(u16 v) {
    return (v << 8) | (v >> 8);
}

static u32 htonl(u32 v) {
    return ((v & 0xFF) << 24) | ((v & 0xFF00) << 8) |
           ((v & 0xFF0000) >> 8) | ((v >> 24) & 0xFF);
}

void Udp_Init(u8 *my_mac, u32 my_ip, u32 dest_ip, u16 src_port, u16 dest_port) {
    for (int i = 0; i < 6; i++) CFG_SrcMac[i] = my_mac[i];
    CFG_SrcIp   = my_ip;
    CFG_DestIp  = dest_ip;
    CFG_SrcPort = src_port;
    CFG_DestPort = dest_port;
}

void Udp_Send(XLlFifo *FifoInstance, char *payload, u32 payload_len) {
    UdpPacketHeader pkt;
    u32 total_frame_len = sizeof(UdpPacketHeader) + payload_len;

    for (int i = 0; i < 6; i++) pkt.DestMac[i] = 0xFF;
    for (int i = 0; i < 6; i++) pkt.SrcMac[i]  = CFG_SrcMac[i];
    pkt.EtherType = htons(0x0800);

    pkt.VerIhl          = 0x45;
    pkt.Tos             = 0;
    pkt.TotalLength     = htons(IP_HDR_LEN + UDP_HDR_LEN + payload_len);
    pkt.Id              = 0;
    pkt.FlagsFragOffset = htons(0x4000);
    pkt.Ttl             = 64;
    pkt.Protocol        = 17;
    pkt.SrcIp           = htonl(CFG_SrcIp);
    pkt.DestIp          = htonl(CFG_DestIp);
    pkt.HeaderChecksum  = 0;
    pkt.HeaderChecksum  = calc_ip_checksum((u16 *)&pkt.VerIhl, IP_HDR_LEN);

    pkt.SrcPort     = htons(CFG_SrcPort);
    pkt.DestPort    = htons(CFG_DestPort);
    pkt.UdpLength   = htons(UDP_HDR_LEN + payload_len);
    pkt.UdpChecksum = 0;

    if (XLlFifo_iTxVacancy(FifoInstance) < total_frame_len) return;

    XLlFifo_Write(FifoInstance, (u8 *)&pkt, sizeof(UdpPacketHeader));
    XLlFifo_Write(FifoInstance, (u8 *)payload, payload_len);
    XLlFifo_TxSetLen(FifoInstance, total_frame_len);
}

int Udp_Receive(XLlFifo *FifoInstance, char *buffer, u32 max_len) {
    if (XLlFifo_RxOccupancy(FifoInstance) == 0)
        return 0;

    u32 rx_len = XLlFifo_RxGetLen(FifoInstance);
    if (rx_len > MAX_PACKET_SIZE) rx_len = MAX_PACKET_SIZE;
    XLlFifo_Read(FifoInstance, RxFrameRaw, rx_len);

    if (rx_len <= TOTAL_HDR)
        return 0;

    u32 payload_len = rx_len - TOTAL_HDR;
    if (payload_len > max_len) payload_len = max_len;

    for (u32 i = 0; i < payload_len; i++)
        buffer[i] = RxFrameRaw[TOTAL_HDR + i];

    return payload_len;
}
