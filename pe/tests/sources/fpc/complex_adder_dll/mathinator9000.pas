unit mathinator9000;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

function Add(A, B: integer): integer;
function Sub(A, B: integer): integer;
function Mul(A, B: integer): integer;

implementation

function Add(A, B: integer): integer;
begin
  Result := A + B;
end;

function Sub(A, B: integer): integer;
begin
  Result := A - B;
end;

function Mul(A, B: integer): integer;
begin
  Result := A * B;
end;

end.
