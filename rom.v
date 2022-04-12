module ROM(address, en, out); 
reg [7:0] storage [127:0]; 
output reg [31:0] out; 
input en; 
input [6:0] address; 

initial begin
	{storage[7], storage[6], storage[5], storage[4]} = 32'b000000000011_01001_000_00001_0010011; //addi x1 x9 3
	{storage[11], storage[10], storage[9], storage[8]} = 32'b000000000001_00011_000_00111_0010011; //addi x7 x3 1
	{storage[15], storage[14], storage[13], storage[12]} = 32'b000000000000_00111_000_00011_0010011; //addi x3 x7 0
	{storage[19], storage[18], storage[17], storage[16]} = 32'b1111111_00001_00111_001_11000_1100011; //bne x7 x1 -8
	{storage[23], storage[22], storage[21], storage[20]} = 32'b0000000_00011_00111_010_01000_0100011; //sw x7 x3 8
	{storage[27], storage[26], storage[25], storage[24]} = 32'b000000001000_00011_010_01001_0000011; //lw x9 x3 8
	{storage[31], storage[30], storage[29], storage[28]} = 32'b0000000_01001_00011_000_00111_0110011; //add x7 x3 x9
end 
 
always @(address or en) begin 
	if(en) begin 
		out <= {storage[address+3], storage[address+2], storage[address+1], storage[address]}; 
	end 
end 
 
 
endmodule 
