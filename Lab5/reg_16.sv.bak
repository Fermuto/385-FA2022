module reg_16 (input  Clk, Reset, Shift_In, Load, Shift_En,
              input  [15:0]  D,
              output Shift_Out,
              output logic [15:0] Data_Out);

    always_ff @ (posedge Clk)
    begin
			 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
				  Data_Out <= 16'h0;
			 else if (Load)
				  Data_Out <= D;
			 else if (Shift_En)
			 begin
				  Data_Out <= { Shift_In, Data_Out[14:1] }; 
			 end
    end
    assign Shift_Out = Data_Out[0];

endmodule
