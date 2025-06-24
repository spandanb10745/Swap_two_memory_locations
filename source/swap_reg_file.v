`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 10:08:12
// Design Name: 
// Module Name: swap_reg_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module swap_reg_file
#(parameter ADDR_WIDTH= 7, DATA_WIDTH= 8)(
    input clk,reset_n,
    input we,
    input [ADDR_WIDTH-1:0] addr_w,addr_r,
    input [DATA_WIDTH-1:0] data_w,
    output [DATA_WIDTH-1:0] data_r,
    //inputs for swap functionality
    input [ADDR_WIDTH-1:0] addr_A, addr_B,
    input swap
    );
    
    wire [1:0] swap;
    wire w;
    wire [ADDR_WIDTH-1:0] MUX_READ_f,MUX_WRITE_f;
    
    reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) REG_FILE(
        .clk(clk),
        .we(w? 1'b1:we),
        .addr_w(MUX_WRITE_f),
        .addr_r(MUX_READ_f),
        .data_w(w? data_r:data_w),
        .data_r(data_r)
        );
        
     swap_fsm FSM0(clk,reset_n,swap,w,sel);
     
     mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_READ(addr_r,addr_A,addr_B,'b0,sel,MUX_READ_f);
     
     mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_WRITE(addr_w,'b0,addr_A,addr_B,sel,MUX_WRITE_f);
     
endmodule
