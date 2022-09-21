module control (	input logic Clk, Reset_Load_Clear, Run, M, Busy,
						output logic Clr_Ld, Shift, Add, Sub);
						
	// Declare signals curr_state, next_state of type enum
   // with enum values of A, B, ..., F as the state values
	// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
   enum logic [3:0] {A, B, C, D, E, F, G, H, I, J}   curr_state, next_state; 

	//updates flip flop, current state is the only one
   always_ff @ (posedge Clk)  
   begin
       if (Reset_Load_Clear)
           curr_state <= A;
       else 
           curr_state <= next_state;
   end

   // Assign outputs based on state
	always_comb
    begin
        if (Busy == 1'b0)
		   begin
			  next_state = curr_state;	//required because I haven't enumerated all possibilities below
			  unique case (curr_state) 

					A :    if (Run)
								  next_state = B;
					B :    next_state = C;
					C :    next_state = D;
					D :    next_state = E;
					E :    next_state = F;
					F :	 next_state = G;
					G :	 next_state = H;
					H :	 next_state = I;
					I :	 next_state = J;
					J :    if (Run) 
								  next_state = B;
			  endcase
		
			// Assign outputs based on ‘state’
			// If M = 1, and curr_state != I, ADD + SHIFT
			// IF M = 1 and curr_state = I, SUB + SHIFT
			// If M = 0, SHIFT
			  case (curr_state) 
					A: 
					begin
						 Clr_Ld = 1'b1;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b0;
					end
					J: 
					begin
						 Clr_Ld = 1'b0;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b0;
					end
					default:
					begin 
						if (M == 1'b1 && (curr_state != I))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b1;
							Sub = 1'b0;
						 end
						if (M == 1'b1 && (curr_state == I))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b0;
							Sub = 1'b1;
						 end
						else
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b0;
							Sub = 1'b0;
						 end
					end
			  endcase
		  end
    end
endmodule
