/*
 * IoT Gateway - Sensor Cluster Advertiser
 *
 * Initializes the network interface with DHCP (2s timeout),
 * falls back to a static IP, responds to ping, and broadcasts
 * a device name advertisement via UDP every 500 ms.
 */

#include <stdio.h>
#include <string.h>

#include "xparameters.h"
#include "netif/xadapter.h"
#include "platform_config.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "lwip/dhcp.h"
#include "lwip/sockets.h"
#include "FreeRTOS.h"
#include "task.h"

#define THREAD_STACKSIZE 1024

#define DEVICE_NAME       "Sensor Cluster 1"
#define ADVERTISE_PORT    5000
#define ADVERTISE_INTERVAL_MS 500
#define DHCP_TIMEOUT_MS   2000

/* Fallback static IP configuration */
#define STATIC_IP1   192
#define STATIC_IP2   168
#define STATIC_IP3   1
#define STATIC_IP4   1

#define STATIC_GW1   192
#define STATIC_GW2   168
#define STATIC_GW3   1
#define STATIC_GW4   254

#define STATIC_MASK1 255
#define STATIC_MASK2 255
#define STATIC_MASK3 255
#define STATIC_MASK4 0

static struct netif server_netif;

void lwip_init();

static void print_ip(char *msg, ip_addr_t *ip)
{
	xil_printf(msg);
	xil_printf("%d.%d.%d.%d\r\n",
		ip4_addr1(ip), ip4_addr2(ip),
		ip4_addr3(ip), ip4_addr4(ip));
}

static void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw)
{
	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

static void advertise_thread(void *p)
{
	(void)p;
	int sock;
	struct sockaddr_in dest;
	int optval = 1;

	sock = lwip_socket(AF_INET, SOCK_DGRAM, 0);
	if (sock < 0) {
		xil_printf("advertise: failed to create socket\r\n");
		vTaskDelete(NULL);
		return;
	}

	lwip_setsockopt(sock, SOL_SOCKET, SO_BROADCAST,
			&optval, sizeof(optval));

	memset(&dest, 0, sizeof(dest));
	dest.sin_family = AF_INET;
	dest.sin_port = htons(ADVERTISE_PORT);
	dest.sin_addr.s_addr = htonl(INADDR_BROADCAST);

	xil_printf("Broadcasting \"%s\" on UDP port %d every %d ms\r\n",
		DEVICE_NAME, ADVERTISE_PORT, ADVERTISE_INTERVAL_MS);

	while (1) {
		lwip_sendto(sock, DEVICE_NAME, strlen(DEVICE_NAME), 0,
			(struct sockaddr *)&dest, sizeof(dest));
		vTaskDelay(ADVERTISE_INTERVAL_MS / portTICK_RATE_MS);
	}
}

static void network_thread(void *p)
{
	(void)p;
	struct netif *netif = &server_netif;
	unsigned char mac[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };
	ip_addr_t ipaddr, netmask, gw;
	int mscnt = 0;

	xil_printf("\r\n--- IoT Gateway - Sensor Cluster ---\r\n");

	/* Start with zeroed addresses for DHCP */
	ipaddr.addr = 0;
	netmask.addr = 0;
	gw.addr = 0;

	if (!xemac_add(netif, &ipaddr, &netmask, &gw,
			mac, PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding network interface\r\n");
		vTaskDelete(NULL);
		return;
	}

	netif_set_default(netif);
	netif_set_up(netif);

	sys_thread_new("xemacif", (void(*)(void*))xemacif_input_thread,
			netif, THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);

	/* Try DHCP for DHCP_TIMEOUT_MS */
	xil_printf("Attempting DHCP...\r\n");
	dhcp_start(netif);

	while (mscnt < DHCP_TIMEOUT_MS) {
		vTaskDelay(DHCP_FINE_TIMER_MSECS / portTICK_RATE_MS);
		dhcp_fine_tmr();
		mscnt += DHCP_FINE_TIMER_MSECS;
		if (netif->ip_addr.addr) {
			xil_printf("DHCP success\r\n");
			break;
		}
	}

	/* Fallback to static IP if DHCP failed */
	if (!netif->ip_addr.addr) {
		xil_printf("DHCP timeout, using static IP\r\n");
		dhcp_stop(netif);
		IP4_ADDR(&(netif->ip_addr),  STATIC_IP1, STATIC_IP2, STATIC_IP3, STATIC_IP4);
		IP4_ADDR(&(netif->netmask),  STATIC_MASK1, STATIC_MASK2, STATIC_MASK3, STATIC_MASK4);
		IP4_ADDR(&(netif->gw),       STATIC_GW1, STATIC_GW2, STATIC_GW3, STATIC_GW4);
	}

	print_ip_settings(&(netif->ip_addr), &(netif->netmask), &(netif->gw));

	/* Start UDP broadcast advertisement */
	sys_thread_new("advertise", advertise_thread, NULL,
			THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);

	vTaskDelete(NULL);
}

static int main_thread()
{
	lwip_init();

	sys_thread_new("network", network_thread, NULL,
			THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);

	vTaskDelete(NULL);
	return 0;
}

int main()
{
	sys_thread_new("main", (void(*)(void*))main_thread, 0,
			THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
	vTaskStartScheduler();
	while (1)
		;
	return 0;
}
