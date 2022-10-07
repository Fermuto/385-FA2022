module reg_file 
(input LD_Reg, cDR, cSR1, Clk, reset,
input [15:0] IR, data,
output logic [15:0] SR2, SR1
);

	logic [2:0] D_Rs, SR_1s, SR_2s;
	logic [15:0] reg_data [8];
	
	o3MUX Destination (.Sel (cDR), .i_data ('{3'b111, IR[11:9]}), .o_data(D_Rs));
	o3MUX Reg_1 (.Sel (cSR1), .i_data('{IR[11:9], IR[8:6]}), .o_data(SR_1s));
	assign SR_2s = IR[2:0];
	
	always_ff @ (posedge Clk)
	begin
		if(LD_Reg)
			reg_data[D_Rs] <= data;
		if(reset)
			begin
			reg_data[0] <= 16'b0000000000000000;
			reg_data[1] <= 16'b0000000000000000;
			reg_data[2] <= 16'b0000000000000000;
			reg_data[3] <= 16'b0000000000000000;
			reg_data[4] <= 16'b0000000000000000;
			reg_data[5] <= 16'b0000000000000000;
			reg_data[6] <= 16'b0000000000000000;
			reg_data[7] <= 16'b0000000000000000;
			end
	end
	
	assign SR1 = reg_data[SR_1s];
	assign SR2 = reg_data[SR_2s];
endmodule

