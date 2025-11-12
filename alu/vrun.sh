vdel -all
vlib work

vlog -sv -timescale 1ns/1ns +acc=pr \
  +incdir+tb \
  +incdir+/F:/questasim/verilog_src/uvm-1.2/src \
  dut/common.sv \
  dut/alu.sv \
  tb/tb_pkg.sv \
  tb/uvm_top_tb.sv

vsim -i work.uvm_top_tb +UVM_NO_RELNOTES +UVM_VERBOSITY=UVM_HIGH
add wave -radix unsigned uvm_top_tb/input_if/*
run -all
