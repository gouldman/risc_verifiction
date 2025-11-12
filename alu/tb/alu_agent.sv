class alu_agent extends uvm_agent;
    alu_driver drv;
    alu_in_monitor mon;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

    `uvm_component_utils(alu_agent)
endclass

function void alu_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(is_active == UVM_ACTIVE) begin
        drv = alu_driver::type_id::create("drv", this);
    end
    mon = alu_in_monitor::type_id::create("mon", this);
endfunction

function void alu_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction