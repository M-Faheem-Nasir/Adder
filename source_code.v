module rca_pipe_2bit(a,b,cin,clk,sum,cout);
  input [7:0] a,b;
  input cin,clk;
  output [7:0] sum;
  output cout;
  // Initializing registers for pipeline
  reg [16:0] ir;		//input reg for saving inputs
  reg [15:0] pr1;		//pipeline reg 1 for stage 1
  reg [14:0] pr2;		//pipeline reg 2 for stage 2
  reg [13:0] pr3;		//pipeline reg 3 for stage 3
  reg [12:0] pr4;		//pipeline reg 4 for stage 4
  reg [11:0] pr5;		//pipeline reg 5 for stage 5
  reg [10:0] pr6;		//pipeline reg 6 for stage 6
  reg [9:0]  pr7;		//pipeline reg 7 for stage 7
  reg [8:0]  OR;		//output reg to store output of last stage

  assign {cout,sum} = OR;	//assigning content of output reg to our outputs

  always @(posedge clk) begin
  	//mapping our inputs to bits of input registers so that we can easily use them i.e {a,b,c} -> input reg
    ir[0] <= cin;
    ir[1] <= a[0];ir[3] <= a[1];ir[5] <= a[2];ir[7] <= a[3];ir[9] <= a[4];ir[11] <= a[5];ir[13] <= a[6];ir[15] <= a[7];
    ir[2] <= b[0];ir[4] <= b[1];ir[6] <= b[2];ir[8] <= b[3];ir[10] <=b[4];ir[12] <= b[5];ir[14] <= b[6];ir[16] <= b[7];

  end


 endmodule
