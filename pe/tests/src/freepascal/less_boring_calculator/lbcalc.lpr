program lbcalc;

uses
  Windows,
  SysUtils;

type
  TArithmeticOperation = (opAdd, opSubtract, opMultiply, opDivide, opMod);

  TFunctionCalc = function(A, B: integer; op: TArithmeticOperation): integer; stdcall;

  { TCalculator }

  TCalculator = class
  private
    FDLLHandle: THandle;
    FCalculate: TFunctionCalc;
    function LoadFunction(const AFuncName: string): Pointer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(A, B: integer): integer;
    function Subtract(A, B: integer): integer;
    function Multiply(A, B: integer): integer;
    function Divide(A, B: integer): integer;
    function Modulo(A, B: integer): integer;
  end;

{ TCalculator }
function TCalculator.LoadFunction(const AFuncName: string): Pointer;
begin
  Result := GetProcAddress(FDLLHandle, PChar(AFuncName));
  if not Assigned(Result) then
    raise Exception.CreateFmt('Could not find function: %s', [AFuncName]);
end;

constructor TCalculator.Create;
const
  ADLLName = 'libcalc_fpc.dll';
begin
  FDLLHandle := LoadLibrary(PChar(ADLLName));
  if FDLLHandle = 0 then
    raise Exception.CreateFmt('Could not load the DLL: %s', [ADLLName]);

  try
    FCalculate := TFunctionCalc(LoadFunction('Calculate'));
  except
    FreeLibrary(FDLLHandle);
    raise;
  end;
end;

destructor TCalculator.Destroy;
begin
  if FDLLHandle <> 0 then
    FreeLibrary(FDLLHandle);
  inherited;
end;

function TCalculator.Add(A, B: integer): integer;
begin
  Result := FCalculate(A, B, opAdd);
end;

function TCalculator.Subtract(A, B: integer): integer;
begin
  Result := FCalculate(A, B, opSubtract);
end;

function TCalculator.Multiply(A, B: integer): integer;
begin
  Result := FCalculate(A, B, opMultiply);
end;

function TCalculator.Divide(A, B: integer): integer;
begin
  if B = 0 then
    raise Exception.Create('Division by zero.');
  Result := FCalculate(A, B, opDivide);
end;

function TCalculator.Modulo(A, B: integer): integer;
begin
  if B = 0 then
    raise Exception.Create('Modulus by zero.');
  Result := FCalculate(A, B, opMod);
end;

var
  Calculator: TCalculator;
  A, B: integer;
begin
  A := 20;
  B := 10;
  try
    Calculator := TCalculator.Create;
    try
      Writeln(Format('%d + %d = %d', [A, B, Calculator.Add(A, B)]));
      Writeln(Format('%d - %d = %d', [A, B, Calculator.Subtract(A, B)]));
      Writeln(Format('%d * %d = %d', [A, B, Calculator.Multiply(A, B)]));
      Writeln(Format('%d div %d = %d', [A, B, Calculator.Divide(A, B)]));
      Writeln(Format('%d mod %d = %d', [A, B, Calculator.Modulo(A, B)]));
    finally
      Calculator.Free;
    end;
  except
    on E: Exception do
      WriteLn('Error: ', E.Message);
  end;
end.
