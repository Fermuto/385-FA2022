module testbench_L3();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset_Clear, Run_Accumulate;
logic [9:0] SW, LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
adder2 adder2(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
SW = 10'b0000000000;
Reset_Clear = 0;
Run_Accumulate = 0;

#2 SW = 10'b0000110011;
Run_Accumulate = 1;

#100 Run_Accumulate = 0;

#2 Run_Accumulate = 1;

#100 Run_Accumulate = 0;

#2 Run_Accumulate = 1;

#100 Run_Accumulate = 0;

#2 Run_Accumulate = 1;

end
endmodule
