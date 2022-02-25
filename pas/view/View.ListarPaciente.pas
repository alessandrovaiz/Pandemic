unit View.ListarPaciente;

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
  TFrmListarPaciente = class(TFrmListarDadosBase)
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    Pacienteelecionado: Integer;
  end;

function ListarPaciente: Integer;

implementation

{$R *.dfm}

procedure TFrmListarPaciente.BtnOkClick(Sender: TObject);
begin
  Pacienteelecionado := FDQDados.FieldByName('id_per').AsInteger;
  Self.Close;
end;

function ListarPaciente: Integer;
var
  FrmListarPaciente: TFrmListarPaciente;
begin
  FrmListarPaciente := TFrmListarPaciente.Create(nil);
  try
    FrmListarPaciente.ShowModal;
    Result := FrmListarPaciente.Pacienteelecionado;
  finally
    FrmListarPaciente.Free;
  end;
end;

end.
