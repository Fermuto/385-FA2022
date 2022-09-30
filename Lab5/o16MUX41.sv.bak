module o16MUX41 
(input [2:0] Sel;
input [15:0] i_data [4];
output [15:0] o_data;
);

	case(Sel)
		2'b00: o_data = i_data[0];
		2'b01: o_data = i_data[1];
		2'b10: o_data = i_data[2];
		2'b11: o_data = i_data[3];
		
	endcase
endmodule
