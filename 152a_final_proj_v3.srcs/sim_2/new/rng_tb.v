`timescale 1ns / 1ps

module rng_tb;

    reg clk;
    reg rst;
    reg generate_num;

    wire [7:0] rand_num;
    wire [1:0] led_to_flash;

    random_number_generator uut (
        .clk(clk), 
        .rst(rst), 
        .generate_num(generate_num), 
        .rand_num(rand_num), 
        .led_to_flash(led_to_flash)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        generate_num = 0;
        #20;
        rst = 0;

        $display("Test 1: Generating Sequence...");
        generate_num = 1;
        
        // Print the first 10 numbers generated
        repeat(25) begin
            @(posedge clk);
            $display("Time: %t | Gen: %b | Rand: %b | LED: %d", $time, generate_num, rand_num, led_to_flash);
        end
        
        $finish;
    end

endmodule
