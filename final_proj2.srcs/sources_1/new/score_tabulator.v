`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 05:40:05 PM
// Design Name: 
// Module Name: score_tabulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// handles score calcuations and splitting up the score for the display
module score_top_module (
    input clk,
    input game_mode,
    input reset,
    input user_hit,
    input [10:0] reaction_time,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds,
    output [3:0] thousands,
    output [3:0] sec,
    output [3:0] ten_sec
    );
    
    wire [13:0] current_score; 
    
    score_tabulator (
        .clk(clk),
        .reaction_time(reaction_time),
//        .game_mode(game_mode),
        .reset(reset),
        .user_hit(user_hit)
        );
    
    display_parser (
        // get from game_fsm in menu.v
        .score(current_score),
        .timer(timer)
        );
    
endmodule
    

// take in user's reaction time, calculate points gained, and add to current score value
// if reset, reset game mode
// if game_mode == 0, don't do anything
module score_tabulator (
    input clk,
    input [10:0] reaction_time, // user's reaction time to press button
//    input game_mode,
    input reset,
    input user_hit,
    output reg [13:0] current_score
    );

    reg [10:0] diff;

always @(posedge clk) begin
    if (reset) begin
        current_score <= 0;
    end
    else if (user_hit) begin
        current_score <= current_score + (800 - reaction_time); // this is the additive score
    end
end
        
endmodule
 
 
  // takes score reg AND timer and breaks it down for the display
 module display_parser (
    input [13:0] score,
    input [15:0] timer,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds,
    output [3:0] thousands,
    output [3:0] sec,
    output [3:0] ten_sec
    );
    
    wire [6:0] seconds_timer;
    
    assign ones = score % 10;
    assign tens = (score/10) % 10;
    assign hundreds = (score/100) % 10;
    assign thousands = (score/1000) % 10;
    
    assign seconds_timer = timer / 1000; // translate ms to s
    assign sec = seconds_timer % 10; 
    assign ten_sec = (seconds_timer / 10) % 10;
    
endmodule
