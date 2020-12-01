unit Controller.Cadastro.Paciente;

interface

uses
  Controller.Cadastro.Base,
  View.Cadastro.Paciente,
  Controller.Programa.Menu;

type
  TControllerCadastroPaciente = class(TControllerCadastroBase<TFrmCadastroPaciente>)
  public
    constructor Create(const AControladorPai: IControllerProgramaMenu); override;
  end;

implementation

{ TControllerCadastroPaciente }

constructor TControllerCadastroPaciente.Create(const AControladorPai: IControllerProgramaMenu);
begin
  oFrmView := TFrmCadastroPaciente.Create(nil);
  inherited Create(AControladorPai);
end;

end.
