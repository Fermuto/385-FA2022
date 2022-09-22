module compute (
	input logic  [7:0] A, S,
	input logic        Add, Sub,
	output logic [7:0] A_Out,
	output logic       X_Out,
	output logic Computing
);
	assign Computing = 1'b1;
	if (Add == 1'b1)
	 begin
		full_adder9 ADD (.A (A), .S (S), .cin (1'b0), .A_Out (A_Out), .X (X_Out));
		assign Computing = 1'b0;
	 end
	if (Sub == 1'b1)
	 begin
		subtractor8 SUB ();
		assign Computing = 1'b0;
	else
		assign Computing = 1'b0;
endmodule
