module tb();
  reg [7:0] a,b;
  reg c,clk;
  wire [7:0] sum;
  wire cout;
  always #2 clk=~clk;   //togglig clock after each 2ns
  //instantiating module
  rca_pipelined_8bit rr(a,b,c,clk,sum,cout);
  initial begin
    //These two lines are adder to work with online EDA compiler
    //You can skip these if you are using modelsim or similare
    $dumpfile("dump.vcd");
    $dumpvars(1);
    //test case inputs
    clk=0;a=0;b=0;c=0;
    #6 a=1;b=1;c=0;
    #4 a=3;b=3;c=1;
    #4 a=7;b=7;c=1;
    #4 a=4;b=10;c=1;
    #4 a=5;b=9;c=1;
    #4 a=6;b=8;c=1;
    #4 a=1;b=5;c=1;
    #4 a=2;b=4;c=1;
    #4 a=2;b=5;c=0;
    #4 a=3;b=4;c=0;
    #4 a=6;b=0;c=1;
    #4 a=13;b=1;c=1;
    #50 $finish;
  end
endmodule