unit VO.Programa.Menu;

interface

uses
  Enum.Programas, Controller.Programa.Menu, Vcl.ExtCtrls, Vcl.StdCtrls,
  Generics.Collections, Vcl.Buttons;

type
  TProgramaMenu = class
  protected

    function GetSelecionado: Boolean;
    procedure SetSelecionado(const ASelecionado: Boolean);
  public
    Programa: TEnumProgramas;
    Controlador: IControllerProgramaMenu;
    PanelMenuPrograma: TPanel;
    LabellTituloPrograma: TLabel;
    BotaoMenuPrograma: TSpeedButton;
    property Selecionado: Boolean read GetSelecionado write SetSelecionado;
  end;

  TListaProgramaMenu = class(TObjectList<TProgramaMenu>)
  public
    function ControladorAtivo: IControllerProgramaMenu;

    procedure DesmarcarTodosOsProgramas;
    procedure MostrarPrograma(const APrograma: TEnumProgramas);
  end;

implementation

uses
  Vcl.Graphics,
  SysUtils,
  Utils.Generics;

{ TProgramaMenu }

function TProgramaMenu.GetSelecionado: Boolean;
begin
  Result := PanelMenuPrograma.Color = $00706601;
end;

procedure TProgramaMenu.SetSelecionado(const ASelecionado: Boolean);
begin
  if (ASelecionado) then
  begin
    PanelMenuPrograma.Color := $00706601;
    BotaoMenuPrograma.Font.Color := clWhite;
    LabellTituloPrograma.Caption := Programa.GetDescricaoPrograma;
    Controlador.Show;
  end
  else
  begin
    PanelMenuPrograma.Color := $00E4EAED;
    BotaoMenuPrograma.Font.Color := $00706601;
    LabellTituloPrograma.Caption := EmptyStr;
    Controlador.Hide;
  end;
end;

{ TListaProgramaMenu }

function TListaProgramaMenu.ControladorAtivo: IControllerProgramaMenu;
var
  oPrograma: TProgramaMenu;
begin
  Result := nil;

  for oPrograma in Self do
  begin
    if (oPrograma.Selecionado) then
      Exit(TUtilsGenerics.IfThen<IControllerProgramaMenu>(Assigned(oPrograma.Controlador.GetControladorFilho), oPrograma.Controlador.GetControladorFilho, oPrograma.Controlador));
  end;
end;

procedure TListaProgramaMenu.DesmarcarTodosOsProgramas;
var
  oPrograma: TProgramaMenu;
begin
  for oPrograma in Self do
  begin
    oPrograma.Selecionado := False;
  end;
end;

procedure TListaProgramaMenu.MostrarPrograma(const APrograma: TEnumProgramas);
var
  oPrograma: TProgramaMenu;
begin
  Self.DesmarcarTodosOsProgramas;

  for oPrograma in Self do
  begin
    if (oPrograma.Programa = APrograma) then
      oPrograma.Selecionado := True;
  end;
end;

end.
