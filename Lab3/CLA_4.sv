module CLA_4 (
	input logic cin,
	input logic [3:0] A, B, P, G,
	output logic [3:0] S
);
	always_comb
	begin
		c1 = ((cin&P[0])|G[0]);
		c2 = ((cin&P[1]&P[0])|(G[0]&P[1])|G[1]);
		c3 = ((cin&P[0]&P[1]&P[2])|(G[0]&P1[1]&P[2])|(G[1]&P[2])|G[2]);
		
		full_adder FA0 (.x (A[0]), .y (B[0]), .z (cin), .s (S[0]));
		full_adder FA1 (.x (A[1]), .y (B[1]), .z (c1), .s (S[1]));
		full_adder FA2 (.x (A[2]), .y (B[2]), .z (c2), .s (S[2]));
		full_adder FA3 (.x (A[3]), .y (B[3]), .z (c3), .s (S[3]));
	end
endmodule
