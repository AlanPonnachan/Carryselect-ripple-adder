

module ripple(A,B,cin,sum,cout);
  input [3:0] A,B;
  input cin;
  output [3:0] sum;
  output cout;
  wire c1,c2,c3;
  
  FA fa1(.a(A[0]),.b(B[0]),.cin(cin),.out(sum[0]),.cout(c1));
  FA fa2(.a(A[1]),.b(B[1]),.cin(c1),.out(sum[1]),.cout(c2));
  FA fa3(.a(A[2]),.b(B[2]),.cin(c2),.out(sum[2]),.cout(c3));
  FA fa4(.a(A[3]),.b(B[3]),.cin(c3),.out(sum[3]),.cout(cout));
  
endmodule
  