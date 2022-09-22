module control (	input logic Clk, Reset_Load_Clear, Run, M, 
						input logic [1:0] FollowI,
						output logic Clr_Ld, Shift, Add, Sub, 
						output logic [1:0] FollowO);
						
	// Declare signals curr_state, next_state of type enum
   // with enum values of A, B, ..., F as the state values
	// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
   enum logic [7:0] {A, B, B2, C, C2, D, D2, E, E2, F, F2, G, G2, H, H2, I, I2, J}   curr_state, next_state; 
	logic [1:0] Follow;

	//updates flip flop, current state is the only one
   always_ff @ (posedge Clk)  
   begin
       if (Reset_Load_Clear)
           curr_state <= A;
       else 
           curr_state <= next_state;
		Follow = FollowI;
   end

   // Assign outputs based on state
	always_comb
    begin
			  next_state = curr_state;	//required because I haven't enumerated all possibilities below
			  unique case (curr_state) 

					A :    if (Run)
								  next_state = B;
					B :    next_state = B2;
					B2:    next_state = C;
					C :    next_state = C2;
					C2:    next_state = D;
					D :    next_state = D2;
					D2:    next_state = E;
					E :    next_state = E2;
					E2:    next_state = F;
					F :    next_state = F2;
					F2:    next_state = G;
					G :    next_state = G2;
					G2:    next_state = H;
					H :    next_state = H2;
					H2:    next_state = I;
					I :    next_state = I2;
					I2:    next_state = J;
					J :    next_state = A;

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
						 FollowO = 2'b00;
					end
					J: 
					begin
						 Clr_Ld = 1'b0;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b0;
						 FollowO = 2'b00;
					end
					default:
					begin 
						if ((Follow == 2'b10))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b0;
							Add = 1'b0;
							Sub = 1'b0;
							FollowO = 2'b00;
						 end
						else if ((M == 1'b1) & ((curr_state != (I)) | (curr_state != (I2))) & ((curr_state == B) | (curr_state == C) | (curr_state == D) | (curr_state == E) | (curr_state == F) | (curr_state == G) | (curr_state == H)))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b0;
							Add = 1'b1;
							Sub = 1'b0;
							FollowO = 2'b01;
						 end
						 
						else if ((Follow == 2'b01) & ((curr_state != (I)) | (curr_state != (I2))) & ((curr_state == B2) | (curr_state == C2) | (curr_state == D2) | (curr_state == E2) | (curr_state == F2) | (curr_state == G2) | (curr_state == H2)))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b0;
							Sub = 1'b0;
							FollowO = 2'b00;
						 end
						
						else if (M == 1'b1 & (curr_state == I))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b0;
							Add = 1'b0;
							Sub = 1'b1;
							FollowO = 2'b01;
						 end
						
						else if (Follow == 2'b01 & (curr_state == I2))
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b0;
							Sub = 1'b0;
							FollowO = 2'b00;
						 end
					
						else
						 begin
							Clr_Ld = 1'b0;
							Shift = 1'b1;
							Add = 1'b0;
							Sub = 1'b0;
							if ((curr_state == B) | (curr_state == C) | (curr_state == D) | (curr_state == E) | (curr_state == F) | (curr_state == G) | (curr_state == H) | (curr_state == I))
								FollowO = 2'b10;
							else
								FollowO = 2'b00;
						 end

					end
			  endcase
    end
endmodule
