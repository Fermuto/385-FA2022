module ALU (
input [15:0] SR1, OP2,
input [1:0] ALUK,
output logic [15:0] Result
);

always_comb
 begin
	if (ALUK == 2'b00)
		Result = SR1 + OP2;
	else if (ALUK == 2'b01)
		Result = SR1 & OP2;
	else if (ALUK == 2'b10)
		Result = ~SR1;
	else if (ALUK == 2'b11)
		Result = SR1;
	else
		Result = 16'bxxxxxxxxxxxxxxxx;
 end

endmodule