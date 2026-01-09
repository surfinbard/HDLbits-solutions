module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always @(posedge clk) begin
        if (reset)
            {hh, mm, ss, pm} = {8'b00010010, 17'd0};
        else begin
            if (ena) begin
                // am -> pm & vice-versa
                if ({hh, mm, ss} == {8'b00010001, 8'b01011001, 8'b01011001}) begin
                    {hh, mm, ss} = {8'b00010010, 16'b0};
                    pm = ~pm;
                end 
                else begin
                    if ({hh, mm, ss} == {8'b00010010, 8'b01011001, 8'b01011001})
                        {hh, mm, ss} = {8'b1, 16'b0};
                    else begin
                        // hour rollover
                            if ({mm, ss} == {8'b01011001, 8'b01011001}) begin
                                {mm, ss} = {16'b0};
                                // updating hour digits
                                if (hh[3:0] == 4'b1001) 
                                    hh = {hh[7:4] + 1'b1, 4'b0};
                                else
                                    hh[3:0] = hh[3:0] + 1'b1;
                            end
                            else begin
                                // minute rollover
                                if (ss == 8'b01011001) begin
                                    ss = 8'b0;
                                    // updating minute digits
                                    if (mm[3:0] == 4'b1001)
                                        mm = {mm[7:4] + 1'b1, 4'b0};
                                    else 
                                        mm[3:0] = mm[3:0] + 1'b1;
                                end
                                else
                                    // updating second digits
                                    if (ss[3:0] == 4'b1001)
                                        ss = {ss[7:4] + 1'b1, 4'b0};
                                    else 
                                        ss[3:0] = ss[3:0] + 1'b1;
                            end 
                    end
                end
            end
        end
    end

endmodule