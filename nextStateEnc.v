/*
* Fase 3 de proyecto state encoder, stateRegister, control unit;
*/
module nextStateEnc(cond,moc,currentS,ir,nextS);
parameter DATAPSHIFTER = 3'b000; 
parameter DATAPIMMEDIATE = 3'b001; 
parameter BRANCH = 3'b101;
parameter LANDSIMMEDIATE= 3'b010; 
parameter LANDSREG= 3'b011; 
input moc;
input cond; 
input  [6:0] currentS;
input [32:0] ir; 
output reg [6:0] nextS;
always @(currentS)
	begin
		case(currentS)
		6'd0: nextS= 6'd1;
		6'd1: nextS= 6'd2;
		6'd2: nextS= 6'd3;
		6'd3://STATE3
			begin
				if(moc == 1)
				 nextS = 6'd4;
				else
				 nextS = 6'd3; 
			end
		6'd4:
			begin
				if(cond == 6'd0) 
				begin
				  nextS = 6'd1;
				end
				else 
				begin
					if(ir[27:25]==DATAPSHIFTER)
						nextS = 6'd5;
					else if(ir[27:25]==DATAPIMMEDIATE)
						nextS = 6'd6;
					else if (ir[27:25] == BRANCH)
					  begin
						if(ir[20] == 0)
							nextS = 6'd8;
						else if(ir[20]==1)
							nextS = 6'd10;
						if(currentS == 10)
							nextS = 6'd8; 
						else if(currentS == 8)
							nextS = 6'd9;
					    else if(currentS == 9)
							nextS = 6'd1;
					end
					else if(ir[27:25] == LANDSIMMEDIATE || ir[27:25] == LANDSREG)
					begin
						if(ir[27:25] ==LANDSIMMEDIATE && currentS < 6'd33)
							begin 
							 if(ir[23] ==1)
								nextS = 6'd33;
							 else if(ir[23] ==0)
								nextS = 6'd46;
							 else if(ir[24]==0)//P=0
									nextS = 6'd40;
							end
						else if(ir[27:25] == LANDSREG && currentS < 6'd33)//change else if to if
							begin 
								if(ir[23] == 1 )
									nextS = 6'd47;
								else if(ir[23] == 0)
									nextS = 6'd37;
								else if(ir[24]==0)//P=0
									nextS = 6'd40;
							end
					end
				end		 
			end
			6'd5, 6'd6: 
				nextS = 6'd1; 
			6'd33,6'd40, 6'd47,6'd37, 6'd46: 
			begin
				if(ir[20] == 0)
					nextS = 6'd41;
				else if(ir[20] == 1 && ir[22]==0)
					nextS = 6'd34;
				else if(ir[20] == 1 && ir[22]==1)
					nextS = 6'd44;	
			end
			6'd41, 6'd34, 6'd44:
			begin
			if(currentS == 6'd41 && ir[22] == 6'd0)
				nextS = 6'd42;
			else if(currentS == 6'd41 && ir[22] == 6'd1)
				nextS = 6'd45;	
			if(currentS == 6'd34 || currentS == 6'd44)
				nextS = 6'd35;
			end
			6'd45, 6'd42: 
				nextS = 6'd43;
			6'd35:
				begin
					if(ir[20]==1 && ir[22]==1)
						nextS = 6'd36;
					else if(ir[20]==1 & ir[22]==0)
						nextS = 6'd50;
				end
			6'd36: 
				begin
					if(currentS == 6'd36 && ir[24] ==1 && ir[21]==0)
						nextS = 6'd1;
				end
			6'd50: 
				begin
					if(ir[24] ==1 && ir[21]==0)
					nextS = 6'd1;
				end
			6'd43:
				if(ir[24] ==1 && ir[21]==0)
					nextS =6'd1;
			default: 
			begin 
				nextS = 6'd0;
			end
		endcase
	end
endmodule