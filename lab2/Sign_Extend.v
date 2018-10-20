`timescale 1ns / 1ps

/**Lab2 */

module Sign_Extend (
    input wire [15:0] nextend,
    output reg [31:0] extend
    );
    
        always @* begin
            //replicate signed bit 16 times then cancatinate
            extend = {16{1'b0}};
        end
    
endmodule