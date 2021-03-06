transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {controller.vo}

vlog -vlog01compat -work work +incdir+D:/altera_project/logicDesignLab/Lab_Controller {D:/altera_project/logicDesignLab/Lab_Controller/testbench.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_mf_ver -L altera_ver -L lpm_ver -L sgate_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L gate_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
