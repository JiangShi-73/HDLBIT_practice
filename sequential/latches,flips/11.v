// Mux and DFF (mt2015_muxdff) —— 一级：二选一 + DFF
// L=1 装载 r_in，L=0 保持/移位 q_in
module top_module (
    input  clk,
    input  L,
    input  r_in,
    input  q_in,
    output reg Q
);
    always @(posedge clk) begin
        if (L) Q <= r_in;
        else   Q <= q_in;
    end
endmodule
