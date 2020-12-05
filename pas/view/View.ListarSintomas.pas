unit View.ListarSintomas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.ListarDados.Base, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrmListarSintomas = class(TFrmListarDadosBase)
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    SintomaSelecionado: Integer;
  end;

function ListarSintomas: Integer;

implementation

{$R *.dfm}

procedure TFrmListarSintomas.BtnOkClick(Sender: TObject);
begin
  SintomaSelecionado := FDQDados.FieldByName('id_sym').AsInteger;
  Self.Close;
end;

function ListarSintomas: Integer;
var
  FrmListarSintomas: TFrmListarSintomas;
begin
  FrmListarSintomas := TFrmListarSintomas.Create(nil);
  try
    FrmListarSintomas.ShowModal;
    Result := FrmListarSintomas.SintomaSelecionado;
  finally
    FrmListarSintomas.Free;
  end;
end;

end.
