module full_adder (input x, y, z,
	output logic s, c);
	always_comb
	 begin
		s = x^y^z;
		c = (x&y)|(y&z)|(x&z);
	 end
endmodule
