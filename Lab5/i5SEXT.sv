module i5SEXT (
input [4:0] s_in,
output [15:0] s_out
);
logic s

always_comb
 begin
	s = s_in[4];
	s_out = {{11{s}}, s_in}
 end
endmodule
