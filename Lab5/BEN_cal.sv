module BEN_cal (
	input [2:0] nzp,
	input [15:0] datapath,
	input LD.BEN, LD.CC,
	output BEN
);

logic N, Z, P, A_R, M_U, M_L, 
		N_M, Z_M, P_M,
		BEN_R;

always_ff @ (posedge Clk)
 begin
	if (LD.CC)
	 begin
		N <= datapath[15];
		Z <= M_U;
		P <= M_L;
	 end
	if (LD.BEN)
		BEN <= BEN_R;
 end
 
always_comb
 begin
	A_R = (datapath[14] | datapath[13] | datapath[12] | datapath[11] | datapath[10] | datapath[9] | 
			datapath[8] | datapath[7] | datapath[6] | datapath[5] | datapath[4] | datapath[3] | 
			datapath[2] | datapath[1] | datapath[0]);
	M_U = ((~A_R) & (~datapath[15]));
	M_L = ((~M_U) & (~datapath[15]) & A_R);
	
	N_M = (N & nzp[2]);
	Z_M = (Z & nzp[1]):
	P_M = (P & nzp[0]);
	
	BEN_R = (N_M | Z_M | P_M);
	
 end


endmodule