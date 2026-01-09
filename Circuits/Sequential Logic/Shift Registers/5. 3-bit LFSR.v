module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire w0, w1, w2;
    assign LEDR = {w2, w1, w0};

    always @(posedge KEY[0]) begin
        if (KEY[1]) begin
            {w2, w1, w0} = SW;
        end
        else begin
            {w2, w1, w0} = {LEDR[1] ^ LEDR[2], LEDR[0], LEDR[2]};
        end
    end

endmodule
