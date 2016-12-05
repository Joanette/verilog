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
reg [7:0] address;  
reg [31:0] DaIn;
//for reading a file:
reg [7:0]data;
integer fd, code, i;
reg [8:0] j; //iteration index
/******** Register File ******/
wire [3:0] muxc_out;
wire [3:0] muxa_out;
wire [3:0] muxb_out;
wire w0 [0:15];
wire [31:0] w1 [0:15];
wire [31:0] PA;
wire [31:0] PB;
integer index;
integer first_time_flag;
binary_decoder d (w0, muxc_out, RFLd);
generate
genvar k; 
for (k = 0; k < 16; i = k + 1) begin
    register r (w1[k], 0, CLK, w0[k]);
end endgenerate
	Mux_16_1 mux1 (PA, muxa_out, w1);

	Mux_16_1 mux2 (PB, muxb_out, w1);   
/****** ALU *******/
wire [31:0] result;
wire FlagC;
wire FlagZ;
wire FlagN;
wire FlagV;
reg carry = 0;

ALU alu(result, FlagZ, FlagN, FlagC, FlagV, PA, PB,  {OP4,OP3,OP2,OP1,OP0}, carry);

//*****MAR ******//
wire MAROUT;
//*****MDR *****//

//**** IR *****//

//instanitate a ram: 
ram256x8 ram(DaIn, DaOut, RW, address, MOV, MOC,typeData);
//instanitate a Control Unit: 
controlUnit cu(CLR,CLK,MOC, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
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

endmodule