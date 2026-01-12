module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);

    wire w0, D;

    always @(posedge clk) begin
        if (E)
            w0 = w;
        else 
            w0 = Q;
        if (L)
            D = R;
        else
            D = w0;
        Q = D;
    end

endmodule

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    
    wire w0, w1, w2;
    assign {w2, w1, w0} = {LEDR[3:1]};

	MUXDFF mux_dff3 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));
    MUXDFF mux_dff2 (.clk(KEY[0]), .w(w2), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
    MUXDFF mux_dff1 (.clk(KEY[0]), .w(w1), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    MUXDFF mux_dff0 (.clk(KEY[0]), .w(w0), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));

endmodule
