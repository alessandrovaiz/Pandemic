unit Controller.Programa.Menu.Cadastro;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Cadastro;

type
  TControllerProgramaMenuCadastro = class(TControllerProgramaMenu<TFrmCadastro>)
  private
    procedure PacientesClick(Sender: TObject);
  public
    constructor Create;
  end;

implementation

uses
  Controller.Cadastro.Paciente;

{ TControllerProgramaMenuCadastro }

constructor TControllerProgramaMenuCadastro.Create;
begin
  oFrmView := TFrmCadastro.Create(nil);
  oFrmView.BtnPacientes.OnClick := PacientesClick;
end;

procedure TControllerProgramaMenuCadastro.PacientesClick(Sender: TObject);
begin
  oControladorFilho := TControllerCadastroPaciente.Create(Self);
  oControladorFilho.SetParent(oFrmView.Parent);

  oFrmView.Hide;
  oControladorFilho.Show;
end;

end.
