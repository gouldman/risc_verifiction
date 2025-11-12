interface alu_in_if();
    logic [3:0] control;
    logic [31:0] left_operand;
    logic [31:0] right_operand;
endinterface

interface alu_out_if();
    logic zero_flag;
    logic [31:0] result;
    logic overflow;
    
endinterface //alu_out_if()