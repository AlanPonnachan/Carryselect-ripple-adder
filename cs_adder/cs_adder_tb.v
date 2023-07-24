module cs_adder_tb;
  reg [15:0] A,B;
  reg cin;
  wire [15:0] sum;
  wire cout;
  
  cs_adder in(.A(A),.B(B),.cin(cin),.sum(sum),.cout(cout));
  
  initial begin
    $monitor("Time = %t | A = %b, B = %b, cin = %b |  sum= %b, cout = %b", $time, A, B, cin, sum, cout);
    
    A=16'h0aa0;
    B=16'h0ff2;
    cin=0;
    #10
    
    A=16'h0400;
    B=16'h00f2;
    cin=1;
    #10
    
    A=16'h671f;
    B=16'h1234;
    cin=1;
    #10
    
    A=16'hbb00;
    B=16'h0cf2;
    cin=1;
    #10
    
    A=16'hfb10;
    B=16'h13f2;
    cin=1;
    #10
    
    A=16'hbb00;
    B=16'hcff2;
    cin=1;
    #10
    
    $finish;
  end
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
    