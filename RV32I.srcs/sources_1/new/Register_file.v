`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 21:48:19
// Design Name: 
// Module Name: Register_file
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


module Register_file(
    input clk,
    input reset,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input reg_write,
    input [31:0] write_data,
    output [31:0] rs1_data,
    output [31:0] rs2_data
    );
    reg [31:0] regs [0:31];
    integer i;
    
    always@(posedge clk or posedge reset)
    begin
    if(reset)
    for(i=0;i<32;i=i+1)begin
    regs[i] <= 32'd0;
    end
    else if(reg_write && rd!=5'd0)
    regs[rd] <= write_data; end
    
    assign rs1_data = (rs1==5'd0) ? 32'd0 :regs[rs1];
    assign rs2_data = (rs2==5'd0) ? 32'd0 :regs[rs2];
    
endmodule
