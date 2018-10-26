`timescale 1ns / 1ps

/**Lab2 */

module I_Decode(
    input wire [31:0] IF_ID_instrout,       //unconnected port
    input wire [31:0] IF_ID_npcout,
    input wire [4:0] MEM_WB_rd,
    input wire MEM_WB_regwrite,
<<<<<<< HEAD
    input wire [31:0] WB_mux5_writedata,
=======
    input wire [31:0] WB_mux5_writedata,    //unconnected port
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
    
    //input wire [3:0] ctlex_out,
    //input wire [2:0] ctlm_out,
    //input wire [1:0] ctlwb_out,
    //input wire [31:0] readdat1, readdat2, signext_out,
    
    output wire [1:0] wb_ctlout,
    output wire [2:0] m_ctlout,
    output wire regdst, alusrc,
    output wire [1:0] aluop,
    output wire [31:0] npcout, rdata1out, rdata2out, s_extendout,       //both radatas are driven by constant 0
    output wire [4:0] instrout_2016, instrout_1511
    );
        //signals
        wire [3:0] ctlex_out;
        wire [2:0] ctlm_out;
        wire [1:0] ctlwb_out;
        wire [31:0] readdat1, readdat2, signext_out;
        
        //instantiations
        Control control2        (.opcode(IF_ID_instrout[31:26]),
                                 .EX(ctlex_out),
                                 .M(ctlm_out),
                                 .WB(ctlwb_out));
                                 
        Register register2      (.rs(IF_ID_instrout[25:21]),
                                 .rt(IF_ID_instrout[20:16]),
                                 .rd(MEM_WB_rd),
                                 .writedata(WB_mux5_writedata),
                                 .regwrite(MEM_WB_regwrite),
                                 .A(readdat1),
                                 .B(readdat2));
                                 
        Sign_Extend s_extend2   (.nextend(IF_ID_instrout[15:0]),
                                 .extend(signext_out));
                                 
        ID_Extend id_ex2        (.ctlwb_out(ctlwb_out),
                                 .ctlm_out(ctlm_out),
                                 .ctlex_out(ctlex_out),
                                 .npc(IF_ID_npcout),
                                 .readdat1(readdat1),
                                 .readdat2(readdat2),
                                 .signext_out(signext_out),
                                 .instr_2016(IF_ID_instrout[20:16]),
                                 .instr_1511(IF_ID_instrout[15:11]),
                                 .wb_ctlout(wb_ctlout),
                                 .m_ctlout(m_ctlout),
                                 .regdst(regdst),
                                 .alusrc(alusrc),
                                 .aluop(aluop),
                                 .npcout(npcout),
                                 .rdata1out(rdata1out),
                                 .rdata2out(rdata2out),
                                 .s_extendout(s_extendout),
                                 .instrout_2016(instrout_2016),
                                 .instrout_1511(instrout_1511));
    
endmodule
