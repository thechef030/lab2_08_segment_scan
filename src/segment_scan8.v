`timescale 1ns/1ps

// Logical outputs are active-high. Apply board polarity in the wrapper.
// Each slot contains one active interval followed by one blank interval.
module segment_scan8 (
    input wire clk, rst, enable,
    input wire [31:0] digits,
    output reg [7:0] select,
    output reg [7:0] segments,
    output reg [2:0] index
);

    reg blank;
    reg [3:0] nibble;

    always @(posedge clk) begin
        if (rst) begin
            index <= 0;
            blank <= 1'b1;
        end else if (enable) begin
            blank <= ~blank;
            if (!blank) index <= index + 1'b1;
        end
    end

    always @* begin
        nibble = digits >> (index * 4);
        select = blank ? 8'h00 : (8'h01 << index);

        // abcdefg, dp; decimal point remains off.
        case (nibble)
            4'h0: segments = 8'b11111100;
            4'h1: segments = 8'b01100000;
            4'h2: segments = 8'b11011010;
            4'h3: segments = 8'b11110010;
            4'h4: segments = 8'b01100110;
            4'h5: segments = 8'b10110110;
            4'h6: segments = 8'b10111110;
            4'h7: segments = 8'b11100000;
            4'h8: segments = 8'b11111110;
            4'h9: segments = 8'b11110110;
            4'ha: segments = 8'b11101110;
            4'hb: segments = 8'b00111110;
            4'hc: segments = 8'b10011100;
            4'hd: segments = 8'b01111010;
            4'he: segments = 8'b10011110;
            4'hf: segments = 8'b10001110;
            default: segments = 8'h00;
        endcase
    end

endmodule
