`timescale 1ns / 1ps

/**Lab2 */

module Register (
<<<<<<< HEAD
    input [4:0] rs,     //31:25
    input [4:0] rt,     //20:25
    input [4:0] rd,     //15:20
    input [31:0] writedata,
    input regwrite,
=======
    input [4:0] rs,     //unconnected port
    input [4:0] rt,     //unconnected port
    input [4:0] rd,
    input [31:0] writedata,
    input regwrite, clk,
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
    output reg [31:0] A,
    output reg [31:0] B
    );
        reg[31:0] REG [0:31]; //32 amount array of 32-bits registers
        integer i;
        
        initial begin
            A <= 0;
            B <= 0;
            
            //register initialization
            for(i = 0; i < 32; i = i + 1)
                REG[i] <= 0;
            
            //display contents of the first 9 registers
<<<<<<< HEAD
            $display("Front Register Memory: ");
=======
            $display("Fromt Register Memory: ");
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
            for(i = 0; i < 9; i = i + 1)
                $display("\tREG[%0d] = %0d", i, REG[i]);
            //display last register
            $display("\t...");
            $display("\tREG[%0d] = %0d", 31, REG[31]);
        end
        
        //Assign output with REG
        always @* begin
<<<<<<< HEAD
=======
        //always @ (rs or rt or rd or writedata or regwrite) begin
            //for(i = 0; i < 32; i = i + 1)   //recently added
            //    REG[i] <= regwrite;         //but could be wrong
        
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
            A <= REG[rs];
            B <= REG[rt];
            
            if(rd != 0 && regwrite)
<<<<<<< HEAD
                REG[rd] <= writedata;
            //else
            //    REG[rd] <= 0;
=======
                for(i = 0; i < 32; i = i + 1)
                    REG[i] <= writedata[rd];
            else
                for(i = 0; i < 32; i = i + 1)
                    REG[i] <= 0;
                //A <= writedata[rd];
                //B <= writedata[rd];
            //else begin
            //    A <= REG[rs];
            //    B <= REG[rt];
            //end
>>>>>>> 5e02ae41d5b41ec445582b81c63817709aaf9481
        end
        
endmodule
        