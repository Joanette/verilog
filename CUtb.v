`timescale 1ns / 100ps 
module CUtb; 
	//CU parameters:
	wire RFLd,IRLd,MARLd;
	wire MDRLd,RW, MOV;
	wire typeData;
	wire [0:3]px;
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
	reg  [31:0]ir;	
	//CLK field
	reg CLK;
	reg CLR;
	//RAM FIELDS
	reg  DataIn; 
	wire DaOut;
	wire MOC;
	reg MAR;//viene del alu
	//instanitate a ram 
	ram256x8 ram(DataIn, DaOut, RW, MAR, MOV, MOC, typeData);
	//instanitate a controlUnit
	controlUnit cu(CLR,CLK, MOC, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);	
	initial begin 
		fd = $fopen("IR.dat", "r"); 
		i = 0; 
		while(!($feof(fd))
			begin 
				code = $fscanf(fd, "%b", data);
				ram.mem[i] = data;
				i = i+1;
			end
			$fclose(fd);
	end 
	initial begin
		ir[31:0] = 32'b11100010000000010000000000000000;
		CLR = 1;
		moc = 1; 
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
	end
	initial
	$monitor("CLK = %d,ir = %h ,RfLd=%d, IRLd=%d, MARLd=%d, MDRLd=%d, RW =%d, MOV=%d, typeData=%d,px=%d, FRLd=%d, MA1=%d, MA0=%d, MB1=%d, MB0=%d, MC2 = %d,MC1=%d, MC0=%d, MD=%d, ME=%d,MF1 = %d,MF=%d,MG = %d,MH=%d, MI1=%d,MI0=%d,MJ1 = %d, MJ0 = %d,T2 = %d,T1=%d,T0=%d,S5=%d,S4=%d,S3=%d,S2=%d,S1=%d,S0=%d,OP4=%d,OP3=%d,OP2=%d,OP1=%d, OP0=%d", CLK, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0,OP4, OP3, OP2, OP1, OP0);

endmodule