"""Packet constants and parsing for FPGA sensor data."""

import struct

PKT_TYPE_SENSOR = 0x01
AES_BLOCK_SIZE = 16
WIRE_PKT_SIZE = 1 + AES_BLOCK_SIZE  # 17 bytes: 1 type + 16 encrypted

# Pre-shared AES-128 key (NIST FIPS-197 Appendix C.1 test vector)
AES_KEY = bytes([
    0x2B, 0x7E, 0x15, 0x16, 0x28, 0xAE, 0xD2, 0xA6,
    0xAB, 0xF7, 0x15, 0x88, 0x09, 0xCF, 0x4F, 0x3C,
])


class SensorState:
    """Parsed sensor payload from the FPGA gateway."""

    __slots__ = ("seq", "leds", "switches", "buttons", "temp_raw",
                 "accel_x", "accel_y", "accel_z")

    def __init__(self, seq: int, leds: int, switches: int, buttons: int,
                 temp_raw: int, accel_x: int, accel_y: int, accel_z: int):
        self.seq = seq
        self.leds = leds
        self.switches = switches
        self.buttons = buttons
        self.temp_raw = temp_raw
        self.accel_x = accel_x
        self.accel_y = accel_y
        self.accel_z = accel_z

    @property
    def temp_celsius(self) -> float:
        """Convert ADT7420 raw register value to degrees Celsius (13-bit mode).

        Bits [15:3] hold a 13-bit two's-complement value with 0.0625 °C / LSB.
        """
        signed = self.temp_raw if self.temp_raw < 0x8000 else self.temp_raw - 0x10000
        return (signed >> 3) / 16.0


def parse_sensor_payload(data: bytes) -> SensorState | None:
    """Parse a decrypted 16-byte sensor payload (type byte already stripped).

    Layout (big-endian):
        [0]    sequence number
        [1-2]  LED state    (u16)
        [3-4]  switch state (u16)
        [5]    button state (bits [4:0])
        [6-7]  temperature  (u16, ADT7420 raw 13-bit)
        [8-9]  accel X      (s16, ADXL362 12-bit, 1 mg/LSB)
        [10-11] accel Y     (s16)
        [12-13] accel Z     (s16)
        [14-15] reserved

    Returns None if the data is invalid.
    """
    if len(data) != AES_BLOCK_SIZE:
        return None

    seq = data[0]
    leds = struct.unpack("!H", data[1:3])[0]
    switches = struct.unpack("!H", data[3:5])[0]
    buttons = data[5] & 0x1F
    temp_raw = struct.unpack("!H", data[6:8])[0]
    accel_x = struct.unpack("!h", data[8:10])[0]
    accel_y = struct.unpack("!h", data[10:12])[0]
    accel_z = struct.unpack("!h", data[12:14])[0]

    return SensorState(seq, leds, switches, buttons, temp_raw,
                       accel_x, accel_y, accel_z)
