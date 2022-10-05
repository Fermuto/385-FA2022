module reg_file 
(input LD_Reg, cDR, cSR1, Clk, reset,
input [15:0] IR, data,
output logic [15:0] SR2, SR1
);

	logic [2:0] D_R, SR_1, SR_2;
	logic [15:0] out0, out1, out2, out3, out4, out5, out6, out7;
	logic [15:0] data0, data1, data2, data3, data4, data5, data6, data7;
	
	o3MUX Destination (.Sel (cDR), .i_data ('{3'b111, IR[11:9]}), .o_data(D_R));
	o3MUX Reg_1 (.Sel (cSR1), .i_data('{IR[11:9], IR[8:6]}), .o_data(SR_1));
	assign SR_2 = IR[2:0];
	
	always_ff @ (posedge Clk)
	begin
	case(D_R)
		3'b000: data0 <= data;
		3'b001: data1 <= data;
		3'b010: data2 <= data;
		3'b011: data3 <= data;
		3'b100: data4 <= data;
		3'b101: data5 <= data;
		3'b110: data6 <= data;
		3'b111: data7 <= data;
		default:  
		begin
		data0 <= 16'bxxxxxxxxxxxxxxxx;
		data1 <= 16'bxxxxxxxxxxxxxxxx;
		data2 <= 16'bxxxxxxxxxxxxxxxx;
		data3 <= 16'bxxxxxxxxxxxxxxxx;
		data4 <= 16'bxxxxxxxxxxxxxxxx;
		data5 <= 16'bxxxxxxxxxxxxxxxx;
		data6 <= 16'bxxxxxxxxxxxxxxxx;
		data7 <= 16'bxxxxxxxxxxxxxxxx;
		end
	endcase
	end
	
	reg_16 Register0	( .*, .Reset(reset), .Load(LD_Reg), .D(data0), .Data_Out(out0));
	reg_16 Register1	( .*, .Reset(reset), .Load(LD_Reg), .D(data1), .Data_Out(out1));
	reg_16 Register2	( .*, .Reset(reset), .Load(LD_Reg), .D(data2), .Data_Out(out2));
	reg_16 Register3	( .*, .Reset(reset), .Load(LD_Reg), .D(data3), .Data_Out(out3));
	reg_16 Register4	( .*, .Reset(reset), .Load(LD_Reg), .D(data4), .Data_Out(out4));
	reg_16 Register5	( .*, .Reset(reset), .Load(LD_Reg), .D(data5), .Data_Out(out5));
	reg_16 Register6	( .*, .Reset(reset), .Load(LD_Reg), .D(data6), .Data_Out(out6));
	reg_16 Register7	( .*, .Reset(reset), .Load(LD_Reg), .D(data7), .Data_Out(out7));
	
	always_ff @ (posedge Clk)
	begin
	case(SR_1)
		3'b000: SR1 <= out0;
		3'b001: SR1 <= out1;
		3'b010: SR1 <= out2;
		3'b011: SR1 <= out3;
		3'b100: SR1 <= out4;
		3'b101: SR1 <= out5;
		3'b110: SR1 <= out6;
		3'b111: SR1 <= out7;
		default: SR1 <= 16'bxxxxxxxxxxxxxxxx;
	endcase
	
	case(SR_2)
		3'b000: SR2 <= out0;
		3'b001: SR2 <= out1;
		3'b010: SR2 <= out2;
		3'b011: SR2 <= out3;
		3'b100: SR2 <= out4;
		3'b101: SR2 <= out5;
		3'b110: SR2 <= out6;
		3'b111: SR2 <= out7;
		default: SR2 <= 16'bxxxxxxxxxxxxxxxx;
	endcase
	end
	
endmodule

