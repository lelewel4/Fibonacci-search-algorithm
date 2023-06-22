`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2023 10:50:21
// Design Name: 
// Module Name: tb_fibonacci_minimum
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

module tb_fibonacci_minimum();

reg clk;
reg rst;
real a,b,c,d;        //max 3
real x0,x1;          //maksymalna szerokosc przedzialu 14 (x1-x0<15)
real eps;
real min;
reg min_ready;

fibonacci_minimum uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .x0(x0),
    .x1(x1),
    .eps(eps),
    .min(min),
    .min_ready(min_ready)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

//Reset signal
initial begin
    rst <= 1'b1;
    #5 rst <= 1'b0;
end

initial begin
    rst = 1'b0;
    a = 2;
    b = 0;
    c = -3;
    d = 0;
    x0 = 0;
    x1 = 14;
    eps = 0.1;
    //min should be in 0.707

#220;
    rst = 1'b1;

#10;
    rst = 1'b0;
    a = 0.4;
    b = -3;
    c = 0;
    d = 5.9;
    x0 = 0;
    x1 = 14;
    eps = 0.1;
    //min should be in 5

#220;
    rst = 1'b1;

#10;
    rst = 1'b0;
    a = 1;
    b = -3;
    c = -5;
    d = -2.5;
    x0 = 0;
    x1 = 14;
    eps = 0.1;
    //min should be in 2.633

#220;
    rst = 1'b1;

#10;
    rst = 1'b0;
    a = 1;
    b = -5.5;
    c = -1;
    d = 3;
    x0 = 0;
    x1 = 14;
    eps = 0.1;
//min should be in 3.755

end
endmodule