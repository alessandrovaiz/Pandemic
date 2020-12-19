unit DM.Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Forms,
  FireDAC.Comp.DataSet;

type
  TDMPrincipal = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQuery: TFDQuery;
    FDConnection: TFDConnection;
    FDQueryInsert: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDMPrincipal.DataModuleCreate(Sender: TObject);
begin
  FDPhysPgDriverLink1.VendorHome := ExtractFileDir(Application.ExeName);
  FDConnection.Connected := True;
end;

procedure TDMPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Connected := False;
end;

end.
