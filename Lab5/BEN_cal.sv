module BEN_cal (
	input [15:0] datapath,
	input [2:0] nzp,
	input LD.BEN, LD.CC,
	output BEN
);

logic N, Z, P, BEN_R;

always_ff @ (posedge Clk)
 begin
	if (LD.CC)
	 begin
		N <=
		Z <=
		P <=
	 end
	if (LD.BEN)
		BEN <=
 end
 
 
 
always_comb
 begin
	
 end


endmodule