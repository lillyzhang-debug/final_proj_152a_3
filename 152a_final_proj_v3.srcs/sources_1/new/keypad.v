module keypad(
    input clk,
    input  wire [3:0] row,   // JB[7:4]
    output wire       col4,  // JB[3]
    output wire       btnA_raw,
    output wire       btnB_raw,
    output wire       btnC_raw,
    output wire       btnD_raw
);

always @(posedge clk) begin
    col4 <= 1'b0;  // col4 = A/B/C/D
    
    btnA_raw <= (row == 4'b1110);  // A
    btnB_raw <= (row == 4'b1101);  // B
    btnC_raw <= (row == 4'b1011);  // C
    btnD_raw <= (row == 4'b0111);  // D
end
endmodule
