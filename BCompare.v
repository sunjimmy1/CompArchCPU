module BCompare(input [31:0] op1, input [31:0] op2, input BrUn, output reg BEQ, output reg BLT);

	always@(op1 or op2 or BrUn)begin
		BEQ = 1'b0;
		BLT = 1'b0;
		if(op1 == op2) begin
			BEQ <= 1'b1;
		end
		if(op1 < op2) begin
			BLT <= 1'b1;
		end
	end
endmodule