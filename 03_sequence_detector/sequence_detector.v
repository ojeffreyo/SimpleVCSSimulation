/*
    auther : yqiu
    date   : 2022-11-11

    4-bits width sequence
*/

module sequence_detector(

    input wire clk,
    input wire reset,
    input wire seq,

    output wire set

);

/* state machine parameter defines */
parameter HIGH = 1'b1;
parameter LOW = 1'b0;

parameter STATE0 = 4'b0000;
parameter STATE1 = 4'b0001;
parameter STATE2 = 4'b0001;
parameter STATE3 = 4'b0101;
parameter STATE4 = 4'b1101;

reg state_flag;

/* state machine state defines */
reg [3:0] current_state;
reg [3:0] next_state;
reg seq_flag;

/* current state reset */
always @(posedge clk, posedge reset) begin
    
    if(reset == 1'b1) begin
        current_state <= 4'b0000; 
    end
    else if(reset == 1'b0) begin
        current_state <= next_state;
    end
end

/* next state switch */
always @(posedge clk, posedge reset) begin
    
    if(reset == 1'b1) begin
        next_state <= 4'b0000;
        state_flag <= 1'b0;
    end
    else if(reset == 1'b0) begin
        
        /* state machine switch state logic */
        case(seq)

            HIGH : 
                    if(current_state == STATE0)
                        next_state <= STATE1;
                    else if(current_state == STATE1 && state_flag == 1'b0)
                        next_state <= STATE1;
                        state_flag <= 1'b0;
                    else if(current_state == STATE2 && state_flag == 1'b1)
                        next_state <= STATE3;
                        state_flag <= 1'b0;
                    else if(current_state == STATE3)
                        next_state <= STATE4;
                    else if(current_state == STATE4)
                        next_state <= STATE1;
                    end  
            LOW :   
                    if(current_state == STATE0)
                        next_state <= STATE0;
                    else if(current_state == STATE1 && state_flag == 1'b0)
                        next_state <= STATE2;
                        state_flag <= 1'b1;
                    else if(current_state == STATE2 && state_flag == 1'b1)
                        next_state <= STATE0;
                        state_flag <= 1'b0;
                    else if(current_state == STATE3)
                        next_state <= STATE2;
                        state_flag <= 1'b1;
                    else if(current_state == STATE4)
                        next_state <= STATE0;
                    end

            default : next_state = STATE0;

        endcase
    
    end
end

/* output set_flag signal */
assign set = seq_flag;
always @(posedge clk) begin
    if(current_state == STATE4)
        seq_flag <= 1'b1;
    else
        seq_flag <= 1'b0;
    end
end

endmodule