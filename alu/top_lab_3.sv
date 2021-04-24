module top_lab_3 (
	input logic [31:0]b, 
	input logic sel, 
	output logic [31:0] y);

	always_comb begin
		if (sel)
			y = ~b;
		else
			y = b;
	end


endmodule // top_lab_3

