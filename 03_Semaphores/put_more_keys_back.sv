//---------------------putting back more keys-----------------------
module semaphore_ex;
  semaphore sema; 

  //display method
  task automatic display(int key);
    sema.get(key); 
    $display("\tGot %0d keys at time",key,$time);
    #30;
    sema.put(key+1);
  endtask
  
  initial begin
    sema=new(1); 
    fork
      display(1); //process-1
      display(2); //process-2
      display(3); //process-3
    join
  end
endmodule