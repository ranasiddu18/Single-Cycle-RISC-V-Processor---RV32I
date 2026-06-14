`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 21:59:38
// Design Name: 
// Module Name: prog_counter
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


module prog_counter(
    input clk,
    input reset,
    input [31:0] next_pc,
    output reg [31:0] pc
    );
    
    always@(posedge clk or posedge reset)
    begin
    if(reset)
    pc<=32'h00;
    else begin
    pc<=next_pc;
    end
    end
endmodule
