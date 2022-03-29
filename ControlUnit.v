module ControlUnit(IWord, PCSelect, RegWEn, ImmSel, BrUn, BEQ, BLT, BSel, ASel, ALUOP, WBSel, MemRW);
input [31:0] IWord;
input BEQ, BLT;
output reg PCSelect, RegWEn, ImmSel, BSel, ASel, WBSel, MemRW, BrUn;
output reg [3:0] ALUOP;
always@(*) begin

	case(IWord[6:0])
		7'b0110011: begin //R-type
			PCSelect <= 1'b0;
			RegWEn <= 1'b1;
			ImmSel <= 1'b0;
			BSel <= 1'b0;
			ASel <= 1'b0;
			MemRW <= 1'bx;
			case(IWord[14:12])
				3'h0 : begin
					case(IWord[31:25])
						 7'h0 : begin //Add
							ALUOP <= 4'h1;
						 end
						 7'h20 : begin //Sub
							ALUOP <= 4'h5;
						end
					endcase
				end
				3'h1 : begin //Shift Left Logical
					ALUOP <= 4'h7;
				end
				3'h2 : begin //Set less than?
					//ALUOP <= 
				end
				3'h3 : begin //Set less than U?
					//ALUOP <= 
				end
				3'h4 : begin //xor
					ALUOP <= 4'h3;
				end
				3'h5 : begin //
					case(IWord[31:25])//Shift Right
						7'h20: begin //SRA
							ALUOP <= 4'h8;
						end
						7'h00:begin //SRL
							ALUOP <= 4'h6;
						end
					endcase
				end
				3'h6 : begin //Or
					ALUOP <= 4'h2;
				end
				3'h7 : begin //And
					ALUOP <= 4'h1;
				end
			endcase
		end
		7'b0010011 : begin //I-Type
			PCSelect <= 1'b0;
			RegWEn <= 1'b1;
			ImmSel <= 1'b1;
			BSel <= 1'b1;
			ASel <= 1'b0;
			MemRW <= 1'bx;
			case(IWord[14:12])
					3'h0 : begin //Add
							ALUOP <= 4'h1;
					end
					3'h1 : begin //Shift Left Logical
						ALUOP <= 4'h7;
					end
					3'h2 : begin //Set less than?
						//ALUOP <= 
					end
					3'h3 : begin //Set less than U?
						//ALUOP <= 
					end
					3'h4 : begin //xor
						ALUOP <= 4'h3;
					end
					3'h5 : begin //
						case(IWord[30])
							1'b0 : begin
								ALUOP <= 4'h6;
							end
							1'b1 : begin
								ALUOP <= 4'h8;
							end
						endcase
					end
					3'h6 : begin //Or
						ALUOP <= 4'h2;
					end
					3'h7 : begin //And
						ALUOP <= 4'h1;
					end
			endcase
		end
		7'b0000011 : begin //Load Word
			PCSelect <= 1'b0;
			RegWEn <= 1'b1;
			ImmSel <= 1'b1;
			BSel <= 1'b1;
			ASel <= 1'b0;
			ALUOP <= 4'b1;
			MemRW <= 0;
		end
		7'b0100011 : begin
			PCSelect <= 1'b0;
			RegWEn <= 1'b1;
			ImmSel <= 1'b1;
			BSel <= 1'b1;
			ASel <= 1'b0;
			ALUOP <= 4'b1;
			MemRW <= 1;
		end
		7'b1100011 : begin
			RegWEn <= 1'b1;
			ImmSel <= 1'b1;
			case(IWord[14:12]) 
				3'h0 : begin
					PCSelect <= BEQ;
				end
				3'h1 : begin
					PCSelect <= ~BEQ;
				end
				3'h4 : begin
					PCSelect <= BLT;
				end
				3'h5 : begin
					PCSelect <= BEQ | ~BLT;
				end
				3'h6 : begin
					BrUn <= 1'b1;
					PCSelect <= BLT;
				end
				3'h7 : begin
					BrUn <= 1'b1;
					PCSelect <= BEQ | ~BLT;
				end
			endcase
			BSel <= 1'b1;
			ASel <= 1'b0;
			ALUOP <= 4'b1;
			MemRW <= 1;
		end
	endcase
end

endmodule