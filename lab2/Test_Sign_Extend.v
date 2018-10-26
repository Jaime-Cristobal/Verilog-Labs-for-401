`timescale 1ns / 1ps

/**Lab2 */

module Test_Sign_Extend();

    wire [31:0] se_out;
    reg [15:0] se_in;
    
    initial begin
<<<<<<< HEAD
        se_in = 16'b000000000000000;
=======
        se_in = 0;
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
        #1 se_in = 16'b100000000000000;
        #1 se_in = 16'b011111111111111;
    end
    
    initial begin
        $monitor("Time = %0d\tse_in = %b\tse_out = %b", $time, se_in, se_out);
    end
    
    Sign_Extend s_extend1(se_in, se_out);

endmodule
