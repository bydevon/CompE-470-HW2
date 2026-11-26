
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

