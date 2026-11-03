module top_module( 
    input a, b, sel,
    output out ); 

assign out = sel ? b : a; // Multiplexer: if sel is 1, output b; if sel is 0, output a
endmodule
