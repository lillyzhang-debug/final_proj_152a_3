// connects game_controller (game status + LED control)
// to score calculation
// to display& debounding
`timescale 1ns/1ps

module top_module(
	input clk,
	input btnU, //start button
    input btnA, // keypad buttons
    input btnB, 
    input btnC,
    input btnD,
    input [15:13] sw, //im not sure how many switches we are going to use
    // send to board
    output [3:0] an,
    output [6:0] seg,
    output [3:0] led
);

// all are clock enables!
wire clk_en_1kHz;
wire clk_en_100hz;
wire clk_en_1hz;
wire clk_en_2hz;
wire clk_en_4hz;

// start/reset button for game mode
wire rst;
// ABCD buttons
wire [3:0] keypad;

// display digits
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;
wire [3:0] thousands;

clock clock_inst(
    .clk(clk),
    .second(clk_en_1hz),
    .display(clk_en_100hz),
    .ms_clock(clk_en_1kHz)
);

input_processing mod2(
    .clk(clk), 
	.btnU(btnU),
    .btnA(btnA),
    .btnB(btnB), 
    .btnC(btnC),
    .btnD(btnD),
	.sw(sw),
	.a(),
	.b(),
	.c(),
	.d(),
	.sw15(),
	.sw14(),
	.sw13(),
	.start(rst)
);

display mod4(
    .clk(clk),
    .rst(rst),
    .clk_refresh(clk_en_100hz),	
	.clk_blink(clk_en_4hz),
	.ones(ones), 
	.tens(tens), 
	.hundreds(hundreds), 
	.thousands(thousands),
	.seg(seg),
	.an(an)
);

wire [1:0] led_to_flash;
wire generate_num;
wire [3:0] sec;
wire [3:0] ten_sec;
wire[3:0] LED_on;

random_number_generator mod5(
    .clk(clk_en_1kHz),
    .rst(rst),
    // get from game_fsm
    .generate_num(generate_num),
    .led_to_flash(led_to_flash)
    );
   
game_controller mod6(
    .ms_clock(clk_en_1kHz),
    .start(rst),
    .keypad(keypad),
    .sw(sw),
    .LED_2_disp(led_to_flash),
    // INPUTS: Taking in the calculated digits
    .ones_score(ones),
    .tens_score(tens),
    .hundreds_score(hundreds),
    .thousands_score(thousands),
    .seconds(sec),
    .ten_seconds(ten_sec),
    .ones(ones), 
    .tens(tens), 
    .hundreds(hundreds), 
    .thousands(thousands),
    .sec(sec),
    .ten_sec(ten_sec),
    .LED_on(LED_on),
    .timer(timer)
    );
    
    wire [10:0] reaction_time;
//    wire [15:0] timer;
    wire user_hit; // might need to add more logic later
    
score_top_module mod7(
    .clk(clk),
//    .game_mode(game_mode),
    .reset(rst),
    .user_hit(user_hit),
    .reaction_time(reaction_time),
    .timer(timer),
    .ones(ones), 
    .tens(tens), 
    .hundreds(hundreds), 
    .thousands(thousands),
    .sec(sec),
    .ten_sec(ten_sec)
    );

endmodule
