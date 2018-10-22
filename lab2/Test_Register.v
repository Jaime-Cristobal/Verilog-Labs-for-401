`timescale 1ns / 1ps

/**Lab2 
    clk is provided from the test bench but 8 arguments are passed to Register
    which only accepts 7.*/

module Test_Register();

    wire [31:0] rdata1, rdata2, wdata;
    wire [4:0] wreg;
    wire [31:0] rreg1, rreg2;
    wire reg_write, clk;
    
    reg [31:0] register [0:31], instr;
    
    initial begin
        instr[25:21] <= 5'b00000;
        instr[20:16] <= 5'b00000;
        instr[15:11] <= 5'b00000;
        $display("Time\tRead data1\tread Data 2\n");
        $monitor("%0d\t%h\t%h", $time, rdata1, rdata2);
        #20; $finish;
    end
    
    always @(reg_write) begin
        #1 register[0] <= 'h002300AA;
        #1 register[1] <= 'h10654321;
        #1 register[2] <= 'h00100022;
        #1 register[3] <= 'h8C123456;
        #1 register[4] <= 'h8F123456;
        #1 register[5] <= 'hAD654321;
        #1 register[6] <= 'h13012345;
        #1 register[7] <= 'hAC654321;
        #1 register[8] <= 'h12012345;
    end
    
    /*
    Register reg1 (rdata1,          //read data 1 output -> output A
                   rdata2,          //read data 2 output -> output B
                   clk,             //clock -> ????????????
                   wreg,            //write register input -> input rd
                   wdata,           //write data input -> input writedata
                   rreg1[25:21],    //read register 1 input -> input rs 
                   rreg2[20:16],    //read reg 2 input -> input rt
                   reg_write);      //RegWrite control line from MEM/WB -> to regwrite
    */
                   
    Register reg1 (rreg1[25:21],
                   rreg2[20:16],
                   wreg,
                   wdata,
                   reg_write,
                   clk,
                   rdata1,
                   rdata2);
    
endmodule
