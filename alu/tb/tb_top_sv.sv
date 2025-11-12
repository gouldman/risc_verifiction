`timescale 1ns / 1ps

import common::*;

// 顶层 testbench
module tb_top;

  // DUT 输入输出信号
  logic [3:0]   control;
  logic [31:0]  left_operand;
  logic [31:0]  right_operand;
  logic [31:0]  result;
  logic         zero_flag;
  logic         overflow;

  // 实例化 DUT
  alu dut (
    .control(control),
    .left_operand(left_operand),
    .right_operand(right_operand),
    .zero_flag(zero_flag),
    .result(result),
    .overflow(overflow)
  );



  // 简单仿真流程
  initial begin
    // 初始化
    control       = ALU_ADD;
    left_operand  = 32'd1;
    right_operand = 32'd2;

    #10; // 等待若干时间单位
    $display("ALU result = %0d, zero=%b, overflow=%b", result, zero_flag, overflow);

    #10;
    $finish;
  end

endmodule
