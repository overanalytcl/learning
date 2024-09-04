library complexadder_fpc;

{$mode objfpc}{$H+}

uses
  mathinator9000;

function AddTwoNumbers(A, B: integer): integer; stdcall;
begin
  Result := Add(A, B);
end;

procedure Decrement(var A: integer); stdcall;
begin
  A := Sub(A, 1);
end;

function DoubleNumber(const A: integer): integer; stdcall;
begin
  Result := Mul(A, 2);
end;

exports
  AddTwoNumbers,
  Decrement,
  DoubleNumber;
begin
end.
