/*Fase 1 de proyecto memoria RAM 
*/
module ram256x8 (DataIn, DataOut, rw, address, mv, enable);
input [7:0] DataIn;//1 byte
input [7:0] address;
input enable;
input rw;
input mv;//Handshaking
output reg [7:0] DataOut; //1 byte
reg [7:0] mem [0:256];//256 localizaciones de 8 bits
always @(rw, enable)
		if(rw)//1 for read
			begin
				DataOut = mem[address]; 
				$display("here yandel %b", mem[address]);
			end
		else //write
			begin
				mem[address] = DataIn;
				DataOut = 8'bz;
			end
endmodule