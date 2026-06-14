`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 23:22:12
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    input reset
    );
    wire [31:0] pc_top;  
    wire [31:0] Next_pc ;  
    wire [31:0] write_out;                                                    //  1   Program counter
    prog_counter PC(.clk(clk),.reset(reset),.next_pc(Next_pc),.pc(pc_top));
    
    wire [31:0] pc_4;                                                        //  2      PC+4
    pc_plus4 plus4(.pc_in(pc_top),.pc_out(pc_4));
    
    wire [31:0] top_inst;                                                     // 3    Instruction Memory
    Instruction_Mem I_Mem1(.read_addr(pc_top),.inst_out(top_inst));
    
    wire [31:0] imm_value;                                                    // 4    Immediate Gen
    Immediate_Gen I_gen(.Inst(top_inst),.Inst_Ext(imm_value));
    
    wire Branch1,memread,memtoreg,memwrite,aluSrc,regwrite; // control signals from control unit
    
    wire [31:0] rdata1,rdata2;                                               // 5    Register file
    Register_file reg_file(.clk(clk),.reset(reset),.rs1(top_inst[19:15]),.rs2(top_inst[24:20]),.rd(top_inst[11:7]),.reg_write(regwrite),.write_data( write_out),.rs1_data( rdata1),.rs2_data(rdata2));

   
    wire [1:0] aluop;                                                          // 6        Control unit
    Control_unit c_unit(.opcode(top_inst[6:0]),.Branch(Branch1),.MemRead(memread),.MemtoReg(memtoreg),.MemWrite(memwrite),.ALUSrc(aluSrc),.RegWrite(regwrite),.ALUOp(aluop));
        
    wire [31:0] Alu_data;                                                      //7.1  Mux 1  ALU operand 2 select
    Mux1 mux_alu(.sel1(aluSrc),.a1(rdata2),.b1(imm_value),.out1(Alu_data));            
    
    wire [3:0] ALUsel;                                                          //8    ALU control unit
    ALU_Control ALU_Con(.ALU_op(aluop),.fuct7(top_inst[30]),.fuct3(top_inst[14:12]),.ALU_sel(ALUsel));
    
    wire [31:0] Alu_res;                                                       //9    ALU Unit
    wire Zero;
    ALU_unit ALU1(.A(rdata1),.B(Alu_data),.ALU_sel(ALUsel),.ALU_Out(Alu_res),.zero(Zero));
    
    wire [31:0] Branch_addr1;                                                 //10     Adder    PC + Immidiate value
    Adder Branch_addr(.in1(pc_top),.in2(imm_value),.sum(Branch_addr1));
    
    
    wire b_sel;                                                              // 11   And logic
    And_logic And1(.Branch(Branch1),.zero(Zero),.PCsrc(b_sel));
    
                                                                           //7.2  Mux Next Pc
    mux2 Mux_pc_sel(.sel2(b_sel),.a2(pc_4),.b2(Branch_addr1),.out2(Next_pc));
    
    wire [31:0] data_read1;                                                 // 12 Data Memory
    Data_Memory D_mem1(.clk(clk),.reset(reset),.memRead(memread),.memWrite(memwrite),.addr(Alu_res),.write_data(rdata2),.Read_data(data_read1));
    
    
                                                     // 7.3  Mux Mem to Reg selector
    mux3 MUXD(.sel3(memtoreg),.a3(Alu_res),.b3(data_read1),.out3(write_out));
    
endmodule
