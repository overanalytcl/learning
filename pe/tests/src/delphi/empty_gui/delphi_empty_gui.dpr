program delphi_empty_gui;

uses
  Vcl.Forms,
  empty_gui in 'empty_gui.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
