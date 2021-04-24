
module four_bit_adder (
	input logic [3:0]A, 
	input logic [3:0]B, 
	input logic Cin,
	output logic [3:0]Sum, 
	output logic cout);

	logic [3:0] Cout;

	full_adder fa0(A[0], B[0], Cin, Sum[0], Cout[0]);
	full_adder fa1(A[1], B[1], Cout[0], Sum[1], Cout[1]);
	full_adder fa2(A[2], B[2], Cout[1], Sum[2], Cout[2]);
	full_adder fa3(A[3], B[3], Cout[2], Sum[3], Cout[3]);

	assign cout = Cout[3];

endmodule // four_bit_adder
