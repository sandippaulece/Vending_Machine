module vending_machine(
    input clk,
    input rst,
    input [1:0] in,       // 01 = 5 rs, 10 = 10 rs
    output reg out,
    output reg [1:0] change
);

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] c_state, n_state;

    always @(posedge clk) begin
        if (rst == 1) begin
            c_state = 0;
            n_state = 0;
            change = 2'b00;
        end 
        else begin
            c_state = n_state;
            case (c_state)
                // State 0 : ₹0
                s0: begin
                    if (in == 0) begin
                        n_state = s0;
                        out = 0;
                        change = 2'b00;
                    end 
                    else if (in == 2'b01) begin
                        n_state = s1;
                        out = 0;
                        change = 2'b00;
                    end 
                    else if (in == 2'b10) begin
                        n_state = s2;
                        out = 0;
                        change = 2'b00;
                    end
                end

                // State 1 : ₹5
                s1: begin
                    if (in == 0) begin
                        n_state = s0;
                        out = 0;
                        change = 2'b01;   // change returned ₹5
                    end 
                    else if (in == 2'b01) begin
                        n_state = s2;
                        out = 0;
                        change = 2'b00;
                    end 
                    else if (in == 2'b10) begin
                        n_state = s0;
                        out = 1;
                        change = 2'b00;
                    end
                end

                // State 2 : ₹10
                s2: begin
                    if (in == 0) begin
                        n_state = s0;
                        out = 0;
                        change = 2'b10;   // return ₹10
                    end 
                    else if (in == 2'b01) begin
                        n_state = s0;
                        out = 1;
                        change = 2'b00;
                    end 
                    else if (in == 2'b10) begin
                        n_state = s0;
                        out = 1;
                        change = 2'b01;   // return ₹5 as change
                    end
                end
            endcase
        end
    end

endmodule
