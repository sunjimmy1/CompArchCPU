module RegFile(rs1, rs2, rd, din, out1, out2, clk, reset, enable, rw);

reg [31:0] steve [31:0];
integer i;

input [4:0] rd, rs1, rs2;
input clk, reset, enable, rw;
input [31:0] din;
output reg [31:0] out1, out2;
reg [31:0] dataHolder;
reg [4:0] rdHolder;
reg rwHolder;

	always @(*) begin
		if (enable) begin
			if(reset) begin
				for( i = 0; i <= 31; i = i + 1 ) begin 
					steve[i] = 32'b0;	
				end
			end
			else if(rw) begin
				steve[rd] = din; 
			end
			out1 = steve[rs1];
			out2 = steve[rs2];
		end
	end

endmodule