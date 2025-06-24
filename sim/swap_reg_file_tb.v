`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 10:23:10
// Design Name: 
// Module Name: swap_reg_file_tb
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


module swap_reg_file_tb;

    parameter ADDR_WIDTH = 7;
    parameter DATA_WIDTH = 8;

    reg clk, reset_n;
    reg we;
    reg [ADDR_WIDTH-1:0] addr_w, addr_r;
    reg [DATA_WIDTH-1:0] data_w;
    wire [DATA_WIDTH-1:0] data_r;

    reg [ADDR_WIDTH-1:0] addr_A, addr_B;
    reg swap;

    integer i;

    // Clock generation
    localparam T = 10;
    always begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end

    // DUT instantiation
    swap_reg_file #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),
        .we(we),
        .addr_w(addr_w),
        .addr_r(addr_r),
        .data_w(data_w),
        .data_r(data_r),
        .addr_A(addr_A),
        .addr_B(addr_B),
        .swap(swap)
    );

    // Test sequence
    initial begin
        // Quick reset for 2 time units
        reset_n = 1'b0;
        #2;
        reset_n = 1'b1;
        swap = 1'b0;

        // Fill locations 20 to 29 with data equal to their address
        for (i = 20; i < 30; i = i + 1) begin
            @(negedge clk);
            addr_w = i;
            data_w = i;
            we = 1'b1;
        end

        we = 1'b0;

        // Perform a swap between address 22 and 28
        @(negedge clk);
        addr_A = 22;
        addr_B = 28;
        swap = 1'b1;

        repeat (3) @(negedge clk);
        swap = 1'b0;

        #25;
        $stop;
    end

endmodule
