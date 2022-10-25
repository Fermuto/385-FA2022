//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] SpriteX, SpriteY, DrawX, DrawY,
							  input			[3:0] FGD_R, FGD_G, FGD_B, BKG_R, BKG_G, BKG_B,
                       output logic [3:0]  Red, Green, Blue );
    
    
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */

	  
//    int DistX, DistY, Size;
//	 assign DistX = DrawX - BallX;
//    assign DistY = DrawY - BallY;
//    assign Size = Ball_size;
	  
	  
	 logic sprite_on;
	 logic[10:0] sprite_x = SpriteX;
	 logic[10:0] sprite_y = SpriteY;
	 logic[10:0] sprite_x_size = 8;
	 logic[10:0] sprite_y_size = 16;
	 
	 logic[10:0] sprite_addr;
	 logic[7:0] sprite_data;
	 
	 font_rom bitmaps (.addr (sprite_addr), .data (sprite_data));
	 
    always_comb
    begin:sprite_on_proc
        if (DrawX >= sprite_x && DrawX < sprite_x + sprite_x_size &&
				DrawY >= sprite_y && DrawY < sprite_y + sprite_y_size) 
				begin
            sprite_on = 1'b1;
				sprite_addr = (DrawY - shape_y + 16*'h48);
				end
        else 
		  begin
            sprite_on = 1'b0;
				sprite_addr = 10'b0;
			end
     end 
       
    always_comb
    begin:RGB_Display
        if ((sprite_on == 1'b1) && sprite_data[DrawX - sprite_x] == 1'b1) 
        begin 
            Red = FGD_R;
            Green = FGD_G;
            Blue = FGD_B;
        end       
        else 
        begin 
            Red = BGD_R; 
            Green = 8'hff;
            Blue = 8'ff;
        end      
    end 
    
endmodule
