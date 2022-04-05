module ImmExtend(input [11:0] imm, output reg [31:0] extend);
	always @(imm) begin
		if(imm[11]) begin
			extend <= {20'b1111_1111_1111_1111_1111,imm};
		end
		else begin
			extend <= {20'b0000_0000_0000_0000_0000, imm};
		end
	end
endmodule