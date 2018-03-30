class ReferenceSqrt;

  virtual function int sqrt(int i);
    $display("ReferenceSqrt");
    return $floor($sqrt(i));
  endfunction

endclass

class BadSqrt extends ReferenceSqrt;

  virtual function int sqrt(int i);
    $display("BadSqrt");
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
