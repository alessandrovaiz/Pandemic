unit View.Programa.Menu.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmRelatorio = class(TForm)
    PnlPrograma: TPanel;
    Titulo: TLabel;
    LblSelectPais: TLabel;
    ComboBox1: TComboBox;
    LblSelectConsulta: TLabel;
    Panel1: TPanel;
    RdCidade: TRadioButton;
    RdRegiao: TRadioButton;
    LblCidade: TLabel;
    LblRegiao: TLabel;
    ComboBox2: TComboBox;
    PnlBotao: TPanel;
    SpeedButton1: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
