module Datapath(input clk,
					input reset,
					output reg [31:0] WB, 
					output PCSelect, 
					output RegWEn, 
					output ImmSel, 
					output BrUn, 
					output BEQ, 
					output BLT, 
					output BSel, 
					output ASel, 
					output [3:0] ALUOP, 
					output WBSel, 
					output MemRW, 
					output [31:0] longImm,
					output [31:0] IWord, 
					output [31:0] data1Val, 
					output [31:0] data2Val, 
					output [31:0] result,
					output reg [31:0] alu1, 
					output reg [31:0] alu2, 
					output [31:0]PCVal, 
					output reg [12:0] imm,
					output reg [4:0] rs1,
					output reg [4:0] rs2,
					output reg [4:0] rd);
					
wire [4:0] status;
ROM Imem(PCVal, 1'b1, IWord);
RegFile regs(IWord[19:15], IWord[24:20], IWord[11:7], WB, data1Val, data2Val, clk, reset, 1'b1 , RegWEn);
BCompare compare(data1Val, data2Val, BrUn, BEQ, BLT);
ControlUnit cu(IWord, PCSelect, RegWEn, ImmSel, BrUn, BEQ, BLT, BSel, ASel, ALUOP, WBSel, MemRW);
PC pc(PCSelect, WB, clk, PCVal);
ImmExtend longBoi(imm, longImm);
ALU alu(alu1, alu2, ALUOP, result, status);
RAM ram(result, alu1, DmemOut, MemRW);

	always@(*) begin
		if(ASel) begin
			alu1 <= PCVal;
		end
		else begin
			alu1 <= data1Val;
		end
		if(BSel) begin
			alu2 <= longImm;
		end
		else begin
			alu2 <= data2Val;
		end
		if(WBSel) begin
			WB <= result;
		end
		else begin
			WB <= DmemOut;
		end
		if(IWord[6:0] == 7'b1100011)begin
			imm <= {IWord[31:25], IWord[11:7]};
		end
		else begin
			imm <= IWord[31:20];
		end
		rs1 <= IWord[19:15];
		rs2 <= IWord[24:20];
		rd <= IWord[11:7];
	end
endmodule