unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

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
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection1: TFDConnection;
    FDQlogin: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
