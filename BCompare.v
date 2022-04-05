module BCompare(input [31:0] op1, input [31:0] op2, input BrUn, output reg BEQ, output reg BLT);

	always@(op1 or op2 or BrUn)begin
		BEQ = 1'b0;
		BLT = 1'b0;
		if(BrUn)begin 
			if(op1 == op2) begin
				BEQ <= 1'b1;
			end
			else if(op1 < op2) begin
				BLT <= 1'b1;
			end
		end
		else begin
			if({1'b0, op1} == {1'b0, op2}) begin
				BEQ <= 1'b1;
			end
			else if({1'b0,op1} < {1'b0, op2}) begin
				BLT <= 1'b1;
			end
		end
	end
endmodule