`timescale 1ns / 1ps

module score_tabulator_tb; // <--- This name must match what Vivado is looking for!

    // Inputs
    reg clk;
    reg [10:0] reaction_time;
    reg reset;
    reg user_hit;

    // Outputs
    wire [13:0] current_score;

    // Instantiate the Unit Under Test (UUT)
    // Make sure 'score_tabulator' matches the name in your source file exactly
    score_tabulator uut (
        .clk(clk), 
        .reaction_time(reaction_time), 
        .reset(reset), 
        .user_hit(user_hit), 
        .current_score(current_score)
    );

    // Clock generation: 100MHz or 1kHz simulation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reaction_time = 0;
        reset = 0;
        user_hit = 0;

        // Reset the system
        #100;
        reset = 1;
        #10;
        reset = 0;
        #10;

        // -------------------------------------------------
        // TEST CASE 1: Perfect Hit (0ms reaction)
        // -------------------------------------------------
        $display("Test 1: Perfect Hit (0ms)");
        reaction_time = 0;
        user_hit = 1;
        #10; // Hold for 1 clock cycle
        user_hit = 0;
        #20;
        
        if (current_score == 800) $display("PASS: Score is 800");
        else $display("FAIL: Score is %d", current_score);

        // -------------------------------------------------
        // TEST CASE 2: Slow Hit (500ms reaction)
        // -------------------------------------------------
        $display("Test 2: Slow Hit (500ms)");
        reaction_time = 500;
        user_hit = 1;
        #10; 
        user_hit = 0;
        #20;
        
        // Previous 800 + New (800-500) = 1100
        if (current_score == 1100) $display("PASS: Score is 1100");
        else $display("FAIL: Score is %d", current_score);

        // -------------------------------------------------
        // TEST CASE 3: The "Button Held Down" Bug Check
        // -------------------------------------------------
        $display("Test 3: Button Held Down (Edge Detection Check)");
        reaction_time = 100; // Should add 700 points
        user_hit = 1;
        
        // Hold the button for 50 clock cycles!
        repeat(50) @(posedge clk);
        
        user_hit = 0;
        #20;
        
        // Previous 1100 + 700 = 1800. 
        // If logic is wrong, score will be HUGE (e.g. 36100)
        if (current_score == 1800) $display("PASS: Score is 1800 (Added only once)");
        else $display("FAIL: Score exploded to %d (Edge detection failed)", current_score);

        $finish;
    end
      
endmodule