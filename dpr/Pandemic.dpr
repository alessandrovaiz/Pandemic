program Pandemic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in '..\view\uPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
