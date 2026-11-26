`timescale 1ns / 1ps

module FourBitFullAdderTestBench();

  reg [3:0] A, B; // 4 bits
  reg CarryIN;
  
  wire [3:0] Sum; // 4 bits
  wire CarryOUT;
  
  
  FourBitFullAdder FBA01 (
      .A(A),
      .B(B),
      .CarryIN(CarryIN),
      .Sum(Sum),
      .CarryOUT(CarryOUT)
  );
  
  
  initial begin
  
      A = 4'b0000; B = 4'b0000; CarryIN = 0; // initializing to zero
      #10; A = 4'b0011; B = 4'b1001; CarryIN = 0; // testing a is 3, b is 9
      #10; A = 4'b0100; B = 4'b0110; CarryIN = 0; // testing a is 4, b is 6
      #10; A = 4'b0110; B = 4'b1001; CarryIN = 0; // testing a is 6, b is 9
      #10; A = 4'b1011; B = 4'b0101; CarryIN = 0; // testing a is 11, b is 5
  
      #10 $finish;

  end
endmodule
  
