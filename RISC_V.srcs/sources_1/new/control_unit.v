`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 03:31:05 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
        input reset,
        input [6:0] funct7,
        input [2:0] funct3,
        input [6:0] opcode,
        output reg [5:0] alu_control,
        output reg lb,
        output reg mem_to_reg,
        output reg bneq_control,
        output reg beq_control,
        output reg bgeq_control,
        output reg blt_control,
        output reg jump,
        output reg sw,
        output reg lui_control
    );
    
    // RESET OPERATION
    always @(reset)
        begin
            if(reset)
                alu_control = 0;
        end
        
    // TYPE OF INSTRUCTION
    always @(funct7 or funct3 or opcode)
        begin
            if (opcode == 7'b0110011)
                begin
                    mem_to_reg = 0;
                    beq_control = 0;
                    bneq_control = 0;
                    blt_control = 0;
                    jump = 0;
                    lui_control = 0;
                
                case (funct3)
                    3'b000 : 
                        begin
                            // ADDITION
                            if (funct7 == 0)
                            alu_control = 6'b000001;
                            
                            // SUBTRACTION
                            else if (funct7 == 64)
                                alu_control = 6'b000010;
                        end
                        
                    3'b001 :
                        begin
                            // SHIFT LEFT LOGICAL
                            if (funct7 == 0)
                                alu_control = 6'b000011;
                        end
                        
                        // 3 and 4 funct3 are slt and sltu
                        
                    3'b100:
                        begin
                            // XOR
                            if(funct7 == 0)
                                alu_control = 6'b000110;
                        end
                        
                    3'b101: 
                        begin
                            // Shift Right Logical
                            if (funct7 == 0)
                                alu_control = 6'b000111;
                        end  
                 endcase  
             end           
        end
endmodule
