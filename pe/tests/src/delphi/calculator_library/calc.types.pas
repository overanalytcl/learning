unit calc.types;

interface

type
  TArithmeticOperation = (opAdd, opSubtract, opMultiply, opDivide, opMod);

  TDivRemResult = record
    Divisor: integer;
    Remainder: integer;
  end;

  TResultVariant = record
    case Operation: TArithmeticOperation of
      opAdd, opSubtract, opMultiply:
        (A, B, IntResult: integer);
      opDivide, opMod:
        (DivRemResult: TDivRemResult);
  end;

  { TCalculator }

  TCalculator = class
  private
    FResult: TResultVariant;
    function GetResult: integer;
  public
    procedure Add(Num1, Num2: integer);
    procedure Subtract(Num1, Num2: integer);
    procedure Multiply(Num1, Num2: integer);
    procedure Divide(Num1, Num2: integer);
    procedure Modulo(Num1, Num2: integer);

    property Result: integer read GetResult;
  end;

implementation

{ TCalculator }

function TCalculator.GetResult: integer;
begin
  case FResult.Operation of
    opAdd, opSubtract, opMultiply:
      Result := FResult.IntResult;
    opDivide:
      Result := FResult.DivRemResult.Divisor;
    opMod:
      Result := FResult.DivRemResult.Remainder;
  else
    Result := $7FFFFFFF;
  end;
end;

procedure TCalculator.Add(Num1, Num2: integer);
begin
  with FResult do
  begin
    Operation := opAdd;
    A := Num1;
    B := Num2;
    IntResult := Num1 + Num2;
  end;
end;

procedure TCalculator.Subtract(Num1, Num2: integer);
begin
  with FResult do
  begin
    Operation := opSubtract;
    A := Num1;
    B := Num2;
    IntResult := Num1 - Num2;
  end;
end;

procedure TCalculator.Multiply(Num1, Num2: integer);
begin
  with FResult do
  begin
    Operation := opMultiply;
    A := Num1;
    B := Num2;
    IntResult := Num1 * Num2;
  end;
end;

procedure TCalculator.Divide(Num1, Num2: integer);
begin
  with FResult do
  begin
    Operation := opDivide;
    DivRemResult.Divisor := Num1 div Num2;
    DivRemResult.Remainder := Num1 mod Num2;
  end;
end;

procedure TCalculator.Modulo(Num1, Num2: integer);
begin
  with FResult do
  begin
    Operation := opMod;
    DivRemResult.Divisor := Num1 div Num2;
    DivRemResult.Remainder := Num1 mod Num2;
  end;
end;

end.
