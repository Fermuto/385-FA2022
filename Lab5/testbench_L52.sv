module testbench_L52 ();

	timeunit 10ns;
	timeprecision 1ns;
	
	logic Clk = 0;
	logic Run, Continue;
	logic [6:0] HEX0, HEX1, HEX2, HEX3;
	logic [9:0] SW, LED;
	
	
//	logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
	
	slc3_testtop slc3_test (.*);
	
	logic [15:0] IR, MAR, MDR, PC, ALU, datapath, SR1_OUT, SR2_OUT, SR2M_val, ADDR2_3, ADDR2_2, ADDR2_1, ADDR2_R, ADDR1_R, i5_OUT, ADDR_R;
//	logic [5:0] State, Next_state;
//	logic [15:0] reg_data [7:0];
	logic [2:0] D_Rs;
	logic    LD_MAR,
							LD_MDR,
							LD_IR,
							LD_BEN,
							LD_CC,
							LD_REG,
							LD_PC,
							LD_LED;
									
	logic   GatePC,
						GateMDR,
						GateALU,
						GateMARMUX;
						
	logic [1:0]  PCMUX;
	logic        DRMUX,
						SR1MUX,
						SR2MUX,
						ADDR1MUX;
	logic [1:0]  ADDR2MUX,
						ALUK;
	  
	logic   Mem_OE,
						Mem_WE;

	
	always_comb
		begin
			IR = slc3_test.slc.IR;
			PC = slc3_test.slc.PC;
			MAR = slc3_test.slc.MAR;
			MDR = slc3_test.slc.MDR;
			ALU = slc3_test.slc.ALU;
			SR1_OUT = slc3_test.slc.SR1_OUT;
			SR2_OUT = slc3_test.slc.SR2_OUT;
			SR2M_val = slc3_test.slc.SR2M_val;
			ADDR2_3 = slc3_test.slc.ADDR2_3;
			ADDR2_2 = slc3_test.slc.ADDR2_2;
			ADDR2_1 = slc3_test.slc.ADDR2_1;
			ADDR2_R = slc3_test.slc.ADDR2_R;
			ADDR1_R = slc3_test.slc.ADDR1_R;
			ADDR_R = slc3_test.slc.ADDR_R;
			i5_OUT = slc3_test.slc.i5_OUT;
			datapath = slc3_test.slc.datapath;
			D_Rs = slc3_test.slc.regfile.D_Rs;
			LD_MAR = slc3_test.slc.state_controller.LD_MAR;
			LD_MDR = slc3_test.slc.state_controller.LD_MDR;
			LD_IR = slc3_test.slc.state_controller.LD_IR;
			LD_CC = slc3_test.slc.state_controller.LD_CC;
			LD_REG = slc3_test.slc.state_controller.LD_REG;
			LD_BEN = slc3_test.slc.state_controller.LD_BEN;
			LD_PC = slc3_test.slc.state_controller.LD_PC;
			LD_LED = slc3_test.slc.state_controller.LD_LED;
			GatePC = slc3_test.slc.state_controller.GatePC;
			GateMDR = slc3_test.slc.state_controller.GateMDR;
			GateALU = slc3_test.slc.state_controller.GateALU;
			GateMARMUX = slc3_test.slc.state_controller.GateMARMUX;
			PCMUX = slc3_test.slc.state_controller.PCMUX;
			DRMUX = slc3_test.slc.state_controller.DRMUX;
			SR1MUX = slc3_test.slc.state_controller.SR1MUX;
			SR2MUX = slc3_test.slc.state_controller.SR2MUX;
			ADDR1MUX = slc3_test.slc.state_controller.ADDR1MUX;
			ADDR2MUX = slc3_test.slc.state_controller.ADDR2MUX;
			ALUK = slc3_test.slc.state_controller.ALUK;
			Mem_OE = slc3_test.slc.state_controller.Mem_OE;
			Mem_WE = slc3_test.slc.state_controller.Mem_WE;
		end
	
	always begin : CLOCK_GENERATION
	#1 Clk = ~Clk;
	end
	
	initial begin: CLOCK_INITIALIZATION
		Clk = 0;
	end
	
	
	initial begin: TEST_VECTORS
	Continue = 1'b1;
	Run = 1'b1;
	
	#10 Continue = 1'b0;
	Run = 1'b0;
	
	#2 Run = 1'b1;
	Continue = 1'b1;
	
	#4 SW = 16'h000B;
//	#1 force slc3_test.slc.state_controller.PCMUX = 2'b01;
//	#2 release slc3_test.slc.state_controller.PCMUX;
	#3 Run = 1'b0;
//		force slc3_test.slc.PC = 16'h3;
//	
//	#1 release slc3_test.slc.PC;
	#4 Run = 1'b1;
	
	#150 Continue = 1'b0;
	
	#4 Continue = 1'b1;
	
	#150 Continue = 1'b0;
	
	#4 Continue = 1'b1;
	
	#150 Continue = 1'b0;
	
	#4 Continue = 1'b1;
//	
//	#8 Run = 1'b0;
//	Continue = 1'b0;
	end
	
endmodule