`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:55 12/07/2021 
// Design Name: 
// Module Name:    ExTop 
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
module ExTop(
    input clk,rst,enable,read_in,output[31:0] result, output cout,zero);


wire RegDst,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,branch,jump;
wire [1:0]ALUop;
wire [3:0]ctrl;
wire [31:0]rdDataA,rdDataB,WrData;


IDTop ID1 (
    .clk(clk), 
    .rst(rst), 
    .enable(enable), 
    .read_in(read_in), 
    .RegDst(RegDst), 
    .ALUsrc(ALUsrc), 
    .MemtoReg(MemtoReg), 
    .RegWrite(RegWrite), 
    .MemRead(MemRead), 
    .MemWrite(MemWrite), 
    .branch(branch), 
    .jump(jump), 
    .ALUop(ALUop), 
    .ctrl(ctrl), 
    .WrData(result), 
    .rdDataA(rdDataA), 
    .rdDataB(rdDataB)
    );


ALU ALU1 (
    .operand1(rdDataA), 
    .operand2(rdDataB), 
    .ctrl(ctrl), 
    .result(result), 
    .cout(cout), 
    .zero(zero)
    );


endmodule
