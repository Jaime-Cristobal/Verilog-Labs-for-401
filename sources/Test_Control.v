`timescale 1ns / 1ps

/**Lab2 */

module Test_Control();

    wire [8:0] controls;
    reg [31:0] instr;       
    
    initial begin
        instr[31:26] <= 6'b000000;
        $display("Time\t\tOPCODE\t\t\t\t\tControlbits\n");
        $monitor("%0d\t\t%b\t%b ", $time, instr, controls);
        #20; $finish;
    end
    
    always begin
        #1 instr[31:26] = 35;
        #1 instr[31:26] = 43;
        #1 instr[31:26] = 4;
        #1 instr[31:26] = 100;
        #1 instr[31:26] = 0;
    end
    
    Control control1(instr[31:26], controls);   

endmodule
