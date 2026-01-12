module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg d0, d1, d2;

    always @(posedge clk) begin
        if (~resetn) 
            {out, d0, d1, d2} = 4'b0;
        else
            {out, d0, d1, d2} = {d0, d1, d2, in};
    end

endmodule
