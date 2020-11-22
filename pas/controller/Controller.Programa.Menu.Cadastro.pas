unit Controller.Programa.Menu.Cadastro;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Cadastro;

type
  TControllerProgramaMenuCadastro = class(TControllerProgramaMenu<TFrmCadastro>)
  public
    constructor Create;
  end;

implementation

{ TControllerProgramaMenuCadastro }

constructor TControllerProgramaMenuCadastro.Create;
begin
  oFrmView := TFrmCadastro.Create(nil);
end;

end.
