class ReferenceSqrt # (type T=int);

  string message;

  function new(string message="ReferenceSqrt");
    this.message = message;
  endfunction

  virtual function T sqrt(T i);
    $display(message);
    return $sqrt(i);
  endfunction

  task automatic check(T val, T expected);
    T got = this.sqrt(val);
    $display("val: ", val, " expected: ", expected, " got: ", got);
  endtask

endclass

// class BadSqrt # (type T=int) extends ReferenceSqrt;
//
//   function new(string message="BadSqrt");
//     super.new(message);
//   endfunction
//
//   virtual function super.T sqrt(super.T i);
//     $display("BadSqrt");
//     return $ceil($sqrt(i));
//   endfunction
//
// endclass



program automatic test;
  typedef int myType;
  ReferenceSqrt #(myType) refsqrt = new;
  // BadSqrt #(real) badsqrt = new;
  myType val = 8;
  myType expected = 2;

  initial
  begin
    $display("##################################");
    $display("");
    $display("");
    $display("");
    refsqrt.check(val, expected);
    // badsqrt.check(val, expected);
    $display("");
    $display("");
    $display("");
    $display("##################################");
  end
endprogram
