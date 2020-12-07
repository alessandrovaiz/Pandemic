unit Controller.Cadastro.Paciente;

interface

uses
  Controller.Cadastro.Base,
  View.Cadastro.Paciente,
  Controller.Programa.Menu,
  System.Generics.Collections,
  Vcl.StdCtrls;

type
  TControllerCadastroPaciente = class(TControllerCadastroBase<TFrmCadastroPaciente>)
  strict private
    iCodigoPessoa: Integer;
    oDicSintomas: TObjectDictionary<Integer, TCheckBox>;

    procedure CriarSintomas;
  protected
    procedure CadastrarClick(Sender: TObject); override;
  public
    constructor Create(const AControladorPai: IControllerProgramaMenu); override;
    destructor Destroy; override;
  end;

implementation

uses
  DM.Principal,
  Math,
  System.SysUtils,
  Enum.Permissao.Usuario;

{ TControllerCadastroPaciente }

procedure TControllerCadastroPaciente.CadastrarClick(Sender: TObject);

  function GetIdPessoa: Integer;
  begin
    DMPrincipal.FDQuery.SQL.Clear;
    DMPrincipal.FDQuery.SQL.Add('select nextval(''person_id_per_seq''::regclass) id');
    DMPrincipal.FDQuery.Active := True;
    try
      Result := DMPrincipal.FDQuery.FieldByName('id').AsInteger;
    finally
      DMPrincipal.FDQuery.Active := False;
    end;
  end;

var
  sValues: string;
  oPairSintomas: TPair<Integer, TCheckBox>;
begin
  if (iCodigoPessoa = 0) then
  begin
    DMPrincipal.FDQueryInsert.SQL.Text := 'insert into PERSON (ID_PER,NAM_PER,CPF_PER,EMA_PER,DAT_BIR,TEL1_PER,WEI_PER,HEI_PER) values values(:ID_PER,:NAM_PER,:CPF_PER,:EMA_PER,:DAT_BIR,:TEL1_PER,:WEI_PER,:HEI_PER)';

    DMPrincipal.FDQueryInsert.Params.ParamByName('ID_PER').AsInteger := GetIdPessoa;
    DMPrincipal.FDQueryInsert.Params.ParamByName('NAM_PER').AsString := oFrmView.EdtNome.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('CPF_PER').AsString := oFrmView.EdtCPF.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('EMA_PER').AsString := oFrmView.EdtEmail.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('DAT_BIR').AsDateTime := oFrmView.DtpData.DateTime;
    DMPrincipal.FDQueryInsert.Params.ParamByName('TEL1_PER').AsString := oFrmView.EdtTelefone.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('WEI_PER').AsString := oFrmView.EdtPeso.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('HEI_PER').AsString := oFrmView.EdtAltura.Text;

    for oPairSintomas in oDicSintomas.ToArray do
    begin
      if (oPairSintomas.Value.Checked) then
      begin
       DMPrincipal.FDQueryInsert.SQL.Text := 'insert into PERSON_SYMPTOMS (ID_PER,ID_SYM,DAT_SYM,INT_SYM) values values(:ID_PER,:ID_SYM,:DAT_SYM,:INT_SYM)';
       DMPrincipal.FDQueryInsert.Params.ParamByName('ID_PER').AsInteger := GetIdPessoa;
       DMPrincipal.FDQueryInsert.Params.ParamByName('ID_SYM').AsInteger :=oPairSintomas.Key;
       DMPrincipal.FDQueryInsert.Params.ParamByName('DAT_SYM').AsDateTime := now;
       DMPrincipal.FDQueryInsert.Params.ParamByName('INT_SYM').AsString := '0';
      end;
    end;

    DMPrincipal.FDQueryInsert.SQL.Text := 'insert into USERS (EMA_USR,PAS_USR,PER_USR,ID_PER) values values(:EMA_USR,:PAS_USR,:PER_USR,:ID_PER)';
    DMPrincipal.FDQueryInsert.Params.ParamByName('EMA_USR').AsString := oFrmView.EdtEmail.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('PAS_USR').AsString := oFrmView.EdtSenha.Text;
    DMPrincipal.FDQueryInsert.Params.ParamByName('PER_USR').AsString := Integer(tpuPaciente).ToString;
    DMPrincipal.FDQueryInsert.Params.ParamByName('ID_PER').AsInteger := iCodigoPessoa;

  end;
end;

constructor TControllerCadastroPaciente.Create(const AControladorPai: IControllerProgramaMenu);
begin
  oFrmView := TFrmCadastroPaciente.Create(nil);
  inherited Create(AControladorPai);

  oDicSintomas := TObjectDictionary<Integer, TCheckBox>.Create;

  CriarSintomas;
end;

procedure TControllerCadastroPaciente.CriarSintomas;
var
  oCheckBox: TCheckBox;
  iLeft, iTop: Integer;
begin
  DMPrincipal.FDQuery.SQL.Clear;
  DMPrincipal.FDQuery.SQL.Add('select ID_SYM, DES_SYM from SYMPTOMS');
  DMPrincipal.FDQuery.Active := True;

  try
    iLeft := 0;
    iTop := 0;
    while (not(DMPrincipal.FDQuery.Eof)) do
    begin
      oCheckBox := TCheckBox.Create(oFrmView);
      oCheckBox.Parent := oFrmView.PnlSintomas;
      oCheckBox.Caption := DMPrincipal.FDQuery.FieldByName('DES_SYM').AsString;
      oCheckBox.Width := 97;
      oCheckBox.Height := 17;

      if ((iLeft + oCheckBox.Width) > oFrmView.PnlSintomas.Width) then
      begin
        iLeft := 0;
        iTop := iTop + 20;
      end;

      oCheckBox.Left := iLeft;
      oCheckBox.Top := iTop;

      iLeft := iLeft + oCheckBox.Width + 5;

      oDicSintomas.Add(DMPrincipal.FDQuery.FieldByName('ID_SYM').AsInteger, oCheckBox);
      DMPrincipal.FDQuery.Next;
    end;
  finally
    DMPrincipal.FDQuery.Active := False;
  end;
end;

destructor TControllerCadastroPaciente.Destroy;
begin
  oDicSintomas.Free;
  inherited;
end;

end.
