program hello_with_unit;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  uGreeter in 'uGreeter.pas';

var
  Name: string;

begin
  Name := 'Test';

  Greet('Mike');
  Greet('Bob');
  Greet(Name);

  Name := 'Blaise';
  Greet(Name);
  Greet('Blaise');

end.
