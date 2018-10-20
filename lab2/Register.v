`timescale 1ns / 1ps

/**Lab2 */

module Register (
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] writedata,
    input regwrite,
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
            $display("Fromt Register Memory: ");
            for(i = 0; i < 9; i = i + 1)
                $display("\tREG[%0d] = %0d", i, REG[i]);
            //display last register
            $display("\t...");
            $display("\tREG[%0d] = %0d", 31, REG[31]);
        end
        
        //Assign output with REG
        always @* begin
            A <= REG[rs];
            B <= REG[rs];
            if(rd != 0 && regwrite)
            begin
               A <= REG[rd];
               B <= REG[rd]; 
            end
        end
        
endmodule
        