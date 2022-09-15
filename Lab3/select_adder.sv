module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	logic C4, C8, C12;
	logic tC8_0, tC8_1, tC12_0, tC12_1, tC16_0, tC16_1;
	logic [3:0] tS8_0, tS8_1, tS12_0, tS12_1, tS16_0, tS16_1;
	full_adder4 S4 (.A (A[3:0]), .B (B[3:0]), .cin (cin), .S (S[3:0]), .cout (C4));
	full_adder4 S8_0 (.A (A[7:4]), .B (B[7:4]), .cin (1'b0), .S (tS8_0), .cout (tC8_0));
	full_adder4 S8_1 (.A (A[7:4]), .B (B[7:4]), .cin (1'b1), .S (tS8_1), .cout (tC8_1));
	full_adder4 S12_0 (.A (A[11:8]), .B (B[11:8]), .cin (1'b0), .S (tS12_0), .cout (tC12_0));
	full_adder4 S12_1 (.A (A[11:8]), .B (B[11:8]), .cin (1'b1), .S (tS12_1), .cout (tC12_1));
	full_adder4 S16_0 (.A (A[15:12]), .B (B[15:12]), .cin (1'b0), .S (tS16_0), .cout (tC16_0));
	full_adder4 S16_1 (.A (A[15:12]), .B (B[15:12]), .cin (1'b0), .S (tS16_1), .cout (tC16_1));
	
	always_comb
	begin

		
		C8 = (C4 & tC8_1);
		C8 = (C8 | tC8_0);
		if (C4 == 1'b1)
			S[7:4] = tS8_1;
		else
			S[7:4] = tS8_0;
		
		C12 = (C8 & tC12_1);
		C12 = (C12 | tC12_0);
		if (C8 == 1'b1)
			S[11:8] = tS12_1;
		else
			S[11:8] = tS12_0;
		
		cout = (C12 & tC16_1);
		cout = (cout | tC16_0);
		if (C12 == 1'b1)
			S[15:12] = tS16_1;
		else
			S[15:12] = tS16_0;
		
	end

endmodule
