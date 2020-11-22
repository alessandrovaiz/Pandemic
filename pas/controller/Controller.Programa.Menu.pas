unit Controller.Programa.Menu;

interface

uses
  Vcl.Forms,
  Vcl.Controls;

type
  IControllerProgramaMenu = interface
    procedure SetParent(const AParent: TWinControl);
    procedure Show;
    procedure Hide;
  end;

  TControllerProgramaMenu<T: TForm> = class(TInterfacedObject, IControllerProgramaMenu)
  protected
    oFrmView: T;
  public
    procedure SetParent(const AParent: TWinControl);
    procedure Show;
    procedure Hide;

    destructor Destroy; override;
  end;

implementation

{ TControllerProgramaMenu }

destructor TControllerProgramaMenu<T>.Destroy;
begin
  oFrmView.Free;
  inherited;
end;

procedure TControllerProgramaMenu<T>.Hide;
begin
  oFrmView.Hide;
end;

procedure TControllerProgramaMenu<T>.SetParent(const AParent: TWinControl);
begin
  oFrmView.Parent := AParent;
end;

procedure TControllerProgramaMenu<T>.Show;
begin
  oFrmView.Show;
end;

end.
