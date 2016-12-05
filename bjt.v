module cpu_test;
//*** Universal Clock *****;
reg CLK;
reg CLR;
//******* Control Unit ***********: 
//Parameters:
parameter DATAPSHIFTER = 3'b000; 
parameter DATAPIMMEDIATE = 3'b001; 
parameter BRANCH = 3'b101;
parameter LANDSIMMEDIATE= 3'b010; 
parameter LANDSREG= 3'b011;
//Wires:
 wire RFLd, IRLd,MARLd, MDRLd,RW,MOV, FRLd,MA1,MA0,MB1,MB0,MC2,MC1,MC0,MD,ME,MG,MF0,MF1,MH,MI0,MI1,MJ0, MJ1, T2,T1,T0, E, S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0; 
 wire [1:0]typeData;
 wire [3:0]px; 
 reg  [31:0]ir;	
//*******RAM parameters***********:
wire[31:0] DaOut;
wire MOC;	
//for reading a file:
reg [7:0]data;
integer fd, code, i;
reg [8:0] j; //iteration index
/******** Register File ******/
//wire [3:0] muxc_out;
//wire[3:0] muxa_out;
wire [3:0] muxb_out;
wire w0 [0:15];
wire [31:0] w1 [0:15];
wire [31:0] PA;
wire [31:0] PB;
integer index;
integer first_time_flag;
generate
genvar k; 
for (k = 0; k < 16; i = k + 1) begin
    register r (w1[k], 0, CLK, w0[k]);
end endgenerate

	 
/****** ALU Parameters *******/
wire [31:0] result;
wire FlagC;
wire FlagZ;
wire FlagN;
wire FlagV;
reg carry = 0;

//***** MAR Parameters ******//
wire [31:0] MAROut;
//*****MDR Parameters*****//
wire [31:0] MDROut;
//**** IR Parameters *****//
wire [31:0] IROut;
//**** FDR *****//
wire [3:0] FDROut; 
/****** out A ****/
wire [3:0] MAOUT;
/****** out B ****/
wire [31:0] Mux_PBOut;
/****** out C ****/
wire [3:0] Mux_COut;
/***** out D ****/
wire [4:0] Mux_DOut;
/******* out E *******/
wire [31:0]Mux_EOut;
/***** out G *******/
wire [31:0] Mux_GOut;
/***** OUT F ******/
wire [31:0] Mux_FOut; 
/****** OUT H ****/ 
wire [31:0] Mux_HOut;
/***** OUT I ******/
wire [2:0] Mux_IOut; 
/***** OUT J ******/
wire[3:0] Mux_JOut;
//**** shifter OUT **/
wire [31:0] shifter_out; 
wire cout;
/***Cond***/
reg cond = 1; 
// instanitate a ALU 
ALU alu(result, FlagZ, FlagN, FlagC, FlagV, PA, Mux_PBOut, Mux_DOut, carry);
//instanitate a ram: 
ram256x8 ram(Mux_GOut, DaOut, RW, MAROut, MOV, MOC,typeData);
//instanitate a Control Unit: 
controlUnit cu(CLR,CLK,cond, MOC, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
//instanitate an MAR 
MAR  mar (MARLd, CLK, result, MAROut);
//instanitate MDR
MDR mdr (MDRLd, CLK, Mux_EOut , MDROut);
//instanitate MUX A 
MUXA muxa(MAOUT, IROut,px, {MA1, MA0});
Mux_16_1 mux1 (PA, MAOUT, w1);
//instanitate MUX B 
MUXPB muxPB (Mux_PBOut, PB, Mux_HOut, MDROut, {MB1, MB0});
//instanitate MUX C 
MUXC muxc (Mux_COut, IROut, px, {MC2, MC1, MC0});
binary_decoder d (w0, Mux_COut, RFLd);
//instanitate Mux D 
MUXD muxd(Mux_DOut, {OP4, OP3, OP2, OP1, OP0}, IROut, MD);
//instanitate MUX E 
MUXE muxe(Mux_EOut,DaOut,result,ME); 
//instanitate MUX F 
MUXF muxf (Mux_FOut,IROut,MDROut,DaOut, PB, MF);
//instanitate MUX G 
MUXG muxg(Mux_GOut,MDROut, Mux_HOut , MG);
//instanitate MUX H 
MUXH muxh(Mux_HOut, shifter_out, 0 ,MH);
//instanitate MUX j 
MUXJ muxj(Mux_JOut, IROut, {MJ1,MJ0} );
Mux_16_1 mux2 (PB, Mux_JOut, w1);
//instanitate shifter 
shifter_extender se(shifter_out, Mux_FOut, {S5, S4, S3, S2, S1, S0}, Mux_IOut, E);
//instanitate MUX I 
MUXI muxi (Mux_IOut, {T2, T1, T0}, {1'b0 ,IROut[6], IROut[5]}, {MI1, MI0});
//instanitate ir 
IR instrucrtionRegister(IRLd,CLK,DaOut,IROut);

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
$monitor("CLK= %d, present state = %d,MDROut = %d, W1 = %d, result= %d, instruction r = %d " , CLK, cu.state, MDROut, w1[5], alu.result, IROut); 
endmodule