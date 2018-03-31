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

  virtual function ReferenceSqrt copy(ReferenceSqrt to=null);
    if (to == null)
      to = new;
    to.message = this.message;
    return to;
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
  ReferenceSqrt refsqrt = new;
  BadSqrt badsqrt = new;
  int val = 8;
  int expected = 2;

  initial
  begin
    $display("##################################");
    $display("");
    $display("");
    $display("");
    check(refsqrt, val, expected);
    check(badsqrt, val, expected);
    // testcast(badsqrt);
    // testcast(refsqrt);
    // testcopy(refsqrt, badsqrt);
    // $display("outter refsqrt:", refsqrt.message);
    // $display("outter badsqrt:", badsqrt.message);
    $display("");
    $display("");
    $display("");
    $display("##################################");
  end
endprogram

task automatic testcast(ReferenceSqrt refsqrt);
  BadSqrt bad;
  $display("BadSqrt <- ", refsqrt.message);
  if ($cast(bad, refsqrt))
    $display("cast successful");
  else
    $display("`can't cast this` -- MC Hammer");
  // $cast(bad, refsqrt); //may throw error
endtask

task automatic testcopy(ReferenceSqrt refsqrt, ReferenceSqrt badsqrt);
  ReferenceSqrt a = new;
  ReferenceSqrt b;

  refsqrt.copy(a);
  b = badsqrt.copy();

  a.message = "a.MESSAGE";
  b.message = "b.MESSAGE";
  $display("a: ", a.message);
  $display("b: ", b.message);
endtask
