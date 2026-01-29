#ifndef ADXL362_DRIVER_H
#define ADXL362_DRIVER_H

#include "xil_types.h"

/*
 * ADXL362 3-axis MEMS accelerometer driver (via Xilinx AXI Quad SPI).
 *
 * Uses polled XSpi_Transfer for SPI transfers.
 * Default ±2 g range, 12-bit resolution, 1 mg/LSB.
 */

/* SPI commands */
#define ADXL362_CMD_WRITE  0x0A
#define ADXL362_CMD_READ   0x0B

/* Register addresses */
#define ADXL362_REG_DEVID_AD   0x00   /* Should read 0xAD */
#define ADXL362_REG_STATUS     0x0B
#define ADXL362_REG_XDATA_L    0x0E   /* 12-bit X acceleration (low byte)  */
#define ADXL362_REG_XDATA_H    0x0F
#define ADXL362_REG_YDATA_L    0x10
#define ADXL362_REG_YDATA_H    0x11
#define ADXL362_REG_ZDATA_L    0x12
#define ADXL362_REG_ZDATA_H    0x13
#define ADXL362_REG_FILTER_CTL 0x2C
#define ADXL362_REG_POWER_CTL  0x2D

/* POWER_CTL measurement mode */
#define ADXL362_MEASURE_ON     0x02

/**
 * Initialize the SPI controller, configure it as master, and wake
 * the ADXL362 into measurement mode.
 *
 * @param spi_device_id  Xilinx SPI device ID (typically 0).
 * @return XST_SUCCESS on success.
 */
int Adxl362_Init(u16 spi_device_id);

/**
 * Read all three 12-bit acceleration axes in one burst.
 *
 * Values are signed 16-bit, 1 mg/LSB at default ±2 g range.
 *
 * @param x  Output: X-axis acceleration (mg).
 * @param y  Output: Y-axis acceleration (mg).
 * @param z  Output: Z-axis acceleration (mg).
 * @return XST_SUCCESS on success, XST_FAILURE on SPI error.
 */
int Adxl362_ReadXYZ(s16 *x, s16 *y, s16 *z);

#endif
