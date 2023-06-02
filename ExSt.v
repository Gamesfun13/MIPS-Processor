`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:31 12/07/2021 
// Design Name: 
// Module Name:    ExSt 
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
module ALU(
input [31:0]operand1,input [31:0]operand2,
input [3:0]ctrl,
output reg [31:0]result,
output reg cout,
output reg zero);

always @(operand1,operand2, ctrl)
begin
if (operand1==operand2)
		begin
			zero<=1;
		end
else if(operand1!=operand2)
		begin
			zero<=0;
		end
if (ctrl==4'b0000)
		begin
			cout<=0;
			result <=operand1&operand2;
		end
if (ctrl==4'b0001)
		begin
			cout<=0;
			result <=operand1 | operand2;
		end
if (ctrl==4'b0010)
		begin
			{cout,result} <=operand1 + operand2;
		end
if (ctrl==4'b0110)
		begin
			{cout,result} <=operand1 - operand2;
		end		
if (ctrl==4'b1100)
		begin
			cout<=0;
			result <=~(operand1 | operand2);
		end
if (ctrl==4'b0111)
		begin
			if (operand1<operand2)
				begin
				cout<=0;
				result <=32'b1;
				end
			else 
				begin
				cout<=0;
				result <=32'b0;
				end
			
		end
end


endmodule
