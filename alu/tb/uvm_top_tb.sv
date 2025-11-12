`timescale 1ns/1ps
import uvm_pkg::*;
import tb_pkg::*;
     `include "alu_if.sv"
module uvm_top_tb;
    
    reg clk;
    reg [3:0] control;
    reg [31:0] left_operand;
    reg [31:0] right_operand;

    wire [31:0] result;
    wire overflow;
    wire zero_flag;

    alu_in_if input_if(clk);
    alu_out_if output_if();
    alu dut(
        .control(input_if.control),
        .left_operand(input_if.left_operand),
        .right_operand(input_if.right_operand),
        .zero_flag(output_if.zero_flag),
        .result(output_if.result),    
        .overflow(output_if.overflow)

    );

    initial begin
        uvm_config_db#(virtual alu_in_if)::set(null, "uvm_test_top.drv", "vif" , input_if);
        uvm_config_db#(virtual alu_in_if)::set(null, "uvm_test_top.i_mon", "vif" , input_if);
    end

    initial begin
        // code without factory
        // alu_driver drv;
        // drv = new("drv", null);
        // drv.main_phase(null);
        // $finish();
        run_test("alu_env");
    end

    initial begin
        clk = 0;
        forever begin
            #100 clk = ~clk;
        end
    end

endmodule