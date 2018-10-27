`timescale 1ns / 1ps

module Ex_Mem(
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [31:0] adder_out,
    input wire aluzero,
    input wire [31:0] aluout, readdat2,
    input wire [4:0] muxout,
    output reg [1:0] wb_ctlout,
    output reg branch, memread, memwrite,
    output reg [31:0] add_result,
    output reg zero,
    output reg [31:0] alu_result, rdata2out,
    output reg [4:0] five_bit_muxout
    );
    
    initial begin
        wb_ctlout <= 0;
        branch <= 0;
        memread <= 0;
        memwrite <= 0;
        add_result <= 0;
        zero <= 0;
        alu_result <= 0;
        rdata2out <= 0;
        five_bit_muxout <= 0;
    end
    
    always @* begin
        #1 //update delay
       
        wb_ctlout <= ctlwb_out;
        branch <= aluzero;      //branch, memread, and memwrite not in fig 3.7
        memread <= ctlm_out;   //check
        memwrite <= ctlm_out;    //check
        add_result <= adder_out;
        zero <= aluzero;
        alu_result <= aluout;
        rdata2out <= readdat2;
        five_bit_muxout <= muxout;
    end
    
endmodule
