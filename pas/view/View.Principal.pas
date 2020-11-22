unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmPrincipal = class(TForm)
    PnlMenu: TPanel;
    PnlPep: TPanel;
    BtnEntrar: TSpeedButton;
    pnlCadastro: TPanel;
    BtnCadastro: TSpeedButton;
    PnlSair: TPanel;
    BtnSair: TSpeedButton;
    PnlHeader: TPanel;
    PnlPrograma: TPanel;
    PnlHeaderMenu: TPanel;
    LblLogin: TLabel;
    LbNomePrograma: TLabel;
    PnlRelatorio: TPanel;
    btnRelatorio: TSpeedButton;
    PnlEstatistica: TPanel;
    BtnEstattistica: TSpeedButton;
    PnlNomePrograma: TPanel;
    PnlBordaHeade: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
