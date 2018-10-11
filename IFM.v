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
    MUX mux_1(.NPC_OUT(npc_mux), .s1(EX_MEM_NPC),
              .s0(npc), .PC_SELECT(EX_MEM_PCSrc));
               
    PC pc_1(.PC_OUT(PC), .NPC_IN(npc_mux));
    
    InstrucMem mem_1(.data(dataout), .address(PC));
    
    IM im(.PC_IN(npc), .PC_NEXT_INSTRUC(PC));
    
    IF_IDLatch IF_ID_1(.instruction_out(IF_ID_INSTR),
                  .npc_out(IF_ID_NPC),
                  .instruction_in(dataout),
                  .npc_in(npc));
    
endmodule
