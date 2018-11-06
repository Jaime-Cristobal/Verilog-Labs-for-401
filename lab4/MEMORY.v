`timescale 1ns / 1ps

module MEMORY(
    input wire [1:0] wb_ctlout,
    input wire branch, memread, memwrite,
    input wire zero,
    input wire [31:0] alu_result, rdata2out,
    input wire [4:0] five_bit_muxout,
    output wire MEM_PCSrc,
    output wire MEM_WB_regwrite, MEM_WB_memtoreg,
    output wire [31:0] read_data, mem_alu_result,
    output wire [4:0] mem_write_reg
    );
    
    //signals
    wire [31:0] read_data_in;
    
    //instantations
    AND AND_$ (.membranch(branch),
               .zero(zero),
               .PCSrc(MEM_PCSrc));
               
    D_MEM d_mem4 (.addr(alu_result),
                  .write_data(rdata2out),
                  .memwrite(memwrite),
                  .memread(memread),
                  .read_data(read_data));
                  
    MEM_WB mem_wb4 (.control_wb_in(wb_ctlout),      //splits into PSrc and memreg
                    .read_data_in(read_data),       //in from D_MEM
                    .alu_result_in(alu_result),     //connects to mem_alu_result
                    .write_reg_in(five_bit_muxout), //connects with mem_write_reg below
                    .regwrite(MEM_WB_regwrite),
                    .memtoreg(MEM_WB_memtoreg),
                    .read_data(read_data_in),           //goes to MUX 1
                    .mem_alu_result(mem_alu_result),    //goes to MUX 0
                    .mem_write_reg(mem_write_reg));     //goes to I_Decode writereg in Register
    
endmodule
