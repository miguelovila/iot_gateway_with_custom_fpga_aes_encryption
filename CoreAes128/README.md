# Core AES-128 Custom Implementation

Just a custom implementation of the AES-128 encryption algorithm in vhdl for processing only one block (16 bytes) at a time in an FPGA.

Not much more to say, really other than it is based on the FIPS-197 specification.

## Run Tests

To run the testbench simulations, you will need to have ghdl and surfer/gtkwave installed. You can personalize which viwewer to use by setting the VIEWER environment variable.

```bash
make test

make view

make clean
```
