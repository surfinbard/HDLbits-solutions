module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    wire [99:0] tmp;

    always @(posedge clk) begin
        if (load)
            q = data;
        else begin
            if (ena == 2'b01) begin
                tmp = q >> 1;
                q = {q[0], tmp[98:0]};
            end
            if (ena == 2'b10) begin
                tmp = q << 1;
                q = {tmp[99:1], q[99]};                            
            end

        end 
    end

endmodule
