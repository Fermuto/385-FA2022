module i9SEXT (
input [8:0] s_in,
output [15:0] s_out
);
logic s

always_comb
 begin
	s = s_in[8];
	s_out = {{7{s}}, s_in}
 end
endmodule
