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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

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

procedure TFrmListarDadosBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQDados.Active := False;
end;

procedure TFrmListarDadosBase.FormCreate(Sender: TObject);
begin
  LblNomePrograma.OnMouseDown := TitleBarMouseDown;
  FDQDados.Active := True;
end;

end.
