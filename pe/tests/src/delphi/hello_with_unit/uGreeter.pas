unit uGreeter;

interface

uses
  System.SysUtils;

procedure Greet(const AStr: string);

implementation

procedure Greet(const AStr: string);
begin
  Writeln(Format('Hello, %s!', [AStr]));
end;

end.
