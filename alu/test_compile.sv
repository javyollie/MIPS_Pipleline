module test_compile (
	input logic a, b, 
	output logic [1:0] y);

	logic c;

	assign c = a;

	assign y[0] = c;
	assign y[1] = a & y[0];


endmodule // N_two_by_one_mux

