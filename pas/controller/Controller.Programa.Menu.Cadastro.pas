unit Controller.Programa.Menu.Cadastro;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Cadastro;

type
  TControllerProgramaMenuCadastro = class(TControllerProgramaMenu<TFrmCadastro>)
  private
    procedure AbrirCadastro(const AControladorFilho: IControllerProgramaMenu);

    procedure PacientesClick(Sender: TObject);
    procedure SintomasClick(Sender: TObject);
  public
    constructor Create;
  end;

implementation

uses
  Controller.Cadastro.Paciente,
  Controller.Cadastro.Sintoma;

{ TControllerProgramaMenuCadastro }

procedure TControllerProgramaMenuCadastro.AbrirCadastro(const AControladorFilho: IControllerProgramaMenu);
begin
  oControladorFilho := AControladorFilho;
  oControladorFilho.SetParent(oFrmView.Parent);
  oControladorFilho.SetMethodFormResize(OnResize);

  oFrmView.Hide;
  oControladorFilho.Show;
end;

constructor TControllerProgramaMenuCadastro.Create;
begin
  oFrmView := TFrmCadastro.Create(nil);
  oFrmView.BtnPacientes.OnClick := PacientesClick;
  oFrmView.BtnSintomas.OnClick := SintomasClick;
end;

procedure TControllerProgramaMenuCadastro.PacientesClick(Sender: TObject);
begin
  AbrirCadastro(TControllerCadastroPaciente.Create(Self));
end;

procedure TControllerProgramaMenuCadastro.SintomasClick(Sender: TObject);
begin
  AbrirCadastro(TControllerCadastroSintoma.Create(Self));
end;

end.
