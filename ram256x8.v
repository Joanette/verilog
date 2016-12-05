/*Fase 1 de proyecto memoria RAM 
*/
module ram256x8 (DataIn, DataOut, rw, address, mv, moc, typeData);
input [31:0] DataIn;//1 byte
input [7:0] address;
input rw;
output reg moc; //Handshaking
input mv;//Handshaking
output reg [31:0] DataOut; //1 byte
reg [7:0] mem [0:256];//256 localizaciones de 8 bits
input [1:0] typeData;
always @(rw, mv)
   begin
		if(rw)//1 for read
			begin
				case(typeData)
				2'b00: DataOut = mem[address]; 
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
				2'b00: mem[address] = DataIn;
				2'b01: 
					begin
					//halfword
					mem[address] = DataIn[15:8];
					mem[address+1] = DataIn[7:0];
					end
				2'b10:
					begin
					//word
					mem[address] = DataIn[31:24];
					mem[address+1] = DataIn[23:16];
					mem[address+2] =DataIn[15:8];
					mem[address+3] = DataIn[7:0];				
					end
			    endcase
				moc =1;
			end
		
	end
endmodule