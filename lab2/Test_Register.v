`timescale 1ns / 1ps

<<<<<<< HEAD
/**Lab2*/
=======
/**Lab2 
    clk is provided from the test bench but 8 arguments are passed to Register
    which only accepts 7.*/
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481

module Test_Register();

    wire [31:0] rdata1, rdata2, wdata;
    wire [4:0] wreg;
<<<<<<< HEAD
    wire [31:0] rreg1, rreg2;               //input to register
    wire reg_write;                        //write to writedata when 1
    
    reg [31:0] register [0:31], instr;
    
    //instr is the memory data that indicate the index
    //example: 5'b00000 points to the 0 index register, which is
    //'h002300AA instruction.
=======
    wire [31:0] rreg1, rreg2;
    wire reg_write, clk;
    
    reg [31:0] register [0:31], instr;
    
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
    initial begin
        instr[25:21] <= 5'b00000;
        instr[20:16] <= 5'b00000;
        instr[15:11] <= 5'b00000;
        $display("Time\tRead data1\tread Data 2\n");
        $monitor("%0d\t%h\t%h", $time, rdata1, rdata2);
<<<<<<< HEAD
        #20; 
        $finish;
=======
        #20; $finish;
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
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
    
<<<<<<< HEAD
    Register reg1 (rdata1,          //read data 1 output -> output A
                   rdata2,          //read data 2 output -> output B
=======
    /*
    Register reg1 (rdata1,          //read data 1 output -> output A
                   rdata2,          //read data 2 output -> output B
                   clk,             //clock -> ????????????
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
                   wreg,            //write register input -> input rd
                   wdata,           //write data input -> input writedata
                   rreg1[25:21],    //read register 1 input -> input rs 
                   rreg2[20:16],    //read reg 2 input -> input rt
                   reg_write);      //RegWrite control line from MEM/WB -> to regwrite
<<<<<<< HEAD
    
=======
    */
                   
    Register reg1 (rreg1[25:21],
                   rreg2[20:16],
                   wreg,
                   wdata,
                   reg_write,
                   clk,
                   rdata1,
                   rdata2);
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
    
endmodule
