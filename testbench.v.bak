module testbench(output reg [4:0] rs1, 
					 output reg [4:0] rs2, 
					 output reg [4:0] rd,
					 output reg [31:0] din, 
					 output reg reset, 
					 output reg enable, 
					 output reg clk, 
					 output [31:0] out1, 
					 output [31:0] out2,
					 output reg rw);


	RegFile testing (rs1, rs2, rd, din, out1, out2, clk, reset, enable, rw);
		
	initial begin
			enable <= 1;
			rw <= 1;
			clk <= 0;
			reset <= 1;
			#3
			reset <= 0;
			#3		
			din <= 32'd37;
			rd <= 5'd17;
			#3
			rw = 0;
			#3
			rd <= 5'd1;
			rs1 <= 5'd17;
			rs2 <= 5'd5;
			#3
			$stop;
		end
		
	always begin
		#1
		clk <= ~clk;
	end
endmodule