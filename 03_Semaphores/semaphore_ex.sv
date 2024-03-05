module semaphore_ex;
  
  semaphore sem;
  
  task automatic display( string x);
    
    $display("%0s:\tGoing to get the key ---> at %0t ns",x,$time);
    sem.get();
    $display("%0s:\tgot the key ---> at %0t ns",x,$time);
    #10;
    $display("%0s:\tPutting the key back ---> at %0t ns",x,$time);
    sem.put();
    $display("%0s:\tPut the key back ---> at %0t ns",x,$time);
    
  endtask
  
  initial begin
   sem=new(1);
    fork
      display("READ");
      display("WRITE");
    join
  end
endmodule