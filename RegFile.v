`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:41 11/30/2021 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(input clk,
   input write,
   input [4:0] wrAddr,
   input [31:0] wrData,
   input [4:0] rdAddrA,
	input [4:0] rdAddrB,
   output [31:0] rdDataA,
   output [31:0] rdDataB
    );

reg [31:0] RegesterFile [31:0];

//integer i=0;
//initial///Reset every register to 0
//begin
//for (i=0;i<=31;i=i+1)
//begin
//RegesterFile[i]=0;
//end
//end

initial
begin
$readmemh("reg.m",RegesterFile); //RegesterFile(for demonstration)
end

assign rdDataA=RegesterFile[rdAddrA];//Read R1
assign rdDataB=RegesterFile[rdAddrB];//Read R2


always@(posedge clk)
begin
 if (write)//Enable writting
	begin
	RegesterFile[wrAddr]<=wrData;
	end
		
end
endmodule
