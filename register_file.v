module binary_decoder (output reg ld0, ld1,ld2,ld3,ld4,ld5,ld6,ld7,ld8,ld9,ld10,ld11,ld12,ld13,ld14,ld15, input [3:0] D, input ld);
	always @(ld, D) 
	begin
		ld0 = 0; ld1 = 0; ld2 = 0; ld3 = 0; ld4 = 0;
		ld5 = 0; ld6 = 0; ld7 = 0; ld8 = 0; ld9 = 0;
		ld10 = 0; ld11 = 0; ld12 = 0; ld13 = 0; ld14 = 0; ld15 = 0;
		if(ld) begin
			case(D)
				0: ld0 = 1;
				1: ld1 = 1;
				2: ld2 = 1;
				3: ld3 = 1;
				4: ld4 = 1;
				5: ld5 = 1;
				6: ld6 = 1;
				7: ld7 = 1;
				8: ld8 = 1;
				9: ld9 = 1;
				10: ld10 = 1;
				11: ld11 = 1;
				12: ld12 = 1;
				13: ld13 = 1;
				14: ld14 = 1;
				15: ld15 = 1;
			endcase
		end		
	end
endmodule
//initialize  var  variable zero if zero 1 q = 0 ;
module register (output reg [31:0] Q, input [31:0] D, input clk, input ld, input reset);
	always @ (posedge clk, reset)
		if(reset) begin
			Q = 32'd0;
		end
		else if(ld) begin
			Q = D;
		end
endmodule

module Mux_16_1 (output reg [31:0] Y, input [3:0] S, input [31:0] r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out);
	always @ (S, r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out) begin
		$display("Register input value: %d", S);
		case (S)
			0: Y = r0_out;
			1: Y = r1_out;
			2: Y = r2_out;
			3: Y = r3_out;
			4: Y = r4_out;
			5: Y = r5_out;
			6: Y = r6_out;
			7: Y = r7_out;
			8: Y = r8_out;
			9: Y = r9_out;
			10: Y = r10_out;
			11: Y = r11_out;
			12: Y = r12_out;
			13: Y = r13_out;
			14: Y = r14_out;
			15: Y = r15_out;
		endcase
	end
endmodule

// module register_file_test;

// 	reg clk, ld;
// 	reg [31:0] input_data;
// 	reg [3:0] d_select;
// 	reg [3:0] m1_select;
// 	reg [3:0] m2_select;
// 	wire w0 [0:15];
// 	wire [31:0] w1 [0:15];
// 	wire [31:0] w2;
// 	wire [31:0] w3;
// 	integer index;
// 	integer first_time_flag;
// 	binary_decoder d (w0, d_select, ld);
// 	generate
// 	genvar i; 
// 	for (i = 0; i < 16; i = i + 1) begin
// 	    register r (w1[i], input_data, clk, w0[i]);
// 	end endgenerate
// 	// register r [15:0](w1, input_data, clk, w0[0]);
// 	Mux_16_1 mux1 (w2, m1_select, w1);

// 	Mux_16_1 mux2 (w3, m2_select, w1);
// 	initial #500 $finish;

// // Test Mux outputs
// 	initial begin
// 		input_data = 32'd0;
// 		d_select = 'b0000;
// 		clk = 1'b0;
// 		ld = 1'b1;
// 		index = 0;
// 		first_time_flag = 1;
// 		// #1 clk = ~clk;
// 		repeat (31) begin
// 			#1 clk = ~clk;
// 			if(!clk) begin
// 				// input_data = input_data + 1;
// 				d_select = d_select + 1;
// 			end
// 		end
// 		//$display("\nDisplaying values stored in Registers");

// 		repeat(16) begin
// 			//$display("Value stored in Register%0d is: %h\n", index, w1[index]);
// 			index = index + 1;
// 		end	
// 		//$display("-----------------------------------------------------------------------------------------------");
// 		m1_select = 'b0000;
// 		m2_select = 'b1111;
// 		repeat (30) begin
// 			#1 clk = ~clk;
// 			if(!clk) begin
// 				m1_select = m1_select + 1;
// 				m2_select = m2_select - 1;
// 			end
// 		end
// 		//$display("-----------------------------------------------------------------------------------------------");
// 	end
// 	// initial $monitor("|   mux1 sel = %b   |   mux1 out = %h   | mux2 sel = %b   |   mux2 out = %h   |", m1_select, w2, m2_select,w3);
// endmodule