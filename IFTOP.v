`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:09 11/13/2021 
// Design Name: 
// Module Name:    IFTOP 
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
module IFTOP(
    clk,rst,enable,read_in, instruction);
	 
input clk,rst,enable;
wire [31:0]address ;
input read_in;	 

output  [31:0] instruction;

pcplusadder a0(clk,rst,enable,address);//address outputted
Instruction_Memory a1(clk,read_in,1'b0,address[31:0], 32'b0,instruction);//instruction outputted

endmodule
