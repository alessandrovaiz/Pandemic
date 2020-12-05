unit Controller.Cadastro.Base;

interface

uses
  View.Cadastro.Base,
  Controller.Programa.Menu,
  System.Classes;

type
  IControllerCadastroBase = interface(IControllerProgramaMenu)
  end;

  TControllerCadastroBase<T: TFrmCadastroBase> = class(TControllerProgramaMenu<T>, IControllerCadastroBase)
  private
    oControladorPai: IControllerProgramaMenu;

    procedure VoltarClick(Sender: TObject);
  protected
    procedure CadastrarClick(Sender: TObject); virtual; abstract;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public

    function Ref: IControllerProgramaMenu;
    constructor Create(const AControladorPai: IControllerProgramaMenu); virtual;
  end;

implementation

uses
  Winapi.Windows;

{ TControllerCadastroBase<T> }

constructor TControllerCadastroBase<T>.Create(const AControladorPai: IControllerProgramaMenu);
begin
  oControladorPai := AControladorPai;
  TFrmCadastroBase(oFrmView).BtnVoltar.OnClick := VoltarClick;
  TFrmCadastroBase(oFrmView).BtnCadastrar.OnClick := CadastrarClick;
  TFrmCadastroBase(oFrmView).BtnCancelar.OnClick := VoltarClick;
end;

procedure TControllerCadastroBase<T>.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    CadastrarClick(nil);
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
