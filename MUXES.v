module MUXA(out,ir,px,MA);
output reg [3:0] out;
input  [31:0] ir;
input [3:0] px;
input  [1:0] MA;
always @ (MA,  ir, px)
	  begin
			case(MA)
			2'd0: 
				out = ir[19:16];
			2'd1:  begin
				out = ir[15:12] + px[3:0];		  
			end
			2'd2: begin
				out = 4'b1111;
				//$display("Entered r15 case");
			end
			endcase
	  end
endmodule

module MUXPB(outPB,L0,L1,L2,MB);
output reg [31:0] outPB;
input [1:0] MB;
input [31:0] L0;
input [31:0] L1; //shifter_out 
input [31:0] L2; 
	always @(MB, L0, L1, L2)
		begin 
			case(MB)
			2'd0: begin
				outPB = L0;	 			  
			end
			2'd1:
			begin 
				outPB = L1;
			end
			2'd2: begin
				outPB = L2;	
			end
			2'd3: begin
				outPB = 32'd5;
			end	
			endcase
		end
endmodule

module MUXC(outC,ir,px,MC);
output reg [3:0] outC;
input [3:0] px;
input [2:0]MC; 
input [31:0] ir;
	always @(MC,ir,px)
		begin 
		case(MC)
		 3'd0: 
			outC = px[3:0]+ir[15:12]; // Rd
		 3'd1: 
			outC = ir[19:12]; // Rn
		 3'd2:
			outC = 4'b1110; //R14
		 3'd3:
			outC = 4'b1111; // R15
		 3'd4: 
			outC = 4'b0111; //R7
		 endcase
		end
endmodule

module MUXD (outD, OP, ir, MD); 
output reg [4:0] outD; 
input  [4:0] OP; 
input  [31:0] ir;
input  MD;
always @(MD,OP, ir)
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
output reg [31:0] outE;
input  [31:0] L1;
input  [31:0] L0; 
input  ME;
always @(ME,L1, L0)
	begin 
		case(ME) 
		1'd0:
			begin
			outE = L0;
			end
		1'd1:
			outE = L1;
		endcase
	end 
endmodule

module MUXF(outF, L3,L2,L1,L0, MF);
output reg [31:0] outF; 
input  [31:0] L3;
input  [31:0] L2; 
input  [31:0] L1;
input  [31:0] L0; 
input [1:0] MF; 
always @(MF, L3, L2, L1, L0)
	begin 
		case(MF) 
		2'd0:
			outF = L0; 
		2'd1: 
			outF = L1;
		2'd2: 
			outF = L2;
		2'd3: begin
			outF = L3;
		end
		endcase
	end
endmodule

module MUXG(outG,L0, L1, MG);
output reg [31:0] outG; 
input  [31:0] L1;
input  [31:0] L0;
input  MG; 
always @(MG, L0, L1)
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
always @(MH, L0, L1)
	begin 
		case(MH)
		1'd0: 
			outH = L0;
		1'd1: 
			outH = L1;
		endcase
	end
endmodule
module MUXI(outI,T,IR0,MI); 
output reg [2:0] outI; 
input  [1:0] MI;
input [2:0] IR0;
input  [2:0] T; 
always @(MI, T, IR0) 
	begin 
		case(MI)
			2'd0: 
				outI = 3'd1;
			2'd1:
				outI = IR0; 
			2'd2:
				outI = T;
		endcase
	end
endmodule

module MUXJ(outJ, ir, MJ); 
output reg [3:0] outJ; 
input [1:0] MJ; 
input [31:0] ir; 
always @(MJ, ir) 
	begin
		case(MJ)
			2'd0: 
				outJ = ir[3:0];
			2'd1:
				outJ = 4'd7;
			2'd2:
				outJ = ir[15:12];
		endcase
	end
endmodule


