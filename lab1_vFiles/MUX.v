`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2018 04:33:56 PM
// Design Name: 
// Module Name: MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX(
    input [31:0] s0, s1,           //s0 = PC + 1, s1 = EX_MEM
    input PC_SELECT,
    output [31:0] NPC_OUT
    );
    
assign NPC_OUT = PC_SELECT == 1 ? s1 : s0;
    
    /**
    always @(PC_SELECT or s0 or s1) //(s0 or s1 or PC_SELECT)
    begin
        if(PC_SELECT == 1)
        //begin
            x = s1;
        //end
        else
        //begin
            x = s0;
        //end
    end
    */
    
endmodule
