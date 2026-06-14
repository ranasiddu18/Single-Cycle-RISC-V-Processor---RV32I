`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 22:24:08
// Design Name: 
// Module Name: tb_regfile
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


 module tb_regfile;

reg clk;
reg reset;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg reg_write;
reg [31:0] write_data;

wire [31:0] rs1_data;
wire [31:0] rs2_data;

Register_file DUT(
    .clk(clk),
    .reset(reset),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .reg_write(reg_write),
    .write_data(write_data),
    .rs1_data(rs1_data),
    .rs2_data(rs2_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    reg_write = 0;

    #10;
    reset = 0;

    // Write x1 = 10
    rd = 5'd1;
    write_data = 32'd10;
    reg_write = 1;
    #10;

    // Write x2 = 20
    rd = 5'd2;
    write_data = 32'd20;
    reg_write = 1;
    #10;

    reg_write = 0;

    // Read x1 and x2
    rs1 = 5'd1;
    rs2 = 5'd2;
    #10;

    // Try writing x0
    rd = 5'd0;
    write_data = 32'd999;
    reg_write = 1;
    #10;

    reg_write = 0;
    rs1 = 5'd0;
    #10;

    $finish;

end

endmodule