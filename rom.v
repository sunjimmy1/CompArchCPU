module ROM(address, en, out); 
reg [31:0] storage [127:0]; 
output reg [31:0] out; 
input en; 
input [6:0] address; 
integer i; 
initial begin 
	//storage[7'd10] <= 31'b0000000_01111_01001_000_00001_0110011; 
	for(i = 7'b0; i < 7'b1111111; i = i + 1) begin 
		storage[i] <= i; 
	end 
end 
 
always @(address or en) begin 
	if(en) begin 
		out <= storage[address]; 
	end 
end 
 
 
endmodule 
