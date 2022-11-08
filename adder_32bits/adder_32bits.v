/*
    auther : yqiu
    date   : 2022-11-3

    1-bit full-adder
*/
module adder_32bits (

    input  clk,
    input  p_reset,

    input   Ai,
    input   Bi,
    input   Ci,
    
    output reg [0:0] f,
    output reg [0:0] co
);


wire pre_co;
wire pre_add;
assign {pre_co, pre_add} = Ai + Bi + Ci;

always @ (posedge clk, negedge p_reset) begin
    
    if(p_reset) begin
        co <= 1'b0;
    end
    else begin
        co <= pre_co;
    end

end

always @ (posedge clk, negedge p_reset) begin
    
    if(p_reset) begin
        f  <= 1'b0;
    end
    else begin
        f  <= pre_add;
    end
end


endmodule