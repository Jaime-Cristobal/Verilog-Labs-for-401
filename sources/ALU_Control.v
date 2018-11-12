`timescale 1ns / 1ps

module ALU_Control(
    input wire [5:0] funct,
    input wire [1:0] aluop,
    output reg [2:0] select
    );
    
    //2 bit parameter
    //function field parameters for Rtype
    parameter Rtype = 10,
              Radd = 100000,
              Rsub = 100010,
              Rand = 100100,
              Ror  = 100101,
              Rslt = 101010;
    //LW and SW use the same bit pattern and stores them as a parameter
    parameter lwsw = 2'b00,
              Itype = 2'b01,    //beq
              xis = 6'bXXXXXX;
    parameter ALUadd = 3'b010,
              ALUsub = 3'b110,
              ALUand = 3'b000,
              ALUor  = 3'b001,
              ALUslt = 3'b111;
    parameter unknown = 2'b11,
              ALUx = 3'b011;
              
    initial
        select <= 0;
        
    always @* begin
        if(aluop == Rtype) begin
            case(funct)
                Radd: select <= 100000;
                Rsub: select <= 100010;
                Rand: select <= 100100;
                Ror:  select <= 100101;
                Rslt: select <= 101010;
                default: select <= ALUx;
             endcase
         end
         else if (aluop == lwsw) begin
            select <= lwsw;
         end
         else if (aluop == Itype) begin
            select <= Itype;
         end
         else if (aluop == unknown) begin
            select <= ALUx;
         end
         else begin
            select <= select;
         end
     end
    
endmodule
