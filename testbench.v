module testbench();

	reg clk;
	reg reset;
	wire [31:0] result,
					longImm, 
					IWord, 
					data1Val, 
					data2Val, 
					alu1, 
					alu2, 
					PCVal,
					WB;
	wire [3:0] ALUOP;
	wire [11:0] imm;
	
	Datapath d(clk,
					reset,
					WB,
					PCSelect, 
					RegWEn, 
					ImmSel, 
					BrUn, 
					BEQ, 
					BLT, 
					BSel, 
					ASel, 
					ALUOP, 
					WBSel, 
					MemRW, 
					longImm, 
					IWord, 
					data1Val, 
					data2Val, 
					result,
					alu1, 
					alu2, 
					PCVal,
					imm);

	initial begin
		clk <= 1'b0;
		reset <= 1;
		#1
		reset <= 0;
		#64
		$stop;	
	end

	always begin
		#1
		clk <= ~clk;
	end
endmodule