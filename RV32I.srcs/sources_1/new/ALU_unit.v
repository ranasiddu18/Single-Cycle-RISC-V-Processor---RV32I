`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 23:38:12
// Design Name: 
// Module Name: ALU_unit
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


module ALU_unit(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_sel,
    output reg [31:0] ALU_Out,
    output zero
    );
    
   always@(*)
   begin
   case(ALU_sel)
   4'b0000: ALU_Out = A+B;   // addition
   4'b0001: ALU_Out = A-B;    //sub
   4'b0010: ALU_Out = A&B;     //bitwise and
   4'b0011: ALU_Out = A|B;     // bitwise or
   4'b0100: ALU_Out = A^B;      // bitwise XOR
   4'b0101: ALU_Out = ($signed(A) < $signed(B))? 32'd1:32'd0; // Set less than signed  
   4'b0110: ALU_Out = A<<B[4:0];  // shift left logical
   4'b0111: ALU_Out = A>>B[4:0];  // shift right logical
   4'b1000: ALU_Out = $signed(A)>>>B[4:0];   // shift right arithmetic
   default : ALU_Out = 32'd0;
   endcase
   end
   assign zero = (ALU_Out == 32'd0);
endmodule
