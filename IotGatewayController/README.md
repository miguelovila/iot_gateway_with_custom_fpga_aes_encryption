# IoT Gateway Controller

Python tkinter application to receive and decrypt sensor data from the
IoT Gateway Application over UDP/Ethernet, and display the data in a GUI
window. Additionally, allows sending commands to the IoT Gateway
to toggle/rotate LEDs, change the transmission interval, and set the AES-128
encryption key.

## Packet Format and Command Protocol

**See specification in IoT Gateway Application README.md**

| Command | Format              | Example                              | Action                          |
|---------|---------------------|--------------------------------------|---------------------------------|
| L       | `L<n>`              | `L5`                                 | Toggle LED n (0-15)             |
| LR      | `LR`                | `LR`                                 | Rotate all LEDs right by 1       |
| LL      | `LL`                | `LL`                                 | Rotate all LEDs left by 1      |
| D       | `D<ms>`             | `D1000`                              | Set TX interval in milliseconds |
| K       | `K<32 hex chars>`   | `K2B7E151628AED2A6ABF7158809CF4F3C`  | Set AES-128 encryption key      |

## Running the Application

It is expected that you have already installed python3-tkinter on your system as this package is required
to run the GUI application and cannot be installed via pip inside a virtual environment. On Ubuntu/Debian systems, you can install it via:

```bash
sudo apt-get install python3-tk
```

Then you can setup a virtual environment and install the required packages:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

To run the application, execute:

```bash
python3 main.py
```
