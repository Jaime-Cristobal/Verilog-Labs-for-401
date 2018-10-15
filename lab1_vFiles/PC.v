`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2018 04:33:56 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] NPC_IN,
    output reg [31:0] PC_OUT
    );
    
    initial begin   //initial thread that sets PC_OUT = 0
        PC_OUT <= 0;
    end
    
    always @ (NPC_IN)
    begin
        #1
        PC_OUT = NPC_IN;
    end
    
endmodule
