// //-------------without semaphore-----------

module without_sem();
  
  int a,b,y;
  
  task automatic shared_resource(string s,int a,b);
    $display("%0s:\twriting  started",s);
    #5ns;
    y=a+b;
    $display("%0s:\tat time=%0t:writing completed | a=%0d | b=%0d | y=%0d |",s,$time,a,b,y); 
  endtask
  

  initial begin
    fork
      shared_resource("1st",10,20);//process 1
      shared_resource("2nd",20,30);//process 2
      shared_resource("3rd",30,40);//process 3
    join
  end
endmodule
//-----------with semaphore------------------
// module with_sem();
//   semaphore sem;
//   int a,b,y;
  
//   task automatic shared_resource(string s,int a,b);
//     sem.get(1);
//     $display("%0s:\tat %0tns writing  started",s,$time);
//     #5ns;
//     y=a+b;
//     $display("%0s:\tat time=%0t:writing completed | a=%0d | b=%0d | y=%0d |",s,$time,a,b,y); 
//     sem.put();
//   endtask
  

//   initial begin
//     sem= new(1);
//     fork
//       shared_resource("1st",10,20);//process 1
//       shared_resource("2nd",20,30);//process 2
//       shared_resource("3rd",30,40);//process 3
//     join
//   end
// endmodule
