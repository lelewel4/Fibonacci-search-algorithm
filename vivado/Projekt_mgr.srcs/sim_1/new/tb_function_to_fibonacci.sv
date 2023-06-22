`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2023 10:58:25
// Design Name: 
// Module Name: tb_function_to_fibonacci
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


module tb_function_to_fibonacci();

reg clk;
reg [1:0] a,b,c,d;
reg [3:0] x;
reg [13:0] y;

function_to_fibonacci uut (
    .clk(clk),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .x(x),
    .y(y)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
#0
a = 1;
b = 1;
c = 1;
d = 1;
x = 1;
//y should be 4

#40;
a = 1;
b = 1;
c = 1;
d = 1;
x = 2;
//y should be 15

#40;
a = 2;
b = 2;
c = 2;
d = 2;
x = 2;
//y should be 30

#40;
a = 2;
b = 1;
c = 1;
d = 2;
x = 1;
//y should be 6

#40;
a = 2;
b = 0;
c = 1;
d = 2;
x = 1;
//y should be 5

#40;
a = 3;
b = 3;
c = 2;
d = 1;
x = 11;
//y should be 4379



end
endmodule
