UART communication occurs between a transmitter (TX) and a receiver (RX). The data is sent bit-by-bit over a single wire.
Transmission Process

- Idle State:
- The line remains high (logic 1) when no data is being sent.
  
- Start Bit:
- The transmitter pulls the line low (logic 0) to indicate the start of transmission.
  
- Data Bits:
- The 8-bit data is transmitted LSB (Least Significant Bit) first.
- Each bit stays on the line for a duration determined by the baud rate.

- Optional Parity Bit (for error checking):
- Can be even parity (ensures an even number of 1s) or odd parity (ensures an odd number of 1s).
- Some implementations skip the parity bit entirely.
  
- Stop Bit:
- The line is set high (logic 1) to mark the end of the transmission.
- Usually 1 or 2 stop bits can be used.
  
- Back to Idle State:
- The line remains high, waiting for the next transmission.

Advantages of UART
- Simple Hardware Interface: Only TX and RX lines are required.
- No Clock Synchronization Needed: Operates asynchronously.
- Widely Used in Embedded Systems: Common in microcontrollers, FPGA, and VLSI chips.
- Supports Multiple Baud Rates: Flexible communication speed settings.

Limitations of UART
- Slower than SPI & I²C: Due to bit-by-bit transmission.
- Limited Distance Without Boosters: For longer distances, RS-485 is preferred.
- Requires Matching Baud Rate: Both sender and receiver must agree on settings.

Where UART is Used?
- Microcontrollers (Arduino, STM32, etc.)
- FPGA & VLSI Design
- Embedded Systems
- Serial Debugging & Logging
- Wireless Modules (Bluetooth, WiFi)


