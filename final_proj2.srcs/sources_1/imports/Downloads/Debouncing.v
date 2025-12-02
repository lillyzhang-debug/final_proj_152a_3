module input_processing(
	input clk, //100 MHz clock
	input btnS, //start button
	input btnA,
	input btnB, 
	input btnC,
	input btnD,
	input [15:13] sw, //im not sure how many switches we are going to use
	output reg start,
	output reg a,
	output reg b,
	output reg c,
	output reg d,
	output reg sw15,
	output reg sw14,
	output reg sw13
);
// need to make s.t. if multiple keypad buttons pressed, nothing should happen
//synchronize inputs w/ 2 flip flops
reg [1:0] sync_sw15, sync_sw14, sync_sw13; //not sure how many switches
reg [1:0] sync_btnS, sync_btnA, sync_btnB, sync_btnC, sync_btnD;

always @(posedge clk) begin
    sync_sw15[0] <= sw[15];
    sync_sw15[1] <= sync_sw0[0];
    
    sync_sw14[0] <= sw[14];
    sync_sw14[1] <= sync_sw14[0];

	sync_sw13[0] <= sw[13];
	sync_sw13[1] <= sync_sw13[0];
        
    //buttons
	sync_btnS[0] <= btnS;
	sync_btnS[1] <= sync_btnS[0];
        
    sync_btnA[0] <= btnA;
    sync_btnA[1] <= sync_btnA[0];

	sync_btnB[0] <= btnB;
    sync_btnB[1] <= sync_btnB[0];

	sync_btnC[0] <= btnC;
    sync_btnC[1] <= sync_btnC[0];

	sync_btnD[0] <= btnD;
    sync_btnD[1] <= sync_btnD[0];
end   

//debouncing make sure it has been 'on' for two samples (2ms)
reg [1:0] deb_sw15, deb_sw14, deb_sw13;
reg [1:0] deb_btnS, deb_btnA, deb_btnB, deb_btnC, deb_btnD;

reg stable_sw15, stable_sw14, stable_sw13;
reg stable_btnS, stable_btnA, stable_btnB, stable_btnC, stable_btnD;

always @(posedge clk) begin
    deb_sw15[0] <= deb_sw15[1];
    deb_sw15[1] <= deb_sw15[0];
    
    deb_sw14[0] <= deb_sw14[1];
    deb_sw14[1] <= deb_sw14[0];

	deb_sw13[0] <= deb_sw13[1];
	deb_sw13[1] <= deb_sw13[0];
    
	deb_btnS[0] <= deb_btnS[1];
	deb_btnS[1] <= deb_btnS[0];
    
    deb_btnA[0] <= deb_btnA[1];
    deb_btnA[1] <= deb_btnA[0];

	deb_btnB[0] <= deb_btnB[1];
    deb_btnB[1] <= deb_btnB[0];

	deb_btnC[0] <= deb_btnC[1];
    deb_btnC[1] <= deb_btnC[0];

	deb_btnD[0] <= deb_btnD[1];
    deb_btnD[1] <= deb_btnD[0];
	
	//if both are 11 switch is on, if both 00 switch is off, if diff current state
	stable_sw15 <= (deb_sw15 == 2'b11) ? 1'b1 : (deb_sw15 == 2'b00) ? 1'b0 : stable_sw15;
	stable_sw14 <= (deb_sw14 == 2'b11) ? 1'b1 : (deb_sw14 == 2'b00) ? 1'b0 : stable_sw14;
	stable_sw13 <= (deb_sw13 == 2'b11) ? 1'b1 : (deb_sw13 == 2'b00) ? 1'b0 : stable_sw13;
	stable_btnS <= (deb_btnS == 2'b11) ? 1'b1 : (deb_btnS == 2'b00) ? 1'b0 : stable_btnS;
	stable_btnA <= (deb_btnA == 2'b11) ? 1'b1 : (deb_btnA == 2'b00) ? 1'b0 : stable_btnA;
	stable_btnB <= (deb_btnB == 2'b11) ? 1'b1 : (deb_btnB == 2'b00) ? 1'b0 : stable_btnB;
	stable_btnC <= (deb_btnC == 2'b11) ? 1'b1 : (deb_btnC == 2'b00) ? 1'b0 : stable_btnC;
	stable_btnD <= (deb_btnD == 2'b11) ? 1'b1 : (deb_btnD == 2'b00) ? 1'b0 : stable_btnD;
end
	
reg prev_btnS, prev_btnA, prev_btnB, prev_btnC, prev_btnD;

//make sure only one keypad input is accepted at a time
wire multiple_keypad_pressed = (stable_btnA + stable_btnB + stable_btnC + stable_btnD) > 1;
	
//detect Button Pressed: 0 -> 1
wire btnS_pressed_edge = stable_btnS && !prev_btnS; // start
wire btnA_pressed_edge = stable_btnA && !prev_btnA && !multiple_keypad_pressed; // A
wire btnB_pressed_edge = stable_btnB && !prev_btnB && !multiple_keypad_pressed; // B
wire btnC_pressed_edge = stable_btnC && !prev_btnC && !multiple_keypad_pressed; // C
wire btnD_pressed_edge = stable_btnD && !prev_btnD && !multiple_keypad_pressed; // D

//assign button values
always @(posedge clk) begin
    prev_btnS <= stable_btnS;
    prev_btnA <= stable_btnA;
	prev_btnB <= stable_btnB;
	prev_btnC <= stable_btnC;
	prev_btnD <= stable_btnD;

	start <= btnS_pressed_edge;
	a <= btnA_pressed_edge;
	b <= btnB_pressed_edge;
	c <= btnC_pressed_edge;
	d <= btnD_pressed_edge;
end

//assign switch values
always @(posedge clk) begin
    sw15 <= stable_sw15;
    sw14 <= stable_sw14;
	sw13 <= stable_sw13;
end 

endmodule
