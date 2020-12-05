unit View.Cadastro.Sintoma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Cadastro.Base, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TFrmCadastroSintoma = class(TFrmCadastroBase)
    Label2: TLabel;
    EdtSintoma: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroSintoma: TFrmCadastroSintoma;

implementation

{$R *.dfm}

end.
