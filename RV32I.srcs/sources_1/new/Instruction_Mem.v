`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 02:06:57
// Design Name: 
// Module Name: Instruction_Mem
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


module Instruction_Mem(
    
    input [31:0] read_addr,
    output [31:0] inst_out
    );
    reg [31:0]I_mem[0:255];
   
    
    initial begin

// I-Type Initialization
I_mem[0]  = 32'h00A00093; // addi x1,x0,10
I_mem[1]  = 32'h01400113; // addi x2,x0,20

// R-Type Instructions
I_mem[2]  = 32'h002081B3; // add  x3,x1,x2
I_mem[3]  = 32'h40110233; // sub  x4,x2,x1
I_mem[4]  = 32'h0020F2B3; // and  x5,x1,x2
I_mem[5]  = 32'h0020E333; // or   x6,x1,x2
I_mem[6]  = 32'h0020C3B3; // xor  x7,x1,x2
I_mem[7]  = 32'h0020A433; // slt  x8,x1,x2
I_mem[8]  = 32'h001094B3; // sll  x9,x1,x1
I_mem[9]  = 32'h00115533; // srl  x10,x2,x1
I_mem[10] = 32'h401155B3; // sra  x11,x2,x1

// I-Type Logical Instructions
I_mem[11] = 32'h0070F613; // andi x12,x1,7
I_mem[12] = 32'h0040E693; // ori  x13,x1,4
I_mem[13] = 32'h0030C713; // xori x14,x1,3
I_mem[14] = 32'h0140A793; // slti x15,x1,20
I_mem[15] = 32'h00109813; // slli x16,x1,1
I_mem[16] = 32'h0010D893; // srli x17,x1,1
I_mem[17] = 32'h4010D913; // srai x18,x1,1

// Memory Instructions
I_mem[18] = 32'h06400993; // addi x19,x0,100
I_mem[19] = 32'h03700A13; // addi x20,x0,55

I_mem[20] = 32'h0149A023; // sw x20,0(x19)
I_mem[21] = 32'h0009AA83; // lw x21,0(x19)

// Branch Test
I_mem[22] = 32'h014A8463; // beq x21,x20,+8

I_mem[23] = 32'h06F00B13; // addi x22,x0,111

I_mem[24] = 32'h0DE00B93; // addi x23,x0,222

end
    

 
   assign inst_out = I_mem[read_addr >> 2];
    
    
endmodule
