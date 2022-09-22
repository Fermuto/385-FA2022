module multiplier (input Clk, Reset_Load_Clear, Run, 
				input [7:0] SW,
				output [7:0] Aval, Bval,
				output logic Xval, Add, Sub, Shift,
				output [6:0] HEX0, 
										 HEX1, 
										 HEX2, 
										 HEX3, 
										 HEX4,
										 HEX5);
	logic M, Clr_Ld, ALoad, BLoad, X_Out, X_Sub;
	logic [1:0] Follow;
	logic [7:0] Mid_A, Mid_B, Add_Out, Sub_Out;
	initial Follow = 0;
	assign M = Bval[0];
	
	always_comb	
		begin
				RLC_h = ~Reset_Load_Clear;
				Run_h = ~Run;

		end
	
	always_ff @ (posedge Clk)
	 begin
		if (RLC_h)
			Xval <= 1'b0;
		if (Run_h)
			Xval <= 1'b0;
		if (Add)
			Xval <= X_Out;
		if (Sub)
			Xval <= X_Sub;

	 end
	
	control control (.Clk (Clk), .Reset_Load_Clear (RLC_h), .Run (Run_h), .M (M), .FollowI (Follow),
							.Clr_Ld (Clr_Ld), .Shift (Shift), .Add (Add), .Sub (Sub), .FollowO (Follow));
	full_adder9 ADD (.A (Aval), .S (SW), .cin (1'b0), .A_Out (Add_Out), .X (X_Out));
	full_adder9 SUB (.A (Aval), .S (~SW), .cin (1'b1), .A_Out (Sub_Out), .X (X_Sub));
	always_comb
	begin
		if (RLC_h)
		 begin
			Mid_B = SW;
			Mid_A = 8'b00000000;
		 end
		else if (Run_h)
		 begin
			Mid_A = 8'b00000000;
			Mid_B = 8'b00000000;
		 end
		else
		 begin
			if(Add == 1'b1)
			 begin
				Mid_A = Add_Out;
				Mid_B = Add_Out;
			 end
			else if(Sub == 1'b1)
			 begin
				Mid_A = Sub_Out;
				Mid_B = Sub_Out;
			 end
			else
			 begin
				Mid_A = 8'b00000000;
				Mid_B = 8'b00000000;
			 end
		 end	
	end
	assign ALoad = (Add | Sub);
	assign BLoad = (RLC_h);
	reg_8 REG_B (.Clk (Clk), .Reset (1'b0), .Shift_In (Aval[0]), .Load (BLoad), .Shift_En (Shift)
					, .D (Mid_B), .Data_Out (Bval));
	reg_8 REG_A (.Clk (Clk), .Reset (RLC_h), .Shift_In (Xval), .Load (ALoad), .Shift_En (Shift)
					, .D (Mid_A), .Data_Out (Aval));
					
					
	HexDriver		SWHex0 (
								.In0(SW[3:0]),
								.Out0(HEX0) );
								
	HexDriver		SWHex1 (
								.In0(SW[7:4]),
								.Out0(HEX1) );
								
	HexDriver		BHex0 (
								.In0(Bval[3:0]),
								.Out0(HEX2) );
								
	HexDriver		BHex1 (
								.In0(Bval[7:4]),
								.Out0(HEX3) );
		
	HexDriver		AHex0 (
								.In0(Aval[3:0]),
								.Out0(HEX4) );
								
	HexDriver		AHex1 (
								.In0(Aval[7:4]),
								.Out0(HEX5) );
endmodule
