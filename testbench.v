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

	reg [5:0] counter;
					 
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
			rs1 <= 5'd17;
			rs2 <= 5'd5;
			for(counter = 1; counter < 5'd31; counter = counter + 2'd2)begin
				#3
				din <= 1 << counter;
				rd <= counter;
				rw <= 1;
				#3
				rw <= 0;
				#3
				din <= 32'd1073741824 >> counter;
				rd <= counter + 1;
				rw <= 1;
				#3
				rw = 0;
				rs1 <= counter;
				rs2 <= counter + 1;
			end
			#3
			reset <= 1;
			#3
			reset <= 0;
			$stop;
		end
		
	always begin
		#1
		clk <= ~clk;
	end
endmodule