module i5SEXT (
input [4:0] s_in,
output logic [15:0] s_out
);
assign s_out = {{11{s_in[4]}}, s_in}; 
endmodule
