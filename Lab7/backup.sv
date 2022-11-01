/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
    // Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
    // We can put a clock divider here in the future to make this IP more generalizable
    input logic CLK,
    
    // Avalon Reset Input
    input logic RESET,
    
    // Avalon-MM Slave Signals
    input  logic AVL_READ,                    // Avalon-MM Read
    input  logic AVL_WRITE,                    // Avalon-MM Write
    input  logic AVL_CS,                    // Avalon-MM Chip Select
    input  logic [3:0] AVL_BYTE_EN,            // Avalon-MM Byte Enable
    input  logic [9:0] AVL_ADDR,            // Avalon-MM Address
    input  logic [31:0] AVL_WRITEDATA,        // Avalon-MM Write Data
    output logic [31:0] AVL_READDATA,        // Avalon-MM Read Data
    
    // Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
    output logic [3:0]  red, green, blue,    // VGA color channels (mapped to output pins in top-level)
    output logic hs, vs                        // VGA HS/VS
);

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers

//put other local variables here
logic blank, sync, VGA_Clk;

logic [31:0] row, col, Data, Control;
logic[10:0] addr;
logic[9:0] DrawX, DrawY, cmap_addr, font_addr;
logic[7:0] font_data;
logic[3:0] yIdx;
logic[2:0] xIdx;
logic[1:0] pos;

logic Inv;

//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller vg0(.Clk(CLK),.Reset(RESET),.hs(hs),
                            .vs(vs), .pixel_clk(VGA_Clk), .blank(blank),
                            .sync(sync), .DrawX(DrawX), .DrawY(DrawY)); 
									 
font_rom from0(.addr(addr), .data(font_data));
									 
always_ff @(posedge CLK) begin
    if(RESET) begin
        for(int i = 0; i< `NUM_REGS; i++)begin
            LOCAL_REG[i] <= 32'b00000000000000000000000000000000;
        end
     end
     else begin
        if(AVL_WRITE == 1'b1 && AVL_CS == 1'b1)
        begin
        case(AVL_BYTE_EN)
            4'b1111:
                LOCAL_REG[AVL_ADDR] <= AVL_WRITEDATA;
            4'b1100:
                LOCAL_REG[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
            4'b0011:
                LOCAL_REG[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
            4'b1000:
                LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];    
            4'b0100:
                LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];                
            4'b0010:
                LOCAL_REG[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];                
            4'b0001:
                LOCAL_REG[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];    
        endcase
        end
        else if(AVL_READ == 1'b1 && AVL_CS == 1'b1)
            AVL_READDATA <= LOCAL_REG[AVL_ADDR];
    end
end

always_comb begin
        row <= DrawY/8'd16;
        col <= DrawX/8'd8;
        font_addr <= (row*8'd80) + col;
        cmap_addr <= (font_addr / 4'd4);
        pos <= (font_addr % 4);
end



always_comb
begin
Data = LOCAL_REG[((row*8'd80)+col)/4'd4];
Control = LOCAL_REG[600];
  case(pos)
		2'b00:
			 begin
			 addr[10:4] <= Data[6:0];
			 Inv <= Data[7];
			 end
		2'b01:
			 begin
			 addr[10:4] <= Data[14:8];
			 Inv <= Data[15];
			 end
		2'b10:
			 begin
			 addr[10:4] <= Data[22:16];
			 Inv <= Data[23];
			 end
		2'b11:
			 begin
			 addr[10:4] <= Data[30:24];
			 Inv <= Data[31];
			 end
  endcase
end

assign xIdx = 7-DrawX%8;
assign yIdx = DrawY%16;
assign addr[3:0] = yIdx;

always_ff @ (posedge VGA_Clk)
   begin
      if(blank == 1'b0)begin
            red <= 8'b0000;
            green <= 8'b0000;
            blue <= 8'b0000;
        end
        else begin
        
            if ((Inv && font_data[xIdx]) || (!Inv && !font_data[xIdx])) 
				begin 
            red <= Control[12:9]; 
            green <= Control[8:5];
            blue <= Control[4:1];
            end      
				
            else 
				begin 
            red <= Control[24:21];
            green <= Control[20:17];
            blue <= Control[16:13];
            end
        end
   end 

endmodule 