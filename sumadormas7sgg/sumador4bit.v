module sumador4bit (xi, yi,co,zi);

  input [3 :0] xi;
  input [3 :0] yi;
  output co;
  output [3 :0] zi;

  wire c1,c2,c3;
  sumador1 s0 (.A(xi[0]), .B(yi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
  sumador1 s1 (.A(xi[1]), .B(yi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
  sumador1 s2 (.A(xi[2]), .B(yi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
  sumador1 s3 (.A(xi[3]), .B(yi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));


endmodule
