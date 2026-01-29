#include "adt7420_driver.h"
#include "xiic.h"

static XIic IicInstance;
static u8   CFG_SensorAddr;

int Adt7420_Init(u16 iic_device_id, u8 sensor_addr) {
    CFG_SensorAddr = sensor_addr;
    return XIic_Initialize(&IicInstance, iic_device_id);
}

int Adt7420_ReadRaw(u16 *raw) {
    u8 reg = ADT7420_REG_TEMP;
    u8 buf[2];
    unsigned sent, rcvd;

    sent = XIic_Send(IicInstance.BaseAddress, CFG_SensorAddr, &reg, 1, XIIC_STOP);
    if (sent != 1)
        return XST_FAILURE;

    rcvd = XIic_Recv(IicInstance.BaseAddress, CFG_SensorAddr, buf, 2, XIIC_STOP);
    if (rcvd != 2)
        return XST_FAILURE;

    *raw = ((u16)buf[0] << 8) | buf[1];
    return XST_SUCCESS;
}
