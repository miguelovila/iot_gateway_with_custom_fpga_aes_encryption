#include "aes_driver.h"
#include "xil_io.h"

static u32 CFG_BaseAddr;

/** Pack 4 bytes (big-endian) into a 32-bit word. */
static u32 pack_bytes(const u8 *b) {
    return ((u32)b[0] << 24) | ((u32)b[1] << 16) | ((u32)b[2] << 8) | b[3];
}

/** Unpack a 32-bit word into 4 bytes (big-endian). */
static void unpack_bytes(u32 word, u8 *b) {
    b[0] = (word >> 24) & 0xFF;
    b[1] = (word >> 16) & 0xFF;
    b[2] = (word >> 8)  & 0xFF;
    b[3] =  word        & 0xFF;
}

void Aes_Init(u32 base_addr) {
    CFG_BaseAddr = base_addr;
    Xil_Out32(CFG_BaseAddr + AES_REG_CTRL, 0);
}

void Aes_Encrypt(const u8 *key, const u8 *plaintext, u8 *ciphertext) {
    Xil_Out32(CFG_BaseAddr + AES_REG_CTRL, 0);

    Xil_Out32(CFG_BaseAddr + AES_REG_KEY0, pack_bytes(&key[0]));
    Xil_Out32(CFG_BaseAddr + AES_REG_KEY1, pack_bytes(&key[4]));
    Xil_Out32(CFG_BaseAddr + AES_REG_KEY2, pack_bytes(&key[8]));
    Xil_Out32(CFG_BaseAddr + AES_REG_KEY3, pack_bytes(&key[12]));

    Xil_Out32(CFG_BaseAddr + AES_REG_PT0, pack_bytes(&plaintext[0]));
    Xil_Out32(CFG_BaseAddr + AES_REG_PT1, pack_bytes(&plaintext[4]));
    Xil_Out32(CFG_BaseAddr + AES_REG_PT2, pack_bytes(&plaintext[8]));
    Xil_Out32(CFG_BaseAddr + AES_REG_PT3, pack_bytes(&plaintext[12]));

    Xil_Out32(CFG_BaseAddr + AES_REG_CTRL, 1);

    while (!(Xil_In32(CFG_BaseAddr + AES_REG_STATUS) & AES_STATUS_DONE));

    unpack_bytes(Xil_In32(CFG_BaseAddr + AES_REG_CT0), &ciphertext[0]);
    unpack_bytes(Xil_In32(CFG_BaseAddr + AES_REG_CT1), &ciphertext[4]);
    unpack_bytes(Xil_In32(CFG_BaseAddr + AES_REG_CT2), &ciphertext[8]);
    unpack_bytes(Xil_In32(CFG_BaseAddr + AES_REG_CT3), &ciphertext[12]);

    Xil_Out32(CFG_BaseAddr + AES_REG_CTRL, 0);
}
