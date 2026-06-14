`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 23:39:14
// Design Name: 
// Module Name: Control_unit
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

module Control_unit(
    input [6:0] opcode,

    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [1:0] ALUOp
);

always @(*)
begin

    case(opcode)

    // R-Type
    7'b0110011:
    begin
        Branch   = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b1;
        ALUOp    = 2'b10;
    end

    // I-Type (ADDI)
    7'b0010011:
    begin
        Branch   = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b1;
        RegWrite = 1'b1;
        ALUOp    = 2'b11;
    end

    // LOAD (LW)
    7'b0000011:
    begin
        Branch   = 1'b0;
        MemRead  = 1'b1;
        MemtoReg = 1'b1;
        MemWrite = 1'b0;
        ALUSrc   = 1'b1;
        RegWrite = 1'b1;
        ALUOp    = 2'b00;
    end

    // STORE (SW)
    7'b0100011:
    begin
        Branch   = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;   // don't care
        MemWrite = 1'b1;
        ALUSrc   = 1'b1;
        RegWrite = 1'b0;
        ALUOp    = 2'b00;
    end

    // BRANCH (BEQ)
    7'b1100011:
    begin
        Branch   = 1'b1;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;   // don't care
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b0;
        ALUOp    = 2'b01;
    end


    default:
    begin
        Branch   = 1'b0;
        MemRead  = 1'b0;
        MemtoReg = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b0;
        ALUOp    = 2'b00;
    end

    endcase

end

endmodule
