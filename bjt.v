module cpu_test;
//*** Universal Clock *****;
reg CLK;
//******* Control Unit ***********: 
//Parameters:
parameter DATAPSHIFTER = 3'b000; 
parameter DATAPIMMEDIATE = 3'b001; 
parameter BRANCH = 3'b101;
parameter LANDSIMMEDIATE= 3'b010; 
parameter LANDSREG= 3'b011;
//Wires:
 wire RFLd,IRLd,MARLd, MDRLd,RW,MOV, FRLd,MA1,MA0,MB1,MB0,MC2,MC1,MC0,MD,ME,MG,MF0,MF1,MH,MI0,MI1,MJ0, MJ1, T2,T1,T0, E, S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0; 
 wire [1:0]typeData;
 wire [3:0]px;
 wire CLR;
// reg  [31:0]ir;	
//*******RAM parameters***********:
wire[31:0] DaOut;
wire MOC;
//for reading a file:
reg [7:0]data;
integer fd, code, i;
reg [7:0] j; //iteration index
/******** Register File ******/
//reg [31:0] input_data;
reg [3:0] d_select;
reg reset=1;
integer first_time_flag;
wire [3:0] muxb_out;
wire w0 [0:15];
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
reg cond; 
//instanitate a Control Unit: 
controlUnit cu(CLK, CLR,cond, MOC, IROut, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
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
Mux_16_1 mux1 (PA, MAOUT, rf_out);
//instanitate MUX C 
MUXC muxc (Mux_COut, IROut, px, {MC2, MC1, MC0});
binary_decoder d (w0, Mux_COut, RFLd);
//instanitate Mux D 
MUXD muxd(Mux_DOut, {OP4, OP3, OP2, OP1, OP0}, IROut, MD);
//instanitate MUX E 
MUXE muxe(Mux_EOut,DaOut,result,ME); 
//instanitate MUX F 
MUXF muxf (Mux_FOut,IROut,MDROut,DaOut, PB, {MF1,MF0});
//instanitate MUX G 
MUXG muxg(Mux_GOut,MDROut, Mux_HOut , MG);
//instanitate MUX j 
MUXJ muxj(Mux_JOut, IROut, {MJ1,MJ0} );
Mux_16_1 mux2 (PB, Mux_JOut, rf_out);
//instanitate shifter 
shifter_extender se(shifter_out, Mux_FOut, {S5, S4, S3, S2, S1, S0}, Mux_IOut, E);
//instanitate MUX B 
MUXPB muxPB (Mux_PBOut, PB, shifter_out, MDROut, {MB1, MB0});
//instanitate MUX I 
MUXI muxi (Mux_IOut, {T2, T1, T0}, {1'b0 ,IROut[6], IROut[5]}, {MI1, MI0});
//instanitate ir 
IR instructionRegister(IRLd,CLK,DaOut,IROut);
// instantiate Registers
generate
	genvar k; 
	for (k = 0; k < 16; i = k + 1) begin
		register r (rf_out[k], result, CLK, w0[k],CLR);
	end
endgenerate

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
		cond = 1;
		#5 CLK = 0;
		repeat (64) 
		begin	
			#5 CLK = ~CLK;
			// if(first_time_flag) 
			// begin
			//   reset = 0;
			//   first_time_flag = 0;
			// end	
		end
end

initial 
$monitor(" || CLK   = %d    CLR   = %d   present state = %d       next state = %d || \n || RFLd  = %d       IRLd = %d       MARLd = %d ||\n || MDRLd = %d         RW = %d         MOV = %d ||\n || FRLd  = %d        MA1 = %d         MA0 = %d ||\n || MB1   = %d        MB0 = %d         MC2 = %d || \n || MC1   = %d        MC0 = %d          MD = %d ||\n || ME    = %d         MG = %d         MF0 = %d ||\n || MF1   = %d         MH = %d         MI0 = %d ||\n || MI1   = %d        MJ0 = %d         MJ1 = %d ||\n || T2    = %d         T1 = %d          T0 = %d || \n || E     = %d         S5 = %d         S4  = %d ||\n || S3    = %d         S2 = %d         S1  = %d ||\n || S0    = %d        OP4 = %d         OP3 = %d ||\n || OP2   = %d        OP1 = %d         OP0 = %d || \n || MAOUT =%d     result = %b  instruction r = %h ||\n || MAROut = %d  PA =  %d Mux_PBOut =  %b Mux_COut = %h ||\n || END OF:     present state = %d  next state = %d, Mux_EOut = %h,shifter_in = %h, shifter_out = %h, MDROut = %h || DaOut = %h, ram.mem[0] = %d" , CLK, CLR, cu.state,cu.nextS, RFLd,IRLd,MARLd, MDRLd,RW,MOV, FRLd,MA1,MA0,MB1,MB0,MC2,MC1,MC0,MD,ME,MG,MF0,MF1,MH,MI0,MI1,MJ0, MJ1, T2,T1,T0, E, S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0, MAOUT, alu.result, IROut, MAROut,PA, Mux_PBOut,Mux_COut,cu.state,cu.nextS, Mux_EOut, Mux_FOut, shifter_out, MDROut, DaOut, ram.mem[0]);
endmodule