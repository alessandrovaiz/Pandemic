unit VO.Programa.Menu;

interface

uses
  Enum.Programas, Controller.Programa.Menu, Vcl.ExtCtrls, Vcl.StdCtrls,
  Generics.Collections, Vcl.Buttons;

type
  TProgramaMenuBase = class
  protected
    fBotaoMenuPrograma: TSpeedButton;
    function GetSelecionado: Boolean;
    procedure SetSelecionado(const ASelecionado: Boolean);

    procedure SetBotaoMenu(const ABotaoMenuPrograma: TSpeedButton);

    procedure BotaoMenuClick(Sender: TObject); virtual;
  public
    Programa: TEnumProgramas;
    Controlador: IControllerProgramaMenu;
    PanelPrograma: TPanel;
    PanelMenuPrograma: TPanel;
    LabellTituloPrograma: TLabel;
    property BotaoMenuPrograma: TSpeedButton read fBotaoMenuPrograma write SetBotaoMenu;
    property Selecionado: Boolean read GetSelecionado write SetSelecionado;
  end;

  TListaProgramaMenu = class(TObjectList<TProgramaMenuBase>)
  public
    procedure DesmarcarTodosOsProgramas;
    procedure MostrarPrograma(const APrograma: TEnumProgramas);
  end;

  TProgramaMenu = class(TProgramaMenuBase)
  strict private
    oListaProgramaMenu: TListaProgramaMenu;
  protected
    procedure BotaoMenuClick(Sender: TObject); override;
  public
    constructor Create(const AListaProgramaMenu: TListaProgramaMenu);
  end;

implementation

uses
  Vcl.Graphics,
  SysUtils;

{ TProgramaMenu }

procedure TProgramaMenuBase.BotaoMenuClick(Sender: TObject);
begin
  Controlador.Show;
  Self.Selecionado := True;
end;

function TProgramaMenuBase.GetSelecionado: Boolean;
begin
  Result := PanelMenuPrograma.Color = $00706601;
end;

procedure TProgramaMenuBase.SetBotaoMenu(const ABotaoMenuPrograma: TSpeedButton);
begin
  fBotaoMenuPrograma := ABotaoMenuPrograma;
  fBotaoMenuPrograma.OnClick := BotaoMenuClick;
end;

procedure TProgramaMenuBase.SetSelecionado(const ASelecionado: Boolean);
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

{ TProgramaMenu }

procedure TProgramaMenu.BotaoMenuClick(Sender: TObject);
begin
  oListaProgramaMenu.DesmarcarTodosOsProgramas;
  inherited;
end;

constructor TProgramaMenu.Create(const AListaProgramaMenu: TListaProgramaMenu);
begin
  oListaProgramaMenu := AListaProgramaMenu;
end;

{ TListaProgramaMenu }

procedure TListaProgramaMenu.DesmarcarTodosOsProgramas;
var
  oPrograma: TProgramaMenuBase;
begin
  for oPrograma in Self do
  begin
    oPrograma.Selecionado := False;
  end;
end;

procedure TListaProgramaMenu.MostrarPrograma(const APrograma: TEnumProgramas);
var
  oPrograma: TProgramaMenuBase;
begin
  Self.DesmarcarTodosOsProgramas;

  for oPrograma in Self do
  begin
    if (oPrograma.Programa = APrograma) then
      oPrograma.Selecionado := True;
  end;
end;

end.
