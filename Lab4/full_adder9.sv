module full_adder9 (
	input  [7:0] A, S,
	input         cin,
	output [7:0] A_Out,
	output       X,
	output Done
);
	logic c1, c2, c3, c4, c5, c6, c7, cout, ignr;
	
	full_adder FA0 (.x (A[0]), .y (S[0]), .z (cin), .s (A_Out[0]), .c (c1));
	full_adder FA1 (.x (A[1]), .y (S[1]), .z (c1), .s (A_Out[1]), .c (c2));
	full_adder FA2 (.x (A[2]), .y (S[2]), .z (c2), .s (A_Out[2]), .c (c3));
	full_adder FA3 (.x (A[3]), .y (S[3]), .z (c3), .s (A_Out[3]), .c (c4));
	full_adder FA4 (.x (A[4]), .y (S[4]), .z (c4), .s (A_Out[4]), .c (c5));
	full_adder FA5 (.x (A[5]), .y (S[5]), .z (c5), .s (A_Out[5]), .c (c6));
	full_adder FA6 (.x (A[6]), .y (S[6]), .z (c6), .s (A_Out[6]), .c (c7));
	full_adder FA7 (.x (A[7]), .y (S[7]), .z (c7), .s (A_Out[7]), .c (cout));
	full_adder FA8 (.x (A[7]), .y (S[7]), .z (cout), .s (X), .c (ignr), .Done (Done));
	
	
endmodule
