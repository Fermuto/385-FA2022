module i6SEXT (
input [5:0] s_in,
output logic [15:0] s_out
);
assign s_out = {{10{s_in[5]}}, s_in}; 
endmodule
