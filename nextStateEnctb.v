`timescale 1ns / 100ps 
module nextStateEnctb;
	wire [6:0]nextS;
	reg  cond, moc; 
	reg  [32:0]ir;
	reg [6:0] state;
nextStateEnc nse(cond,moc,state,ir,nextS);	
	initial begin 
		#5 state = 6'd4; ir = 32'b11100010000000010000000000000000;cond=1'b1; moc=1'b1;
		
	end
	initial 
	$monitor($time, "Current State = %d, Next State = %d", state, nextS); 
endmodule