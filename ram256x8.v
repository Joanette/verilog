/*Fase 1 de proyecto memoria RAM 
*/
module ram256x8 (DataIn, DataOut, rw, address, mov, moc, typeData);
input [31:0] DataIn;//1 byte
input [31:0] address;
input rw;
output reg moc; //Handshaking
input mov;//Handshaking
output reg [31:0] DataOut; //1 byte
reg [7:0] mem [0:256];//256 localizaciones de 8 bits
input [1:0] typeData;
always @(rw, mov)
   begin
		if(rw)//1 for read
			begin
				case(typeData)
				2'b00:
				begin 
						DataOut	= mem[address];
				end 
				2'b01:
					begin 
					 //halfword
						DataOut = {mem[address],mem[address+1]};
						end
					2'b10:
						begin
						//Word
						DataOut = {mem[address], mem[address+1],
						mem[address+2], mem[address+3]};
						end		
					endcase
					moc =1;
				end
			else //write
				begin
					case(typeData)
					2'b00:
					if(mov == 1 )
					begin
					 	mem[address] = DataIn;
					end
					2'b01: 
						begin
						//halfword
						if(mov == 1)
							begin
								mem[address] = DataIn[15:8];
								mem[address+1] = DataIn[7:0];
							end
						end
					2'b10:
						begin
						//word
						if(mov == 1)
							begin
								mem[address] = DataIn[31:24];
								mem[address+1] = DataIn[23:16];
								mem[address+2] =DataIn[15:8];
								mem[address+3] = DataIn[7:0];	
							end	
						end
					endcase
					moc = 1;
				end			
		end
	endmodule