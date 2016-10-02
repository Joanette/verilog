/*
	Ram test module 
*/
`timescale 1ns / 100ps 
module ram256x8tb;
//constants:
parameter WRITE = 1'b1; 
parameter READ = 1'b0;
//RAM parameters:
wire[7:0] DaOut; //1 byte		
reg [7:0] DaIn;
reg [7:0] address; 
reg rw;
reg mv; 
reg enable;
//for reading a file:
reg [7:0]data;
integer fd, code,i; 
//instanitate a ram: 
ram256x8 ram(DaIn, DaOut, rw, address, mv, enable);
//iteration index
reg [8:0] i;
initial begin
		fd = $fopen("mifile.dat", "r");
		i =0;
		    while(!($feof(fd))) 
			begin 
				code = $fscanf(fd, "%b", data);
				ram.mem[i] = data;
				i = i+1;
				$display("data = %b %d", data, i); 
			end
			$finish;
			$fclose(fd);
end
initial begin
  //initializing 
  address=8'b00000000;   
  DaIn  =0;
  rw = 1;
  
  address=8'b00000011;
  enable =0;
end
 initial $monitor($time, "At address=%b,DataIn=%b,DataOut=%b, rw=%b",address,DaIn,DaOut,rw);
endmodule