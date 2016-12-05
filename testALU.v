//Testing ALU

module  ALUtest;
	
	reg [31:0] A, B;
	reg [4:0] opcode;
	reg carry;

	//outputs
	wire [31:0] result;
	wire FlagN, FlagZ, FlagC, FlagV;

	reg[8*3:1] instruction;

	ALU MyALU (result, FlagN, FlagZ, FlagC, FlagV, A, B, opcode, carry);

	initial # 1000 $finish;

		initial begin

		//AND Logical 
		A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00000; instruction = "AndL";

		// XOR Logical 
		#10 A = 32'hF0000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00001; instruction = "Xor";

		//Substract
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b1; opcode = 5'b00010; instruction = "Sbs";
			
		//Reverse Sub
		#10 A = 32'hF0000000; B = 32'h0000FFFF; carry = 1'b1; opcode = 5'b00011; instruction = "RSbs";

		//Add
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00100; instruction = "Add";

		//Add Carry
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00101; instruction = "AddC";

		//Subtract Carry
		#10 A = 32'h00000001; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00110; instruction = "SbsC";

		//Reverse Sub Carry
		#10 A = 32'h00000001; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b00111; instruction = "RSbC";

		//Test
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01000; instruction = "Tst";

		//Test Equivalence
		#10 A = 32'h0000000F; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01001; instruction = "TsEq";

		//Compare
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01010; instruction = "Cmp";

		//Compare Negate
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01011; instruction = "CmpN";

		//OR Logical
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01100; instruction = "OrL";

		//Move
		#10 A = 32'h00000000; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01101; instruction = "Mov";

		//Bit Clear
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01110; instruction = "BitC";

		//Move Not
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b01111; instruction = "MovN";

		//A
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b10000; instruction = "A";

		//A + 4
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b10001; instruction = "A4";

		//A + B + 4
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b10010; instruction = "A+B4";

		//B
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b10011; instruction = "B";

		//A - B + 4
		#10 A = 32'h0000FF00; B = 32'h0000FFFF; carry = 1'b0; opcode = 5'b10100; instruction = "A-B4";


		end

		initial begin
			$display ("Test 		A 			B 		      carry  	opcode(instruction)	 flags(ZNCV)	result");
			$monitor ("%0d		%h 		%h 		%d 		%b(%s) 		%b%b%b%b 	%h", $time, A, B, carry , opcode, instruction, FlagZ, FlagN, FlagC, FlagV, result);
		end

	endmodule