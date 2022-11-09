/*
    auther : yqiu
    date   : 2022-11-8

    test bench for 32bits counter 
*/

`timescale 1ns / 1ns

module counter_test();

    reg clk_in;
    wire enable;
    wire reset_positive;

    wire [31:0] cnt_output;

    counter_32bits cnt1 (
    
        .clk(clk_in),
        .en(enable),
        .p_reset(reset_positive),

        .cnt_out(cnt_output)
    );

`ifdef FSDB
initial begin
        $fsdbDumpfile("counter_32bits.fsdb");
        $fsdbDumpvars(0,cnt1);

        /* start VCS simulation */
        $fsdbDumpon();
        #10000000;
        $fsdbDumpoff();

        /* finish VCS simulation */
        $finish;
end
`endif


    assign reset_positive = 1'b0;
    assign enable = 1'b0;
    parameter clk_period = 10;
    initial begin

            clk_in = 1'b0;
            #(clk_period/2) clk_in = ~clk_in;
            forever
                #(clk_period/2) clk_in = ~clk_in;
    end


    initial begin

            #2000;
            #100 force reset_positive = 1'b1;
            #100 force reset_positive = 1'b0;
    end


endmodule