`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:23 12/07/2021 
// Design Name: 
// Module Name:    ALUctr 
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
module ALUctr(
input [1:0]ALUop, input [3:0]funct,output reg [3:0]ctrl);

always @(*)
begin
case(ALUop)
	6'b00: ctrl<=4'b0010;
	6'b01: ctrl<=4'b0110;
	6'b10:case(funct)
			6'b0000:	ctrl<=4'b0010;
			6'b0010: ctrl<=4'b0110;
			6'b0100: ctrl<=4'b0000;
			6'b0101: ctrl<=4'b0001;
			6'b1010: ctrl<=4'b0111;
			endcase
	6'b11:case(funct)
			6'b0000:	ctrl<=4'b0010;
			6'b0010: ctrl<=4'b0110;
			6'b0100: ctrl<=4'b0000;
			6'b0101: ctrl<=4'b0001;
			6'b1010: ctrl<=4'b0111;
			endcase
	
endcase
end


endmodule
