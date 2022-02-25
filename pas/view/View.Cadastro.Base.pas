unit View.Cadastro.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFrmCadastroBase = class(TForm)
    PnlPrograma: TPanel;
    PnlNavBar: TPanel;
    PnlVoltar: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BtnVoltar: TSpeedButton;
    LblListar: TLinkLabel;
    Panel1: TPanel;
    LblCadastro: TLabel;
    PnlBotao: TPanel;
    BtnCadastrar: TSpeedButton;
    PnlCancelar: TPanel;
    BtnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
