module ROM(address, en, out); 
reg [7:0] storage [127:0]; 
output reg [31:0] out; 
input en; 
input [6:0] address; 

initial begin
{storage[3], storage[2], storage[1], storage[0]} = 32'b0; 
{storage[7], storage[6], storage[5], storage[4]} = 32'b000000000011_01001_000_01001_0010011; //addi x9 x9 3
{storage[11], storage[10], storage[9], storage[8]} = 32'b000000000001_00011_000_00011_0010011; //addi x3 x3 1
{storage[15], storage[14], storage[13], storage[12]} = 32'b1111111_01001_00011_001_11100_1100011; //bne x3 x9 -4
{storage[19], storage[18], storage[17], storage[16]} = 32'b0100000_01001_00011_000_00100_0110011; //sub x4 x3 x9
end

always @(address or en) begin 
	if(en) begin 
		out <= {storage[address+3], storage[address+2], storage[address+1], storage[address]}; 
	end 
end 
 
 
endmodule 
