module full_adder8 (
	input  [7:0] A, B,
	input         cin,
	output [7:0] D,
	output        cout
);
	logic c1, c2, c3, c4, c5, c6, c7;
	
	full_adder FA0 (.x (A[0]), .y (B[0]), .z (cin), .s (S[0]), .c (c1));
	full_adder FA1 (.x (A[1]), .y (B[1]), .z (c1), .s (S[1]), .c (c2));
	full_adder FA2 (.x (A[2]), .y (B[2]), .z (c2), .s (S[2]), .c (c3));
	full_adder FA3 (.x (A[3]), .y (B[3]), .z (c3), .s (S[3]), .c (c4));
	full_adder FA4 (.x (A[0]), .y (B[0]), .z (c4), .s (S[0]), .c (c5));
	full_adder FA5 (.x (A[1]), .y (B[1]), .z (c5), .s (S[1]), .c (c6));
	full_adder FA6 (.x (A[2]), .y (B[2]), .z (c6), .s (S[2]), .c (c7));
	full_adder FA7 (.x (A[3]), .y (B[3]), .z (c7), .s (S[3]), .c (cout));

endmodule
