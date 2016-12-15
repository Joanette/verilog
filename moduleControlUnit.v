module nextSdecoder(state, nextS, ir, moc, cond);
parameter DATAPSHIFTER = 3'b000; 
parameter DATAPIMMEDIATE = 3'b001; 
parameter BRANCH = 3'b101;
parameter LANDSIMMEDIATE= 3'b010; 
parameter LANDSREG= 3'b011;
input [6:0] state; 
input [31:0] ir;
input moc;
input cond; 
output reg [6:0] nextS; 
always@(state, ir)
	begin
		case(state)
		 6'd0,6'd6,6'd7, 6'd9, 6'd38,6'd39,6'd48, 6'd49 : 
			nextS = 1; 
		 6'd1:
			nextS = 2;
		 6'd2: 
			nextS = 3;
		 6'd3: 
			begin
				if(moc == 1)
					nextS = 6'd4;
				else
					nextS = 6'd3;
			end
	     6'd4:
			begin
				if(cond == 0)
					begin
						nextS = 6'd1; 
					end
				else
					decodeIR();
			end
		 6'd5:
			nextS = 6'd6; 
		 6'd8: 
			nextS = 6'd9;
		 6'd10: 
			nextS = 6'd8; 
		 6'd33: 
			begin
			if(ir[20] == 0)
				nextS = 6'd41; 
			else 
				begin
					if(ir[20]==1 && ir[22] ==0)
						nextS = 6'd34;
					else if(ir[20]==1 && ir[22] ==1)
						nextS = 6'd44; 
				end
			end
		  6'd34:
			nextS = 6'd35;
		  6'd35:
			begin
			    if(ir[20]==1 && ir[22]==0)
					nextS = 6'd36; 
				else if(ir[20]==1 && ir[22]==1)
					nextS = 6'd50; 
			end
		  6'd36:
			begin
				if(ir[24] == 1 && ir[21]==0)
				nextS = 6'd1;
			 else if(ir[24] == 0 || (ir[24] == 1 && ir[21]==1))
				begin 
					if(ir[27:25] ==LANDSIMMEDIATE)
					begin
						if(ir[23] == 1)
							nextS = 6'd38;
						else if(ir[23] == 0)
							nextS = 6'd48;
					end
					if(ir[27:25] ==LANDSREG)
					begin
						if(ir[23] == 1)
							nextS = 6'd39;
						else if(ir[23] == 0)
							nextS = 6'd49;
					end
				end
			end
		   6'd37:
		   begin
		    	if(ir[20] == 0)
				nextS = 6'd41; 
			else
				begin
					if(ir[20]==1 && ir[22] ==0)
						nextS = 6'd34;
					else if(ir[20]==1 && ir[22] ==0)
						nextS = 6'd44; 
				end
		   end
		   6'd40:
		   begin
				if(ir[20] == 0)
				nextS = 6'd41; 
			else
				begin
					if(ir[20]==1 && ir[22] ==0)
						nextS = 6'd34;
					else if(ir[20]==1 && ir[22] ==0)
						nextS = 6'd44; 
				end
		   end
		   6'd41: 
		   begin 
			if(ir[22] == 0)
				nextS = 6'd42; 
			else if(ir[22] == 1)
				nextS = 6'd45;
		   end
		   6'd42:
		   begin
			 if(ir[24] == 1 && ir[21]==0)
				nextS = 6'd1;
			else if(ir[24] == 0 || (ir[24] == 1 && ir[21]==1))
				begin 
					if(ir[27:25] ==LANDSIMMEDIATE)
					begin
						if(ir[23] == 1)
							nextS = 6'd38;
						else if(ir[23] == 0)
							nextS = 6'd48;
					end
					if(ir[27:25] ==LANDSREG)
					begin
						if(ir[23] == 1)
							nextS = 6'd39;
						else if(ir[23] == 0)
							nextS = 6'd49;
					end
				end
		   end
		   6'd44:
				nextS = 6'd35;
		   6'd45: 
		   begin
				if(ir[24] == 1 && ir[21]==0)
					nextS = 6'd1;
				else if(ir[24] == 0 || (ir[24] == 1 && ir[21]==1))
					begin 
						if(ir[27:25] ==LANDSIMMEDIATE)
						begin
							if(ir[23] == 1)
								nextS = 6'd38;
							else if(ir[23] == 0)
								nextS = 6'd48;
						end
						if(ir[27:25] ==LANDSREG)
						begin
							if(ir[23] == 1)
								nextS = 6'd39;
							else if(ir[23] == 0)
								nextS = 6'd49;
						end
					end	
			   end
		    6'd46:
			begin
				if(ir[20] == 0)
				 nextS = 6'd41;
			    else if(ir[20]==1 && ir[22] ==0)
				 nextS = 6'd34;
			    else if(ir[20]==1 && ir[22] ==1)
				 nextS = 6'd44; 
			end
			6'd47: 
			begin
				if(ir[20] == 0)
				nextS = 6'd41;
			  else if(ir[20]==1 && ir[22] ==0)
				nextS = 6'd34;
			  else if(ir[20]==1 && ir[22] ==1)
				nextS = 6'd44; 
			end
			6'd50:
			begin
			if(ir[24] == 1 && ir[21]==0)
					nextS = 6'd1;
				else if(ir[24] == 0 || (ir[24] == 1 && ir[21]==1))
					begin 
						if(ir[27:25] ==LANDSIMMEDIATE)
						begin
							if(ir[23] == 1)
								nextS = 6'd38;
							else if(ir[23] == 0)
								nextS = 6'd48;
						end
						if(ir[27:25] ==LANDSREG)
						begin
							if(ir[23] == 1)
								nextS = 6'd39;
							else if(ir[23] == 0)
								nextS = 6'd49;
						end
					end	
			end	
		endcase
	end
	task decodeIR(); 
		case(ir[27:25])
			DATAPIMMEDIATE: 
				nextS = 6'd5;
			DATAPSHIFTER:
				nextS = 6'd7; 
			BRANCH:
			begin 
				if(ir[24] == 0)
				 nextS = 6'd8;
				else if(ir[24] == 1)
				 nextS = 6'd10; 
			end
			LANDSIMMEDIATE: 
			begin 
				if(ir[23] == 1 && ir[24] != 0 )
					nextS = 6'd33;
				else if(ir[24] == 0)
					nextS = 6'd40; 
				else if(ir[23] == 0)
					nextS = 6'd46;
			end
			LANDSREG:
			begin
				if(ir[23] == 1)
					nextS = 6'd37;
				else if(ir[24] == 0)
					nextS = 6'd40; 
				else if(ir[23] ==0) 
					nextS = 6'd47;
			end
		endcase
	endtask
endmodule

module stateRegister(CLK, CLR,nextS, state);
input CLK; 
input CLR; 
input [6:0] nextS;
output reg [6:0] state; 
initial begin
	state = 6'd0; 
end
always@(posedge CLK)
	begin
		$display("here in stateRegister state = %d nextS = %d", state, nextS);
		state = nextS;	
	end
endmodule

