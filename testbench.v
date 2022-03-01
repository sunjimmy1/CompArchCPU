module testbench(output reg [6:0] address, 
						output reg en, 
						output [31:0] out, 
						output reg clk);

ROM testing(address, en, out, clk);
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