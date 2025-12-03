// connects game_controller (game status + LED control)
// to score calculation
// to display& debounding
`timescale 1ns/1ps

module top_module(
	input clk,
	input btnS, //start button
	input [15:13] sw, //switches for time
	input  wire [7:0] JB, //keypad buttons
    // send to board
	output wire JB3,
    output [3:0] an,
    output [6:0] seg,
    output [7:0] led,
    output [15:8] led_debug
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

// for keypad
wire btnA_raw, btnB_raw, btnC_raw, btnD_raw;

// for debouncing
wire sw15_clean, sw14_clean, sw13_clean;
wire btnD_clean, btnC_clean, btnB_clean, btnA_clean;
wire start_clean; // Use this for reset

clock clock_inst(
    .clk(clk),
    .second(clk_en_1hz),
    .display(clk_en_100hz),
    .ms_clock(clk_en_1kHz),
    .led(clk_en_4hz)
);

// --- RESET LOGIC ---
// FIX 1: Connect btnC DIRECTLY to reset. 
// This bypasses the debouncer pulse which was too fast for the slow game clock.
//wire rst;
assign rst = btnS; 

keypad mod0(
	.row(JB[7:4]),
	.col4(JB3),
    .btnA_raw(btnA_raw),
    .btnB_raw(btnB_raw),
    .btnC_raw(btnC_raw),
    .btnD_raw(btnD_raw)
);
	
input_processing mod1(
    .clk(clk), 
	.btnS(1'b0), // wired rst directly 
    .btnA(btnA_raw),
    .btnB(btnB_raw), 
    .btnC(btnC_raw),
    .btnD(btnD_raw),
	.sw(sw),
	.a(btnA_clean),
	.b(btnB_clean),
	.c(btnC_clean),
	.d(btnD_clean),
	.sw15(sw15_clean),
	.sw14(sw14_clean),
	.sw13(sw13_clean),
	.start() //unused for now?
);

//doesnt passing in {btnD_clean, btnC_clean, btnB_clean, btnA_clean} already do this?
// 4. THE ENCODER (Converts 4 buttons -> 2-bit Index)
	reg [1:0] keypad_encoded;
    always @(*) begin
        if (btnA_clean)      keypad_encoded = 2'b00; // Matches RNG '0'
        else if (btnB_clean) keypad_encoded = 2'b01; // Matches RNG '1'
        else if (btnC_clean) keypad_encoded = 2'b10; // Matches RNG '2'
        else if (btnD_clean) keypad_encoded = 2'b11; // Matches RNG '3'
        else                 keypad_encoded = 2'b00; 
    end 

//assign rst = start_clean;

wire playing;

wire [1:0] led_to_flash;
wire generate_num;
wire [3:0] sec;
wire [3:0] ten_sec;
wire[3:0] LED_on;

wire [15:0] timer;      // Carries the count-up timer
wire [15:0] countdown;  // Carries the count-down timer (3000 -> 0)

wire [7:0] rand_num;
	
random_number_generator mod2(
    .clk(clk_en_1kHz),
    .rst(rst),
    // get from game_fsm
    .generate_num(generate_num),
	.rand_num(rand_num),
    .led_to_flash(led_to_flash)
);

game_controller mod3(
    .ms_clock(clk_en_1kHz),
    .start(rst),
    .keypad({btnD_clean, btnC_clean, btnB_clean, btnA_clean}),
    .sw({sw15_clean, sw14_clean, sw13_clean}),
    .LED_2_disp(led_to_flash),
    // INPUTS: Taking in the calculated digits
    .ones_score(ones),
    .tens_score(tens),
    .hundreds_score(hundreds),
    .thousands_score(thousands),
    .seconds(sec),
    .ten_seconds(ten_sec),
	// OUTPUTS
    .ones(ones), 
    .tens(tens), 
    .hundreds(hundreds), 
    .thousands(thousands),
    .sec(sec),
    .ten_sec(ten_sec),
    .LED_on(LED_on),
    .LED_on_2(led_debug), // for debug
//  .started_debug(started_debug), // for debug
    .timer(timer),
    .countdown(countdown),
    .generate_nums(generate_num)
    );
    
    wire [10:0] reaction_time;
//  wire [15:0] countdown;
    wire user_hit; // might need to add more logic later
?
//i feel like this should be called inside of game_controller? since so many of its inputs 
//are from that module, and that way it can input the score directly into the display info
//and that way there is only one ouput for ones, tens, hundreds, thousands 
//seems like it might be an issue that this module and game_controller both output those values
score_top_module mod4(
    .clk(clk_en_1kHz),
//  .game_mode(game_mode),
    .reset(rst),
    .user_hit(user_hit),
    .reaction_time(reaction_time),
    .countdown(countdown),
    .ones(ones), 
    .tens(tens), 
    .hundreds(hundreds), 
    .thousands(thousands),
    .sec(sec),
    .ten_sec(ten_sec)
);

display mod5(
    .clk(clk),
    .rst(rst),
    .adj(playing),
    .clk_refresh(clk_en_100hz),	
	.clk_blink(clk_en_4hz),
	.ones(ones), 
	.tens(tens), 
	.hundreds(hundreds), 
	.thousands(thousands),
	.seg(seg),
	.an(an)
);

    assign led[3:0] = LED_on;
    assign led[4] = btnS;
    assign led[5] = sw13_clean;
    assign led[6] = sw14_clean;
    assign led[7] = sw15_clean;
    assign led_debug[15] = btnA_clean;
    assign led_debug[14] = btnB_clean;
    assign led_debug[13] = btnC_clean;
    assign led_debug[12] = btnD_clean;
//  assign led_debug[11] = started_debug;
endmodule
