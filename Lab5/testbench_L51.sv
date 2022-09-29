module testbench_L51 ();

	timeunit 10ns;
	timeprecision 1ns;
	
	logic Clk = 0;
	logic Run, Continue;
	logic [6:0] HEX0, HEX1, HEX2, HEX3;
	logic [9:0] SW, LED;
	
	slc3_testtop slc3_test (.*);
	
	always begin : CLOCK_GENERATION
	#1 Clk = ~Clk;
	end
	
	initial begin: CLOCK_INITIALIZATION
		Clk = 0;
	end
	
	
	initial begin: TEST_VECTORS
	Continue = 1'b0;
	Run = 1'b0;
	
	#2 Run = 1'b1;
	Continue = 1'b1;
	
	#4 Run = 1'b0;
	
	#4 Run = 1'b1;
	
	#8 Continue = 1'b0;
	
	#4 Continue = 1'b1;
	
	#8 Continue = 1'b0;
	
	#4 Continue = 1'b1;
	
	#8 Continue = 1'b0;
	
	#4 Continue = 1'b1;
	
	#8 Run = 1'b0;
	Continue = 1'b0;
	end
	
endmodule