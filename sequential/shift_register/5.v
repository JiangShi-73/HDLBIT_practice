module top_module (
    input  [2:0] SW,        // R[2:0]
    input  [1:0] KEY,       // KEY[1] = L,  KEY[0] = clk
    output [2:0] LEDR   // Q[2:0]
);
    wire clk = KEY[0];
    wire L   = KEY[1];
    reg [2:0] rLEDR;
    assign LEDR = rLEDR;
    always @(posedge clk) begin
        rLEDR[0] <= L ? SW[0] : LEDR[2];
        rLEDR[1] <= L ? SW[1] : LEDR[0];
        rLEDR[2] <= L ? SW[2] : (LEDR[1] ^ LEDR[2]);
    end
endmodule

