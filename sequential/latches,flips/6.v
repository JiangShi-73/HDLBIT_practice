// DFF with byte enable (dff16e)
// byteena[0] 控制低字节 d[7:0]，byteena[1] 控制高字节 d[15:8]
// resetn 是同步、低有效
module top_module (
    input         clk,
    input         resetn,
    input  [1:0]  byteena,
    input  [15:0] d,
    output reg [15:0] q
);
    always @(posedge clk) begin
        if (!resetn)
            q <= 16'd0;
        else begin
            if (byteena[0]) q[7:0]  <= d[7:0];
            if (byteena[1]) q[15:8] <= d[15:8];
        end
    end
endmodule
