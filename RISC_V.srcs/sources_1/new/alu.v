`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 10:22:08 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] src1,
    input [31:0] src2,
    input [5:0] alu_control,
    input [31:0] imm_val_r,
    input [3:0] shamt,
    output reg [31:0] result
    );
    
    always @(*)
        begin 
            case(alu_control)
                6'b000001 : result = src1 + src2;   // addition
                6'b000010 : result = src1 - src2;   //subtraction
                6'b000011 : result = src1 << src2;  // shift left logical
                6'b000100 : result = (src1 < src2)? 1:0;    // set less than
               // 6'b000101 : set less than unsigned
                6'b000110 : result = src1 ^ src2;   // xor
                6'b000111 : result = src1 >> src2;  // shift right logical
                6'b001000 : result = src1 >>> src2; // shift right arithmetic
                6'b001001 : result = src1 | src2;   // or
                6'b001011 : result = src1 & src2;   // and
             endcase
         end   
endmodule
