module ROM(address, en, out); 
reg [31:0] storage [127:0]; 
output reg [31:0] out; 
input en; 
input [6:0] address; 

initial begin
	storage[4] = 32'b000000000011_01001_000_00001_0010011;//ADDI x1, x9, 3
	storage[8] = 32'b000000000001_00111_000_00011_0010011;//ADDI x7, x3, 1
	storage[12] = 32'b000000000001_00011_000_01111_0010011;//ADDI x3, x7, 0
	//storage[16] =32'b0100000_00111_00001_000_11111_0110011;//SUB x31, x1, x7
	storage[16] =32'b1111111_00111_00001_001_11000_1100011;//BNE x7, x1, -8
end 
 
always @(address or en) begin 
	if(en) begin 
		out <= storage[address]; 
	end 
end 
 
 
endmodule 
