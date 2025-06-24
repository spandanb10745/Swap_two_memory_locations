# Memory Swap System in Verilog

This project implements a hardware-based system to swap the contents of two memory locations using Verilog. The design is developed and simulated using Xilinx Vivado. It consists of modular components: a register file, multiplexer, control FSM, and a top-level integration module. The testbench verifies the functionality of the swap operation.

## 📁 Files Overview

| File               | Description                                                        |
|--------------------|--------------------------------------------------------------------|
| `reg_file.v`       | Implements a simple register file for read/write operations        |
| `mux_4x1_nbit.v`   | 4-to-1 multiplexer for N-bit input                                 |
| `swap_fsm.v`       | Finite State Machine controlling the swapping process              |
| `swap_reg_file.v`  | Top-level module connecting reg file, FSM, and mux                 |
| `swap_reg_file_tb.v`| Testbench verifying the full design functionality                 |

## 🧠 Project Description

Two memory addresses `A` and `B` are provided. The control FSM triggers a swap between their contents using a sequence of read/write operations controlled through multiplexers and internal states.

### Features

- Modular, scalable Verilog design
- Controlled data swap between any two memory locations
- Simulated using Vivado testbench
- Clean waveform verification


## 🗂️ Schematics

- [Register File Schematic]([#]https://github.com/user-attachments/assets/2e774643-8bb5-4605-abc5-8f3ef1abbb79)  
- [Desired Schematic](https://github.com/user-attachments/assets/34e36a0a-88d8-46f8-8e9b-f72b164ecb49)


## 🔧 Simulation Screenshot

![Simulation Output]([./images/simulation_waveform.png](https://github.com/user-attachments/assets/540860af-b279-4201-ae77-1c5896246fad))  
*Sample output of the swapping process in Vivado simulator*

