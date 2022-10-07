onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_L52/Clk
add wave -noupdate /testbench_L52/Run
add wave -noupdate /testbench_L52/Continue
add wave -noupdate /testbench_L52/HEX0
add wave -noupdate /testbench_L52/HEX1
add wave -noupdate /testbench_L52/HEX2
add wave -noupdate /testbench_L52/HEX3
add wave -noupdate /testbench_L52/SW
add wave -noupdate /testbench_L52/LED
add wave -noupdate -radix binary /testbench_L52/IR
add wave -noupdate -radix hexadecimal /testbench_L52/MAR
add wave -noupdate -radix hexadecimal /testbench_L52/MDR
add wave -noupdate -radix hexadecimal /testbench_L52/PC
add wave -noupdate -radix binary /testbench_L52/ALU
add wave -noupdate /testbench_L52/datapath
add wave -noupdate /testbench_L52/SR1_OUT
add wave -noupdate /testbench_L52/SR2_OUT
add wave -noupdate /testbench_L52/SR2M_val
add wave -noupdate /testbench_L52/ADDR2_3
add wave -noupdate /testbench_L52/ADDR2_2
add wave -noupdate /testbench_L52/ADDR2_1
add wave -noupdate /testbench_L52/ADDR2_R
add wave -noupdate /testbench_L52/ADDR1_R
add wave -noupdate /testbench_L52/i5_OUT
add wave -noupdate /testbench_L52/ADDR_R
add wave -noupdate /testbench_L52/slc3_test/slc/state_controller/State
add wave -noupdate /testbench_L52/slc3_test/slc/state_controller/Next_state
add wave -noupdate -radix binary /testbench_L52/slc3_test/slc/state_controller/BEN
add wave -noupdate /testbench_L52/slc3_test/slc/regfile/reg_data
add wave -noupdate /testbench_L52/D_Rs
add wave -noupdate /testbench_L52/LD_MAR
add wave -noupdate /testbench_L52/LD_MDR
add wave -noupdate /testbench_L52/LD_IR
add wave -noupdate /testbench_L52/LD_BEN
add wave -noupdate /testbench_L52/LD_CC
add wave -noupdate /testbench_L52/LD_REG
add wave -noupdate /testbench_L52/LD_PC
add wave -noupdate /testbench_L52/LD_LED
add wave -noupdate /testbench_L52/GatePC
add wave -noupdate /testbench_L52/GateMDR
add wave -noupdate /testbench_L52/GateALU
add wave -noupdate /testbench_L52/GateMARMUX
add wave -noupdate /testbench_L52/PCMUX
add wave -noupdate /testbench_L52/DRMUX
add wave -noupdate /testbench_L52/SR1MUX
add wave -noupdate /testbench_L52/SR2MUX
add wave -noupdate /testbench_L52/ADDR1MUX
add wave -noupdate /testbench_L52/ADDR2MUX
add wave -noupdate /testbench_L52/ALUK
add wave -noupdate /testbench_L52/Mem_OE
add wave -noupdate /testbench_L52/Mem_WE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1455270 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 249
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1291727 ps} {1570139 ps}
