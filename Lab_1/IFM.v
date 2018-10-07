`timescale 1ns / 1ps
//INSTRUCTOR FETCH MODULE (IFM)
//////////////////////////////////////////////////////////
// The top level module for the Instruction Fetch Stage .
// This is how all of the individual modules are
// connected to each other .
//////////////////////////////////////////////////////////
module IFM(
    input EX_MEM_PCSrc,
    input wire [31:0] EX_MEM_NPC,
    output wire [31:0] IF_ID_INSTR, IF_ID_NPC
    );
    //signals
    wire [31:0] PC;
    wire [31:0] dataout;
    wire [31:0] npc, npc_mux;
    //instantiations
    mux mux_1(.npc(npc_mux), .s1(EX_MEM_NPC),
              .s0(npc), .select(EX_MEM_PCSrc));
               
    pc pc_1(.pc_out(PC), .npc(npc_mux));
    
    mem mem_1(.data(dataout), .addr(PC));
    
    IF_ID IF_ID_1(.instruction_out(IF_ID_instr),
                  .npc_out(IF_ID_npc),
                  .instruction_in(dataout),
                  .npc_in(npc));
    
endmodule
