unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage,
  uFormBorderless, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TFrmPrincipal = class(TBorderlessForm)
    PnlMenu: TPanel;
    PnlHeader: TPanel;
    PnlPrograma: TPanel;
    LblNomePrograma: TLabel;
    PnlNomePrograma: TPanel;
    PnlBordaHeade: TPanel;
    PnlSair: TPanel;
    BtnSair: TSpeedButton;
    PnlHeaderMenu: TPanel;
    LblNomeApp: TLabel;
    PnlIconesMenu: TPanel;
    PnlFechar: TPanel;
    ImgFechar: TImage;
    PnlMaximizar: TPanel;
    ImgMaximizar: TImage;
    PnlMinimizar: TPanel;
    ImgMinimizar: TImage;
    BtnFechar: TSpeedButton;
    BtnMaximizar: TSpeedButton;
    BtnMinimizar: TSpeedButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  end;

implementation

{$R *.dfm}

end.
