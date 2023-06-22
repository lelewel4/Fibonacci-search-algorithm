`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2023 18:25:06
// Design Name: 
// Module Name: fibonacci_search
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

module fibonacci_search(clk, rst, arr, value, index, index_ready);
parameter n = 50;                   //n elementów tablicy

input clk;                          //zegar
input rst;                          //reset
input reg [10:0] arr [0:n-1];       //n elementwoa tablica 11 bitowych danych
input reg [10:0] value;             //szukana wartosc 
output reg [5:0] index;             //zwracany index (od 0)
output reg index_ready;             //flaga oznaczajaca znalezienie indeksu

logic [20:0] fibo_value_out [1:0];  //ostatnie dwa wyrazy ciagu Fibonacciego
reg [20:0] fib2;                    //trzy kolejne wyrazy ciagu Fibonnaciego
reg [20:0] fib1;
reg [20:0] fib0;

logic fibo_ready_out;               
logic fibo_reset = 0;
logic [4:0] i = 10;                 //i-elementów ci¹gu fibonacciego, w zale¿nosci od wielkosci tablicy nalezy zmienic

fibonacci fibo(
    .clk(clk),
    .rst(fibo_reset),
    .n_element(i),
    .value_out(fibo_value_out),
    .ready_out(fibo_ready_out)
 );

integer offset = -1;    
integer itr;                        //iterator po elementach ciagu fibonacciego    
                                      
parameter S1 = 4'h01, S2 = 4'h02, S3 = 4'h03, S4 = 4'h04, S5 = 4'h05,
          S6 = 4'h06, S7 = 4'h07, S8 = 4'h08, S9 = 4'h09;
reg [3:0] state;

always @(posedge clk)
begin
    if(rst == 1'b1)
    begin
        index_ready <= 1'b0;
        state <= S1;
        fibo_reset <= 0;
    end
    else
    begin
        case(state)
            S1: begin
                if(fibo_ready_out == 1'b1) 
                    state <= S2;
                else
                    state <= S1;
                end
            S2: begin
                    fibo_reset <= 1;
                    fib2 = fibo_value_out[1];
                    fib1 = fibo_value_out[0];
                    fib0 = fib2 - fib1;
                    state <= S3;
                end
            S3: begin
                if(fib2 > 1)
                    state <= S4;
                else
                    state <= S9;
                end
            S4: begin
                    if((offset + fib1) < n-1)
                        itr = offset + fib1;
                    else 
                        itr = n-1;
                    state <= S5;
                end
            S5: begin
                    if(arr[itr] < value)
                        state <= S6;
                    else if(arr[itr] > value)
                        state <= S7;
                    else
                        state <= S8;
                end
            S6: begin
                    fib2 = fib1;
                    fib1 = fib0;
                    fib0 = fib2 - fib1;
                    offset <= itr;
                    state <= S3;
                end
            S7: begin
                    fib2 = fib0;
                    fib1 = fib1 - fib0;
                    fib0 = fib2 - fib1;
                    state <= S3;
                end
            S8: begin
                    index <= itr;
                    index_ready <= 1;
                    state <= S1;
                end
            S9: begin
                    if(fib1 == 1 && arr[offset + 1] == value)
                        begin
                            index <= offset + 1;
                            index_ready <= 1;
                            state <= S1;
                        end
                    else
                        begin
                            index <= -1;
                            index_ready <= 1;
                            state <= S1;
                        end
                end
      endcase
   end
end

//always @(posedge index_ready)
//begin
//    $display("Szukany index wynosi %d",index);
//end

endmodule



//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 14.06.2023 18:25:06
//// Design Name: 
//// Module Name: fibonacci_search
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

//module fibonacci_search(clk, rst, arr, value, index, index_ready);
//parameter n = 50;     //n elementów tablicy

//input clk;                          //zegar
//input rst;                          //reset
//input reg [10:0] arr [0:n-1];         //11 elementwoa tablica 6 bitowych danych
//input reg [10:0] value;              //szukana wartosc 
//output reg [3:0] index;             //zwracany index
//output reg index_ready;

////parameter N = 8;                                           //8 elemntow ciagu fibonacciego
////reg [5:0] f_sztywniutko [0:N-1] = {0,1,1,2,3,5,8,13};      //wartosci Fibonacciego

//logic [20:0] fibo_value_out [1:0]; 
//reg [20:0] fib2;
//reg [20:0] fib1;
//reg [20:0] fib0;
//reg start = 1'b0;

//logic fibo_ready_out; 
//logic fibo_reset = 0;
//logic [4:0] i = 10;  //i-elementów ci¹gu fibonacciego, w zale¿nosci od wielkosci tablicy nalezy zmienic

//fibonacci fibo(
//    .clk(clk),
//    .rst(fibo_reset),
//    .n_element(i),
//    .value_out(fibo_value_out),
//    .ready_out(fibo_ready_out)
// );

//integer offset = -1;    
//integer itr;                                               //iterator po elementach ciagu fibonacciego    
                                      

//always @(posedge clk)
//begin
//    if(rst == 1'b0 && fibo_ready_out == 1'b1 && start == 1'b0)
//    begin
//        start = 1'b1;
////        index = 0;
//        index_ready = 0;
//        fibo_reset <= 1;
//        fib2 = fibo_value_out[1];
//        fib1 = fibo_value_out[0];
//        fib0 = fib2 - fib1;
//    end
//    if(start == 1'b1)
//    begin
//        if(fib2 > 1)
//            begin   
//            if((offset + fib1) < n-1)
//                begin
//                    itr = offset + fib1;
//                end
//            else 
//                begin
//                    itr = n-1;
//                end
//            if(arr[itr] < value)
//                begin
//                    fib2 = fib1;
//                    fib1 = fib0;
//                    fib0 = fib2 - fib1;
//                    offset = itr;
//                end
//            else if(arr[itr] > value)
//                begin
//                    fib2 = fib0;
//                    fib1 = fib1 - fib0;
//                    fib0 = fib2 - fib1;
//                end
//            else
//                begin
//                    index <= itr;
//                    index_ready <= 1;
////                    $display("Index: %d",index);
//                end
//            end
//       else if(fib1 == 1 && arr[offset + 1] == value)
//           begin
//              index <= offset + 1;
//              index_ready <= 1;
////              $display("Index: %d",index);
//           end
//       else
//           begin
//              index <= -1;
//              index_ready <= 1;
////              $display("Index: %d",index);
//           end
//    end
//end
//endmodule