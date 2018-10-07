`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2018 04:33:56 PM
// Design Name: 
// Module Name: IM
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

/**Incrementer Module*/
module IM(
    input wire [31:0] PC_IN,
    output wire [31:0] PC_NEXT_INSTRUC
    );
    
    assign PC_NEXT_INSTRUC = PC_IN + 1;    /*add 1 to PC_IN*/
    
endmodule
