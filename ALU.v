module ALU(clk,
				in1,
				in2, 
				op, 
				result,
				status);
	output reg [4:0] status; // from LSB these are carry-out, negative, zero, parity (odd), overflow
	output reg [31:0] result;
	reg [32:0] temp;
	input clk;
	input [31:0] in1, in2;
	input [3:0] op; //This will be generated by the control unit
						//Starting at 0001, these are AND, OR, XOR, ADD, SUB, Shift right logical, shift left logical, shift right arithmetic, shift left arithmetic, unsigned addition
						
	function parity(input [31:0] in);
		begin
			parity = in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[7] ^ in[8] ^ in[9] ^ in[10] ^ in[11] ^ in[12] ^ in[13] ^ in[14] ^ in[15] ^ in[16] ^ in[17] ^ in[18] ^ in[19] ^ in[20] ^ in[21] ^ in[22] ^ in[23] ^ in[24] ^ in[25] ^ in[27] ^ in[27] ^ in[28] ^ in[29] ^ in[30] ^ in[31];
		end
	endfunction

	always @(posedge clk) begin
		case(op)
			4'b0001 : begin //AND
				result = in1 & in2;
				status <= 5'b0;
				status[3] <= parity(result);
			end
			4'b0010 : begin //OR
				result = in1 | in2;
				status <= 5'b0;
				status[3] <= parity(result);
			end
			4'b0011 : begin //XOR
				result = in1 ^ in2;
				status <= 5'b0;
				status[3] <= parity(result);
			end
			4'b0100 : begin //ADD
				result = in1 + in2;
				status[0] <= 0;
				status[1] <= result == 0 ? 1'b1 : 1'b0;
				status[2] <= result[31];
				status[3] <= parity(result);
				status[4] <= ~(in1[31] ^ in2[31]) & ~((~in1[31] & ~in2[31] & ~result[31]) | (in1[31] & in2[31] & result[31]));
			end
			4'b0101 : begin//SUB
				result = in1 - in2;
				status[0] <= 0;
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			4'b0110 : begin //Shift right logical
				result = in1 >> in2;
				status[0] <= 0;
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			4'b0111 : begin //shift left logical
				result = in1 << in2;
				status[0] <= 0;
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			4'b1000 : begin //shift right arithmetic
				result = in1 >>> in2;
				status[0] <= 0;
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			4'b1001 : begin //shift left arithmetic
				result = in1 <<< in2;
				status[0] <= 0;
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			4'b1010 : begin //Unsigned Add
				temp = in1 + in2;
				result = temp[31:0];
				status[0] <= temp[32];
				status[1] <= result[31];
				status[2] <= result == 0 ? 1'b1 : 1'b0;
				status[3] <= parity(result);
				status[4] <= 0;
			end
			default : begin 
				result <= 32'bx;
				status <= 5'bx;
			end

		endcase
	end
endmodule