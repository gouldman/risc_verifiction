import tb_pkg::*;
`include "uvm_macros.svh"
class alu_env extends uvm_env;
    // alu_driver drv;
    // alu_in_monitor i_mon;
    alu_agent i_agt;
    function new(string name = "alu_env", uvm_component parent);
        super.new(name,parent);
    endfunction
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        i_agt = alu_agent::type_id::create("i_agt", this); //只有使用这种方式才支持重载
    endfunction
    `uvm_component_utils(alu_env)
endclass