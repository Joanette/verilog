`timescale 1ns / 100ps 
module CUtb; 
	//CU parameters:
	//reg clk;
	reg [6:0] state;
	wire RFLd;
	wire IRLd;
	wire MARLd;
	wire MDRLd;
	wire RW;
	wire MOV;
	wire typeData;
    wire [0:3]px;
	wire FRLd;
	wire MA1;
	wire MA0;
	wire MB1;
	wire MB0;
	wire MC1;
	wire MC0;
	wire MD;
	wire ME;
	wire MF; 
	wire MH; 
	wire MI0;
	wire MI1; 
	wire T1; 
	wire T0;
	wire S5;
	wire S4;
	wire S3;
	wire S0;
	wire OP4;
	wire OP3;
	wire OP2;
	wire OP1;
	wire OP0;
	//instanitate a controlUnit
	controlUnit cu(RFLd,IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC1, MC0, MD, ME,MF, MG,MH, MI0,MI1, E, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0, state);
	initial begin
		#5 state = 6'b000000;
		#5 state = 6'd49;
		$display("Hello World");
	end
	initial
	$monitor($time," At state = %d RfLd=%d, IRLd=%d, MARLd=%d, MDRLd=%d, RW =%d, MOV=%d, typeData=%d,px=%d, FRLd=%d, MA1=%d, MA0=%d, MB1=%d, MB0=%d, MC1=%d, MC0=%d, MD=%d, ME=%d,MF=%d,MH=%d, MI0=%d,MI1=%d, T1=%d,T0=%d,S5=%d,S4=%d,S3=%d,S2=%d,S1=%d,S0=%d,OP4=%d,OP3=%d,OP2=%d, OP1=%d, OP0=%d",state, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC1, MC0, MD, ME,MF,MH, MI0,MI1, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
endmodule