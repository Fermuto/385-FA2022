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
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [601]; // Registers
//put other local variables here


//Declare submodules..e.g. VGA controller, ROMS, etc

   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin
	if (AVL_CS && AVL_READ)
	begin
		AVL_READDATA <= 32'b00000000000000000000000000000000;
		case (AVL_BYTE_EN)
		4'b1111:
			begin
				AVL_READDATA <= LOCAL_REG[AVL_ADDR];
			end
		4'b1100:
			begin
				AVL_READDATA[31:16] <= LOCAL_REG[AVL_ADDR][31:16];
			end
		4'b0011:
			begin
				AVL_READDATA[15:0] <= LOCAL_REG[AVL_ADDR][15:0];
			end
		4'b1000:
			begin
				AVL_READDATA[31:24] <= LOCAL_REG[AVL_ADDR][31:24];
			end
		4'b0100:
			begin
				AVL_READDATA[23:16] <= LOCAL_REG[AVL_ADDR][23:16];
			end
		4'b0010:
			begin
				AVL_READDATA[15:8] <= LOCAL_REG[AVL_ADDR][15:8];
			end
		4'b0001:
			begin
				AVL_READDATA[7:0] <= LOCAL_REG[AVL_ADDR][7:0];
			end
		endcase
	end
	
	else if (AVL_CS && AVL_WRITE)
	begin
		case (AVL_BYTE_EN)
		4'b1111:
			begin
				LOCAL_REG[AVL_ADDR] <= AVL_WRITEDATA;
			end
		4'b1100:
			begin
				LOCAL_REG[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
			end
		4'b0011:
			begin
				LOCAL_REG[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
			end
		4'b1000:
			begin
				LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
			end
		4'b0100:
			begin
				LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
			end
		4'b0010:
			begin
				LOCAL_REG[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
			end
		4'b0001:
			begin
				LOCAL_REG[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
			end
		endcase
	end
	
		

end


//handle drawing (may either be combinational or sequential - or both).

//always_ff(VGA_Clk)

endmodule
