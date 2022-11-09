/*
    auther : yqiu
    date   : 2022-11-8

    32bits counter
*/
module counter_32bits (
    
    input  wire clk,
    input  wire en,
    input  wire p_reset,
    
    output wire [31:0] cnt_out
    
);

/* key parameter define */
wire [31:0] preload_val;
reg  [31:0] cnt;

/* main always */
assign preload_val = cnt;
assign cnt_out = preload_val;
 
always @ (posedge clk, negedge p_reset, negedge en) begin

    if(p_reset) begin
        cnt <= 32'h00000000;
    end
    else begin
        if(~en) begin
            cnt <= cnt + 1; 
        end
    end
end


endmodule