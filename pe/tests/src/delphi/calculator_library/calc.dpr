library calc;

uses
  calc.types in 'calc.types.pas';

{$R *.res}

function Calculate(A, B: integer; operation: TArithmeticOperation): integer;
var
  calc: TCalculator;
begin
  calc := TCalculator.Create;
  try
    case operation of
      opAdd:
        calc.Add(A, B);
      opSubtract:
        calc.Subtract(A, B);
      opMultiply:
        calc.Multiply(A, B);
      opDivide:
        calc.Divide(A, B);
      opMod:
        calc.Modulo(A, B);
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
