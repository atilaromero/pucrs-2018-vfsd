virtual class Virtual_cbs;
  virtual task run();
  endtask
endclass

class Real_cbs extends Virtual_cbs;
  virtual task run();
    $display("this was written by a callback");
  endtask
endclass

program automatic test;
  Real_cbs c = new;

  initial
  begin
    $display("##################################");
    $display("");
    $display("");
    $display("");
    testcallback(c);
    $display("");
    $display("");
    $display("");
    $display("##################################");
  end
endprogram

task testcallback(Virtual_cbs c);
  c.run();
endtask
