`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 09:38:51
// Design Name: 
// Module Name: swap_fsm
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


module swap_fsm(
    input clk, reset_n,
    input swap,
    output w,
    output [1:0] sel
    );
    
    reg [1:0] state_reg, state_nxt;
    parameter s0= 0, s1= 1, s2= 2, s3= 3;
    
    //Sequential state register
    always@(posedge clk, negedge reset_n)
    begin
     if(~reset_n)
        state_reg<= s0;
     else
        state_reg<= state_nxt;
    end
    
    //Next state logic
    
    always@(*)
    begin
        state_nxt=state_reg;
        case(state_reg)
         s0:if(~swap) state_nxt= s0;
            else state_nxt= s1;
         s1:state_nxt= s2;
         s2:state_nxt= s3;
         s3:state_nxt= s0;
         default: state_nxt= s0;
        endcase
    end
    
    //output logic
    assign sel=state_reg;
    assign w=(state_reg != s0);
    
endmodule
