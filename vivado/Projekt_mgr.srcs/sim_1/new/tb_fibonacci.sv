`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 20:38:32
// Design Name: 
// Module Name: tb_fibonacci
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


module tb_fibonacci();
reg clk;
reg reset;
reg [4:0] n;
wire [20:0] fib_n [1:0];
wire ready;

fibonacci uut (
    .clk(clk),
    .rst(reset),
    .n_element(n),
    .value_out(fib_n),
    .ready_out(ready)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    n = 0;
    #10 reset = 0;
    #20 n = 10;    
    #200 n = 15;
    #200 n = 31;
end
endmodule
