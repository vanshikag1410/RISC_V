`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 06:05:15 PM
// Design Name: 
// Module Name: instruction_fetch_unit
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


module instruction_fetch_unit(
            input clk,
            input reset,
            input [31:0] imm_address,
            input [31:0] imm_address_jump,
            input beq, input bneq, input bge, input blt, input jump,
            output reg [31:0] pc, output reg [31:0] curr_pc
    );
    
    // Loading address wrt command in PC
    always @(posedge clk)
    begin
        if (reset)
            pc <= 0;
        else if (beq || bneq || bge || blt)
            pc <= pc + imm_address;
        else if (jump)
            pc <= pc + imm_address_jump;  
        else
            pc <= pc + 4;          
    end 
    
    // Storing RA of PC
    always @(posedge clk)
    begin
        if (reset)
            curr_pc <= 0;
        else if (!reset & !jump)
            curr_pc <= pc + 4;
        else
            curr_pc <= curr_pc;
    end
    
endmodule
