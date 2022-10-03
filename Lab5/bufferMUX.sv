module bufferMUX(
input [3:0] Select,
input [15:0] PC, MDR, ALU, ADDR_R,
output logic [15:0] Output
);
//	assign Select = {GatePC, GateMDR, GateALU, GateMARMUX};

always_comb
begin
	case (Select)
		4'b1000: Output = PC;
		4'b0100: Output = MDR;
		4'b0010: Output = ALU;
		4'b0001: Output = ADDR_R;
		default: Output = 16'bxxxxxxxxxxxxxxxx;
	endcase
end

endmodule
