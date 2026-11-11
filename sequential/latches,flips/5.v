// DFF with asynchronous reset (dff8ar)
// 和同步复位的唯一区别：areset 出现在敏感列表里
module top_module (
    input        clk,
    input        areset,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk or posedge areset) begin
        if (areset) q <= 8'd0;
        else        q <= d;
    end
endmodule
