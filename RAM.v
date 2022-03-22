module RAM(address, dataIn, out, rw);
input [31:0] address;
input rw;
input [31:0] dataIn;
reg [7:0] en;
wire [31:0] outToMux [7:0];
output reg [31:0] out;

	Chip c0(address, dataIn, outToMux[0], rw, en[0]);
	Chip c1(address, dataIn, outToMux[1], rw, en[1]);
	Chip c2(address, dataIn, outToMux[2], rw, en[2]);
	Chip c3(address, dataIn, outToMux[3], rw, en[3]);
	Chip c4(address, dataIn, outToMux[4], rw, en[4]);
	Chip c5(address, dataIn, outToMux[5], rw, en[5]);
	Chip c6(address, dataIn, outToMux[6], rw, en[6]);
	Chip c7(address, dataIn, outToMux[7], rw, en[7]);



	always @(address or dataIn or rw) begin
		case(address[31:24])
			8'd0: begin
				en[0] <= 1;
				out <= outToMux[0];
			end
			8'd1: begin
				en[1] <= 1;
				out <= outToMux[1];
			end
			8'd2: begin
				en[2] <= 1;
				out <= outToMux[2];
			end
			8'd3: begin
				en[3] <= 1;
				out <= outToMux[3];
			end
			8'd4: begin
				en[4] <= 1;
				out <= outToMux[4];
			end
			8'd5: begin
				en[5] <= 1;
				out <= outToMux[5];
			end
			8'd6: begin
				en[6] <= 1;
				out <= outToMux[6];
			end
			8'd7: begin
				en[7] <= 1;
				out <= outToMux[7];
			end
	endcase
		
end

endmodule

module Chip(address, dataIn, out, rw, en);

reg [255:0] steve [31:0];

input [23:0] address;
input en, rw;
input [31:0] dataIn;
output reg [31:0] out;

always @(address or dataIn or rw) begin

	if(en) begin
		if(rw) begin
			steve[address] <= dataIn;		
		end
		else begin
			out <= steve[address];
		end
	end
end

endmodule