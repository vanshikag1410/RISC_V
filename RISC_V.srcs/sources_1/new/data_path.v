`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 10:21:49 PM
// Design Name: 
// Module Name: data_path
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


module data_path(
        input clk,reset,
        input [4:0] read_reg_num1,
        input [4:0] read_reg_num2,
        input [4:0] write_reg_num1,
        input [5:0] alu_control,
        input jump,beq_control,bneq_control,
        input [31:0] imm_val,
        input [3:0] shamt,
        input lb, sw,
        input bgeq_control,blt_control,lui_control,
        input [31:0] imm_val_lui,
        output [4:0] read_data_addr_dm,
        output beq,bneq,bge,blt, 
        output [31:0] src1,src2,
        output [31:0] answer      
    );
    wire [31:0] read_data1;

    wire [31:0] read_data2;
    
    wire [4:0] read_data_addr_dm_2;
    
    wire [31:0] write_data_alu;    
    
    wire [31:0] data_out;
    
    wire [31:0]  data_out_2_dm;
    
    register_file_unit RFU(
        clk,reset,
        read_reg_num1,
        read_reg_num2,
        write_reg_num1,
        data_out,
        lb, sw,
        lui_control,
        imm_val_lui,
        jump,
        read_data1,
        read_data2,
        read_data_addr_dm_2,
        data_out_2_dm
    );
    
    alu alu_unit(
        read_data1,
        read_data2,
        alu_control,
        imm_val,shamt,
        write_data_alu);
        
        assign src1 = read_data1;
        assign src2 = read_data2;
        assign answer = write_data_alu;
        
endmodule
