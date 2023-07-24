
module muxc(x,y,z,sel);
  input x,y,sel;
  output z;
 assign z = (sel)? y:x;
endmodule

module muxs(x,y,z,sel);
  input [3:0]x,y;
  input sel;
  output [3:0]z;
 assign z = (sel)? y:x;
endmodule


module cs_adder(A,B,cin,sum,cout);
  input [15:0] A,B;
  input cin;
  output  [15:0] sum;
  output  cout;
  wire [3:0] sa0,sa1,sb0,sb1,sc0,sc1,sd0,sd1;
  wire ca0,ca1,cb0,cb1,cc0,cc1,cd0,cd1;
  reg c1,c2,c3;
 
  //carry 0
  ripple Ra0(.A(A[3:0]),.B(B[3:0]),.cin(0),.sum(sa0),.cout(ca0));
  ripple Rb0(.A(A[7:4]),.B(B[7:4]),.cin(ca0),.sum(sb0),.cout(cb0));
  ripple Rc0(.A(A[11:8]),.B(B[11:8]),.cin(cb0),.sum(sc0),.cout(cc0));
  ripple Rd0(.A(A[15:12]),.B(B[15:12]),.cin(cc0),.sum(sd0),.cout(cd0));
  
  //carry1
  ripple Ra1(.A(A[3:0]),.B(B[3:0]),.cin(1),.sum(sa1),.cout(ca1));
  ripple Rb1(.A(A[7:4]),.B(B[7:4]),.cin(ca1),.sum(sb1),.cout(cb1)); 
  ripple Rc1(.A(A[11:8]),.B(B[11:8]),.cin(cb1),.sum(sc1),.cout(cc1));
  ripple Rd1(.A(A[15:12]),.B(B[15:12]),.cin(cc1),.sum(sd1),.cout(cd1));

  //mux for carry
  muxc c(.x(cd0),.y(cd1),.z(cout),.sel(cin));
  
  //mux for sum
  muxs s1(.x(sa0),.y(sa1),.z(sum[3:0]),.sel(cin));
  muxs s2(.x(sb0),.y(sb1),.z(sum[7:4]),.sel(cin));
  muxs s3(.x(sc0),.y(sc1),.z(sum[11:8]),.sel(cin));
  muxs s4(.x(sd0),.y(sd1),.z(sum[15:12]),.sel(cin));

  

endmodule