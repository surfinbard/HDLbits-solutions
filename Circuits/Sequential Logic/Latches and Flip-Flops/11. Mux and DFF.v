module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    wire d;

    always @(posedge clk) begin
        if (L)
            d = r_in;
        else 
            d = q_in;
        Q = d;
    end

endmodule
