`timescale 1ns/1ps

module tb_segment_scan8;

reg clk=0, rst=1;
integer checks=0;

always #5 clk=~clk;

task step;
begin
    @(posedge clk);
    #1;
end
endtask

task check(
    input condition,
    input [8*100-1:0] description
);
begin
    checks=checks+1;
    if (condition !== 1'b1) begin
        $display("LAB2_FAIL %0s time=%0t", description, $time);
        $fatal(1, "check failed");
    end
end
endtask

task finish;
begin
    $display("LAB2_PASS segment_scan8 checks=%0d", checks);
    $finish;
end
endtask

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_segment_scan8);
end

initial begin
    #100000;
    $fatal(1, "Watchdog timeout");
end

reg enable=0;
reg [31:0] digits=32'h76543210;

wire [7:0] select, segments;
wire [2:0] index;

segment_scan8 dut(
    clk, rst, enable, digits, select, segments, index
);

reg [7:0] expected[0:15];
integer bank, position, lap;

initial begin

    // Truth-table values, ordered 0..F with abcdefg and dp.
    expected[0]=8'hfc;
    expected[1]=8'h60;
    expected[2]=8'hda;
    expected[3]=8'hf2;

    expected[4]=8'h66;
    expected[5]=8'hb6;
    expected[6]=8'hbe;
    expected[7]=8'he0;

    expected[8]=8'hfe;
    expected[9]=8'hf6;
    expected[10]=8'hee;
    expected[11]=8'h3e;

    expected[12]=8'h9c;
    expected[13]=8'h7a;
    expected[14]=8'h9e;
    expected[15]=8'h8e;

    step;
    check(select===0 && index===0, "reset blanks digit zero");
    rst=0;

    for(bank=0; bank<2; bank=bank+1) begin

        digits = bank ? 32'hfedcba98 : 32'h76543210;

        for(lap=0; lap<2; lap=lap+1) begin

            for(position=0; position<8; position=position+1) begin

                enable=1;
                step;

                check(index===position, "position order");

                check(
                    select===(1<<position),
                    "exactly intended digit active"
                );

                check(
                    segments===expected[bank*8+position],
                    "hex truth table"
                );

                enable=0;
                step;

                check(
                    select===(1<<position),
                    "enable zero holds active slot"
                );

                enable=1;
                step;

                check(
                    select===0,
                    "blank interval between every digit"
                );

                enable=0;
                step;

                check(
                    select===0,
                    "blank interval hold"
                );
            end
        end
    end

    enable=1;
    step;

    rst=1;
    step;

    check(
        select===0 && index===0,
        "reset from active scan"
    );

    finish;
end

endmodule
