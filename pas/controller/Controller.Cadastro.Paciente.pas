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
  System.SysUtils;

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
    iCodigoPessoa := GetIdPessoa;

    sValues := iCodigoPessoa.ToString + ',';
    sValues := sValues + QuotedStr(oFrmView.EdtNome.Text) + ',';
    sValues := sValues + QuotedStr(oFrmView.EdtCPF.Text) + ',';
    sValues := sValues + QuotedStr(oFrmView.EdtEmail.Text) + ',';
    sValues := sValues + QuotedStr(FormatDateTime('dd.mm.yyy', oFrmView.DtpData.DateTime)) + ',';
    sValues := sValues + QuotedStr(oFrmView.EdtTelefone.Text) + ',';
    sValues := sValues + oFrmView.EdtPeso.Text + ',';
    sValues := sValues + oFrmView.EdtAltura.Text;

    DMPrincipal.FDConnection.ExecSQL('insert into PERSON (ID_PER,NAM_PER,CPF_PER,EMA_PER,DAT_BIR,TEL1_PER,WEI_PER,HEI_PER) values (' + sValues + ')');

    for oPairSintomas in oDicSintomas.ToArray do
    begin
//      if (oPairSintomas.Value.Checked) then
//      begin
//        oPairSintomas.Key //Codigo do sintoma
//        DMPrincipal.FDConnection.ExecSQL('insert into PERSON (ID_PER,NAM_PER,CPF_PER,EMA_PER,DAT_BIR,TEL1_PER,WEI_PER,HEI_PER) values (' + sValues + ')');
//      end;
    end;
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
