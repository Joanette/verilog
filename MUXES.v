module MUXA(out,ir,MA);
output reg [3:0] out;
input  [32:0] ir;
input  [1:0] MA;
always @ (MA)
	  begin
			case(MA)
			2'd0: 
				out = ir[19:16];
			2'd1: 
				out = ir[15:12];
			2'd2:
				out = 4'd15;
			endcase
	  end
endmodule

module MUXPB(outPB,L0,L1,L2,MB);
output reg [31:0] outPB; 
input [1:0] MB;
input [31:0] L0;
input [31:0] L1; 
input [31:0] L2; 
	always @(MB)
		begin 
			case(MB)
			2'd0: 
				outPB = L0; 
			2'd1: 
				outPB = L1;
			2'd2: 
				outPB = L2; 
			endcase
		end
endmodule

module MUXC(outC,ir,L0,MC);
output reg [3:0] outC;
input [3:0] L0;
input [3:0]MC; 
input [31:0] ir;
	always @(MC)
		begin 
		case(MC)
		 3'd0: 
			outC = L0;
		 3'd1: 
			outC = ir[19:12];
		 3'd2:
			outC = 4'b1110; 
		 3'd3:
			outC = 4'b1111; 
		 3'd4: 
			outC = 4'b0001;
		 endcase
		end
endmodule

module MUXD (outD, OP, ir, MD); 
output reg [3:0] outD; 
input  [3:0] OP; 
input  [31:0] ir;
input  MD;
always @(MD)
	begin 
		case(MD)
		1'd0: 
			outD = ir[24:21];
		1'd1:
			outD = OP;
		endcase
	end 	
endmodule

module MUXE(outE, L1, L0, ME); 
output reg [3:0] outE;
input  [3:0] L1;
input  [3:0] L0; 
input  ME;
always @(ME)
	begin 
		case(ME) 
		1'd0:
			outE = L0;
		1'd1:
			outE = L1;
		endcase
	end 
endmodule

module MUXF(outF, L1, L0, MF);
output reg [31:0] outF; 
input  [31:0] L1;
input  [31:0] L0; 
input  MF; 
always @(MF)
	begin 
		case(MF) 
		1'd0:
			outF = L0; 
		1'd1: 
			outF = L1;
		endcase
	end
endmodule

module MUXG(outG,L0, L1, MG);
output reg [31:0] outG; 
input  [31:0] L1;
input  [31:0] L0;
input  MG; 
always @(MG)
	begin 
		case(MG)
		1'd0: 
			outG = L0;
		1'd1: 
			outG = L1;
		endcase
	end
endmodule

module MUXH(outH, L0, L1, MH); 
output reg [31:0] outH; 
input  [31:0] L1;
input  [31:0] L0;
input  MH; 
always @(MH)
	begin 
		case(MH)
		1'd0: 
			outH = L0;
		1'd1: 
			outH = L1;
		endcase
	end
endmodule
module MUXI(outI, T, MI); 
output reg [3:0] outI; 
input  [1:0] MI;
input  [3:0] T; 
always @(MI) 
	begin 
		case(MI)
			2'd0: 
				outI = 4'd7;
			2'd1:
				outI = 4'd7; 
			2'd2:
				outI = T;
		endcase
	end
endmodule

module MUXJ(outJ, ir, MJ); 
output reg [3:0] outJ; 
input [1:0] MJ; 
input [31:0] ir; 
always @(MJ) 
	begin
		case(MJ)
			2'd0: 
				outJ = ir[3:0];
			2'd1:
				outJ = 4'd1;
			2'd2:
				outJ = ir[15:12];
		endcase
	end
endmodule


