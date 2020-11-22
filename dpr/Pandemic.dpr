program Pandemic;

uses
  Vcl.Forms,
  View.Principal in '..\pas\view\View.Principal.pas' {FrmPrincipal},
  View.Login in '..\pas\view\View.Login.pas' {FrmLogin},
  Controller.Login in '..\pas\controller\Controller.Login.pas',
  Controller.Base in '..\pas\controller\Controller.Base.pas',
  Controller.Principal in '..\pas\controller\Controller.Principal.pas',
  Enum.Permissao.Usuario in '..\pas\enum\Enum.Permissao.Usuario.pas',
  Singleton.Usuario in '..\pas\singleton\Singleton.Usuario.pas',
  Enum.Programas in '..\pas\enum\Enum.Programas.pas',
  Controller.Programa.Menu in '..\pas\controller\Controller.Programa.Menu.pas',
  Controller.Programa.Menu.PEP in '..\pas\controller\Controller.Programa.Menu.PEP.pas',
  Controller.Programa.Menu.Cadastro in '..\pas\controller\Controller.Programa.Menu.Cadastro.pas',
  Controller.Programa.Menu.Relatorio in '..\pas\controller\Controller.Programa.Menu.Relatorio.pas',
  Controller.Programa.Menu.Estatistica in '..\pas\controller\Controller.Programa.Menu.Estatistica.pas',
  Controller.Programa.Menu.Ajuda in '..\pas\controller\Controller.Programa.Menu.Ajuda.pas';

{$R *.res}

begin
  Application.Initialize;

  if (TControllerLogin.Create.Ref.Autenticar) then
    TControllerPrincipal.Create.Ref.Show;

  Application.Run;
end.
