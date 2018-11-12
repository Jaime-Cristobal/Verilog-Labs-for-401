`timescale 1ns / 1ps

module wb_test();

    //wire port
    wire [31:0] out;
    
    //registers
    reg [31:0] alu_result, read_data;
    reg sel;
    
    initial begin
        read_data = 32'b01010;
        alu_result = 32'b10101;
        sel = 1'b1;
        #10;
    end
    
    Write_Back wb5(out, alu_result, read_data, sel);

endmodule
