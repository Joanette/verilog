// output reg [31:0] shifter_out, output reg cout, input [31:0] shifter_in, input [5:0] shift_value, input [2:0] type, input cin, input E
module shifter_extender(output reg [31:0] shifter_out, input [31:0] shifter_in, input [5:0] shift_value, input [2:0] t, input E);
	reg [63:0] tmp;
	reg newShiftValue;
	always @(shifter_in, shift_value)
	begin
		if (E == 0) begin
		// If E == 0, shift shifter_in.
			case(t)
				0: shifter_out = shifter_in << shift_value;
				1: shifter_out = shifter_in >> shift_value;
				2: shifter_out = shifter_in >>> shift_value;
				3: begin
					tmp = {shifter_in, shifter_in} >> shift_value;
					shifter_out = tmp[31:0];
 				end
				4: begin
					newShiftValue = shift_value * 2 ;
					tmp = {shifter_in, shifter_in} >> newShiftValue;
					shifter_out = tmp[31:0];
					$display("Entered 2 time rotate right");
				end
				5: shifter_out = shifter_in << 2;
			endcase
		end
		else if (E == 1) begin
			$display("T value = %h", t);
			case(t)
				0: begin
					if (shifter_in[7] == 1) begin
						shifter_out = {24'b111111111111111111111111, shifter_in[7:0]};
					end
					else begin
						shifter_out = {24'b000000000000000000000000, shifter_in[7:0]};
					end
				end
				1: shifter_out = {24'b000000000000000000000000, shifter_in[7:0]};
				2: begin
					if (shifter_in[15] == 1) begin
						shifter_out = {16'b1111111111111111, shifter_in[15:0]};
					end
					else begin
						shifter_out = {16'b0000000000000000, shifter_in[15:0]};
					end
				end
				3: shifter_out = {16'b0000000000000000, shifter_in[15:0]}; 
				4: begin
					if (shifter_in[23] == 1) begin
						shifter_out = {8'b11111111, shifter_in[23:0]}; // For B&L
					end
					else begin
						shifter_out = {8'b00000000, shifter_in[23:0]}; // For B&L
					end					
				end
				5: shifter_out = {20'b00000000000000000000, shifter_in[11:0]};
			endcase
		end
	end
endmodule