module ImmExtend(input [11:0] imm, output reg [31:0] extend);
	always @(imm) begin
		extend <= {{20{imm[11]}}, imm};
	end
endmodule