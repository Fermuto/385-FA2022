module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	logic [15:0] P, G;
	logic [3:0] P_g, G_g;
	logic C4, C8, C12;
		always_comb
		begin
			for (i = 0; i < 16; i++)
			begin
				G[i] = A[i]&B[i];
				P[i] = A[i]^B[i];
			end
				
			P_g[0] = (P[3]&P[2]&P[1]&P[0]);
			P_g[1] = (P[7]&P[6]&P[5]&P[4]);
			P_g[2] = (P[11]&P[10]&P[9]&P[8]);
			P_g[3] = (P[15]&P[14]&P[13]&P[12]);
			
			G_g[0] = ((G[0]&P[3]&P[2]&P[1])|(G[1]&P[3]&P[2])|(G[2]&P[3])|G[3]);
			G_g[1] = ((G[4]&P[7]&P[6]&P[5])|(G[5]&P[7]&P[6])|(G[6]&P[7])|G[7]);
			G_g[2] = ((G[8]&P[11]&P[10]&P[9])|(G[9]&P[11]&P[10])|(G[10]&P[11])|G[11]);
			G_g[3] = ((G[12]&P[15]&P[14]&P[13])|(G[13]&P[15]&P[14])|(G[14]&P[15])|G[15]);
			
			C4 = (G_g[0]|(cin&P_g[0]));
			C8 = (G_g[1]|(G_g[0]&P_g[1])|(cin&P_g[0]&P_g[1])):
			C12 = (G_g[2]|(G_g[1]&P_g[2])|(G_g[0]&P_g[2]&P_g[1])|(cin&P_g[2]&P_g[1]&P_g[0]));
			cout = (G_g[3]|(G_g[2]&P_g[3])|(G_g[1]&P_g[3]&P_g[2])|(G_g[0]&P_g[3]&P_g[2]&P_g[1])|(cin&P_g[3]&P_g[2]&P_g[1]&P_g[0]));
			
			CLA_4 F03 (.cin (cin), .A (A[3:0]), .B (B[3:0]), .P (P[3:0]), .G (G[3:0]), .S (S[3:0]));
			CLA_4 F47 (.cin (C4), .A (A[7:4]), .B (B[7:4]), .P (P[7:4]), .G (G[7:4]), .S (S[7:4]));
			CLA_4 F811 (.cin (C8), .A (A[11:8]), .B (B[11:8]), .P (P[11:8]), .G (G[11:8]), .S (S[11:8]));
			CLA_4 F1215 (.cin (C12), .A (A[15:12]), .B (B[15:12]), .P (P[15:12]), .G (G[15:12]), .S (S[15:12]));
		end
endmodule
