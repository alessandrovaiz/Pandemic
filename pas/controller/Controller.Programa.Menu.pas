unit Controller.Programa.Menu;

interface

type
  IControllerProgramaMenu = interface
    procedure Show;
  end;

  TControllerProgramaMenu = class(TInterfacedObject, IControllerProgramaMenu)
  public
    procedure Show;
  end;

implementation

{ TControllerProgramaMenu }

procedure TControllerProgramaMenu.Show;
begin

end;

end.
