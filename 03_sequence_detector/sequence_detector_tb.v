module sequence_tb();

    reg clk_in; 
    wire reset;
    wire seq_input;

    sequence_detector seq1(
        
        .clk(clk_in),
        .reset(),
        .seq(),
        .set()
    );