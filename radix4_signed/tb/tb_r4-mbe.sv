`timescale 1ps/1ps

module tb_r4_mbe;
  parameter integer WIDTH = 11;

  class inputs;
    rand bit [WIDTH-1:0] a, b;
    constraint c1 {};
    constraint c2 {};
  endclass



  
  logic clk_i = 0, rst_i;
  //inputs 
  logic signed [WIDTH-1:0] a_i, b_i;
  // Outputs
  logic signed [2*WIDTH - 1 : 0] p_i; // modificato per compatibilità, probabilmente bisognerà troncare
  logic signed [2*WIDTH - 1 : 0] p_gold; 
  // Instantiate the radix 4 modified booth multiplier
  radix4_mult dut (
    .a_in(a_i),
    .x_in(b_i),
    .p_out(p_i)
  );

  inputs i = new();


  // Clock generation
  always #5 clk_i <= ~clk_i;

  // Reset generation
  initial begin
    rst_i = 1;
    #10 rst_i = 0;
    $display("Starting test");
    // @(posedge clk_i);
    // a_i = 11'b00010111000; 
    // b_i = 11'b00000110100;
    // @(posedge clk_i);
    //#200;
    //$display("Ending test");
    //$finish;
  end

  //Test case 1
   always @(posedge clk_i) begin
     a_i = i.a;
     b_i = i.b;
    $display("a = %h, b = %h", a_i, b_i);
     i.randomize(a);
     i.randomize(b);
   end

  always @(negedge clk_i) begin

    p_gold = a_i*b_i;

    if (p_i != p_gold) begin
      $display("ERROR: expected output : %d, actual: p = %d, a = %d, b = %d", $signed (p_gold), $signed(p_i), $signed(a_i), $signed(b_i));
      //$finish;
    end else begin
      $display("SUCCESS: p = %d, a = %d, b = %d", $signed(p_i), $signed(a_i), $signed(b_i));
    end
  end

endmodule
