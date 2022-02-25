unit View.ListarDados.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBorderless, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DM.Principal;

type
  TFrmListarDadosBase = class(TBorderlessForm)
    PnlHeader: TPanel;
    PnlNomePrograma: TPanel;
    LblNomePrograma: TLabel;
    PnlBordaHeade: TPanel;
    PnlIconesMenu: TPanel;
    PnlFechar: TPanel;
    ImgFechar: TImage;
    BtnFechar: TSpeedButton;
    PnlBottom: TPanel;
    PnlBotao: TPanel;
    BtnOk: TSpeedButton;
    PnlCancelar: TPanel;
    BtnCancelar: TSpeedButton;
    PnlBotoes: TPanel;
    DBGridDados: TDBGrid;
    DSDados: TDataSource;
    FDQDados: TFDQuery;
    Panel1: TPanel;
    BtnExcluir: TSpeedButton;
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TCustomHackDBGrid = class(TDBGrid);

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TFrmListarDadosBase.BtnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation, [mbyes, mbno], 0) = MrYes) then
    FDQDados.Delete;
end;

procedure TFrmListarDadosBase.BtnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmListarDadosBase.DBGridDadosDblClick(Sender: TObject);
begin
  BtnOk.Click;
end;

procedure TFrmListarDadosBase.DBGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1F2F3; // leve cinza

  // Aplicando prto para a cor da fonte
  (Sender as TDBGrid).Canvas.Font.Color := $00706600;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Brush.Color := $00ADADAD;
    (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    (Sender as TDBGrid).Canvas.Font.Style := [fsBold];
  end;

  (Sender as TDBGrid).Canvas.FillRect(Rect);
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  (Sender as TDBGrid).Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure TFrmListarDadosBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQDados.Active := False;
end;

procedure TFrmListarDadosBase.FormCreate(Sender: TObject);
begin
  LblNomePrograma.OnMouseDown := TitleBarMouseDown;
  FDQDados.Active := True;
end;

procedure TFrmListarDadosBase.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to Pred(DBGridDados.Columns.Count) do
  begin
    DBGridDados.Columns.Items[i].Alignment := taCenter;
    DBGridDados.Columns.Items[i].Font.Name := 'Segoe UI';
    DBGridDados.Columns.Items[i].Font.Size := 9;
    DBGridDados.Columns.Items[i].Font.Style := [fsBold];
    DBGridDados.Columns.Items[i].Font.Color := clWhite;

    DBGridDados.Columns.Items[i].Title.Alignment := taCenter;
    DBGridDados.Columns.Items[i].Title.Font.Name := 'Segoe UI';
    DBGridDados.Columns.Items[i].Title.Font.Size := 9;
    DBGridDados.Columns.Items[i].Title.Font.Style := [fsBold];
    DBGridDados.Columns.Items[i].Title.Font.Color := clWhite;
  end;

  TCustomHackDBGrid(DBGridDados).DefaultRowHeight := 30;
  TCustomHackDBGrid(DBGridDados).ClientHeight := (30 * TCustomHackDBGrid(DBGridDados).RowCount) + 30;
end;

end.
