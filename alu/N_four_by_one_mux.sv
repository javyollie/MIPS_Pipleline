module N_four_by_one_mux (
	input logic [31:0] f00, f01, f02, f03, 
	input logic [1:0]sel, 
	output logic [31:0] y);

	always_comb begin
		if (sel == 2'b00)
			y = f00;
		else if (sel == 2'b01)
			y = f01;
		else if (sel == 2'b10)
			y = f02;
		else
			y = f03;
	end

endmodule // N_two_by_one_mux

