`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 21:43:32
// Design Name: 
// Module Name: Immediate_Gen
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


module Immediate_Gen(
    input [31:0] Inst,
    output reg [31:0] Inst_Ext
    );
    wire [6:0] opcode;
    
    assign opcode = Inst[6:0];
    always@(*)
    begin
    case(opcode)
    7'b0010011,7'b0000011: Inst_Ext = {{20{Inst[31]}},Inst[31:20]};  // I Type 
    7'b0100011: Inst_Ext = {{20{Inst[31]}},Inst[31:25],Inst[11:7]}; // S Type
    7'b1100011 :Inst_Ext = {{19{Inst[31]}},Inst[31],Inst[7],Inst[30:25],Inst[11:8],1'b0}; //B type
    7'b0110111:Inst_Ext =  {Inst[31:12],12'd0};  // U type LUI
    7'b0010111: Inst_Ext = {Inst[31:12],12'd0};   // U type AUIPC
    7'b1101111 : Inst_Ext = {{11{Inst[31]}},Inst[31],Inst[19:12],Inst[20],Inst[30:21],1'b0};  // J type
    default : Inst_Ext= 32'b0;
    endcase
    end
endmodule
