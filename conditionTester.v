module cond_tester(output reg cond, input [3:0] cc, input [3:0] flag);
reg n = flag[3];
reg z = flag[2];
reg c = flag[1];
reg v = flag[0];
always @(cc, flag)
begin
  case (code) begin
    0 : cond = z;
    1 : cond = ~z;
    2 : cond = c;
    3 : cond = ~c;
    4 : cond = n;
    5 : cond = ~n;
    6 : cond = v;
    7 : cond = ~v;
    8 : cond = (c == 1 && z == 0) ? 1 : 0;
    9 : cond = (c == 0 || z == 1) ? 1 : 0;
    10: cond = (n == v) ? 1 : 0;
    11: cond = (n != v) ? 1 : 0;
    12: cond = (z == 0 && n == v) ? 1 : 0;
    13: cond = (z == 1 || n != v) ? 1 : 0;
    14: cond = 1;
  endcase
end

endmodule