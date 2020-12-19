unit Controller.Programa.Menu.PEP;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.PEP;

type
  TControllerProgramaMenuPEP = class(TControllerProgramaMenu<TFrmPEP>)
  public
    constructor Create;
  end;

implementation

{ TControllerProgramaMenuPEP }

constructor TControllerProgramaMenuPEP.Create;
begin
  oFrmView := TFrmPEP.Create(nil);
end;

end.
