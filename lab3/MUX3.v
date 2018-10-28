`timescale 1ns / 1ps

module MUX3 #(parameter BITS = 5)(
    output wire [BITS-1:0] y,      //output of mux
    input wire [BITS-1:0] a, b,    //input 1 of mux
    
    //input 0 of mux
    input wire sel  //select input
    );
    
    assign y = sel ? a : b;
    
endmodule
