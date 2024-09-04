program external_adder_fpc;

{$mode objfpc}
{$H+}

function AddTwoNumbers(A, B: integer): integer; stdcall; external 'simpleadder_fpc.dll';
procedure PrintAdd; stdcall; external 'simpleadder_fpc.dll';

var
  X: integer;
begin
  X := AddTwoNumbers(20, 30);
  Writeln(X);
  PrintAdd;
end.
