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

## 🔧 Simulation Screenshot

![Simulation Output](./images/simulation_waveform.png)  
*Sample output of the swapping process in Vivado simulator*

## 🗂️ Schematics

- [Register File Schematic](#)  
- [Swap FSM Schematic](#)

## 🧪 Testbench

The testbench initializes two different values at memory locations `A` and `B`, sets the `swap` signal high, and validates whether the values are successfully exchanged in memory.

```verilog
// Sample test sequence
addr_A = 2'b01;
addr_B = 2'b10;
swap = 1'b1;
// Observe memory values post-swap
