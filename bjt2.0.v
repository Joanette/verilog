module cpu_test2;
///***** Same a as bjt.v except now we use contol unit that's seperated by modules.***///
//*** Universal Clock *****;
reg CLK;
//******* Control Unit ***********: 
//Parameters:
parameter DATAPSHIFTER = 3'b000; 
parameter DATAPIMMEDIATE = 3'b001; 
parameter BRANCH = 3'b101;
parameter LANDSIMMEDIATE= 3'b010; 
parameter LANDSREG= 3'b011;
//Wires for CU:
 wire RFLd,IRLd,MARLd, MDRLd,RW,MOV, FRLd,MA1,MA0,MB1,MB0,MC2,MC1,MC0,MD,ME,MG,MF0,MF1,MH,MI0,MI1,MJ0, MJ1, T2,T1,T0, E, S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0;
 wire [1:0]typeData;
 wire [3:0]px;
 wire  CLR;
 wire [6:0] state;
 wire [6:0] nextS;
// reg  [31:0]ir;	
//*******RAM parameters***********:
wire[31:0] DaOut;
wire MOC;
//for reading a file:
reg [7:0]data;
integer fd, code, i, f;
reg [7:0] j; //iteration index
/******** Register File ******/
//reg [31:0] input_data;
reg [3:0] d_select;
reg reset=1;
integer first_time_flag;
wire [3:0] muxb_out;
wire ld0,ld1,ld2,ld3,ld4,ld5,ld6,ld7,ld8,ld9,ld10,ld11,ld12,ld13,ld14, ld15;
wire [31:0] rf_out [0:15];
wire [31:0] PA;
wire [31:0] PB;

integer index;
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
//**** Cond Tester *****//
wire CondOut; 
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
 
//instanitate a Control Unit: 
outputEncoder oe(CLK, CLR,CondOut,state, MOC,IROut, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
nextSdecoder nsd(state, nextS, IROut, MOC,CondOut); 
stateRegister sr(CLK, CLR, nextS, state);

// instanitate a ALU 
ALU alu(result, FlagZ, FlagN, FlagC, FlagV, PA, Mux_PBOut, Mux_DOut, carry);
//instanitate a ram: 
ram256x8 ram(Mux_GOut, DaOut, RW, MAROut, MOV, MOC,typeData);
//instantiate an MAR 
MAR  mar(MARLd, CLK, result, MAROut);
//instanitate MDR
MDR mdr (MDRLd, CLK, Mux_EOut , MDROut);
//instanitate MUX A 
MUXA muxa(MAOUT, IROut,px, {MA1, MA0});
Mux_16_1 mux1 (PA, MAOUT,rf_out[0],rf_out[1],rf_out[2],rf_out[3],rf_out[4],rf_out[5],rf_out[6],rf_out[7],rf_out[8],rf_out[9],rf_out[10],rf_out[11],rf_out[12],rf_out[13],rf_out[14],rf_out[15]);
//instanitate MUX C 
MUXC muxc (Mux_COut, IROut, px, {MC2, MC1, MC0});
binary_decoder d (ld0,ld1,ld2,ld3,ld4,ld5,ld6,ld7,ld8,ld9,ld10,ld11,ld12,ld13,ld14, ld15, Mux_COut, RFLd);
//instanitate Mux D
MUXD muxd(Mux_DOut, {OP4, OP3, OP2, OP1, OP0}, IROut, MD);
//instanitate MUX E 
MUXE muxe(Mux_EOut,result,DaOut,ME); 
//instanitate MUX F 
MUXF muxf (Mux_FOut,IROut,MDROut,DaOut, PB, {MF1,MF0});
//instanitate MUX G 
MUXG muxg(Mux_GOut,MDROut, shifter_out, MG);
//instanitate MUX j 
MUXJ muxj(Mux_JOut, IROut, {MJ1,MJ0} );
Mux_16_1 mux2 (PB, Mux_JOut,rf_out[0],rf_out[1],rf_out[2],rf_out[3],rf_out[4],rf_out[5],rf_out[6],rf_out[7],rf_out[8],rf_out[9],rf_out[10],rf_out[11],rf_out[12],rf_out[13],rf_out[14],rf_out[15]);
//instanitate shifter 
shifter_extender se(shifter_out, Mux_FOut, {S5, S4, S3, S2, S1, S0}, Mux_IOut, E);
//instanitate MUX B 
MUXPB muxPB (Mux_PBOut, PB, shifter_out, MDROut, {MB1, MB0});
//instanitate MUX I 
MUXI muxi (Mux_IOut, {T2, T1, T0}, {1'b0 ,IROut[6], IROut[5]}, {MI1, MI0});
//instanitate ir 
IR instructionRegister(IRLd,CLK,DaOut,IROut);
//instanciate Flag register
FDR FlagRegister(FRLd, CLK, CLR,{FlagN,FlagZ,FlagC,FlagV},FDROut);
//instanitate Condition Tester 
cond_tester condTest(CondOut,IROut[31:28], FDROut);

// instantiate Registers
// generate
// 	genvar k; 
// 	for (k = 0; k < 16; i = k + 1) begin
// 		register r (rf_out[k], result, CLK, ld[k],CLR);
// 	end
// endgenerate

register r0 (rf_out[0], result, CLK, ld0,CLR);
register r1 (rf_out[1], result, CLK, ld1,CLR);
register r2 (rf_out[2], result, CLK, ld2,CLR);
register r3 (rf_out[3], result, CLK, ld3,CLR);
register r4 (rf_out[4], result, CLK, ld4,CLR);
register r5 (rf_out[5], result, CLK, ld5,CLR);
register r6 (rf_out[6], result, CLK, ld6,CLR);
register r7 (rf_out[7], result, CLK, ld7,CLR);
register r8 (rf_out[8], result, CLK, ld8,CLR);
register r9 (rf_out[9], result, CLK, ld9,CLR);
register r10 (rf_out[10], result, CLK, ld10,CLR);
register r11 (rf_out[11], result, CLK, ld11,CLR);
register r12 (rf_out[12], result, CLK, ld12,CLR);
register r13 (rf_out[13], result, CLK, ld13,CLR);
register r14 (rf_out[14], result, CLK, ld14,CLR);
register r15 (rf_out[15], result, CLK, ld15,CLR);
initial begin
    fd = $fopen("IR.dat", "r");
    i = 0;
        while(!($feof(fd))) 
        begin
            code = $fscanf(fd, "%b", data);
            ram.mem[i] = data;
            i = i+1;
        end
        $fclose(fd);
		first_time_flag = 1'b1;
		#5 CLK = 0;
		repeat (340)
		begin	
			#5 CLK = ~CLK;	
		end
end


initial 

$monitor(" || CLK   = %d    CLR   = %d   present state = %d       next state = %d || \n || RFLd  = %d       IRLd = %d       MARLd = %d ||\n || MDRLd = %d         RW = %d         MOV = %d ||\n || FRLd  = %d        MA1 = %d         MA0 = %d ||\n || MB1   = %d        MB0 = %d         MC2 = %d || \n || MC1   = %d        MC0 = %d          MD = %d ||\n || ME    = %d         MG = %d         MF0 = %d ||\n || MF1   = %d         MH = %d         MI0 = %d ||\n || MI1   = %d        MJ0 = %d         MJ1 = %d ||\n || T2    = %d         T1 = %d          T0 = %d || \n || E     = %d         S5 = %d         S4  = %d ||\n || S3    = %d         S2 = %d         S1  = %d ||\n || S0    = %d        OP4 = %d         OP3 = %d ||\n || OP2   = %d        OP1 = %d         OP0 = %d || \n || MAOUT =%d     result = %h  instruction r = %h ||\n || MAROut = %d  PA =  %h PBOut =  %h Mux_COut = %h ||\n || END OF:     present state = %d  next state = %d, Mux_EOut = %h || \n shifter_in = %h, shifter_out = %h, MDROut = %h || Mux_GOut = %h   DaOut = %h   Mux_JOut = %h, rf0_out = %h   rf1_out = %h   rf2_out = %h   \nrf3_out = %h   rf4_out = %h rf5_out = %h   \nrf6_out = %h   rf7_out = %h   rf8_out = %h   \nrf9_out = %h   rf10_out = %h   rf11_out = %h, \nrf12_out = %h   rf13_out = %h   rf14_out = %h   \nrf15_out = %h  CondOut = %h FlagZ = %h\n || mem[0] = %h%h%h%h     mem[4] = %h%h%h%h  mem[8]=%h%h%h%h ||\n || mem[12] = %h%h%h%h    mem[16] = %h%h%h%h    mem[20]= %h%h%h%h ||\n || mem[24] = %h%h%h%h    mem[28] = %h%h%h%h    mem[32]= %h%h%h%h ||\n || mem[36] = %h%h%h%h    mem[40] = %h%h%h%h    mem[44]= %h%h%h%h ||\n" , CLK, CLR, state,nextS, RFLd,IRLd,MARLd, MDRLd,RW,MOV, FRLd,MA1,MA0,MB1,MB0,MC2,MC1,MC0,MD,ME,MG,MF0,MF1,MH,MI0,MI1,MJ0, MJ1, T2,T1,T0, E, S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0, MAOUT, alu.result, IROut, MAROut,PA, PB,Mux_COut,state,nextS, Mux_EOut, Mux_FOut, shifter_out, MDROut, Mux_GOut, DaOut, Mux_JOut,rf_out[0], rf_out[1], rf_out[2], rf_out[3], rf_out[4], rf_out[5], rf_out[6], rf_out[7], rf_out[8], rf_out[9], rf_out[10], rf_out[11], rf_out[12], rf_out[13], rf_out[14], rf_out[15], CondOut, FlagZ,ram.mem[0], ram.mem[1], ram.mem[2], ram.mem[3], ram.mem[4], ram.mem[5], ram.mem[6], ram.mem[7],ram.mem[8],ram.mem[9],ram.mem[10],ram.mem[11],ram.mem[12],ram.mem[13],ram.mem[14],ram.mem[15],ram.mem[16],ram.mem[17],ram.mem[18],ram.mem[19],ram.mem[20],ram.mem[21],ram.mem[22],ram.mem[23],ram.mem[24],ram.mem[25],ram.mem[26],ram.mem[27],ram.mem[28],ram.mem[29],ram.mem[30],ram.mem[31],ram.mem[32],ram.mem[33],ram.mem[34],ram.mem[35],ram.mem[36],ram.mem[37],ram.mem[38],ram.mem[39],ram.mem[40],ram.mem[41],ram.mem[42],ram.mem[43], ram.mem[44],ram.mem[45],ram.mem[46],ram.mem[47]);


endmodule