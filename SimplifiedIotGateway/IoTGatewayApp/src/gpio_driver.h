#ifndef GPIO_DRIVER_H
#define GPIO_DRIVER_H

#include "xil_types.h"

/* AXI GPIO register offsets */
#define GPIO_DATA_OFFSET 0x00
#define GPIO_TRI_OFFSET  0x04

/* --- LEDs (16-bit output) --- */

/** Initialize LED controller. Sets all 16 outputs low. */
void Leds_Init(u32 base_addr);

/** Write all 16 LED outputs. Bit N controls LED N. */
void Leds_Set(u16 value);

/** @return Current 16-bit LED output state. */
u16 Leds_Get(void);

/** Toggle LEDs selected by mask (XOR with current state). */
void Leds_Toggle(u16 mask);

/** Make LEDs shift left by 1 */
void Leds_Shift_Right();

/** ake LEDs shift right by 1 */
void Leds_Shift_Left();

/* --- Push Buttons (5-bit input) --- */

/** Initialize push button controller as 5-bit input. */
void Buttons_Init(u32 base_addr);

/** @return Button states in bits [4:0]. */
u8 Buttons_Get(void);

/* --- DIP Switches (16-bit input) --- */

/** Initialize DIP switch controller as 16-bit input. */
void Switches_Init(u32 base_addr);

/** @return 16-bit switch state. Bit N corresponds to switch N. */
u16 Switches_Get(void);

#endif
