// DFF with reset (dff8r) —— 同步复位
module top_module (
    input        clk,
    input        reset,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk) begin
        if (reset) q <= 8'd0;
        else       q <= d;
    end
endmodule
