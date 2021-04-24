module full_adder(
	input logic A, B, Cin,
	output logic Sum, Cout);

   logic a, b, c;
    
    assign a =  A ^ B;
    assign b = A & B;
    assign c = a & Cin;
    assign Sum = a ^ Cin;
    assign Cout = b | c;

endmodule // full_adder

