library calc;

{$mode objfpc}{$H+}

uses
  calc.types;

function Calculate(A, B: integer; operation: TArithmeticOperation): integer;
var
  calc: TCalculator;
begin
  try
    calc := TCalculator.Create;
    case operation of
      opAdd: calc.Add(A, B);
      opSubtract: calc.Subtract(A, B);
      opMultiply: calc.Multiply(A, B);
      opDivide: calc.Divide(A, B);
      opMod: calc.Modulo(A, B);
    end;
    Result := calc.Result;
  finally
    calc.Free;
  end;
end;

exports
  Calculate;

begin
end.
