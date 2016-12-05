module adder(output reg [3:0] R, input [3:0] A, input [3:0] B);
    always @(A, B)
        R = A + B;
endmodule