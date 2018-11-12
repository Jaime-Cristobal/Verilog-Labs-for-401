`timescale 1ns / 1ps

module Write_Back(
    output wire [31:0] wb_data,                         //select
    input wire [31:0] mem_alu_result, mem_read_data,    //b(0) -> 1 on diagram, a(1) -> 0
    input wire memtoreg
    );

    MUX3 mux5 (.y(wb_data),
               .a(mem_read_data),        //a -> 1; so set it to opposite
               .b(mem_alu_result),       //b -> 0
               .sel(memtoreg));
               
    
endmodule
