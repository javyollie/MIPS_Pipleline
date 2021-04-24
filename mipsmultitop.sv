
module mipsmultitop(input logic clk, reset, 
			output logic [31:0] writedata, adr, 
			output logic memwrite);

	logic [31:0] readdata;
	// microprocessor (control & datapath)
	mipsmulti mips(clk, reset, adr, writedata, memwrite, readdata);

	// memory 
	mem mem(clk, memwrite, adr, writedata, readdata);
endmodule

module mem(input logic clk, we,
			input logic [31:0] a, wd,
			output logic [31:0] rd);
			
	logic [31:0] RAM[63:0];
 
	// initialize memory with instructions
	initial
	begin
	$readmemh("memfile.dat",RAM); 
	// "memfile.dat" contains your instructions in hex
	// you must create this file
	end

	assign rd = RAM[a[31:2]]; // word aligned
	
	always_ff @(posedge clk)
		if (we)
			RAM[a[31:2]] <= wd;
 
endmodule
