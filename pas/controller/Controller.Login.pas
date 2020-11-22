unit Controller.Login;

interface

uses
  Vcl.Forms,
  View.Login,
  Classes,
  Windows;

type
  IControllerLogin = interface
    function Autenticar: Boolean;
  end;

  TControllerLogin = class(TInterfacedObject, IControllerLogin)
  private
    oFrmLogin: TFrmLogin;
    bAutenticado: Boolean;

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
  System.SysUtils;

{ TControllerLogin }

function TControllerLogin.Autenticar: Boolean;
begin
  oFrmLogin.ShowModal;
  Result := bAutenticado;
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
  if (oFrmLogin.EdtNomeUsuario.Text = EmptyStr) and (oFrmLogin.EdtSenha.Text = EmptyStr) then
  begin
    oFrmLogin.lblStatus.Caption := '*Preencha todos os campos.';
    oFrmLogin.lblStatus.Visible := True;
    Exit;
  end;

  { Validar informacoes com o banco }
  if (oFrmLogin.EdtNomeUsuario.Text = 'admin') and (oFrmLogin.EdtSenha.Text = 'admin') then
  begin
    bAutenticado := True;
    oFrmLogin.Close;
  end
  else
  begin
    oFrmLogin.lblStatus.Caption := '*Usúario ou senha inválida.';
    oFrmLogin.lblStatus.Visible := True;
  end;
end;

function TControllerLogin.Ref: IControllerLogin;
begin
  Result := Self;
end;

end.
