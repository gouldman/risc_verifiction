
import uvm_pkg::*;
`include "uvm_macros.svh"
class alu_driver extends uvm_driver;
    virtual alu_in_if vif;
    `uvm_component_utils(alu_driver)
    function new(string name = "alu_driver", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("alu_driver", "new is called", UVM_LOW)
    endfunction
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual alu_in_if)::get(this, "", "vif", vif))
            `uvm_fatal("alu_driver", "virtual interface must be set for vif!!!")
    endfunction
    extern task drive_one_pkt(alu_transaction tr);
    extern virtual task main_phase(uvm_phase phase);
endclass

task alu_driver::main_phase(uvm_phase phase);
    alu_transaction tr;
     phase.raise_objection(this);
    `uvm_info("alu_driver", "main_phase is called", UVM_LOW);
    vif.control <= 4'b0;
    vif.left_operand <= 32'b0;
    vif.right_operand <= 32'b0;
    for (int i = 0; i < 256; i++) begin
        // @(posedge uvm_top_tb.clk);
        // vif.control <= $urandom_range(0, 10);
        // vif.left_operand <=  $urandom_range(0, 255);
        // vif.right_operand <= $urandom_range(0, 255);
        tr = new("tr");
        assert(tr.randomize());
        drive_one_pkt(tr);
        if(i == 255) `uvm_info("alu_driver", "data is drived", UVM_LOW);
    end
    phase.drop_objection(this);
    
endtask

task alu_driver::drive_one_pkt(alu_transaction tr);
            @(posedge vif.clk);
        vif.control <= tr.control;
        vif.left_operand <=  tr.left_operand;
        vif.right_operand <= tr.right_operand;
endtask