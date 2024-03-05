task process_a();
  while ($time < 30) begin
    #1;
    $display("process_a(): at time %0t",$time);
  end
endtask 


task process_b();
  #5;
  $display("process_b() finished at time %0t",$time);
endtask 


task process_c();
  #10;
  $display("process_c() finished %0t",$time);
endtask


task run();

  fork:f1
    process_a();
  join_none

  fork:f2
    process_b();
    process_c();
  join_any

  $display("time before disable fork: %0t", $time);

  disable f2; 

  #10;
  
endtask:run

module top;
  initial begin
    run();
  end
endmodule 