`timescale 1ns / 1ps

module game_fsm_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [2:0] sw;

    // Outputs
    wire playing;
    wire [15:0] timer;
    wire [1:0] game_mode;
    wire generate_nums;

    // Instantiate the Unit Under Test (UUT)
    game_fsm uut (
        .clk(clk), 
        .reset(reset), 
        .sw(sw), 
        .playing(playing), 
        .timer(timer), 
        .game_mode(game_mode), 
        .generate_nums(generate_nums)
    );

    // Clock generation: 100MHz simulation clock (10ns period)
    // Note: We use a fast clock here to simulate the 3000 ticks quickly.
    // In real hardware, these ticks would be 1ms each (3 seconds total).
    always #5 clk = ~clk; 

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        sw = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // -------------------------------------------------
        // TEST CASE 1: Invalid Start (Switches OFF)
        // -------------------------------------------------
        $display("---------------------------------------------------");
        $display("Test 1: Attempt Start with Invalid Switches (000)");
        
        // SYNC: Change inputs away from posedge to avoid race conditions
        @(negedge clk); 
        sw = 3'b000;
        reset = 1; 
        
        @(negedge clk); // Hold reset for one clock cycle
        reset = 0;
        
        // Wait 2 cycles to let FSM state settle
        repeat(2) @(posedge clk);

        // EXPECTATION: With new logic, Invalid Input -> STARTUP (Mode 1) for 3s
        if (game_mode == 1) $display("PASS: Entered STARTUP (Mode 1) to flash error");
        else $display("FAIL: Expected Mode 1, Got Mode %d", game_mode);


        // -------------------------------------------------
        // TEST CASE 2: Valid Start (Switch 0 ON -> 10s Game)
        // -------------------------------------------------
        $display("---------------------------------------------------");
        $display("Test 2: Start 10s Game (Switch 001)");
        
        // Wait for previous startup to finish or just override it with reset
        @(negedge clk);
        sw = 3'b001; // Valid 10s mode
        reset = 1;

        @(negedge clk);
        reset = 0;

        repeat(2) @(posedge clk);
        
        // Debug: Peek inside the module to see if setup_valid was set
        // Note: This requires the variable in game_fsm to be named 'setup_valid'
        // $display("DEBUG: setup_valid = %b", uut.setup_valid);

        if (game_mode == 1) $display("PASS: Entered STARTUP mode");
        else $display("FAIL: Did not enter STARTUP");


        // -------------------------------------------------
        // TEST CASE 3: Wait for Countdown (3000 ticks)
        // -------------------------------------------------
        $display("---------------------------------------------------");
        $display("Test 3: Waiting for 3s countdown (3000 cycles)...");
        
        // Wait 3000 cycles for timer
        // We split the wait into chunks to show progress in the console
        repeat(6) begin
             repeat(500) @(posedge clk);
             $display("   ... Simulating countdown: Timer = %d / 3000", uut.timer);
        end
        repeat(5) @(posedge clk); // Final few cycles buffer
        
        if (game_mode == 2) begin
            $display("PASS: Entered PLAYING mode (Mode 2) after delay");
        end else begin
            $display("FAIL: Stuck in mode %d (Timer: %d)", game_mode, timer);
            $display("      (Hint: If Mode is 0, setup_valid failed to latch 1)");
            $display("      Debug: setup_valid is %b", uut.started);
        end

        // -------------------------------------------------
        // TEST CASE 4: Game Duration (10000 ticks)
        // -------------------------------------------------
        $display("---------------------------------------------------");
        $display("Test 4: Playing game (Wait 10,000 cycles)...");
        
        // Split the game wait too so it doesn't look frozen
        repeat(10) begin
             repeat(1000) @(posedge clk);
             // Uncomment to track game timer: 
             // $display("   ... Playing: Timer = %d", uut.timer);
        end
        repeat(5) @(posedge clk);
        
        if (game_mode == 0) $display("PASS: Returned to IDLE after duration");
        else $display("FAIL: Still playing (Timer: %d)", timer);

        $display("---------------------------------------------------");
        $finish;
    end
      
endmodule