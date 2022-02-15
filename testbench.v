module testbench(output reg clk,
				output reg [31:0] in1,
				output reg [31:0] in2, 
				output reg [3:0] op, 
				output wire [31:0] result,
				output wire [4:0] status);

				
	ALU testing (clk, in1, in2, op, result, status);
		
	initial begin
			clk <=0;
			#5
			in1 <= 32'b0101;
			in2 <= 32'b0110;
			op <= 4'b0001;
			#5
			in1 <= 32'b0101;
			in2 <= 32'b0110;
			op <= 4'b0010;
			#5
			in1 <= 32'b0101;
			in2 <= 32'b0110;
			op <= 4'b0011;
			#5
			in1 <= 32'b0111_0000_1111_0000_1111_0000_0101;
			in2 <= 32'b0111_0000_1111_0000_1111_0000_0101;
			op <= 4'b0100;
			#5
			in1 <= 32'b0;
			in2 <= 32'b0;
			$stop;
		end
		
	always begin
		#1
		clk <= ~clk;
	end
endmodule