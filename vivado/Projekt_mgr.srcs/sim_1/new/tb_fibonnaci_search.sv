`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 18:49:22
// Design Name: 
// Module Name: tb_fibonnaci_search
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_fibonnaci_search();
parameter n = 50;     //n element??w tablicy
reg clk;                      //zegar
reg rst;                      //reset
reg [10:0] arr [0:n-1];         //11 elementwoa tablica 6 bitowych wyrazow
reg [10:0] value;              //szukana wartosc 
wire [5:0] index;         //zwaracany index
wire index_ready;
reg [10:0] test_value [0:3] = {182, 295, 402, 109};
reg [5:0] test_index [0:4] = {1,8,15,19,63};
integer i = 0;

fibonacci_search uut (
    .clk(clk),
    .rst(rst),
    .arr(arr),
    .value(value),
    .index(index),
    .index_ready(index_ready)
  );

initial begin
clk = 0;
forever #5 clk = ~clk;
end
//Reset signal
initial
begin
rst <= 1'b1;
#5 rst <= 1'b0;
end

initial begin
//rst = 1'b0;
arr= {16, 66, 70, 101, 105, 109, 166, 168, 182, 223, 230, 262, 275, 278, 280, 295, 297, 306, 366, 402, 413, 434, 467, 483, 517, 520, 535, 545, 579, 599, 608, 616, 646, 654, 655, 724, 729, 737, 751, 788, 796, 833, 847, 909, 909, 910, 910, 923, 930, 964};
value = 66;
end



always @(posedge index_ready)
begin
    if(index == test_index[i])
    begin
        $display("PASS");
        $display("Index: %d",index);
        $display("wartosc: %d",value);
    end
    else
    begin
        $display("FAILED");
        $display("wartosc: %d",value);
    end
    
    rst = 1'b1;
    #40 rst = 1'b0;
    value = test_value[i];
    i++;
    if(i == 5)
        $stop;      
end       
endmodule