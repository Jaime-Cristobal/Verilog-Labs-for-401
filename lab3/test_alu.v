`timescale 1ns / 1ps

module test_alu();

    //register declarations
    reg [31:0] A, B;
    reg [2:0] control;
    
    //wire ports
    wire [31:0] result;
    wire zero;
    
    initial begin
        A <= 'b1010;
        B <= 'b0111;
        control <= 'b011;
        $display("A = %b\tB = %b", A, B);
        $monitor("ALUOp = %b\tresult = %b", control, result);
        #1
        control <= 'b100;
        #1
        control <= 'b010;
        #1
        control <= 'b111;
        #1
        control <= 'b011;
        #1
        control <= 'b110;
        #1
        control <= 'b001;
        #1
        control <= 'b000;
        #1
        $finish;
    end
    
    ALU ALU3(result, zero, A, B, control);

endmodule
