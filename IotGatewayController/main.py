"""Entry point — creates the GUI and starts the network listener thread."""

import queue

from gui import FpgaMonitor
from network import UdpListener, UdpSender
from protocol import AES_KEY

UDP_LISTEN_HOST = "0.0.0.0"
UDP_LISTEN_PORT = 6000

FPGA_HOST = "192.168.1.255"
FPGA_CMD_PORT = 5000


def main() -> None:
    state_queue: queue.Queue = queue.Queue()

    listener = UdpListener(state_queue, UDP_LISTEN_HOST, UDP_LISTEN_PORT, AES_KEY)
    listener.start()

    sender = UdpSender(FPGA_HOST, FPGA_CMD_PORT)

    app = FpgaMonitor(state_queue, sender.send, listener.set_key)
    app.mainloop()

    listener.stop()


if __name__ == "__main__":
    main()
