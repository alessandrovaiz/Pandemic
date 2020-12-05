unit Controller.Cadastro.Sintoma;

interface

uses
  Controller.Cadastro.Base,
  View.Cadastro.Sintoma,
  Controller.Programa.Menu;

type
  TControllerCadastroSintoma = class(TControllerCadastroBase<TFrmCadastroSintoma>)
  private
    iSintomaSelecionado: Integer;

    procedure ListarSintomaClick(Sender: TObject);
  protected
    procedure CadastrarClick(Sender: TObject); override;
  public
    constructor Create(const AControladorPai: IControllerProgramaMenu); override;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Dialogs,
  DM.Principal,
  View.ListarSintomas;

{ TControllerCadastroPaciente }

procedure TControllerCadastroSintoma.CadastrarClick(Sender: TObject);
begin
  if (oFrmView.EdtSintoma.Text = EmptyStr) then
  begin
    ShowMessage('Informe um título.');
    Exit;
  end;

  if (iSintomaSelecionado = 0) then
    DMPrincipal.FDConnection.ExecSQL('insert into SYMPTOMS (DES_SYM) values (' + QuotedStr(oFrmView.EdtSintoma.Text) + ')')
  else
    DMPrincipal.FDConnection.ExecSQL('update SYMPTOMS set DES_SYM = ' + QuotedStr(oFrmView.EdtSintoma.Text) + ' where ID_SYM = ' + iSintomaSelecionado.ToString);

  oFrmView.EdtSintoma.Clear;
end;

constructor TControllerCadastroSintoma.Create(const AControladorPai: IControllerProgramaMenu);
begin
  oFrmView := TFrmCadastroSintoma.Create(nil);
  oFrmView.LblListar.OnClick := ListarSintomaClick;
  inherited Create(AControladorPai);
end;

procedure TControllerCadastroSintoma.ListarSintomaClick(Sender: TObject);
begin
  iSintomaSelecionado := ListarSintomas;

  if (iSintomaSelecionado > 0) then
  begin
    DMPrincipal.FDQuery.SQL.Clear;
    DMPrincipal.FDQuery.SQL.Add('select DES_SYM from SYMPTOMS where ID_SYM = ' + iSintomaSelecionado.ToString);
    DMPrincipal.FDQuery.Active := True;
    try
      oFrmView.EdtSintoma.Text := DMPrincipal.FDQuery.FieldByName('DES_SYM').AsString;
    finally
      DMPrincipal.FDQuery.Active := False;
    end;
  end;

end;

end.
