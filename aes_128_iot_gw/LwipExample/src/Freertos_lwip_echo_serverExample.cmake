set(AXIETHERNET_NUM_DRIVER_INSTANCES "")
set(EMACLITE_NUM_DRIVER_INSTANCES "axi_ethernetlite_0")
set(EMACLITE0_PROP_LIST "0x40e00000;0x1")
list(APPEND TOTAL_EMACLITE_PROP_LIST EMACLITE0_PROP_LIST)
set(EMACPS_NUM_DRIVER_INSTANCES "")
set(mig_7series_0_memory_0 "0x80000000;0x8000000")
set(microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0 "0x50;0x7fb0")
set(DDR mig_7series_0_memory_0)
set(CODE mig_7series_0_memory_0)
set(DATA mig_7series_0_memory_0)
set(TOTAL_MEM_CONTROLLERS "mig_7series_0_memory_0;microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0")
set(MEMORY_SECTION "MEMORY
{
	mig_7series_0_memory_0 : ORIGIN = 0x80000000, LENGTH = 0x8000000
	microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0 : ORIGIN = 0x50, LENGTH = 0x7fb0
}")
set(STACK_SIZE 0xa000)
set(HEAP_SIZE 0xa000)
