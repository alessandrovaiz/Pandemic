unit Controller.Programa.Menu;

interface

uses
  Vcl.Forms,
  Vcl.Controls,
  Enum.Margin;

type
  IControllerProgramaMenu = interface
    procedure SetParent(const AParent: TWinControl);
    procedure Show;
    procedure Hide;
    procedure SetHeight(const AHeight: Integer);
    procedure SetWidth(const AWidth: Integer);
    procedure SetMargin(const AMargin: TEnumMargin; const ATamanho: Integer);

    function Height: Integer;
    function Width: Integer;
    function GetControladorFilho: IControllerProgramaMenu;
  end;

  TControllerProgramaMenu<T: TForm> = class(TInterfacedObject, IControllerProgramaMenu)
  protected
    oFrmView: T;
    oControladorFilho: IControllerProgramaMenu;
  public
    procedure SetParent(const AParent: TWinControl);
    procedure SetHeight(const AHeight: Integer);
    procedure SetWidth(const AWidth: Integer);
    procedure SetMargin(const AMargin: TEnumMargin; const ATamanho: Integer);

    procedure Show;
    procedure Hide;

    function Height: Integer;
    function Width: Integer;
    function GetControladorFilho: IControllerProgramaMenu;

    destructor Destroy; override;
  end;

implementation

{ TControllerProgramaMenu }

destructor TControllerProgramaMenu<T>.Destroy;
begin
  oFrmView.Free;
  inherited;
end;

function TControllerProgramaMenu<T>.GetControladorFilho: IControllerProgramaMenu;
begin
  Result := oControladorFilho;
end;

function TControllerProgramaMenu<T>.Height: Integer;
begin
  Result := oFrmView.Height;
end;

procedure TControllerProgramaMenu<T>.Hide;
begin
  if (Assigned(oControladorFilho)) then
  begin
    oControladorFilho.Hide;
    oControladorFilho := Nil;
  end;

  oFrmView.Hide;
end;

procedure TControllerProgramaMenu<T>.SetHeight(const AHeight: Integer);
begin
  oFrmView.Height := Height;
end;

procedure TControllerProgramaMenu<T>.SetMargin(const AMargin: TEnumMargin; const ATamanho: Integer);
begin
  case AMargin of
    tmgLeft:
      oFrmView.Margins.Left := ATamanho;
    tmgRight:
      oFrmView.Margins.Right := ATamanho;
    tmgTop:
      oFrmView.Margins.Top := ATamanho;
    tmgBot:
      oFrmView.Margins.Bottom := ATamanho;
  end;
end;

procedure TControllerProgramaMenu<T>.SetParent(const AParent: TWinControl);
begin
  oFrmView.Parent := AParent;
end;

procedure TControllerProgramaMenu<T>.SetWidth(const AWidth: Integer);
begin
  oFrmView.Width := AWidth;
end;

procedure TControllerProgramaMenu<T>.Show;
begin
  if (Assigned(oControladorFilho)) then
  begin
    oControladorFilho.Hide;
    oControladorFilho := Nil;
  end;

  oFrmView.Show;
end;

function TControllerProgramaMenu<T>.Width: Integer;
begin
  Result := oFrmView.Width;
end;

end.
