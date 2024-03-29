`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:21 09/05/2019
// Design Name:   display
// Module Name:   C:/Users/UECCI/Desktop/ejer01/display_7segx4/testbench.v
// Project Name:  display_7segx4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [7:0] num;
	reg clk2;
	reg rst;

	// Outputs
	wire [6:0] sseg;
	wire [4:0] an;

	// Instantiate the Unit Under Test (UUT)
	Hex2SSeg uut (
		.num(num), 
		.clk(clk2), 
		.sseg(sseg), 
		.an(an), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk2= 0;
		rst = 0;
		#10 rst =1;
		
		num = 8'hf4;
        

	end
      

	always #1 clk2 = ~clk2;
	
	initial begin: TEST_CASE
     $dumpfile("BCDtoSSeg_TB.vcd");
     #(1000) $finish;
   end
	
endmodule

