`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:40 12/07/2021 
// Design Name: 
// Module Name:    MainCtrlr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MainCtrlr(
    input [5:0]opcode,
	 output reg RegDst,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,branch,jump,
	 output reg [1:0] ALUop);
	 
always@(*)
begin
if (opcode==6'b000000)
	begin
		RegDst=1;ALUsrc=0;MemtoReg=0;RegWrite=1;
		MemRead=0;MemWrite=0;branch=0;jump=0;
		ALUop=2'b10;
	end
if (opcode==6'b001000)
	begin
		RegDst=0;ALUsrc=1;MemtoReg=0;RegWrite=1;
		MemRead=0;MemWrite=0;branch=0;jump=0;
		ALUop=2'b00;
	end
if (opcode==6'b100011)
	begin
		RegDst=0;ALUsrc=1;MemtoReg=1;RegWrite=1;
		MemRead=1;MemWrite=0;branch=0;jump=0;
		ALUop=2'b00;
	end
if (opcode==6'b101011)
	begin
		RegDst=1'b0;ALUsrc=1;MemtoReg=1'b0;RegWrite=0;
		MemRead=0;MemWrite=1;branch=0;jump=0;
		ALUop=2'b00;
	end
if (opcode==6'b000100)
	begin
		RegDst=1'b0;ALUsrc=0;MemtoReg=1'b0;RegWrite=0;
		MemRead=0;MemWrite=0;branch=1;jump=0;
		ALUop=2'b01;
	end
if (opcode==6'b000010)
	begin
		RegDst=1'b0;ALUsrc=1'b0;MemtoReg=1'b0;RegWrite=0;
		MemRead=0;MemWrite=0;branch=0;jump=1;
		ALUop=2'b00;
	end



end


endmodule
