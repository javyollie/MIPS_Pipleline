
module tb_lab3 ();

	logic [31:0] A, B, Y, Y_sol; 
	logic [2:0] F;
	logic zero, OF;

	// instantiate device under test
	alu dut(A, B, F, Y, zero, OF);

	initial	begin
	// TB1: ADD 0+0; Y = 0
	F = 2'h2;
	A = 32'h00000000;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// ADD 0+(-1); Y = (-1)
	A = 32'h00000000;
	B = 32'hFFFFFFFF;

	Y_sol = 32'hFFFFFFFF;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// ADD 1+(-1); Y = 0
	A = 32'h00000001;
	B = 32'hFFFFFFFF;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// ADD FF + 1; Y = 100
	A = 32'h000000FF;
	B = 32'h00000001;

	Y_sol = 32'h00000100;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// ADD FF + 1; Y = 100
	A = 32'h000000FF;
	B = 32'h00000001;

	Y_sol = 32'h00000100;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);


	/******************************************************/
	// SUB 0-0
	F = 3'h6;
	A = 32'h00000000;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SUB 0-(-1)
	A = 32'h00000000;
	B = 32'hFFFFFFFF;

	Y_sol = 32'h00000001;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SUB 1-1
	A = 32'h00000001;
	B = 32'h00000001;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SUB 100-10
	A = 32'h00000100;
	B = 32'h00000010;

	Y_sol = 32'h000000F0;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);


	/******************************************************/
	// SLT 0, 0
	F = 3'h7;
	A = 32'h00000000;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SLT 0, 1
	A = 32'h00000000;
	B = 32'h00000001;

	Y_sol = 32'h80000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SLT 0, -1
	A = 32'h00000000;
	B = 32'hFFFFFFFF;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SLT 1, 0
	A = 32'h00000001;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SLT -1, 0
	A = 32'hFFFFFFFF;
	B = 32'h00000000;

	Y_sol = 32'h80000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);
	/******************************************************/
	// AND FFFFFFFF, FFFFFFFF; Y: FFFFFFFF
	F = 3'h0;
	A = 32'hFFFFFFFF;
	B = 32'hFFFFFFFF;

	Y_sol = 32'hFFFFFFFF;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// AND FFFFFFFF, 12345678; Y: 12345678
	A = 32'hFFFFFFFF;
	B = 32'h12345678;

	Y_sol = 32'h12345678;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// AND 12345678, 87654321; Y: 02244220
	A = 32'h12345678;
	B = 32'h87654321;

	Y_sol = 32'h02244220;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// AND 00000000, FFFFFFFF; Y: 00000000
	A = 32'h00000000;
	B = 32'hFFFFFFFF;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	/******************************************************/
	// OR FFFFFFFF, FFFFFFFF; Y: FFFFFFFF
	F = 3'h1;
	A = 32'hFFFFFFFF;
	B = 32'hFFFFFFFF;

	Y_sol = 32'hFFFFFFFF;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// OR 12345678, 87654321; Y: 97755779
	A = 32'h12345678;
	B = 32'h87654321;

	Y_sol = 32'h97755779;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// OR 00000000, FFFFFFFF; Y: FFFFFFFF
	A = 32'h00000000;
	B = 32'hFFFFFFFF;

	Y_sol = 32'hFFFFFFFF;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// OR 00000000, 00000000; Y: 00000000
	A = 32'h00000000;
	B = 32'h00000000;

	Y_sol = 32'h00000000;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

/*
	// ADD MAX# + 3  = (+OVERFLOW)
	A = 32'h7FFFFFFF;
	B = 32'h00000003;

	Y_sol = 32'h00000100;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// ADD -MAX + 3; Y = 100 (OVERFLOW)
	A = 32'h80000000;
	B = 32'hFFFFFFFD;

	Y_sol = 32'h00000100;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SUB (OVERFLOW) -MAX# - 3 = -OF 
	A = 32'h80000001;
	B = 32'h00000003;

	Y_sol = 32'h000000F0;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);

	// SUB (OVERFLOW) +MAX# - -3 = +OF 
	A = 32'h7FFFFFFF;
	B = 32'hFFFFFFFD;

	Y_sol = 32'h000000F0;
	#10;
	tb_display(A, B, F, Y, Y_sol, zero, OF);
*/
	end

task tb_display(logic [31:0]A,  logic [31:0]B, logic[2:0] F, logic [31:0] Y, logic [31:0] Y_sol, logic zero, logic OF);
	begin
	$display("TB: Inputs - A = 0x%h, B = 0x%h, F = 0x%h", A, B, F);
	$display("TB: Outputs - Y = 0x%h, zero = 0x%h, OF = 0x%h ", Y, zero, OF);

	if (Y == Y_sol) 
		$display("TB: PASS TEST Y = 0x%h", Y);
	else 
		$display("TB: FAIL");

	end
endtask

endmodule
