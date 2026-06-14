`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 22:57:43
// Design Name: 
// Module Name: pc_plus4
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


module pc_plus4(
    input [31:0] pc_in,
    output [31:0] pc_out
    );
    
    assign pc_out = pc_in + 32'd4;
endmodule
