`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 07:04:29 PM
// Design Name: 
// Module Name: register_file_unit
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


module register_file_unit(
    input clk,reset,
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg_num1,
    input [31:0] write_data_dm,
    input lb, sw,
    input lui_control,
    input [31:0] lui_imm_val,
    input jump,
    output [31:0] read_data1,
    output [31:0] read_data2,
    output [4:0] read_data_addr_dm,
    output reg [31:0] data_out_2_dm
    );
    
    reg [31:0] reg_mem [31:0];
    wire [31:0] write_reg_dm;
    
    assign read_data_addr_dm = write_reg_num1;
    assign write_reg_dm = write_reg_num1;
    
    integer i;
    
    always @(posedge clk)
        begin
            if(reset)
                begin
                    for (i=0;i<32;i=i+1)
                        reg_mem[i] <= i;
                        data_out_2_dm = 0;
                end
        end
        
    assign read_data1 = reg_mem[read_reg_num1];
    assign read_data2 = reg_mem[read_reg_num2];
        
endmodule
