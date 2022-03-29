module testbench();

ControlUnit testing(rd, din, out, rw);
integer i;

initial begin
	
	$stop;	
end

always begin
	#1
	clk <= ~clk;
end
endmodule