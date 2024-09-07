program boring_calc;

uses
  Windows,
  SysUtils;

type
  TAddFunctionCalc = function(A, B: integer): integer; stdcall;
  TProcedureCalc = procedure; stdcall;

  { TCalculator }

  TCalculator = class
  private
    FDLLHandle: THandle;
    FAddTwoNumbers: TAddFunctionCalc;
    FPrintAdd: TProcedureCalc;
    function LoadFunction(const AFuncName: string): Pointer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(A, B: integer): integer;
    procedure PrintAdd;
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
  ADLLName = 'libadder_fpc.dll';
begin
  FDLLHandle := LoadLibrary(PChar(ADLLName));
  if FDLLHandle = 0 then
    raise Exception.CreateFmt('Could not load the DLL: %s', [ADLLName]);

  FAddTwoNumbers := TAddFunctionCalc(LoadFunction('AddTwoNumbers'));
  FPrintAdd := TProcedureCalc(LoadFunction('PrintAdd'));
end;

destructor TCalculator.Destroy;
begin
  if FDLLHandle <> 0 then
    FreeLibrary(FDLLHandle);
  inherited;
end;

function TCalculator.Add(A, B: integer): integer;
begin
  Result := FAddTwoNumbers(A, B);
end;

procedure TCalculator.PrintAdd;
begin
  FPrintAdd;
end;

var
  Calculator: TCalculator;
  sum: integer;
begin
  try
    Calculator := TCalculator.Create;
    try
      Sum := Calculator.Add(10, 20);
      WriteLn('10 + 20 = ', Sum);

      Calculator.PrintAdd;
    finally
      Calculator.Free;
    end;
  except
    on E: Exception do
      WriteLn('Error: ', E.Message);
  end;
end.
