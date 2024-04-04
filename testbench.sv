// Code your testbench here
// or browse Examples
module tailLight_tb;
  
  reg HAZARD,r,l,clk,rst;
  wire [2:0] RIGHT_INDICATOR, LEFT_INDICATOR;
  tailLight DUT (clk,rst,l,r,HAZARD,LEFT_INDICATOR,RIGHT_INDICATOR);
  
  initial clk=0;
  always #10 clk=~clk;
  
  initial
    begin
      #10 HAZARD=0;rst=1;r=0;l=1;
      #90 l=0;
      #100 HAZARD=0;rst=0;r=0;l=1;
      #100 HAZARD=1;l=0;
      #130 HAZARD=0;r=1;
    end
  
  initial
    begin
      $dumpfile("taillight.vcd");
      $dumpvars;
      #700 $finish;
    end
endmodule         