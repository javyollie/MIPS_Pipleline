module N_two_by_one_mux (
	input logic [31:0] b, 
	input logic sel, 
	output logic [31:0] y);

	always_comb begin
		if (sel)
			y = ~b;
		else
			y = b;
	end


endmodule // N_two_by_one_mux

