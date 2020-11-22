unit Controller.Programa.Menu.Estatistica;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Estatisticas;

type
  TControllerProgramaMenuEstatistica = class(TControllerProgramaMenu<TFrmEstatisticas>)
  public
    constructor Create;
  end;

implementation

{ TControllerProgramaMenuEstatistica }

constructor TControllerProgramaMenuEstatistica.Create;
begin
  oFrmView := TFrmEstatisticas.Create(nil);
end;

end.
