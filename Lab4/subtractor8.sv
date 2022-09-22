module subtractor8 (
	input  [7:0] A, B,
	output [7:0] D,
	output        cout,
	output Done
);
	logic c1, c2, c3, c4, c5, c6, c7;
	
	for (int i = 0; i < 8; i++)
	begin
		if (B[i] == {1'b0})
			B[i] = {1'b1};
		else
			B[i] = {1'b0};
	end
	
	full_adder FA0 (.x (A[0]), .y (B[0]), .z ({1'b1}), .s (D[0]), .c (c1));
	full_adder FA1 (.x (A[1]), .y (B[1]), .z (c1), .s (D[1]), .c (c2));
	full_adder FA2 (.x (A[2]), .y (B[2]), .z (c2), .s (D[2]), .c (c3));
	full_adder FA3 (.x (A[3]), .y (B[3]), .z (c3), .s (D[3]), .c (c4));
	full_adder FA4 (.x (A[4]), .y (B[4]), .z (c4), .s (D[4]), .c (c5));
	full_adder FA5 (.x (A[5]), .y (B[5]), .z (c5), .s (D[5]), .c (c6));
	full_adder FA6 (.x (A[6]), .y (B[6]), .z (c6), .s (D[6]), .c (c7));
	full_adder FA7 (.x (A[7]), .y (B[7]), .z (c7), .s (D[7]), .c (cout), .Done (Done));

endmodule
