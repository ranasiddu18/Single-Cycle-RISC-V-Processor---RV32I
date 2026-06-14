`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 01:28:47
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [1:0] ALU_op,
    input fuct7,
    input [2:0] fuct3,
    output reg [3:0] ALU_sel
    );
    always@(*)
    begin
    if(ALU_op == 2'b00)
    ALU_sel = 4'b0000; // ADD
    else if(ALU_op == 2'b01)
    ALU_sel = 4'b0001; // SUB
    else begin
    casex({ALU_op,fuct7,fuct3})
    6'b10_0_000 : ALU_sel = 4'b0000;     // for addition
    6'b10_1_000 : ALU_sel = 4'b0001;     // for SUB
    6'b10_X_111 : ALU_sel = 4'b0010;     // for bitwise and
    6'b10_X_110 : ALU_sel = 4'b0011;     // for bitwise or
    6'b10_X_100 : ALU_sel = 4'b0100;     // for bitwise xor
    6'b10_X_010 : ALU_sel = 4'b0101;     // for Set less than (SLT)
    6'b10_X_001 : ALU_sel = 4'b0110;     // for shift left logical  ( SLL)
    6'b10_0_101 : ALU_sel = 4'b0111;     // for  shift right logical ( SRL)
    6'b10_1_101 : ALU_sel = 4'b1000;     // for shift right arithmetic  (SRA)
    6'b11_X_000 : ALU_sel = 4'b0000;     // ADDI
    6'b11_X_111 : ALU_sel = 4'b0010;     // ANDI
    6'b11_X_110 : ALU_sel = 4'b0011;     // ORI
    6'b11_X_100 : ALU_sel = 4'b0100;     // XORI
    6'b11_X_010 : ALU_sel = 4'b0101;     // SLTI
    6'b11_X_001 : ALU_sel = 4'b0110;     // SLLi
    6'b11_0_101 : ALU_sel = 4'b0111;     // SRLi
    6'b11_1_101 : ALU_sel = 4'b1000;     // SRAi
    default : ALU_sel = 4'd0;
    endcase
    end
    end
endmodule
