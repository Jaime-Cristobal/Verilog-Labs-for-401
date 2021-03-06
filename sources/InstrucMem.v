`timescale 1ns / 1ps
///////////////////////////////////////////////////////
// Memory module which holds all of the instructions
// needed by the MIPS processor
///////////////////////////////////////////////////////

module InstrucMem(
    input [31:0] address,
    output reg [31:0] data
    );
reg [31:0] MEM[0:127];
integer i;

initial begin
    $readmemb("risc.txt", MEM);
    
    /**
    MEM[0] <= 'hA00000AA ;
    MEM[1] <= 'h10000011 ;
    MEM[2] <= 'h20000022 ;
    MEM[3] <= 'h30000033 ;
    MEM[4] <= 'h40000044 ;
    MEM[5] <= 'h50000055 ;
    MEM[6] <= 'h60000066 ;
    MEM[7] <= 'h70000077 ;
    MEM[8] <= 'h80000088 ;
    MEM[9] <= 'h90000099 ;
    */
    
    for(i = 0; i < 24; i = i + 1)
        MEM[i] = i;
    
    $display("From instruction memory (risc.txt):");
    for(i = 0; i < 24; i = i + 1)
        $display(MEM[i]);
end
    
always @ (address)
begin
    data <= MEM[address];
end
    
endmodule
