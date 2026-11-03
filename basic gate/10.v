module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
assign ringer = ring & ~vibrate_mode; // Make sound when ring is high and vibrate_mode is low
assign motor = ring & vibrate_mode;    // Vibrate when ring is high and vibr
endmodule
