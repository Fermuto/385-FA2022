transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/bufferMUX.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/reg_16.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/o16MUX21.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/slc3.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/provided/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab5/testbench_L51.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_L51

add wave *
view structure
view signals
run 1000 ns
