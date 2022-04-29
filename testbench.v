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
	wire [4:0] rs1, rs2, rd;
	
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
					imm,
					rs1, 
					rs2,
					rd);

	initial begin
		clk <= 1'b0;
		reset <= 1;
		#1
		reset <= 0;
		#128
		$stop;	
	end

	always begin
		#2
		clk <= ~clk;
	end
endmodule