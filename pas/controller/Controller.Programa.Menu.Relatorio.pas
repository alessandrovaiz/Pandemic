unit Controller.Programa.Menu.Relatorio;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Relatorio;

type
  TControllerProgramaMenuRelatorio = class(TControllerProgramaMenu<TFrmRelatorio>)
  public
    constructor Create;
  end;

implementation

{ TControllerProgramaMenuRelatorio }

constructor TControllerProgramaMenuRelatorio.Create;
begin
  oFrmView := TFrmRelatorio.Create(nil);
end;

end.
