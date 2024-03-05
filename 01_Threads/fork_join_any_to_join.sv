
//3) Write a logic to mimic the behavior of fork join using fork join any 

module any_to_all;
  
// event e1,e2;

task  process_a();
  $display("process_a started @%0tns",$time);
  #5;
  $display("process_a finished  @%0tns",$time);
  //->e1;
endtask

task  process_b();
  $display("process_b started  @%0tns",$time);
  #10;
  $display("process_b finished  @%0tns",$time);
  //->e2;
endtask

initial begin
fork
    process_a();
    process_b();
join_any

//wait_order(e1,e2);
  wait fork;
$display("Out of fork block  @%0t",$time); 

end
endmodule