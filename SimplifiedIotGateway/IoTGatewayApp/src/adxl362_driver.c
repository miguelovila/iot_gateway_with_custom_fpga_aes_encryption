#include "adxl362_driver.h"
#include "xspi.h"

static XSpi SpiInstance;

/** Write a single register on the ADXL362. */
static void spi_write_reg(u8 reg, u8 val) {
    u8 buf[3] = { ADXL362_CMD_WRITE, reg, val };
    XSpi_SetSlaveSelect(&SpiInstance, 0x01);
    XSpi_Transfer(&SpiInstance, buf, NULL, 3);
}

int Adxl362_Init(u16 spi_device_id) {
    XSpi_Config *cfg = XSpi_LookupConfig(spi_device_id);
    if (cfg == NULL)
        return XST_FAILURE;

    int status = XSpi_CfgInitialize(&SpiInstance, cfg, cfg->BaseAddress);
    if (status != XST_SUCCESS)
        return status;

    XSpi_SetOptions(&SpiInstance, XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
    XSpi_Start(&SpiInstance);
    XSpi_IntrGlobalDisable(&SpiInstance);

    /* Wake the sensor: measurement mode */
    spi_write_reg(ADXL362_REG_POWER_CTL, ADXL362_MEASURE_ON);

    return XST_SUCCESS;
}

int Adxl362_ReadXYZ(s16 *x, s16 *y, s16 *z) {
    /*
     * Burst-read 6 data bytes starting at XDATA_L (0x0E).
     * SPI frame: [CMD][ADDR][D0][D1][D2][D3][D4][D5]  (8 bytes)
     * Response bytes [2..7] contain XDATA_L, XDATA_H, YDATA_L, ...
     */
    u8 tx[8] = { ADXL362_CMD_READ, ADXL362_REG_XDATA_L, 0, 0, 0, 0, 0, 0 };
    u8 rx[8];

    XSpi_SetSlaveSelect(&SpiInstance, 0x01);
    int status = XSpi_Transfer(&SpiInstance, tx, rx, 8);
    if (status != XST_SUCCESS)
        return XST_FAILURE;

    /* ADXL362 data is little-endian 12-bit, sign-extended to 16 bits */
    *x = (s16)((rx[3] << 8) | rx[2]);
    *y = (s16)((rx[5] << 8) | rx[4]);
    *z = (s16)((rx[7] << 8) | rx[6]);

    return XST_SUCCESS;
}
