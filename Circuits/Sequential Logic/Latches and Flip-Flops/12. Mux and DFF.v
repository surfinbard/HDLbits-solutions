 module top_module (
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
