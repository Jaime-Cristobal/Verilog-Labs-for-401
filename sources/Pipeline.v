`timescale 1ns / 1ps

module Pipeline();
   //Instruction Fetch Module (IFM)
   wire [31:0] IF_ID_instrout, IF_ID_npcout;
   wire MEM_PCSrc;
   wire [31:0] EX_MEM_NPC;
   
   IFM fetch1 (.EX_MEM_PCSrc(MEM_PCSrc),
               .EX_MEM_NPC(EX_MEM_NPC),
               .IF_ID_INSTR(IF_ID_instrout),
               .IF_ID_NPC(IF_ID_npcout));
               
   initial begin
        #24 $stop;
   end
   
   //Instruction Decode (I_Decode)
   wire [4:0] MEM_WB_rd;
   wire MEM_WB_regwrite;
   wire [31:0] WB_mux5_writedata;
   wire [1:0] wb_ctlout;
   wire [2:0] m_ctlout;
   wire regdst, alusrc;
   wire [1:0] aluop;
   wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
   wire [4:0] instrout_2016, instrout_1511;
   
   I_Decode idecode2 (.IF_ID_npcout(IF_ID_npcout),
                      .IF_ID_instrout(IF_ID_instrout),
                      .MEM_WB_rd(MEM_WB_rd),
                      .MEM_WB_regwrite(MEM_WB_regwrite),
                      .WB_mux5_writedata(WB_mux5_writedata),
                      .wb_ctlout(wb_ctlout),
                      .m_ctlout(m_ctlout),
                      .regdst(regdst),
                      .aluop(aluop),
                      .alusrc(alusrc),
                      .npcout(npcout),
                      .rdata1out(rdata1out),
                      .rdata2out(rdata2out),
                      .s_extendout(s_extendout),
                      .instrout_2016(instrout_2016),
                      .instrout_1511(instrout_1511));
                      
    //Execute
    wire [1:0] wb_ctlout_pipe;
    wire branch, memread, memwrite;
    wire zero;
    wire [31:0] alu_result, rdata2out_pipe;
    wire [4:0] five_bit_muxout;
    
    //anything that's not commented is from the I_Decode pipeline
    Execute execute3 (.wb_ctl(wb_ctlout),
                      .m_ctl(m_ctlout), 
                      .regdst(regdst),
                      .alutsrc(alusrc),
                      .aluop(aluop),
                      .npcout(npcout),
                      .rdata1(rdata1out),
                      .rdata2(rdata2out),
                      .s_extendout(s_extendout),
                      .instrout_2016(instrout_2016),
                      .instrout_1511(instrout_1511),
                      .wb_ctlout(wb_ctlout_pipe),                     //going to MEM pipeline stage
                      .branch(branch),                                //going to MEM pipeline stage
                      .memread(memread),                              //going to MEM pipeline stage
                      .memwrite(memwrite),                            //going to MEM pipeline stage
                      .EX_MEM_NPC(EX_MEM_NPC),
                      .zero(zero),                                    //going to MEM pipeline stage
                      .alu_result(alu_result),                        //going to MEM pipeline stage
                      .rdata2out(rdata2out_pipe),                     //going to MEM pipeline stage
                      .five_bit_muxout(five_bit_muxout));             //going to MEM pipeline stage
                      
    //Memory
    wire MEM_WB_memtoreg;
    wire [31:0] read_data, mem_alu_result;
    
    //anything that's not commented is from the Execution pipeline
    MEMORY memory4 (.wb_ctlout(wb_ctlout_pipe),
                    .branch(branch),
                    .memread(memread),
                    .memwrite(memwrite),
                    .zero(zero),
                    .alu_result(alu_result),
                    .rdata2out(rdata2out_pipe),
                    .five_bit_muxout(five_bit_muxout),
                    .MEM_PCSrc(MEM_PCSrc),                  //Back to the MUX in IF module
                    .MEM_WB_regwrite(MEM_WB_regwrite),
                    .MEM_WB_memtoreg(MEM_WB_memtoreg),      //to WB stage mux
                    .read_data(read_data),                  //to WB stage mux
                    .mem_alu_result(mem_alu_result),        //to WB stage mux
                    .mem_write_reg(MEM_WB_rd));             //goes to rd (write reg) in I_Decode Register

    //Write Back
    Write_Back wb5 (.memtoreg(MEM_WB_memtoreg),
                    .mem_read_data(read_data),
                    .mem_alu_result(mem_alu_result),
                    .wb_data(WB_mux5_writedata));
endmodule
