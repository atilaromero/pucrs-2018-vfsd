class ReferenceSqrt;

  string message;

  //dont use virtual, is a constructor
  //can have optional parameters
  function new(string message="ReferenceSqrt");
    this.message = message;
  endfunction

  virtual function int sqrt(int i);
    $display(message);
    return $floor($sqrt(i));
  endfunction

  function int roundPI();
    return 3;
  endfunction

endclass

class BadSqrt extends ReferenceSqrt;

  function new(string message="BadSqrt");
    //$display("cant be here!!!");
    super.new(message);
  endfunction

  virtual function int sqrt(int i);
    int pi;
    $display("BadSqrt");
    //other super functions dont need to be at first line
    pi = super.roundPI();
    return $ceil($sqrt(i));
  endfunction

endclass

task automatic check(ReferenceSqrt refsqrt, int val, int expected);
  int got = refsqrt.sqrt(val);
  $display("val: %d, expected: %d, got: %d", val, expected, got);
endtask


program automatic test;
  initial
  begin
    automatic ReferenceSqrt refsqrt = new;
    automatic BadSqrt badsqrt = new;
    automatic int val = 8;
    automatic int expected = 2;
    $display("##################################");
    $display("");
    $display("");
    $display("");
    check(refsqrt, val, expected);
    check(badsqrt, val, expected);
    $display("");
    $display("");
    $display("");
    $display("##################################");
  end
endprogram
