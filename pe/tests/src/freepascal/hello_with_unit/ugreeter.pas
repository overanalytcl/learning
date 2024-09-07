unit uGreeter;

{$mode ObjFPC}{$H+}

interface

uses
  SysUtils;

procedure Greet(const AStr: string);

implementation

procedure Greet(const AStr: string);
begin
  Writeln(Format('Hello, %s!', [AStr]));
end;

end.
