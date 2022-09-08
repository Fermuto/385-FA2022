transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/Synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/Router.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/compute.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2/2.2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/2.2/reg_8.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2/2.2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/2.2/control_8.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2/2.2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/2.2/register_unit_8.sv}
vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2/2.2 {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/2.2/Processor_8.sv}

vlog -sv -work work +incdir+C:/Users/dante/Desktop/Professional/School/Classes/ECE\ 385/385-FA2022/Lab2/2.2/.. {C:/Users/dante/Desktop/Professional/School/Classes/ECE 385/385-FA2022/Lab2/2.2/../testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  Simulation

add wave *
view structure
view signals
run 1000 ns
