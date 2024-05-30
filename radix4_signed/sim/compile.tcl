

set src_folder "../src"

set tb_folder "../tb"

vlib work

vlog -sv -work work ${src_folder}/full_adder.sv
vlog -sv -work work ${src_folder}/half_adder.sv
vlog -sv -work work ${src_folder}/encoder.sv
vlog -sv -work work ${src_folder}/_4_bit_adder.sv
vlog -sv -work work ${src_folder}/_4_bit_mux.sv
vlog -sv -work work ${src_folder}/G.sv
vlog -sv -work work ${src_folder}/PG.sv
vlog -sv -work work ${src_folder}/cla.sv
vlog -sv -work work ${src_folder}/select_adder.sv
vlog -sv -work work ${src_folder}/_24_bit_adder.sv
vlog -sv -work work ${src_folder}/dadda_tree.sv
vlog -sv -work work ${src_folder}/radix4_multiplier.sv

vlog -sv -work work ${tb_folder}/tb_r4-mbe.sv