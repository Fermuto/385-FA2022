module o16MUX21 
(input Sel,
input [15:0] i_data [1:0],
output logic [15:0] o_data
);

always_comb
begin
	case(Sel)
		1'b0: o_data = i_data[1];
		1'b1: o_data = i_data[0];
		default: o_data = 16'b0000000000000000;
	endcase
end
	
endmodule
