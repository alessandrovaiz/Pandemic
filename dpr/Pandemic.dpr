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
  Controller.Programa.Menu.Ajuda in '..\pas\controller\Controller.Programa.Menu.Ajuda.pas',
  VO.Programa.Menu in '..\pas\vo\VO.Programa.Menu.pas',
  View.Programa.Menu.PEP in '..\pas\view\View.Programa.Menu.PEP.pas' {FrmPEP},
  View.Programa.Menu.Cadastro in '..\pas\view\View.Programa.Menu.Cadastro.pas' {FrmCadastro},
  View.Programa.Menu.Relatorio in '..\pas\view\View.Programa.Menu.Relatorio.pas' {FrmRelatorio},
  View.Programa.Menu.Estatisticas in '..\pas\view\View.Programa.Menu.Estatisticas.pas' {FrmEstatisticas},
  View.Programa.Menu.Ajuda in '..\pas\view\View.Programa.Menu.Ajuda.pas' {FrmAjuda},
  Enum.Margin in '..\pas\enum\Enum.Margin.pas',
  uFormBorderless in '..\pas\view\uFormBorderless.pas' {BorderlessForm},
  DM.Principal in '..\pas\dataModule\DM.Principal.pas' {DMPrincipal: TDataModule},
  Controller.Cadastro.Paciente in '..\pas\controller\Controller.Cadastro.Paciente.pas',
  SplashScreen in '..\pas\utils\SplashScreen.pas' {FrmSplashScreen},
  View.Cadastro.Base in '..\pas\view\View.Cadastro.Base.pas' {FrmCadastroBase},
  View.Cadastro.Paciente in '..\pas\view\View.Cadastro.Paciente.pas' {FrmCadastroPaciente},
  Controller.Cadastro.Base in '..\pas\controller\Controller.Cadastro.Base.pas',
  Utils.Generics in '..\pas\utils\Utils.Generics.pas',
  View.Cadastro.Sintoma in '..\pas\view\View.Cadastro.Sintoma.pas' {FrmCadastroSintoma},
  Controller.Cadastro.Sintoma in '..\pas\controller\Controller.Cadastro.Sintoma.pas',
  View.ListarDados.Base in '..\pas\view\View.ListarDados.Base.pas' {FrmListarDadosBase},
  View.ListarSintomas in '..\pas\view\View.ListarSintomas.pas' {FrmListarSintomas},
  Constantes.Programas in '..\pas\const\Constantes.Programas.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TDMPrincipal, DMPrincipal);
  if (TControllerLogin.Create.Ref.Autenticar) then
    TControllerPrincipal.Create.Ref.Show;

  Application.Run;

end.
