module i11SEXT (
input [10:0] s_in,
output logic [15:0] s_out
);
assign s_out = {{5{s_in[10]}}, s_in}; 
endmodule