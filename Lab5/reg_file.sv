module reg_file (input LD_Reg, cDR, cSR1, reset,
					input [15:0] IR, data,
					output [15:0] SR2, SR1);

	input [2:0] DR, SR_1, SR_2;
	
	o3MUX Destination (.Sel (cDR), .i_data[0](IR[11:9]), .i_data[1](3'b111), .o_data(D_R));
	o3MUX Reg_1 (.Sel (cSR1), .i_data[0](IR[8:6]), .i_data[1](IR[11:9]), .o_data(SR_1));
	SR_2 = IR[2:0];
	
	reg_16 Destination_Reg	( .*, .Reset(reset), .Load(LD_Reg), .D(data), .Data_Out(SR1));
	reg_16 Register1	( .*, .Reset(reset), .Load(LD_Reg), .D(data), .Data_Out(SR1));
	reg_16 Register2	( .*, .Reset(reset), .Load(LD_Reg), .D(data), .Data_Out(SR2));
	
endmodule
	