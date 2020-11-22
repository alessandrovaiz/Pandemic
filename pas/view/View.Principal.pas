unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TFrmPrincipal = class(TForm)
    PnlMenu: TPanel;
    PnlHeader: TPanel;
    PnlPrograma: TPanel;
    PnlHeaderMenu: TPanel;
    LblLogin: TLabel;
    LblNomePrograma: TLabel;
    PnlNomePrograma: TPanel;
    PnlBordaHeade: TPanel;
    PnlSair: TPanel;
    BtnSair: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
