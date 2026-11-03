module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
assign out = sel ? b : a; // Multiplexer: if sel is 1, output b; if sel is 0, output a
endmodule
