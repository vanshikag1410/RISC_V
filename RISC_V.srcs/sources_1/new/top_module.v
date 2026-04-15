`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 06:50:25 PM
// Design Name: 
// Module Name: top_module
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


module top_module( input clk,input reset,
        output [31:0] rs1,
        output [31:0] rs2,
        output [31:0] rd
    );
    wire [31:0] imm_val_top;
    wire [31:0] instruction;
    wire [31:0] pc;
    wire [5:0] alu_control;
    wire mem_to_reg;
    wire bneq_control;
    wire beq_control;
    wire jump;
    wire [31:0] read_data_addr_dm;
    wire [31:0] imm_val;
    wire lb,sw;
    wire [31:0] imm_val_branch_top;
    wire beq,bneq;
    wire bgeq_control;
    wire blt_control;
    wire bge,blt,lui_control;
    wire [31:0] imm_val_lui;
    wire [31:0] imm_val_jump;
    wire [31:0] current_pc;
    wire [31:0] immediate_value_store_temp;
    wire [31:0] immediate_value_store;
    wire [4:0] base_addr;
    wire [31:0] curr_pc;
    wire [31:0] src1,src2,answer;
    
    
    // INSTRUCTION FETCH UNIT
    instruction_fetch_unit IFU(
             clk,
             reset,
             imm_val_branch_top,
             imm_val_jump,
             beq, bneq, bge, blt, jump,
             pc, curr_pc);
             
     // INSTRUCTION MEMORY
     instruction_memory IMU(
         clk,
         reset,  pc,
         instruction);
         
     // CONTROL UNIT
     control_unit CU(
         reset,
        instruction [31:25],     // funct7
        instruction [14:12],    // funct3
        instruction [6:0],     // opcode
        alu_control,
        lb,
        mem_to_reg,
        bneq_control,
        beq_control,
        bgeq_control,
        blt_control,
        jump,
        sw,
        lui_control);
        
    // DATA PATH UNIT
    data_path DPU(
        clk,reset,
        instruction [19:15],
        instruction [24:20],
        instruction [11:7],
        alu_control,
        jump, beq_control, bneq_control,
        imm_val, imm_val[3:0],
        lb,sw,bgeq_control, blt_control,
        lui_control,imm_val_lui,
        read_data_addr_dm,
        beq,bneq,bge,blt,
        src1,src2,answer);
        
        assign rs1 = src1;
        assign rs2 = src2;
        assign rd = answer; 
    
endmodule
