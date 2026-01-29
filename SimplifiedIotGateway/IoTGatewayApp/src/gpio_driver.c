#include "gpio_driver.h"
#include "xil_io.h"

static u32 CFG_LedsBase;
static u32 CFG_ButtonsBase;
static u32 CFG_SwitchesBase;

/* --- LEDs --- */

void Leds_Init(u32 base_addr) {
    CFG_LedsBase = base_addr;
    Xil_Out32(CFG_LedsBase + GPIO_TRI_OFFSET, 0x0000);
    Xil_Out32(CFG_LedsBase + GPIO_DATA_OFFSET, 0x0000);
}

void Leds_Set(u16 value) {
    Xil_Out32(CFG_LedsBase + GPIO_DATA_OFFSET, value);
}

u16 Leds_Get(void) {
    return (u16)Xil_In32(CFG_LedsBase + GPIO_DATA_OFFSET);
}

void Leds_Toggle(u16 mask) {
    Leds_Set(Leds_Get() ^ mask);
}

void Leds_Shift_Left() {
    u16 val = Leds_Get();
    Leds_Set(((val << 1) | (val >> 15)) & 0xFFFF);
}

void Leds_Shift_Right() {
    u16 val = Leds_Get();
    Leds_Set(((val >> 1) | (val << 15)) & 0xFFFF);
}

/* --- Push Buttons --- */

void Buttons_Init(u32 base_addr) {
    CFG_ButtonsBase = base_addr;
    Xil_Out32(CFG_ButtonsBase + GPIO_TRI_OFFSET, 0x1F);
}

u8 Buttons_Get(void) {
    return (u8)(Xil_In32(CFG_ButtonsBase + GPIO_DATA_OFFSET) & 0x1F);
}

/* --- DIP Switches --- */

void Switches_Init(u32 base_addr) {
    CFG_SwitchesBase = base_addr;
    Xil_Out32(CFG_SwitchesBase + GPIO_TRI_OFFSET, 0xFFFF);
}

u16 Switches_Get(void) {
    return (u16)Xil_In32(CFG_SwitchesBase + GPIO_DATA_OFFSET);
}
