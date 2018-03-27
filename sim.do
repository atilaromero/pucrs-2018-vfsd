vlib work
vmap work work

vcom -work work sqrt.vhd
vlog -work work interface_sqrt.sv
vlog -work work test_sqrt.sv
vlog -work work top_sqrt.sv

vsim work.top_sqrt_svl

#do wave.do
run 16000ns

