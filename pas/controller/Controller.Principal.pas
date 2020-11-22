unit Controller.Principal;

interface

uses
  Vcl.Forms,
  Controller.Base,
  View.Principal;

type
  TControllerPrincipal = class(TControllerBase<TFrmPrincipal>)
  public
    procedure Show; override;
    constructor Create;
  end;

implementation

{ TControllerPrincipal }

constructor TControllerPrincipal.Create;
begin
  Application.CreateForm(TFrmPrincipal, oFrmView);
end;

procedure TControllerPrincipal.Show;
begin
  oFrmView.Show;
end;

end.
