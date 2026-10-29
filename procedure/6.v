// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
    casez (in)
        4'b???1: pos = 2'd0;   // bit0 是 1，直接取 0
        4'b??10: pos = 2'd1;   // bit0=0 且 bit1=1
        4'b?100: pos = 2'd2;
        4'b1000: pos = 2'd3;
        default: pos = 2'd0;   // 只剩 4'b0000
    endcase
end
endmodule
