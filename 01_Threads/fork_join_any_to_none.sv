//1) Write a logic to mimic the behaviour of fork_join_none using fork_join_any:

module any_to_none;
 // event e;
task  process_a();

  $display("process_a started @%0tns",$time);
  #5;
  $display("process_a finished  @%0tns",$time);
endtask
  
task  process_b();
  $display("process_b started  @%0tns",$time);
  #10;
  $display("process_b finished  @%0tns",$time);
endtask

initial begin
fork
  
  //->e;         //process     
  begin 
  end            //process
  process_a();   //process 1
  
  process_b();  //process 2

join_any
  
 // wait(e.triggered);
  $display("Out of fork block @%0t",$time);

end
endmodule