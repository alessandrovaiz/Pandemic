program Pandemic;

uses
  Vcl.Forms,
  View.Principal in '..\pas\view\View.Principal.pas' {FrmPrincipal} ,
  View.Login in '..\pas\view\View.Login.pas' {FrmLogin} ,
  Controller.Login in '..\pas\controller\Controller.Login.pas',
  Controller.Base in '..\pas\controller\Controller.Base.pas',
  Controller.Principal in '..\pas\controller\Controller.Principal.pas';

{$R *.res}

begin
  Application.Initialize;

  if (TControllerLogin.Create.Ref.Autenticar) then
    TControllerPrincipal.Create.Ref.Show;

  Application.Run;
end.
