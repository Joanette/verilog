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
				if(cond == 0)
				 nextS = 0;
				else 
				begin
					case(ir[27:26])
					DATAPSHIFTER: nextS = 6'd5;
					DATAPIMMEDIATE: nextS = 6'd6;
					BRANCH: 
					  begin
						if(currentS == 8)
							nextS = 6'd7;
						else if(currentS == 7)
							nextS = 0;
					  end
					endcase
				end
			end
		default: nextS = 0;
		endcase
	end
endmodule