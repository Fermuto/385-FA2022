module i11SEXT (
input [10:0] s_in,
output [15:0] s_out
);
logic s

always_comb
 begin
	s = s_in[10];
	s_out = {{5{s}}, s_in}
 end
endmodule