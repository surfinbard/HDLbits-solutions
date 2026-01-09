module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    wire [63:0] tmp;

    always @(posedge clk) begin
        if (load)
            q = data;
        else begin
            if (ena) begin
                case (amount)
                    2'b00: 
                        q = q << 1;
                    2'b01:
                        q = q << 8;
                    2'b10: begin
                        tmp = q >> 1;
                        q = {q[63], tmp[62:0]};
                    end
                    2'b11: begin
                        tmp = q >> 8;
                        q = {{8{q[63]}}, tmp[55:0]};                        
                    end
                endcase
            end
        end
    end

endmodule
