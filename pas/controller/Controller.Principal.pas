unit Controller.Principal;

interface

uses
  Vcl.Forms,
  Controller.Base,
  View.Principal,
  VO.Programa.Menu,
  System.Generics.Collections;

type
  TControllerPrincipal = class(TControllerBase<TFrmPrincipal>)
  private
    oListaProgramaMenu: TListaProgramaMenu;

    { Metodo Especificos }
    procedure MontarMenu;
    procedure ImportarDadosIBGE;
    procedure InserirRegioes(const ADicRegioes: TDictionary<String, Integer>);
    procedure InserirEstados(const ADicRegioes, ADicEstados: TDictionary<String, Integer>);
    procedure InserirCidades(const ADicEstados: TDictionary<String, Integer>);

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
  Controller.Programa.Menu,
  Constantes.Programas,
  DM.Principal,
  SplashScreen,
  System.JSON,
  System.SysUtils;

const
  API_IBGE = 'https://servicodados.ibge.gov.br/api/v1/localidades/';

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
  ImportarDadosIBGE;

  oFrmView.Constraints.MinHeight := ProgramaMenuHeight + oFrmView.PnlHeader.Height + 20;
  oFrmView.Constraints.MinWidth := ProgramaMenuWidth + oFrmView.PnlMenu.Width + 20;
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

  if (oFrmView.PnlPrograma.Width > ProgramaMenuWidth) or (oFrmView.PnlPrograma.Height > ProgramaMenuHeight) then
  begin
    oControllerAtivo.SetMargin(tmgLeft, (oFrmView.PnlPrograma.ClientWidth - ProgramaMenuWidth) div 2);
    oControllerAtivo.SetMargin(tmgRight, (oFrmView.PnlPrograma.ClientWidth - ProgramaMenuWidth) div 2);
    oControllerAtivo.SetMargin(tmgTop, (oFrmView.PnlPrograma.ClientHeight - ProgramaMenuHeight) div 2);
    oControllerAtivo.SetMargin(tmgBot, (oFrmView.PnlPrograma.ClientHeight - ProgramaMenuHeight) div 2);
  end
  else
  begin
    oControllerAtivo.SetMargin(tmgLeft, 0);
    oControllerAtivo.SetMargin(tmgRight, 0);
    oControllerAtivo.SetMargin(tmgTop, 0);
    oControllerAtivo.SetMargin(tmgBot, 0);
  end;
end;

procedure TControllerPrincipal.ImportarDadosIBGE;
var
  oDicRegioes: TDictionary<String, Integer>;
  oDicEstados: TDictionary<String, Integer>;
begin
  DMPrincipal.FDQuery.SQL.Clear;
  DMPrincipal.FDQuery.SQL.Add('select count(*) counter from state');
  DMPrincipal.FDQuery.Active := True;

  oDicEstados := TDictionary<String, Integer>.Create;
  oDicRegioes := TDictionary<String, Integer>.Create;
  try
    if (DMPrincipal.FDQuery.FieldByName('counter').AsInteger = 0) then
    begin
      DMPrincipal.FDQuery.Active := False;

      InserirRegioes(oDicRegioes);
      InserirEstados(oDicRegioes, oDicEstados);
      InserirCidades(oDicEstados);
    end;
  finally
    oDicEstados.Free;
    oDicRegioes.Free;
  end;
end;

procedure TControllerPrincipal.InserirCidades(const ADicEstados: TDictionary<String, Integer>);
var
  oResponseJSON: TJSONValue;
  oResponseJSONArray: TJSONArray;
  oArrayElement: TJSONValue;
  i: Integer;
begin
  oFrmView.RESTClient1.BaseURL := API_IBGE + '/municipios';
  oFrmView.RESTRequest1.Params.Clear;
  oFrmView.RESTRequest1.Resource := '';

  TSplashScreen.Mostrar;
  oFrmView.RESTRequest1.Execute;
  oResponseJSON := TJSONObject.ParseJSONValue(oFrmView.RESTResponse1.Content.Trim);

  try
    oResponseJSONArray := oResponseJSON.GetValue<TJSONArray>;

    DMPrincipal.FDQueryInsert.SQL.Text := 'insert into city (NAM_CIT,ID_STA) values (:NamCit,:IdSta)';
    DMPrincipal.FDQueryInsert.Params.ArraySize := oResponseJSONArray.Count;

    for i := 0 to Pred(oResponseJSONArray.Count) do
    begin
      oArrayElement := oResponseJSONArray.Items[i];

      DMPrincipal.FDQueryInsert.Params.ParamByName('NamCit').AsStrings[i] := oArrayElement.GetValue<String>('nome');
      DMPrincipal.FDQueryInsert.Params.ParamByName('IdSta').AsIntegers[i] := ADicEstados[oArrayElement.GetValue<TJSONValue>('microrregiao').GetValue<TJSONValue>('mesorregiao')
        .GetValue<TJSONValue>('UF').GetValue<String>('sigla')];
    end;

    DMPrincipal.FDQueryInsert.Execute(DMPrincipal.FDQueryInsert.Params.ArraySize);
  finally
    oResponseJSON.Free;
    TSplashScreen.Esconder;
  end;
end;

procedure TControllerPrincipal.InserirEstados(const ADicRegioes, ADicEstados: TDictionary<String, Integer>);

  function GetIdEstado: Integer;
  begin
    DMPrincipal.FDQuery.SQL.Clear;
    DMPrincipal.FDQuery.SQL.Add('select nextval(''state_id_sta_seq''::regclass) id');
    DMPrincipal.FDQuery.Active := True;
    try
      Result := DMPrincipal.FDQuery.FieldByName('id').AsInteger;
    finally
      DMPrincipal.FDQuery.Active := False;
    end;
  end;

var
  oResponseJSON: TJSONValue;
  oResponseJSONArray: TJSONArray;
  oArrayElement: TJSONValue;
  i: Integer;
begin
  oFrmView.RESTClient1.BaseURL := API_IBGE + '/estados';
  oFrmView.RESTRequest1.Params.Clear;
  oFrmView.RESTRequest1.Resource := '';

  TSplashScreen.Mostrar;
  oFrmView.RESTRequest1.Execute;
  oResponseJSON := TJSONObject.ParseJSONValue(oFrmView.RESTResponse1.Content.Trim);

  try
    oResponseJSONArray := oResponseJSON.GetValue<TJSONArray>;

    DMPrincipal.FDQueryInsert.SQL.Text := 'insert into STATE (ID_STA,NAM_STA,INI_STA,COU_STA,ID_REG) values (:IdSta,:NamSta,:InitSta,''BR'',:IdReg)';
    DMPrincipal.FDQueryInsert.Params.ArraySize := oResponseJSONArray.Count;

    for i := 0 to Pred(oResponseJSONArray.Count) do
    begin
      oArrayElement := oResponseJSONArray.Items[i];

      ADicEstados.Add(oArrayElement.GetValue<String>('sigla'), GetIdEstado);
      DMPrincipal.FDQueryInsert.Params.ParamByName('IdSta').AsIntegers[i] := ADicEstados[oArrayElement.GetValue<String>('sigla')];
      DMPrincipal.FDQueryInsert.Params.ParamByName('NamSta').AsStrings[i] := oArrayElement.GetValue<String>('nome');
      DMPrincipal.FDQueryInsert.Params.ParamByName('InitSta').AsStrings[i] := oArrayElement.GetValue<String>('sigla');
      DMPrincipal.FDQueryInsert.Params.ParamByName('IdReg').AsIntegers[i] := ADicRegioes[oArrayElement.GetValue<TJSONValue>('regiao').GetValue<String>('sigla')];
    end;

    DMPrincipal.FDQueryInsert.Execute(DMPrincipal.FDQueryInsert.Params.ArraySize);
  finally
    oResponseJSON.Free;
    TSplashScreen.Esconder;
  end;
end;

procedure TControllerPrincipal.InserirRegioes(const ADicRegioes: TDictionary<String, Integer>);

  function GetIdRegiao: Integer;
  begin
    DMPrincipal.FDQuery.SQL.Clear;
    DMPrincipal.FDQuery.SQL.Add('select nextval(''region_id_reg_seq''::regclass) id');
    DMPrincipal.FDQuery.Active := True;
    try
      Result := DMPrincipal.FDQuery.FieldByName('id').AsInteger;
    finally
      DMPrincipal.FDQuery.Active := False;
    end;
  end;

var
  oResponseJSON: TJSONValue;
  oResponseJSONArray: TJSONArray;
  oArrayElement: TJSONValue;
  i: Integer;
begin
  oFrmView.RESTClient1.BaseURL := API_IBGE + '/regioes';
  oFrmView.RESTRequest1.Params.Clear;
  oFrmView.RESTRequest1.Resource := '';

  TSplashScreen.Mostrar;
  oFrmView.RESTRequest1.Execute;
  oResponseJSON := TJSONObject.ParseJSONValue(oFrmView.RESTResponse1.Content.Trim);

  try
    oResponseJSONArray := oResponseJSON.GetValue<TJSONArray>;

    DMPrincipal.FDQueryInsert.SQL.Text := 'insert into REGION (ID_REG,NAM_REG) values (:IdReg, :NamReg)';
    DMPrincipal.FDQueryInsert.Params.ArraySize := oResponseJSONArray.Count;

    for i := 0 to Pred(oResponseJSONArray.Count) do
    begin
      oArrayElement := oResponseJSONArray.Items[i];

      ADicRegioes.Add(oArrayElement.GetValue<String>('sigla'), GetIdRegiao);
      DMPrincipal.FDQueryInsert.Params.ParamByName('IdReg').AsIntegers[i] := ADicRegioes[oArrayElement.GetValue<String>('sigla')];
      DMPrincipal.FDQueryInsert.Params.ParamByName('NamReg').AsStrings[i] := oArrayElement.GetValue<String>('nome');
    end;

    DMPrincipal.FDQueryInsert.Execute(DMPrincipal.FDQueryInsert.Params.ArraySize);
  finally
    oResponseJSON.Free;
    TSplashScreen.Esconder;
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
    oProgramaMenu.Controlador.SetMethodFormResize(FormResize);

    oListaProgramaMenu.Add(oProgramaMenu);
  end;

  oListaProgramaMenu.First.Selecionado := True;
end;

procedure TControllerPrincipal.Show;
begin
  oFrmView.Show;
end;

end.
