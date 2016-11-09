module stateRegister(nextState,currentState);
output reg  [6:0] currentState;
input [6:0] nextState;
always @(nextState)
	begin
		currentState = nextState;
	end
endmodule
