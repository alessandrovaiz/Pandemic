unit View.Programa.Menu.Estatisticas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFrmEstatisticas = class(TForm)
    PnlPrograma: TPanel;
    CmbPais: TComboBox;
    PnlInformacoes: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    PnlTop: TPanel;
    LblPais: TLabel;
    PnlLinha: TPanel;
    LblAtualizado: TLabel;
    Label2: TLabel;
    LblInformacoes: TLabel;
    Label1: TLabel;
    PnlBotao: TPanel;
    Image1: TImage;
    BtnOk: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
