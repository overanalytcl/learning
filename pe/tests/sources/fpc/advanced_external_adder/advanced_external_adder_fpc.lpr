program advanced_external_adder_fpc;

function AddTwoNumbers(A, B: integer): integer; stdcall; external 'complexadder_fpc.dll';
procedure Decrement(var A: integer); stdcall; external 'complexadder_fpc.dll';
function DoubleNumber(const A: integer): integer;
stdcall; external 'complexadder_fpc.dll';

var
  A, B: integer;
begin
  Readln(A);
  Writeln(AddTwoNumbers(A, 2));
  B := DoubleNumber(A);
  Writeln(B);
  Decrement(B);
  Writeln(B);
  Writeln(A);
end.
