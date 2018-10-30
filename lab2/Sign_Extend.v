`timescale 1ns / 1ps

/**Lab2 */

module Sign_Extend (
    input wire [15:0] nextend,
    output reg [31:0] extend
    );
    
        always @* begin
            //bit shift left in 2's complement form; from 16 to 32 bit extension 
            extend <= {{16{nextend[15]}}, {nextend[15:0]}};
        end
    
endmodule