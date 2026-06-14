`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 23:08:12
// Design Name: 
// Module Name: test_bench
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


module test_bench();
reg clk , reset;

top_module uut(clk,reset);

initial begin

clk=0;
forever #5 clk = ~clk;

end
initial begin
$monitor(
        "Time=%0t PC=%h Inst=%h ALU=%h",
        $time,
        uut.pc_top,
        uut.top_inst,
        uut.Alu_res
    );
clk = 0 ; reset = 1; #10
reset = 0 ; # 500
$finish;
end 
    
endmodule
