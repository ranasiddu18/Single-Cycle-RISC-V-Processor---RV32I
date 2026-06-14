`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 00:10:27
// Design Name: 
// Module Name: imm_gen_tb
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


module imm_gen_tb;
reg [31:0] Inst;
wire [31:0] Inst_Ext;

Immediate_Gen uut(
    .Inst(Inst),
    .Inst_Ext(Inst_Ext)
);

initial
begin

    // ==================================
    // I-Type : addi x1,x0,10
    // Immediate = 10
    // ==================================
    Inst = 32'h00A00093;
    #10;
    $display("I-Type  : Inst = %h | Imm = %h", Inst, Inst_Ext);

    // ==================================
    // S-Type : sw x5,8(x0)
    // Immediate = 8
    // ==================================
    Inst = 32'h00502423;
    #10;
    $display("S-Type  : Inst = %h | Imm = %h", Inst, Inst_Ext);

    // ==================================
    // B-Type : Branch offset = 16
    // ==================================
    Inst = 32'h00208863;
    #10;
    $display("B-Type  : Inst = %h | Imm = %h", Inst, Inst_Ext);

    // ==================================
    // U-Type : lui x1,0x12345
    // Immediate = 0x12345000
    // ==================================
    Inst = 32'h123450B7;
    #10;
    $display("U-Type  : Inst = %h | Imm = %h", Inst, Inst_Ext);

    // ==================================
    // AUIPC
    // Immediate = 0xABCDE000
    // ==================================
    Inst = 32'hABCDE117;
    #10;
    $display("AUIPC   : Inst = %h | Imm = %h", Inst, Inst_Ext);

    // ==================================
    // J-Type : jal
    // ==================================
    Inst = 32'h008000EF;
    #10;
    $display("J-Type  : Inst = %h | Imm = %h", Inst, Inst_Ext);

    #10;
    $finish;

end

endmodule

