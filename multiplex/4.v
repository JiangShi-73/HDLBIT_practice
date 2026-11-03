module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
assign out = in[sel]; // Multiplexer: output the bit of 'in' selected by 'sel'
endmodule
