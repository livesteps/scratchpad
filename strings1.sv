// Strings
module string_datatype;
   reg [0:15*8-1] s;
   string s0; //an empty string
   bit[31:0] b;
   initial begin
      s = "how are you doing"; //17 chars
      $display("String s = %0s", s);

      s = "Hello World"; //11 chars
      $display("String s = %0s", s);

      // s0 -> Empty string
      $display("String s = %0s", s0);

      s0 = "Hello world"; //11 chars
      $display("String s0 = %0s", s0);

      s0 = {"Hi,","," ",s}; //17 chars
      $display("String s0 = %0s", s0);

      b=128;
      s0 = "Welcome to We_LSI channel, practice at the end of the session\
      All the best";
      $display("String s0 = %0s", s0);
   end
endmodule

// String operators
module string_operator;
   string s1="Hi Everyone"; //11
   string s2="Hii Everyone"; //12
   string s3; //empty string
   initial begin
      if(s1==s2) 
         $display("s1=%0s equals to s2=%0s", s1, s2);
      else
         $display("s1 is not equal to s2");

      if(s1<s2)  // Other operators could be tested <=, >, >=
         $display("s1<%0s less than s2=%0s", s1, s2);
      else
         $display("s1 is not less than s2");

      s3={s1,"welcome",s2};
      $display("s3=%0s", s3);

      s3={3{"We_LSI"}}; //{5{s1}}
      $display("s3=%0s", s3);

      s3="Hello guys";
      $display("s3=%0d s3=%0s", s3[7], s3[7]);
   end
endmodule

// String basic methods
module string_basic_methods;
   string s1="Hi Everyone"; //11
   string s2="He Everyone"; //11
   string s3; //empty string

   initial begin
      $display("Len s1=%0d", s1.len());

      s1.putc(c,"char"); //s1="Hiceveryone"
      $display("s1=%0s", s1);

      $display("s1=%0s=%0d", s1.getc(2), s1.getc(2));

      s1="ENGINEERING";
      $display("s1=%0s", s1.tolower());
      $display("s1=%0s", s1.toupper());

      s2="Engineering"; // A=65, a=97
      //Compare string: (s1-s2)case_sensitive(0=equ, neg=s1<s2,pos=s1>s2)
      $display("s1=%0s s2=%0s difference=%0d", s1, s2, s1.compare(s2)); //case sensitive
      $display("s1=%0s s2=%0s difference=%0d", s1, s2, s1.icompare(s2)); //case insensitive
   end
endmodule

// String conversion methods
module tb_string_conversion_methods;
string mystring;
int 1;
real j;
initial begin
   my_string=3459ah";
   $display("string is=%0s %0d", my_string, my_string);
   i=my_string.atoi();
   $display("%0d", i);
   i=my_string.atohex();
   $display("%0d", i);
   i=my_string.atooct();
   $display("%0d", i);
   i=my_string.atobin();
   $display("%0d", i);
   j=my_string.atoreal();
   $display("%0d", j);

   i=65987; j=23.87;
   $display("Before string is %0s", my_string);
   my_string.itoa(i);
   $display("After string is %0s", my_string);
   my_string.hextoa(i);
   $display("After string is %0s", my_string);
   my_string.octtoa(i);
   $display("After string is %0s", my_string);
   my_string.bintoa(i);
   $display("After string is %0s", my_string);
   my_string.realtoa(j);
   $display("After string is %0s", my_string);
end
endmodule
