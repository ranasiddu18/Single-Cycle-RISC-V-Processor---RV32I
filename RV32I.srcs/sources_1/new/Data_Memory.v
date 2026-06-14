`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 23:56:58
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input reset,
    input memRead,
    input memWrite,
    input [31:0] addr,
    input [31:0] write_data,
    output [31:0] Read_data
    );
   reg [31:0] D_mem [0:255] ;
   integer i;
  always@(posedge clk or posedge reset)
  begin
     if(reset)
        for(i=0;i<256;i=i+1) begin
           D_mem[i] <= 32'd0; end
   else if(memWrite)
           D_mem[addr>>2] <= write_data;
   end
   
   assign Read_data = ( memRead) ? D_mem[addr>>2] : 32'd0;
endmodule
