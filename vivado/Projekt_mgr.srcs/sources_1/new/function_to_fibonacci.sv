`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2023 10:56:00
// Design Name: 
// Module Name: function_to_fibonacci
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

module function_to_fibonacci(clk, a, b, c, d, x, y);

input clk;
input reg [1:0] a,b,c,d;        //max 3
input reg [3:0] x;              //max 15   
output reg [13:0] y;        //max 10848(10), 10101001100000(2)

assign y = (a * (x ** 3)) + (b * (x ** 2)) + (c * x) + d;

endmodule
