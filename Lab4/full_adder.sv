module full_adder (logic input x, y, z,
	logic output s, c, Done);
	always_comb
	 begin
		Done = 1'b0;
		s = x^y^z;
		c = (x&y)|(y&z)|(x&z);
		Done = 1'b1;
	 end
endmodule
