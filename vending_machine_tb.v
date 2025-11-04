`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2025 20:50:22
// Design Name: 
// Module Name: vending_machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vending_machine_tb;

    // Inputs
    reg clk;
    reg [1:0] in;
    reg rst;

    // Outputs
    wire out;
    wire [1:0] change;

    // Instantiate the Unit Under Test (UUT)
    vending_machine uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out),
        .change(change)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        in = 0;

        // Reset pulse
        #10 rst = 0;

        // Apply test inputs
        #10 in = 2;
        #20 in = 2;
        #30 in = 1;
        #20 in = 0;

        // Finish simulation
        #50 $stop;    // use $stop instead of $finish in Vivado
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule

