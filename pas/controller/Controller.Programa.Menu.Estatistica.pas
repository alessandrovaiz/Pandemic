unit Controller.Programa.Menu.Estatistica;

interface

uses
  Controller.Programa.Menu,
  View.Programa.Menu.Estatisticas,
  Classes;

type
  TControllerProgramaMenuEstatistica = class(TControllerProgramaMenu<TFrmEstatisticas>)
  private
    procedure AlimentarComboBoxPaises;

    procedure FormShow(Sender: TObject);
    procedure ProcurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor Create;
  end;

implementation

uses
  System.SysUtils,
  System.JSON,
  Vcl.Dialogs,
  SplashScreen,
  Winapi.Windows;

const
  API_URL = 'https://covid19-brazil-api.now.sh/api/report/v1';

  { TControllerProgramaMenuEstatistica }

procedure TControllerProgramaMenuEstatistica.AlimentarComboBoxPaises;
var
  oResponseJSON: TJSONValue;
  oResponseJSONArray: TJSONArray;
  oArrayElement: TJSONValue;
begin
  oFrmView.PnlInformacoes.Visible := False;
  oFrmView.RESTClient1.BaseURL := API_URL + '/countries';
  oFrmView.RESTRequest1.Params.Clear;
  oFrmView.RESTRequest1.Resource := '';

  TSplashScreen.Mostrar;
  oFrmView.RESTRequest1.Execute;
  oResponseJSON := TJSONObject.ParseJSONValue(oFrmView.RESTResponse1.Content.Trim);

  try
    oFrmView.CmbPais.ItemIndex := -1;
    oFrmView.CmbPais.Clear;
    oResponseJSONArray := oResponseJSON.GetValue<TJSONArray>('data');

    for oArrayElement in oResponseJSONArray do
    begin
      oFrmView.CmbPais.Items.Add(oArrayElement.GetValue<String>('country'));
    end;
  finally
    oResponseJSON.Free;
    TSplashScreen.Esconder;
  end;
end;

procedure TControllerProgramaMenuEstatistica.ProcurarClick(Sender: TObject);
var
  oResponseJSON, oResponseJSONData: TJSONValue;
begin
  if (oFrmView.CmbPais.ItemIndex = -1) then
  begin
    ShowMessage('Informe um país.');
    Exit;
  end;

  oFrmView.PnlInformacoes.Visible := True;
  oFrmView.RESTClient1.BaseURL := API_URL;
  oFrmView.RESTRequest1.Params.AddUrlSegment('pais', oFrmView.CmbPais.Text);
  oFrmView.RESTRequest1.Resource := '{pais}';

  TSplashScreen.Mostrar;

  oFrmView.RESTRequest1.Execute;
  oResponseJSON := TJSONObject.ParseJSONValue(oFrmView.RESTResponse1.Content.Trim);
  oResponseJSONData := oResponseJSON.GetValue<TJSONValue>('data');

  try
    oFrmView.LblPais.Caption := 'Status ' + oResponseJSONData.GetValue<String>('country');
    oFrmView.LblInformacoes.Caption := oResponseJSONData.GetValue<String>('confirmed') + ' Confirmados';
    oFrmView.LblInformacoes.Caption := oFrmView.LblInformacoes.Caption + #13 + oResponseJSONData.GetValue<String>('cases') + ' Ativos';
    oFrmView.LblInformacoes.Caption := oFrmView.LblInformacoes.Caption + #13 + oResponseJSONData.GetValue<String>('recovered') + ' Recuperados';
    oFrmView.LblInformacoes.Caption := oFrmView.LblInformacoes.Caption + #13 + oResponseJSONData.GetValue<String>('deaths') + '  Mortes';;
    oFrmView.LblAtualizado.Caption := 'Atualizado em ' + FormatDateTime('c', oResponseJSONData.GetValue<TDateTime>('updated_at'));
  finally
    oResponseJSON.Free;
    TSplashScreen.Esconder;
  end;
end;

constructor TControllerProgramaMenuEstatistica.Create;
begin
  oFrmView := TFrmEstatisticas.Create(nil);
  oFrmView.OnShow := FormShow;
  oFrmView.OnKeyDown := FormKeyDown;
  oFrmView.PnlInformacoes.Visible := False;
  oFrmView.BtnOk.OnClick := ProcurarClick;
end;

procedure TControllerProgramaMenuEstatistica.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    oFrmView.BtnOk.Click;
end;

procedure TControllerProgramaMenuEstatistica.FormShow(Sender: TObject);
begin
  AlimentarComboBoxPaises;
end;

end.
