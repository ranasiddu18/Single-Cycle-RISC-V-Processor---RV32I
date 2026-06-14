`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 01:35:41
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [31:0] in1,    // PC value adderss of current instruction 
    input [31:0] in2,     // immediate value  to calculate branch address
    output [31:0] sum 
    );
    
    assign sum = in1+in2;
endmodule
