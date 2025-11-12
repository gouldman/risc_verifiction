
import uvm_pkg::*;
`include "uvm_macros.svh"
class alu_transaction extends uvm_sequence_item;
    rand bit [3:0]  control;
    rand bit [31:0] left_operand;
    rand bit [31:0] right_operand;

    `uvm_object_utils(alu_transaction)
    function new(string name = "alu_transaction");
        super.new(name);
    endfunction
endclass