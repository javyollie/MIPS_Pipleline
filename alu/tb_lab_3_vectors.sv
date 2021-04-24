
module tb_lab3_vectors ();

	logic [31:0] A, B, Y, Y_sol; 
	logic [2:0] F;
	logic zero, OF;
	logic [3:0] zero_expected, F_temp, overflow_temp;

	logic clk, reset;
	logic [31:0] vectornum, errors; // bookkeeping variables
 	logic [106:0] testvectors[10:0]; // array of testvectors

	// instantiate device under test
	alu dut(A, B, F, Y, zero, OF);

	// generate clock
	always begin // no sensitivity list, so it always executes
		clk = 1; #5; clk = 0; #5;
	end

	assign 	F = F_temp[2:0];
	assign 	OF = overflow_temp[0];


 	// apply test vectors on rising edge of clk
 	always @(posedge clk)
 	begin
		#1; {F_temp, A, B, Y_sol, zero_expected, overflow_temp} = testvectors[vectornum];
 	end

	initial	begin
	// at start of test, load vectors and pulse reset
	$readmemh("alu_overflow.tv", testvectors);
	vectornum = 0; errors = 0;
	reset = 1; #27; reset = 0; //reset for a few cycles
	// Note: use $readmemh to read testvector files written in hex
/*
	// TB1: ADD 0+0; Y = 0
	F = 2'h2;
	A = 32'h00000000;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);
	*/
	end


// check results on falling edge of clk
	always @(negedge clk) begin
		if (~reset) begin // skip during reset
			if (OF !== 1) begin
				$display("Error: inputs F = %h", {F});
				$display("Error: inputs A & B = %h", {A, B});
				$display(" outputs = 0x%h (0x1 expected)", OF);
				errors = errors + 1;
			end
			// Note: to print in hexadecimal, use %h. For example,
			// $display(“Error: inputs = %h”, {a, b, c});

			// increment array index and read next testvector
			vectornum = vectornum + 1;
			if (testvectors[vectornum] == {4'h0, 32'hDEADBEEF, 32'hDEADBEEF, 32'hDEADBEEF, 4'h0, 4'h0}) begin
				#10
				$display("%d tests completed with %d errors",
				vectornum, errors);
				$finish;
 			end
		end
 	end
endmodule
// === and !== can compare values that are 1, 0, x, or z.
