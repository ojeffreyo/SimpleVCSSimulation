/*
    auther : yqiu
    date   : 2022-11-4

    test bench for 32bits-adder
*/

`timescale 1ns / 1ns

module adder_test();

    reg clk_in;
    reg reset_postive;

    reg A;
    reg B;
    reg C;

    wire f_out;
    wire co_out;

    /* defparam for 32bits-adder*/
    adder_32bits adder1(
    
    .clk(clk_in),
    .p_reset(reset_positive),

    .Ai(A),
    .Bi(B),
    .Ci(C),

    .f(f_out),
    .co(co_out)

    );

`ifdef FSDB
initial 
    begin
         $fsdbDumpfile("adder_32bits.fsdb");
         $fsdbDumpvars(0, adder1);
         $fsdbDumpon();
    end
`endif


    assign reset_positive = 1'b0;
initial
    begin

        #10 A = 1'b0; B = 1'b0; C = 1'b0;
        #10 A = 1'b1; B = 1'b0; C = 1'b0;
        #10 A = 1'b0; B = 1'b1; C = 1'b0;
        #10 A = 1'b1; B = 1'b1; C = 1'b0; 
        #10 A = 1'b0; B = 1'b0; C = 1'b1;
        #10 A = 1'b1; B = 1'b0; C = 1'b1;
        #10 A = 1'b0; B = 1'b1; C = 1'b1;
        #10 A = 1'b1; B = 1'b1; C = 1'b1;

        #20 $finish;
    end

parameter clk_period = 10;  
initial begin  
    clk_in = 0;  
    forever  
        #(clk_period/2) clk_in = ~clk_in;  
end

endmodule