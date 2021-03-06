/*
	Ram test module 
*/
`timescale 1ns / 100ps 
module ram256x8tb;
//constants:
parameter WRITE = 1'b0; 
parameter READ = 1'b1;
parameter BYTE = 2'b00; 
parameter HALFWORD = 2'b01;
parameter WORD 	 = 2'b10; 

//RAM parameters:
wire[31:0] DaOut; //1 byte
wire moc;		
reg [31:0] DaIn;
reg [7:0] address; 
reg rw;
reg mv; 
reg enable;
reg [1:0] typeData;
//for reading a file:
reg [7:0]data;
integer fd, code,i; 
//instanitate a ram: 
ram256x8 ram(DaIn, DaOut, rw, address, mv, moc,typeData);
//iteration index
reg [8:0] j;
initial begin
		fd = $fopen("IR.dat", "r");
		i =0;
		    while(!($feof(fd))) 
			begin 
				code = $fscanf(fd, "%b", data);
				ram.mem[i] = data;
				i = i+1;
			end
			$fclose(fd);
end

initial begin
  //initializing
  mv = 0;
  address=0;
  DaIn=0; 
  typeData = 2;
  //Initializing 
  $display("***=============Testing precharged memory=============***");
  	rw = READ; 
	address = 0;
	enable =0;
repeat(12) 
	begin 
	 #5 address = address + 4;
     enable = ~enable;
	 mv = 1; //memory operation valid
	 #5 mv = 0;
	end
$display("***=============Testing bytess=============***");
  enable=0;
  DaIn  =8'h9a;
  address =0;
  rw =WRITE;
  typeData = BYTE;
$display("=============Writing bytess=============");
  repeat(2) 
	begin 
     enable = ~enable; 
	 address = address +2;
	 DaIn = DaIn +1;
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
   $display("=============Readig bytess=============");
	rw = READ; 
	address = 0;
	enable =0;
  repeat(2) 
	begin 
     enable = ~enable;
	 address = address +2;	 
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
  $display("***=============Testing halfwords=============***");
  $display("=============Writing halfwords=============");
  DaIn  =16'hbebe;
  rw =WRITE;
  typeData = HALFWORD; 
  address =0; 
  repeat(2) 
	begin 
     enable = ~enable; 
	 address = address +2;
	 DaIn = DaIn +1;
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
	$display("=============Readig halfwords=============");
	rw = READ; 
	address = 0;
	enable =0;
  repeat(2) 
	begin 
     enable = ~enable; 
	 address = address +2;
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
	$display("***=============Testing word=============***");
    $display("=============Writing words=============");
	DaIn  =32'hbebebebe;
  rw =WRITE;
  typeData = WORD; 
  address =0; 
  repeat(2) 
	begin 
     enable = ~enable;
     address = address + 4;	 
	 DaIn = DaIn +1;
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
	$display("=============Readig words=============");
	rw = READ; 
	address = 0;
	enable =0;
  repeat(2) 
	begin
     enable = ~enable; 
	 address = address +4;	
	 mv = 1; //memory operation valid
	 #5 mv =0;
	end
  $finish;
end
 initial 
 $monitor($time," At address=%h,DataIn=%h,DataOut=%h, rw=%b, typeData= %b, enable = %b",address,DaIn,DaOut,rw,typeData,enable);
endmodule