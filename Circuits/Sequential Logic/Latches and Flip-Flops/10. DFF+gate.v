module top_module (
    input clk,
    input in, 
    output out);

    wire d, q;

    always @(posedge clk) begin
        d = in ^ q;
        q = d;
        out = q; 
    end

endmodule
