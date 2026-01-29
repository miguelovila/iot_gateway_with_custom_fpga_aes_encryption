#include "xaxiethernet.h"

XAxiEthernet_Config XAxiEthernet_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,axi-ethernet-7.2", /* compatible */
		0x40c00000, /* reg */
		0x0, /* xlnx,txcsum */
		0x0, /* xlnx,rxcsum */
		"mii", /* phy-mode */
		0x0, /* xlnx,txvlan-tran */
		0x0, /* xlnx,rxvlan-tran */
		0x0, /* xlnx,txvlan-tag */
		0x0, /* xlnx,rxvlan-tag */
		0x0, /* xlnx,txvlan-strp */
		0x0, /* xlnx,rxvlan-strp */
		0x0, /* xlnx,mcast-extend */
		0x1, /* xlnx,statistics-counters */
		0x0, /* xlnx,enable-avb */
		0x0, /* xlnx,enable-lvds */
		0x0, /* xlnx,enable-1588 */
		0x3e8, /* xlnx,speed-1-2p5 */
		0x0, /* xlnx,number-of-table-entries */
		0x1, /* xlnx,phyaddr */
		0xffff, /* interrupts */
		0xffff, /* interrupt-parent */
		0x44a00001 /* axistream-connected */
	},
	 {
		 NULL
	}
};