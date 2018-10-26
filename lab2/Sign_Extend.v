`timescale 1ns / 1ps

/**Lab2 */

module Sign_Extend (
<<<<<<< HEAD
    input wire [15:0] nextend,
=======
    input wire [15:0] nextend,      //unconnected port
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
    output reg [31:0] extend
    );
    
        always @* begin
<<<<<<< HEAD
            //bit shift left in 2's complement form; from 16 to 32 bit extension 
            extend <= {{16{nextend[15]}}, {nextend[15:0]}};
=======
            //replicate signed bit 16 times then cancatinate
            extend = {16{nextend}};
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
        end
    
endmodule