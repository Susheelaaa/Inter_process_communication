
//2) Write a logic to mimic the behaviour of fork_join_any using fork_join_none

module none_to_any;
  event e;
  
task  process_a();
  $display("process_a started @%0tns",$time);
  #5;
  $display("process_a finished  @%0tns",$time);
 ->e;
endtask
  
task  process_b();
  $display("process_b started  @%0tns",$time);
  #10;
  $display("process_b finished  @%0tns",$time);
  ->e;
endtask

initial begin
  
fork
   process_a();
   process_b();
join_none
  
 @e;
$display("Out of fork block  @%0t",$time);
  
end
endmodule