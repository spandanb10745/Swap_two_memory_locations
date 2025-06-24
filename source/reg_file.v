`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 09:28:37
// Design Name: 
// Module Name: reg_file
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


module reg_file
#(parameter ADDR_WIDTH= 7, DATA_WIDTH= 8)(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr_w,addr_r,
    input [DATA_WIDTH-1:0] data_w,
    output [DATA_WIDTH-1:0] data_r
    );
    
    reg [DATA_WIDTH-1:0] memory [0:2 ** ADDR_WIDTH -1];
    always @(posedge clk)
    begin
        // Synchronous write port
        if(we)
        memory[addr_w]<=data_w;
    end
    //Asynchronous read port
    assign data_r= memory[addr_r];
endmodule
