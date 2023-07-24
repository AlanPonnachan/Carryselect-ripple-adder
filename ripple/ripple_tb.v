module ripple_tb;
  reg [3:0] A,B;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  ripple ut(.A(A),.B(B),.cin(cin),.sum(sum),.cout(cout));
  
  initial begin
    $monitor("Time = %t | A = %b, B = %b, cin = %b | sum = %b, cout = %b", $time, A, B, cin, sum, cout);
    
    A = 4'b0000;
    B = 4'b0000;
    cin = 0;
    #10;
    

    A = 4'b0000;
    B = 4'b0000;
    cin = 1;
    #10;
    
    // Test Case 3: a = 1, b = 1, carry_in = 0
    A = 4'b1111;
    B = 4'b1111;
    cin = 0;
    #10;
    
    // Test Case 4: a = 1, b = 1, carry_in = 1
    A = 4'b1111;
    B = 4'b1111;
    cin = 1;
    #10;
    
    // Test Case 5: Random values
    repeat (10) begin
      A = $random;
      B = $random;
      cin = $random;
      #10;
    end
    

    
    $finish;
  end
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule