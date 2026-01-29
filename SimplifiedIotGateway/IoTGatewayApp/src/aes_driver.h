#ifndef AES_DRIVER_H
#define AES_DRIVER_H

#include "xil_types.h"

/*
 * AES-128 hardware accelerator driver.
 *
 * Drives the axi_custom_aes_128_accel IP via MMIO registers.
 * Encryption is blocking: Aes_Encrypt() returns after the core signals done.
 */

/* Register offsets */
#define AES_REG_CTRL   0x00
#define AES_REG_STATUS 0x04
#define AES_REG_KEY0   0x08
#define AES_REG_KEY1   0x0C
#define AES_REG_KEY2   0x10
#define AES_REG_KEY3   0x14
#define AES_REG_PT0    0x18
#define AES_REG_PT1    0x1C
#define AES_REG_PT2    0x20
#define AES_REG_PT3    0x24
#define AES_REG_CT0    0x28
#define AES_REG_CT1    0x2C
#define AES_REG_CT2    0x30
#define AES_REG_CT3    0x34

/* STATUS register bits */
#define AES_STATUS_DONE 0x01
#define AES_STATUS_BUSY 0x02

/** Store the peripheral base address and deassert start. */
void Aes_Init(u32 base_addr);

/**
 * Encrypt a single 128-bit block (blocking).
 *
 * @param key        16-byte encryption key.
 * @param plaintext  16-byte input block.
 * @param ciphertext 16-byte output buffer.
 */
void Aes_Encrypt(const u8 *key, const u8 *plaintext, u8 *ciphertext);

#endif
