`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2018 04:33:56 PM
// Design Name: 
// Module Name: IF_IDLatch
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


module IF_IDLatch(
        input wire [31:0] instruction_in, npc_in,
        output reg [31:0] instruction_out, npc_out
    );
initial begin
    instruction_out <= 0;
    npc_out <= 0;
end
    
always @* //@(instruction_in or npc_in)
begin
    #1
    instruction_out <= instruction_in;
    npc_out <= npc_in;
end
    
endmodule
