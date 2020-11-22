unit Controller.Base;

interface

uses
  Vcl.Forms;

type
  IControllerBase = interface
    procedure Show;
  end;

  TControllerBase<T: TForm> = class(TInterfacedObject, IControllerBase)
  protected
    oFrmView: T;

  public
    function Ref: IControllerBase;
    procedure Show; virtual;

    destructor Destroy; override;
  end;

implementation

{ TControllerBase<T> }

destructor TControllerBase<T>.Destroy;
begin
  oFrmView.Free;
  inherited;
end;

function TControllerBase<T>.Ref: IControllerBase;
begin
  Result := Self;
end;

procedure TControllerBase<T>.Show;
begin
  oFrmView.ShowModal;
end;

end.
