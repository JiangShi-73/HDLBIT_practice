module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q,
    input areset           // Synchronous reset
);

always @(posedge clk ||  posedge areset) begin
    if (areset) begin
        q <= 0;
    end else begin
        q <= d;
    end
end
endmodule
