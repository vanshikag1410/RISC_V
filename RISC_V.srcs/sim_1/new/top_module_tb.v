`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 11:03:48 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb(
    );
    reg clk;
    reg reset;
    reg [4:0] address;
    reg [31:0] instruction_code;
    reg [7:0] instruction_code_2;
    reg [31:0] data_in_top;
    reg wr_en;
     wire [31:0] rs1,rs2,rd;
     top_module dut(clk,reset,rs1,rs2,rd);
     
    initial
        begin
            clk = 0;

         end
         
     always #10 clk = ~ clk;                

   initial
    begin
        reset = 1'b1;
        #100;
        reset = 1'b0;
     end
     
     always @(posedge clk)
        begin
            if (!reset)
                begin
                    $display ("TIME = %0t RS1 = %d RS2 = %d RD = %d",$time,rs1,rs2,rd);
                end
        end
        
endmodule
