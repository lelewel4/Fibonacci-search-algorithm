`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2023 10:21:00
// Design Name: 
// Module Name: fibonacci_minimum
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

function real f;
  input real a, b, c, d;
  input real x;          
  begin
    f = (a * (x ** 3)) + (b * (x ** 2)) + (c * x) + d;
  end
endfunction

module fibonacci_minimum(clk, rst, a, b, c, d, x0, x1, eps, min, min_ready);

input clk;
input rst;
input real a,b,c,d;        //max 3
input real x0,x1;          //maksymalna szerokosc przedzialu 14 (x1-x0<15)
input real eps;
output real min;
output reg min_ready;

reg start = 1'b0;
real x3,x4;                //punkty graniczne przedzialow
real fx3, fx4;
reg [10:0] itr = 0;

logic [20:0] fibo_value_out [1:0];  //ostatnie dwa wyrazy ciagu Fibonacciego
real fib2;                    //trzy kolejne wyrazy ciagu Fibonnaciego
real fib1;
real fib0;

logic fibo_ready_out;               
logic fibo_reset = 0;
logic [4:0] i = 12;                 //i-elementów ci¹gu fibonacciego, w zale¿nosci od wielkosci tablicy nalezy zmienic

fibonacci fibo(
    .clk(clk),
    .rst(fibo_reset),
    .n_element(i),
    .value_out(fibo_value_out),
    .ready_out(fibo_ready_out)
 );

always @(posedge clk)
begin
    if(rst == 1'b0 && fibo_ready_out == 1 && start == 1'b0)
    begin
        start = 1'b1;
        min_ready = 0;
        fibo_reset = 1;
        fib2 = fibo_value_out[1];
        fib1 = fibo_value_out[0];
        fib0 = fib2 - fib1;
        x3 = x0 + (fib0 / fib2) * (x1 - x0);
        x4 = x0 + (fib1 / fib2) * (x1 - x0);
        fx3 = f(a,b,c,d,x3); 
        fx4 = f(a,b,c,d,x4); 
        itr = 0;
        fib2 = fib1;
        fib1 = fib0;
        fib0 = fib2-fib1;
    end
    if(start == 1'b1)
    begin 
        if(fx3 < fx4)
        begin
            x1 = x4;
            x4 = x3;
            fx4 = fx3;
            x3 = x0 + (fib0 / fib2) * (x1 - x0);
            fx3 = f(a,b,c,d,x3); 
        end
        else 
        begin
            x0 = x3;
            x3 = x4;
            fx3 = fx4;    
            x4 = x0 + (fib1 / fib2) * (x1 - x0);
            fx4 = f(a,b,c,d,x4); 
        end
        itr += 1; 
        fib2 = fib1;
        fib1 = fib0;
        fib0 = fib2-fib1;
    end
    if(fib0 == 0 && fib1 == 1)
        begin
        min_ready <= 1;
        min <= (x3 + x4)/2;
        start <= 0;
        fibo_reset <= 0;
        end
end
endmodule


