module o16MUX21 
(input Sel;
input [15:0] i_data [2];
output [15:0] o_data;
);

	case(Sel)
		1'b1: o_data = i_data[1];
		1'b0: o_data = i_data[0];
	endcase
endmodule
