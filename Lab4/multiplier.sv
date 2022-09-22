module multiplier (input logic Clk, Reset_Load_Clear, Run, 
				input logic [7:0] SW,
				output logic [7:0] Aval, Bval,
				output logic Xval,
				output logic [6:0] HEX0, 
										 HEX1, 
										 HEX2, 
										 HEX3, 
										 HEX4,
										 HEX5

);
	logic M, Busy, Add, Sub, Shift, Clr_Ld;
	assign M = Bval[0];
	control control (.Clk (Clk), .Reset_Load_Clear (Reset_Load_Clear), .Run (Run), .M (M), .Busy (Busy)
							.Clr_Ld (Clr_Ld), .Shift (Shift), .Add (Add), .Sub (Sub));
	 
	if(Add == 1'b1)
	 begin
		full_adder9 ADD ();
	 end
	if(Sub == 1'b1)
	 begin
		subtractor8 SUB ();
	 end
	reg_8 REG_A ();
	reg_8 REG_B ();
endmodule
