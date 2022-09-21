module full_adder (logic input x, y, z,
	logic output s, c);
		assign s = x^y^z;
		assign c = (x&y)|(y&z)|(x&z);
endmodule
