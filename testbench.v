module testbench(output reg [31:0] rd, 
							output reg [31:0] din, 
							output [31:0]out, 
							output reg clk,
							output reg rw);

RAM testing(rd, din, out, rw);
integer i;

initial begin
	clk <= 0;
	for(i = 7'b0; i <= 7'b1111111; i = i + 1) begin
		#2
		rw <= 1;
		#2
		rd <= i;
		din <= $urandom;
		#1
		rw <= 0;
		#3
		rw <= 0;
	end
	rw <= 0;
	$stop;	
end

always begin
	#1
	clk <= ~clk;
end
endmodule