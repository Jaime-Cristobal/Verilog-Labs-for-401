`timescale 1ns / 1ps

module D_MEM(
    input wire [31:0] addr, //memory address
    input wire [31:0] write_data, //mem addr contents
    input wire memwrite, memread,
    output reg [31:0] read_data //output contents
    );
    
    //32-bit memory register
    reg [31:0] DMEM[0:255]; //256 words
    
    integer i;
    
    initial begin
        read_data <= 0;
        
        //init DMEM[0-5] from data.txt
        $readmemb("data.txt", DMEM);
        
        //init DMEM[6-255] to 6-255
        for(i = 6; i < 256; i = i + 1)
            DMEM[i] = i;
            
        //display DMEM[0-5]
        $display("From data memory (data.txt):");
        for(i = 0; i < 6; i = i + 1)
            $display("\tDMEM[%0d] = %0h", i, DMEM[i]);
        
        //display DMEM[6-9]
        $display("From data memory (initial):");
        for(i = 6; i < 10; i = i + 1)
            $display("\tDMEM[%0d] = %0d", i, DMEM[i]);
        
        //display DMEM[255]
        $display("\t...");
        $display("\tDMEM[%0d] = %0d", 255, DMEM[255]);
    end
    
    always@(addr) begin
        if(memwrite == 1'b1) begin      //copy contents if mem is 1
            DMEM[addr] <= write_data;
        end

        if(memread == 1'b1) begin   //checks for a valid address and read memory
            read_data <= DMEM[addr];    //in the memread address
        end
    end
    
endmodule
