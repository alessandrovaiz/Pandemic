unit Controller.Programa.Menu.Ajuda;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Ajuda;

type
  TControllerProgramaMenuAjuda = class(TControllerProgramaMenu<TFrmAjuda>)
  public
    constructor Create;
  end;

implementation

{ TControllerProgramaMenuEstatistica }

constructor TControllerProgramaMenuAjuda.Create;
begin
  oFrmView := TFrmAjuda.Create(nil);
end;

end.
