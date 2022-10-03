module i6SEXT (
input [5:0] s_in,
output [15:0] s_out
);
logic s

always_comb
 begin
	s = s_in[5];
	s_out = {{10{s}}, s_in}
 end
endmodule
