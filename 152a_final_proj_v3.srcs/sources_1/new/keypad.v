module keypad(
    input clk,
    input  wire [3:0] row,   // JB[7:4]
    output reg      col4,    // JB[3]
    output reg      btnA_raw,
    output reg      btnB_raw,
    output reg      btnC_raw,
    output reg      btnD_raw
);

always @(posedge clk) begin
    // 1. Drive Column 4 LOW continuously to activate it
    col4 <= 1'b0;  
    
    // 2. Read Rows (Active Low)
    // We use the tilde (~) to flip 0 to 1.
    // We check individual bits so it works even if multiple buttons are pressed.
    
    btnA_raw <= ~row[3]; // Row 0 (JB7)  -> Button A
    btnB_raw <= ~row[2]; // Row 1 (JB8)  -> Button B
    btnC_raw <= ~row[1]; // Row 2 (JB9)  -> Button C
    btnD_raw <= ~row[0]; // Row 3 (JB10) -> Button D
end
endmodule