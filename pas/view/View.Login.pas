unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    PnlPrincipal: TPanel;
    BtnFechar: TSpeedButton;
    lblStatus: TLabel;
    PnlImagem: TPanel;
    LblLogin: TLabel;
    ImgLogo: TImage;
    PnlUsuario: TPanel;
    LblNomeUsuario: TLabel;
    PnlSenha: TPanel;
    LblSenha: TLabel;
    EdtSenha: TEdit;
    PnlEntrar: TPanel;
    BtnEntrar: TSpeedButton;
    PnlCancelar: TPanel;
    BtnCancelar: TSpeedButton;
    PnlEdtUsuario: TPanel;
    EdtNomeUsuario: TEdit;
    PnlEdtSenha: TPanel;
    PnlFundo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
