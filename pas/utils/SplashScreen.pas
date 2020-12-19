unit SplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrmSplashScreen = class(TForm)
    PnlImagem: TPanel;
    LblLogin: TLabel;
    Panel1: TPanel;
  private
    { Private declarations }
  public

  end;

  TSplashScreen = class
  public
    class procedure Mostrar;
    class procedure Esconder;
  end;

var
  FrmSplashScreen: TFrmSplashScreen;

implementation

{$R *.dfm}
{ TFrmSplashScreen }

class procedure TSplashScreen.Esconder;
begin
  if (Assigned(FrmSplashScreen)) then
  begin
    FrmSplashScreen.Close;
    FreeAndNil(FrmSplashScreen);
  end;
end;

class procedure TSplashScreen.Mostrar;
begin
  FrmSplashScreen := TFrmSplashScreen.Create(nil);
  FrmSplashScreen.Show;
end;

end.
