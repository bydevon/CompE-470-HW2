
// First we initialize a half adder
module myHalfAdder(input a, b,
                   output sum, carry);
  xor (sum, a, b);
  and (carry, a, b);
endmodule

module OneBitFullAdder(input A, B, CarryIN,
                       output Sum, CarryOUT);
// internal wires
  wire carry1, carry2; // connects the two half adders to the OR gate
  wire z; // intermediate sum

  myHalfAdder HA00 (.a(A), .b(B), .sum(z), Carry(carry1));
  myHalfAdder HA01 (.a(z), .b(CarryIN), .sum(Sum), Carry(carry2));
  or (CarryOUT, carry1, carry2);
endmodule

//in the same fule we implement the 4bit Full Adder

module FourBitFullAdder(input [3:0] A, B, input CaryIN,
                        output [3:0] Sum, output CarryOUT);
  wire carry1, carry2, carry3;

  OneBitFullAdder FA00 (.A(A[0]), .B(B[0]), .CarryIN(CarryIN), .Sum(Sum[0]), .CarryOUT(carry1));
  OneBitFullAdder FA01 (.A(A[1]), .B(B[1]), .CarryIN(carry1), .Sum(Sum[1]), .CarryOUT(carry2));
  OneBitFullAdder FA02 (.A(A[2]), .B(B[2]), .CarryIN(carry2), .Sum(Sum[2]), .CarryOUT(carry3));
  OneBitFullAdder FA03 (.A(A[3]), .B(B[3]), .CarryIN(carry3), .Sum(Sum[3]), .CarryOUT(CarryOUT));

endmodule
