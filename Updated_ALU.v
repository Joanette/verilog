// Arithmetic Logic Unit
//September 30, 2016. Bryan Vazquez

module ALU(output reg [31:0] result, output reg FlagZ, FlagN, FlagC, FlagV, input [31:0] A, B, input [4:0] opcode, input carry);

reg signed [31:0] sA;
reg signed [31:0] sB;

always @(A, B, carry, opcode)
	 begin
	 	sA = A;
		sB = B;
		case (opcode)
			5'b00000:	//AND Logical 
				begin
					result = A & B;
					FlagC = carry;
				end
				
			5'b00001:	// XOR Logical  
				begin
					result = A ^ B;
					FlagC = carry;
				end
			5'b00010:	//Substract
				begin
					{FlagC, result} = A - B;
					//FlagC = ~FlagC;// C = NOT borrow (A-B)
					//Check for Overflow
					check_overflow_sub();
				end
			5'b00011:	//Reverse Sub
				begin
					{FlagC, result} = B - A;
					//FlagC = ~FlagC;// C = NOT borrow (A-B)
					//Check for Overflow
					check_overflow_sub();
				end
			5'b00100:	//Add
				begin
					{FlagC, result} = A + B;
					//Check for Overflow
					check_overflow_add();
				end
			5'b00101:	//Add Carry
				begin
					{FlagC, result} = A + B + carry;
					//Check for Overflow
					check_overflow_add();
				end
			5'b00110:	//Subtract Carry
				begin
					{FlagC, result} = A - B + (~carry);
					FlagC = ~FlagC;
					//Check for Overflow
					check_overflow_sub();
				end
			5'b00111:	//Reverse Sub Carry
				begin
					{FlagC, result} = B - A + (~carry);
					FlagC = ~FlagC;
					//Check for Overflow
					check_overflow_sub();
				end
			5'b01000:	//Test
				begin
					{FlagZ, FlagN} =  A & B;
				end
			5'b01001:	//Test Equivalence
				begin
					{FlagZ, FlagN} =  A ^ B;
				end
			5'b01010:	//Compare
				begin
					{FlagZ, FlagN} =  A - B;
				end
			5'b01011:	//Compare Negate
				begin
					{FlagZ, FlagN} =  A + B;
				end
			5'b01100:	//OR Logical
				begin
					result = A | B;
					FlagC = carry;
				end
			5'b01101:	//Move
				begin
					result = B;
				end
			5'b01110:	//Bit Clear
				begin
					result = A & !B;
				end
			5'b01111:	//Move Not
				begin
					result = !B;
				end
			5'b10000:	//A
				begin
					result = A;
				end
			5'b10001:	//A + 4
				begin
					result = A + 4;
				end
			5'b10010:	//A + B + 4
				begin
					result = A + B + 4;
				end
			5'b10011:	//B
				begin
					result = B;
					//$display("B result: ", result);
				end
			5'b10100:	//A - B + 4
				begin
					result = A - B + 4;
				end
		endcase
		//Update Flags
		FlagN = result[31];
		if(result == 0)	FlagZ =1;
		else FlagZ = 0;			
	end


//Declare functions

task check_overflow_add;
begin
	if((A[31] == 0 && B[31] == 0 && result[31] == 1) || (A[31] == 1 && B[31] == 1 && result[31] == 0))
		FlagV = 1;
	else 
		FlagV = 0;
	
end
endtask

task check_overflow_sub;
begin
	if((A[31] == 0 && B[31] == 1 && result[31] == 1) || (A[31] == 1 && B[31] == 0 && result[31] == 0))
		FlagV = 1;
	else 
		FlagV = 0;
end
endtask

endmodule