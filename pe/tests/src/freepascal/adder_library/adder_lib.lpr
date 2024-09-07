library adder_lib;

{$mode objfpc}{$H+}

function AddTwoNumbers(A, B: integer): integer; stdcall;
begin
  Result := A + B;
end;

procedure PrintAdd; stdcall;
var
  X: integer;
begin
  X := AddTwoNumbers(34, 35);
  Writeln(X);
end;

exports
  PrintAdd,
  AddTwoNumbers;

begin
end.

