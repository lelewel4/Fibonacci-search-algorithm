`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 20:38:02
// Design Name: 
// Module Name: fibonacci
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


module fibonacci(clk, rst, n_element, value_out, ready_out);

input clk;                      //zegar
input rst;                      //reset
input reg [4:0] n_element;          //n-ty element ciagu Fibonacciego, ograniczenie do 31 wartosci
output reg [20:0] value_out [1:0];    //wartosc n-tego elemetu ciagu Fibonacciego, max 1346269
output reg ready_out;           //flaga sygnalizujaca gotowosc wyznaczenia 
reg [20:0] prev_val = 21'b0;            //poprzednia wartosc ciagu Fibonacciego
reg [20:0] curr_val = 21'b1;            //aktualna wartosc ciagu Fibonacciego
reg [5:0] itr = 5'b0;                  //iterator

always @(posedge clk)
begin
    if(rst == 1'b1)
        begin
            prev_val <= 21'b0;			//prev fib1, cuur fib2
            curr_val <= 21'b1;
            itr <= 5'b0;
        end
    else
        begin
            prev_val <= curr_val;
            curr_val <= curr_val + prev_val;
            itr <= itr + 1;
            ready_out <= 0;
        end      
    if (itr == n_element - 1)
        begin
            value_out[0] <= prev_val;
            value_out[1] <= curr_val;
            ready_out <= 1;
            prev_val <= 21'b0;
            curr_val <= 21'b1;
            itr <= 5'b0;
        end
end
endmodule
