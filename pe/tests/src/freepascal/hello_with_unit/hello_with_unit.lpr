program hello_with_unit;

{$mode objfpc}{$H+}{$J-}

uses
  uGreeter;

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
