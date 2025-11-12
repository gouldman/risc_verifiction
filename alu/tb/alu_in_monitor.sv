import uvm_pkg::*;
import tb_pkg::*;
`include "uvm_macros.svh"
class alu_in_monitor extends uvm_monitor;
    virtual alu_in_if vif;
    `uvm_component_utils(alu_in_monitor)
    function new(string name = "alu_in_monitor", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual alu_in_if)::get(this, "", "vif", vif))
        `uvm_fatal("alu_in_monitor", "virtual interface must be set for vif")
    endfunction


    extern task main_phase(uvm_phase phase);
    extern task collect_one_pkt(alu_transaction tr);
endclass

task alu_in_monitor::main_phase(uvm_phase phase);
    alu_transaction tr;
    while(1) begin
        tr = new("tr");
        collect_one_pkt(tr);
    end
endtask

task alu_in_monitor::collect_one_pkt(alu_transaction tr);

    `uvm_info("alu_in_monitor", "begin to collect one pkt", UVM_LOW);
    tr.control = vif.control;
    tr.left_operand = vif.left_operand;
    tr.right_operand = vif.right_operand;
    `uvm_info("alu_in_monitor", "end collect one pkt, print it:", UVM_LOW);
    tr.my_print();
endtask