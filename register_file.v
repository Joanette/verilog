module binary_decoder (output reg Y [0:15], input [3:0] D, input ld);
	integer result = 1;
	integer i;
	always @(ld, D) 
	begin
		for(i = 0; i < 16; i = i +1) begin
			Y[i] = 0;
		end
		if(ld) begin
			Y[D] = 1;
		end
	end
endmodule
//initialize  var  variable zero if zero 1 q = 0 ;
module register (output reg [31:0] Q, input [31:0] D, input clk, input ld, input reset);
	always @ (clk, reset)
		if(reset) begin
			Q = 32'd0;
		end
		else if(ld && clk) begin
			Q = D;
			$display("Data inputted to register= %d",D);
			$display("Data stored to register= %d",Q);
		end
		else if(clk) begin
			Q = Q;
		end	
endmodule

module Mux_16_1 (output reg [31:0] Y, input [3:0] S, input [31:0] data[0:15]);
	always @ (S) begin
		Y = data[S];
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