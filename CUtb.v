`timescale 1ns / 100ps 
module CUtb;
	//CU parameters:
	wire RFLd,IRLd,MARLd;
	wire MDRLd,RW, MOV;
	wire [1:0]typeData;
	wire [3:0]px;
	wire FRLd;
	wire MA1,MA0;
	wire MB1,MB0;
	wire MC2,MC1,MC0;
	wire MD, ME;
	wire MF1,MF; 
	wire MH;
	wire MI0,MI1; 
	wire MJ0,MJ1;
	wire T2, T1, T0;
	wire S5,S4,S3,S0;
	wire OP4,OP3, OP2,OP1,OP0;
	//nextStateEnc fields 
	reg [31:0]ir;	
	//CLK field
	reg CLK;
	reg CLR;
	//RAM FIELDS 
	reg MOC;
	reg cond;
	//for next state
	wire [6:0] nextS; 
	wire [6:0] state;
	//instanitate a ouputEncoder:
	outputEncoder oe (CLK,CLR,cond,state, MOC, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0); 
	nextSdecoder nsd(state, nextS, ir, MOC,cond); 
	stateRegister sr(CLK, CLR,nextS,state);
	initial begin
		ir[31:0] = 32'b11100010000000010000000000000000;
		CLR = 1;
		cond = 1;
		MOC = 1; 
		CLK = 1;
		#5 CLK <= !CLK;//1
		//2
		#10 CLK = ~CLK;
		#10 CLK = ~CLK;
		//3
		#10 CLK = ~CLK; 
		#10 CLK = ~CLK;
		//4 
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;
		//5
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;
		//6
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;
		//7
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;	
		//8
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;
		//9
	    #10 CLK = ~CLK; 
		#10 CLK = ~CLK;			
	end
	initial
	$monitor("||state =%d , CLK = %d,ir = %h||",state, CLK, ir);

endmodule