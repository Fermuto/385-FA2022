module i9SEXT (
input [8:0] s_in,
output logic [15:0] s_out
);
assign s_out = {{7{s_in[8]}}, s_in}; 
endmodule
