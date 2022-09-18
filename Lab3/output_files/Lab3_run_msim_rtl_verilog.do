transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/router.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/reg_17.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/control.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/adder2.sv}

vlog -sv -work work +incdir+C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3 {C:/Users/zdrag/Documents/GitHub/385-FA2022/Lab3/testbench_L3.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_L3

add wave *
view structure
view signals
run 1000 ns
