`timescale 1ns / 1ps

module OneBitFullAdderTestBench();

  reg, A, B, CarryIN; // register for the inputs
  wire Sum, CarryOUT; // outputs are wires in Test Benches

  OneBitFullAdder FA00 (.A(A), .B(B), .CarryIN(CarryIN), .Sum(Sum), .CarryOUT(CarryOUT));

  initial begin

    A = 0; B = 0; CarryIN = 0; // initialize all of the inputs

    #10 A = 0; B = 0; CarryIN = 1;
    #10 A = 0; B = 1; CarryIN = 0;
    #10 A = 0; B = 1; CarryIN = 1;
    #10 A = 1; B = 0; CarryIN = 0;
    #10 A = 1; B = 0; CarryIN = 1;
    #10 A = 1; B = 1; CarryIN = 0;
    #10 A = 1; B = 1; CarryIN = 1;

    #10 $finish; // ending the simulation with the system task after incrementing 10ns

end
endmodule
