module test_synth(
	input logic [31:0]b, 
	input logic sel, 
	output logic [31:0] y);

	always_comb begin
		if (sel)
			y = ~b;
		else
			y = b;
	end
endmodule // test_synth

/*
module alu(input logic [31:0] A, B,
 input logic [2:0] F,
 output logic [31:0] Y,
 output logic zero);

	logic [31:0] BB, Sum, f00, f01, f10, f11;
	logic [7:0] cout;

	N_two_by_one_mux mux0(B, F[2], BB);
	N_four_by_one_mux mux1(f00, f01, f10, f11, F[1:0], Y);

	four_bit_adder byte_lsb0(A[3:0],   BB[3:0],   F[2],    Sum[3:0],   cout[0]);
	four_bit_adder byte_lsb1(A[7:4],   BB[7:4],   cout[0], Sum[7:4],   cout[1]);
	four_bit_adder byte_lsb2(A[11:8],  BB[11:8],  cout[1], Sum[11:8],  cout[2]);
	four_bit_adder byte_lsb3(A[15:12], BB[15:12], cout[2], Sum[15:12], cout[3]);
	four_bit_adder byte_msb0(A[19:16], BB[19:16], cout[3], Sum[19:16], cout[4]);
	four_bit_adder byte_msb1(A[23:20], BB[23:20], cout[4], Sum[23:20], cout[5]);
	four_bit_adder byte_msb2(A[27:24], BB[27:24], cout[5], Sum[27:24], cout[6]);
	four_bit_adder byte_msb3(A[31:28], BB[31:28], cout[6], Sum[31:28], cout[7]);

	assign f00 = BB | A;
	assign f01 = BB & A;
	assign f10 = Sum;
	assign f11 = {Sum[31], 3'b000,28'h0000000};


endmodule // top_lab_2
*/