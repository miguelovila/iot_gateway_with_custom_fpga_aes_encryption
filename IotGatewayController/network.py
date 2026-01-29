"""UDP listener thread with AES-128 ECB decryption, and command sender."""

import queue
import socket
import threading

from Crypto.Cipher import AES

from protocol import AES_BLOCK_SIZE, PKT_TYPE_SENSOR, WIRE_PKT_SIZE, parse_sensor_payload


class UdpListener(threading.Thread):
    """Daemon thread that receives encrypted sensor packets over UDP."""

    def __init__(self, state_queue: queue.Queue, host: str, port: int, key: bytes):
        super().__init__(daemon=True)
        self.state_queue = state_queue
        self.host = host
        self.port = port
        self.cipher = AES.new(key, AES.MODE_ECB)
        self._stop_event = threading.Event()

    def run(self) -> None:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind((self.host, self.port))
        sock.settimeout(1.0)

        while not self._stop_event.is_set():
            try:
                data, _addr = sock.recvfrom(1024)
            except socket.timeout:
                continue

            if len(data) != WIRE_PKT_SIZE:
                continue

            if data[0] != PKT_TYPE_SENSOR:
                continue

            plaintext = self.cipher.decrypt(data[1 : 1 + AES_BLOCK_SIZE])
            state = parse_sensor_payload(plaintext)
            if state is not None:
                self.state_queue.put(state)

        sock.close()

    def set_key(self, key: bytes) -> None:
        """Update the decryption key (thread-safe under CPython GIL)."""
        self.cipher = AES.new(key, AES.MODE_ECB)

    def stop(self) -> None:
        self._stop_event.set()


class UdpSender:
    """Sends plain-text ASCII commands to the FPGA gateway over UDP."""

    def __init__(self, dest_host: str, dest_port: int):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        self.dest = (dest_host, dest_port)

    def send(self, message: str) -> None:
        self.sock.sendto(message.encode("ascii"), self.dest)
