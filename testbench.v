/*module testbench(output [31:0] out1, 
					output [31:0] out2, 
					output reg [31:0] in1, 
					output reg [4:0] rs1, 
					output reg [4:0] rs2, 
					output reg [4:0] rd, 
					output reg clk, 
					output reg EN, 
					output reg RW, 
					output reg reset);

RegFile testing(out1, out2, rs1, rs2, rd, clk, EN, RW, in1, reset);

initial begin
	EN <= 1;
	RW <= 0;
	clk <=0;
	reset <= 1;
	#15
	reset <= 0;
	in1 <= 32'd37;
	rd <= 5'd17;
	#5
	RW <= 1;
	#5
	rs1 <= 5'd17;
	rs2 <= 5'd3;
	#25
	$stop;
end

always begin
	#1
	clk <= ~clk;	
end
endmodule

module testbench(output reg clk,
				output reg [31:0] in1,
				output reg [31:0] in2, 
				output reg [3:0] op, 
				output wire [31:0] result,
				output wire [4:0] status);

				
	alu testing (clk, in1, in2, op, result, status);
		
	initial begin
			$display("I am smort");
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
			in1 <= 32'b0111_0111_0000_1111_0000_1111_0000_0101;
			in2 <= 32'b0111_0111_0000_1111_0000_1111_0000_0101;
			op <= 4'b0100;
			#5
			in1 <= 32'd4;
			in2 <= 32'd5;
			op <= 4'b0100;
			#10
			op <= 4'd1;
			#10
			op <= 4'd2;
			#10
			op <= 4'd3;
			#10
			op <= 4'd4;
			#10
			op <= 4'd5;
			#10
			op <= 4'd6;
			#10
			op <= 4'd7;
			#10
			op <= 4'd8;
			#10
			op <= 4'd9;
			#10
			op <= 4'd10;
			#10
			op <= 4'd11;
			#10
			in1 <= 32'b0;
			in2 <= 32'b0;
			$stop;
		end
		
	always begin
		#1
		clk <= ~clk;
	end
endmodule*/

module testbench(output reg [6:0] address, 
						output reg en, 
						output [31:0] out, 
						output reg clk);

rom testing(address, en, out, clk);
integer i;
initial begin
	clk <= 0;
	en <= 1;
	#2
	for(i = 7'b0; i < 7'b1111111; i = i + 1) begin
		#2
		address <= i;
	end
	$stop;	
end

always begin
	#1
	clk <= ~clk;
end
endmodule
