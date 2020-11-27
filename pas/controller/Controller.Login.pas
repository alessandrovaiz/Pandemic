unit Controller.Login;

interface

uses
  Vcl.Forms,
  View.Login,
  Classes,
  Vcl.Dialogs,
  Windows;

type
  IControllerLogin = interface
    function Autenticar: Boolean;
  end;

  TControllerLogin = class(TInterfacedObject, IControllerLogin)
  private
    oFrmLogin: TFrmLogin;

    procedure CloseClick(Sender: TObject);
    procedure LoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    function Ref: IControllerLogin;
    function Autenticar: Boolean;

    constructor Create;
  end;

implementation

uses
  System.SysUtils,
  Singleton.Usuario,
  Enum.Permissao.Usuario,
  DMprincipal;

{ TControllerLogin }

function TControllerLogin.Autenticar: Boolean;
begin
  oFrmLogin.ShowModal;
  Result := oSingletonUsuario.IdUsuario > 0;
end;

procedure TControllerLogin.CloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

constructor TControllerLogin.Create;
begin
  oFrmLogin := TFrmLogin.Create(nil);
  oFrmLogin.lblStatus.Visible := False;

  oFrmLogin.OnClose := FormClose;
  oFrmLogin.OnKeyDown := FormKeyDown;
  oFrmLogin.BtnFechar.OnClick := CloseClick;
  oFrmLogin.BtnCancelar.OnClick := CloseClick;
  oFrmLogin.BtnEntrar.OnClick := LoginClick;
end;

procedure TControllerLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TControllerLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    oFrmLogin.BtnEntrar.Click;
end;

procedure TControllerLogin.LoginClick(Sender: TObject);
begin
  if (oFrmLogin.EdtNomeUsuario.Text = EmptyStr) or (oFrmLogin.EdtSenha.Text = EmptyStr) then
  begin
    oFrmLogin.lblStatus.Caption := '*Preencha todos os campos.';
    oFrmLogin.lblStatus.Visible := True;
    Exit;
  end;

  DM.FDQuery.SQL.Clear;

  try

    DM.FDQuery.SQL.Text := 'SELECT  count(*) as counter FROM users WHERE ema_usr = ' + QuotedStr(oFrmLogin.EdtNomeUsuario.Text) + 'AND pas_usr = ' + QuotedStr(oFrmLogin.EdtSenha.Text) + ';';
    DM.FDQuery.Active := True;

    if DM.FDQuery.FieldByName('counter').AsInteger = 1 then
    begin
      oSingletonUsuario.IdUsuario := 1;
      oSingletonUsuario.PermissaoUsuario := tpuAdministrador;
      oFrmLogin.Close;
    end
    else
    begin
      oFrmLogin.lblStatus.Caption := '*Usúario ou senha inválida.';
      oFrmLogin.lblStatus.Visible := True;
    end;
  finally
    DM.FDQuery.Active := False;
  end;
end;

function TControllerLogin.Ref: IControllerLogin;
begin
  Result := Self;
end;

end.
