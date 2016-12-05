module adder(output reg r, input [3:0] px, input [3:0] mc);
    always @(px, mc)
        r = px + mc;
endmodule