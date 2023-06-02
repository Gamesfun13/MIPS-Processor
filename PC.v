`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:02 11/13/2021 
// Design Name: 
// Module Name:    PC 
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
module pcplusadder(input clk,rst,enable, output reg[31:0] pc);
always @(posedge clk) begin
if (enable==1)			///enable counting
			begin 
			pc<=pc+1;
			end
if (rst==1)				///reset the PC to 0
			begin 
			pc<=0;
			end
end

endmodule
