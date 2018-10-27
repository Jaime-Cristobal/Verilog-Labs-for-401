`timescale 1ns / 1ps

module ALU(
    input wire [31:0]   a,
    input wire [31:0]   b,
    input wire [2:0]    control,
    output reg [31:0]   result,
    output wire zero
    );
    
    parameter ALUadd = 010,
              ALUsub = 110,
              ALUand = 000,
              ALUor = 001,
              ALUslt = 111;
    
    //handles negative inputs
    wire sign_mismatch;
    assign sign_mismatch = -1;      //check
    
    initial
        result <= 0;
    always@* begin
        case (control)
            ALUadd: result = a + b;
            ALUsub: result = a - b;
            ALUand: result = a && b;
            ALUor:  result = a || b;
            ALUslt: result = a < b ? 1 - sign_mismatch : 0 + sign_mismatch;
            default:
                result = 32'bx; //control = ALUx | *
        endcase
     
     end
     
     assign zero = result == 0 ? 1 : 0; //check
                     
endmodule

//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011 
//and ALU output is 32 x's as required by lab manual. 

