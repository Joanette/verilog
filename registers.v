module IR (IRLd, CLK, Ds, Qs ); 
input IRLd; 
input CLK;
input [31:0] Ds; 
output reg [31:0]Qs;
always@(posedge CLK)
	begin
		if(IRLd)
			Qs <= Ds;
	end
endmodule

module MAR (MARLd, CLK, Ds, Qs);
input MARLd;
input CLK; 
input[31:0] Ds;
output reg [31:0] Qs; 
always@(posedge CLK)
	begin
		if(MARLd) begin
		  Qs <= Ds;
		end
	end

endmodule

module MDR (MDRLd, CLK, Ds, Qs); 
input MDRLd; 
input CLK;
input [31:0] Ds;
output reg [31:0] Qs;
always@(posedge CLK) 
	begin
	  if(MDRLd)
			Qs<=Ds;
	end
endmodule

module FDR (FDRLd, CLK, Ds, Qs); 
input FDRLd; 
input CLK;
input  [3:0] Ds; 
output reg [3:0] Qs; 
always@(posedge CLK)
	begin 
		if(FDRLd)
			Qs <= Ds;
	end
endmodule
