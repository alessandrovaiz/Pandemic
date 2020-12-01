unit Controller.Principal;

interface

uses
  Vcl.Forms,
  Controller.Base,
  View.Principal,
  VO.Programa.Menu;

type
  TControllerPrincipal = class(TControllerBase<TFrmPrincipal>)
  private
    oListaProgramaMenu: TListaProgramaMenu;

    { Metodo Especificos }
    procedure MontarMenu;

    { Eventos Formulario }
    procedure BtnSairClick(Sender: TObject);
    procedure BtnMinimizarClick(Sender: TObject);
    procedure BtnItemMenuClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  public
    procedure Show; override;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  Enum.Programas,
  Singleton.Usuario,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Graphics,
  Enum.Margin,
  Controller.Programa.Menu;

{ TControllerPrincipal }

procedure TControllerPrincipal.BtnItemMenuClick(Sender: TObject);
var
  oEPrograma: TEnumProgramas;
begin
  oEPrograma := TEnumProgramas(TSpeedButton(Sender).Tag);

  if (oEPrograma <> tpNenhum) then
    oListaProgramaMenu.MostrarPrograma(oEPrograma);

  FormResize(nil);
end;

procedure TControllerPrincipal.BtnMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TControllerPrincipal.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

constructor TControllerPrincipal.Create;
begin
  Application.CreateForm(TFrmPrincipal, oFrmView);

  oFrmView.BtnSair.OnClick := BtnSairClick;
  oFrmView.BtnFechar.OnClick := BtnSairClick;
  oFrmView.BtnMaximizar.OnClick := oFrmView.MaximizeClick;

  oFrmView.LblNomePrograma.OnDblClick := oFrmView.MaximizeClick;
  oFrmView.LblNomeApp.OnDblClick := oFrmView.MaximizeClick;
  oFrmView.LblNomePrograma.OnMouseDown := oFrmView.TitleBarMouseDown;
  oFrmView.LblNomeApp.OnMouseDown := oFrmView.TitleBarMouseDown;

  oFrmView.BtnMinimizar.OnClick := BtnMinimizarClick;

  oFrmView.OnResize := FormResize;
  oListaProgramaMenu := TListaProgramaMenu.Create;
  MontarMenu;
end;

destructor TControllerPrincipal.Destroy;
begin
  oListaProgramaMenu.Free;
  inherited;
end;

procedure TControllerPrincipal.FormResize(Sender: TObject);
var
  oControllerAtivo: IControllerProgramaMenu;
begin
  oControllerAtivo := oListaProgramaMenu.ControladorAtivo;

  oFrmView.PnlNomePrograma.Width := oFrmView.Width - oFrmView.PnlHeaderMenu.Width;

  if (not(Assigned(oControllerAtivo))) then
    Exit;

  if (oFrmView.PnlPrograma.Width > 675) or (oFrmView.PnlPrograma.Height > 453) then
  begin
    oControllerAtivo.SetMargin(tmgLeft, (oFrmView.PnlPrograma.ClientWidth - 675) div 2);
    oControllerAtivo.SetMargin(tmgRight, (oFrmView.PnlPrograma.ClientWidth - 675) div 2);
    oControllerAtivo.SetMargin(tmgTop, (oFrmView.PnlPrograma.ClientHeight - 453) div 2);
    oControllerAtivo.SetMargin(tmgBot, (oFrmView.PnlPrograma.ClientHeight - 453) div 2);
  end
  else
  begin
    oControllerAtivo.SetMargin(tmgLeft, 0);
    oControllerAtivo.SetMargin(tmgRight, 0);
    oControllerAtivo.SetMargin(tmgTop, 0);
    oControllerAtivo.SetMargin(tmgBot, 0);
  end;
end;

procedure TControllerPrincipal.MontarMenu;

  function GetPanelMenu(const APrograma: TEnumProgramas): TPanel;
  begin
    Result := TPanel.Create(oFrmView);
    Result.Parent := oFrmView.PnlMenu;
    Result.ShowCaption := False;
    Result.Name := 'Pnl' + APrograma.GetName;
    Result.Left := 0;
    Result.Width := 165;
    Result.Height := 41;
    Result.Align := alTop;
    Result.BevelOuter := bvNone;
    Result.Color := $00E4EAED;
    Result.ParentBackground := False;
    Result.BringToFront;
  end;

  function GetBotaoMenu(const APrograma: TEnumProgramas; const APanel: TPanel): TSpeedButton;
  begin
    Result := TSpeedButton.Create(oFrmView);
    Result.Parent := APanel;
    Result.Name := 'Btn' + APrograma.GetName;
    Result.Left := 0;
    Result.Top := 0;
    Result.Align := alClient;
    Result.Caption := APrograma.GetCaption;
    Result.Flat := True;
    Result.Font.Color := $00706601;
    Result.Font.Height := -15;
    Result.Font.Name := 'Segoe UI';
    Result.Font.Style := [fsBold];
    Result.ParentFont := False;
    Result.Tag := Integer(APrograma);
    Result.OnClick := BtnItemMenuClick;
    Result.BringToFront;
  end;

var
  oEPrograma: TEnumProgramas;
  oProgramaMenu: TProgramaMenu;
begin
  for oEPrograma in TClassEnumProgramas.GetProgramasPorPermissao(oSingletonUsuario.PermissaoUsuario) do
  begin
    oProgramaMenu := TProgramaMenu.Create;
    oProgramaMenu.Programa := oEPrograma;
    oProgramaMenu.PanelMenuPrograma := GetPanelMenu(oEPrograma);
    oProgramaMenu.BotaoMenuPrograma := GetBotaoMenu(oEPrograma, oProgramaMenu.PanelMenuPrograma);
    oProgramaMenu.LabellTituloPrograma := oFrmView.LblNomePrograma;
    oProgramaMenu.Controlador := oEPrograma.GetControladorPrograma;
    oProgramaMenu.Controlador.SetParent(oFrmView.PnlPrograma);

    oListaProgramaMenu.Add(oProgramaMenu);
  end;

  oListaProgramaMenu.First.Selecionado := True;
end;

procedure TControllerPrincipal.Show;
begin
  oFrmView.Show;
end;

end.
