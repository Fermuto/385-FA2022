transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/control.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/full_adder9.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/reg_8.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/subtractor8.sv}

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab4/testbench_L4.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_L4

add wave *
view structure
view signals
run 105 ns
