/*Fase 1 de proyecto memoria RAM 
*/
module ram256x8 (DataIn, DataOut, rw, address, mv,moc, enable, typeData);
input [63:0] DataIn;//1 byte
input [7:0] address;
input enable;
input rw;
output reg moc; //Handshaking
input mv;//Handshaking
output reg [63:0] DataOut; //1 byte
reg [7:0] mem [0:256];//256 localizaciones de 8 bits
input [1:0] typeData;
always @(rw, enable)
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
				2'b11:
					begin
					 //double word
					DataOut = {mem[address], mem[address+1], 
					mem[address+2], mem[address+3], mem[address+4]
					, mem[address+5], mem[address+6], mem[address+7]};
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
				2'b11: 
					begin
					mem[address]   = DataIn[63:56];
					mem[address+1] = DataIn[55:48];
					mem[address+2] = DataIn[47:40];
					mem[address+3] = DataIn[39:32];
					mem[address+4] = DataIn[31:24];
					mem[address+5] = DataIn[23:16];
					mem[address+6] = DataIn[15:8];
					mem[address+7] = DataIn[7:0];
					end
			    endcase
				moc =1;
			end		
	end
endmodule