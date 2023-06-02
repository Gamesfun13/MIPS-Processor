`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:46 11/30/2021 
// Design Name: 
// Module Name:    IDTop 
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
module IDTop(
	input clk,
	input rst,
	input enable,
	input read_in,
	output  RegDst,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,branch,jump,
	output [1:0] ALUop,
	output [3:0] ctrl,
	input [31:0]WrData,
	output [31:0] rdDataA,
   output reg [31:0] rdDataB

    );


wire [31:0]Instruction;
IFTOP I1(clk,rst,enable,read_in,Instruction);


MainCtrlr M1 (
    Instruction[31:26], 
    RegDst, 
    ALUsrc, 
    MemtoReg, 
    RegWrite, 
    MemRead, 
    MemWrite, 
    branch, 
    jump, 
    ALUop
    );

ALUctr A1 (
    .ALUop(ALUop), 
    .funct(Instruction[5:0]), 
    .ctrl(ctrl)
    );



reg [4:0]rdAddr;
always @ (posedge clk-1)
begin//Select Destination Register Rd,Rt
if(RegDst)
begin rdAddr<=Instruction[15:11]; end
else
begin rdAddr<=Instruction[20:16]; end
end

wire [31:0] rdDataBT;
RegFile R1(clk,RegWrite,rdAddr,WrData,Instruction[20:16],Instruction[25:21],rdDataA,rdDataBT);


always @(posedge clk)
begin//Select 16 bit immediate or R2 register to ALU
if (ALUsrc)
		begin rdDataB=Instruction[15:0]; end///!6bit immediate
else
		begin rdDataB=rdDataBT;end	///R2 
		
end





endmodule
