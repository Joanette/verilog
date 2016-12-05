module IR (IRLd, CLK, Ds, Qs ); 
input IRLd; 
input CLK;
input [31:0] Ds; 
output reg [31:0]Qs;
always@(CLK)
	begin
		if(IRLd)
			Qs <= Ds
	end
end module
module 

module MAR (MARLd, CLK, Ds, Qs);
input MARLd;
input CLK; 
input[7:0] Ds;
output reg [7:0] Qs; 
always@(CLK)
	begin
		if(MARLd)
			Qs <= Ds;  
	end
endmodule

module MDR (MDRLd, CLK, Ds, Qs); 
input MDRLd; 
input CLK;
input Ds[31:0]
output reg Qs [31:0]
always@(CLK) 
	begin
	  if(MDRLd)
			Qs<=Ds;
	end
endmodule

module FDR (FDRLd, CLK, Ds, Qs); 
input FDRLd; 
input CLK;
input Ds[3:0]; 
output reg Qs [3:0]; 
always@(CLK)
	begin 
		if(MDRLd)
			Qs <= Ds;
	end
endmodule