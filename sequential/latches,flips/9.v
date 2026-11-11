// DFF (exams/m2014_q4c) —— 同步复位 R
module top_module (
    input  clk,
    input  d,
    input  r,
    output reg q
);
    always @(posedge clk) begin
        if (r) q <= 1'b0;
        else   q <= d;
    end
endmodule
