module PC(input PCSel, input [31:0] branchVal, input clk, output reg [31:0] PCVal);
	
	always @(posedge clk) begin
		if(PCSel) begin
			PCVal <= branchVal;
		end
		else begin
			PCVal <= PCVal + 3'b100;
		end
	end
	
	initial begin
		PCVal <= 31'b0;
	end
endmodule