`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:15 12/07/2021
// Design Name:   ExTop
// Module Name:   G:/5th semester/COA/labs/lab7/MIPS/EXstTest.v
// Project Name:  IFcycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ExTop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EXstTest;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg read_in;

	// Outputs
	wire[31:0] result;
	wire cout;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ExTop uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.read_in(read_in), 
		.result(result), 
		.cout(cout), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		clk = 0; rst = 0; enable = 0; read_in = 0;#10;
		rst=1; #8;
		rst=0; #2;
		read_in=1;
		enable=1;#100;
		$finish;
        
	end
      always #10 clk=~clk;
endmodule

