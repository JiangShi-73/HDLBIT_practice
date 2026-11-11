// K-map implemented with a multiplexer (exams/ece241_2014_q3)
// 用 a,b 当 4 选 1 的选择端，mux_in[i] = f(ab=i, c, d)
//   ab=00 -> c|d
//   ab=01 -> 0
//   ab=11 -> c&d
//   ab=10 -> ~d
module top_module (
    input  c,
    input  d,
    output [3:0] mux_in
);
    assign mux_in[0] = c | d;     // ab=00
    assign mux_in[1] = 1'b0;      // ab=01
    assign mux_in[2] = c & d;     // ab=11
    assign mux_in[3] = ~d;        // ab=10
endmodule
