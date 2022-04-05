module ROM(address, en, out); 
reg [31:0] storage [127:0]; 
output reg [31:0] out; 
input en; 
input [6:0] address; 

initial begin
	storage[4] = 32'b000000000000_01111_000_00111_0010011;//ADDI
	storage[8] = 32'b000000000011_01001_000_00001_0010011;//ADDI
	storage[12] = 32'b0100000_00111_00001_000_11111_0110011;//SUB
end 
 
always @(address or en) begin 
	if(en) begin 
		out <= storage[address]; 
	end 
end 
 
 
endmodule 
