//--------------------process with more than one key-------------
module semaphore_ex;
  semaphore sema; 

  initial begin
    sema=new(4); 
    fork
      display(2); //process-1
      display(3); //process-2
      display(2); //process-3
      display(1); //process-4
    join
  end

  //display method
  task automatic display(int key);
    sema.get(key); 
     $display("\tGot %0d keys at time",key,$time);
    #30;
    sema.put(key); 
  endtask
endmodule