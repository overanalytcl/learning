program delphi_empty_fmx;

uses
  System.StartUpCopy,
  FMX.Forms,
  empty_fmx_gui in 'empty_fmx_gui.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
