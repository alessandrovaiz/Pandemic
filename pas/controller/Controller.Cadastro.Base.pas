unit Controller.Cadastro.Base;

interface

uses
  View.Cadastro.Base,
  Controller.Programa.Menu;

type
  IControllerCadastroBase = interface(IControllerProgramaMenu)
  end;

  TControllerCadastroBase<T: TFrmCadastroBase> = class(TControllerProgramaMenu<T>, IControllerCadastroBase)
  private
    oControladorPai: IControllerProgramaMenu;

    procedure VoltarClick(Sender: TObject);
  public

    function Ref: IControllerProgramaMenu;
    constructor Create(const AControladorPai: IControllerProgramaMenu); virtual;
  end;

implementation

{ TControllerCadastroBase<T> }

constructor TControllerCadastroBase<T>.Create(const AControladorPai: IControllerProgramaMenu);
begin
  oControladorPai := AControladorPai;
  TFrmCadastroBase(oFrmView).BtnVoltar.OnClick := VoltarClick;
end;

function TControllerCadastroBase<T>.Ref: IControllerProgramaMenu;
begin
  Result := Self;
end;

procedure TControllerCadastroBase<T>.VoltarClick(Sender: TObject);
begin
  Self.Hide;
  oControladorPai.Show;
end;

end.
