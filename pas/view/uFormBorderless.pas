unit uFormBorderless;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TMethodOnMaximize = reference to procedure(Sender: TObject);

  TBorderlessForm = class(TForm)
  private
    oMethodOnMaximize: TMethodOnMaximize;

    function IsBorderless: Boolean;
    function GetBorderSpace: Integer;

    procedure WM_NCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCalcSize;
    procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHitTest;
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    procedure MaximizeClick(Sender: TObject);
    procedure TitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  end;

var
  BorderlessForm: TBorderlessForm;

implementation

{$R *.dfm}
{ TBorderlessForm }

function TBorderlessForm.GetBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle:
      Result := GetSystemMetrics(SM_CYFIXEDFRAME);
    bsDialog, bsToolWindow:
      Result := GetSystemMetrics(SM_CYDLGFRAME);
    bsSizeable, bsSizeToolWin:
      Result := GetSystemMetrics(SM_CYSIZEFRAME) + GetSystemMetrics(SM_CXPADDEDBORDER);
  else
    Result := 0;
  end;
end;

function TBorderlessForm.IsBorderless: Boolean;
begin
  Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

procedure TBorderlessForm.MaximizeClick(Sender: TObject);
begin
  if WindowState = wsNormal then
    WindowState := wsMaximized
  else
    WindowState := wsNormal;

  if (Assigned(oMethodOnMaximize)) then
    oMethodOnMaximize(Sender)
end;

procedure TBorderlessForm.Paint;
begin
  inherited;
  if (WindowState = wsNormal) and (not IsBorderless) then
  begin
    Canvas.Pen.Color := clBlack;
    Canvas.MoveTo(0, 0);
    Canvas.LineTo(Width, 0);
  end;
end;

procedure TBorderlessForm.Resize;
begin
  inherited;
  if (WindowState = wsNormal) and (not IsBorderless) then
    Padding.Top := 1
  else
    Padding.Top := 0;
end;

procedure TBorderlessForm.TitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TBorderlessForm.WM_NCCalcSize(var Msg: TWMNCCalcSize);
var
  CaptionBarHeight: Integer;
begin
  inherited;
  if BorderStyle = bsNone then
    exit;

  CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);
  if WindowState = wsNormal then
    Inc(CaptionBarHeight, GetBorderSpace);

  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight);
end;

procedure TBorderlessForm.WM_NCHitTest(var Msg: TWMNCHitTest);
var
  ResizeSpace: Integer;
begin
  inherited;
  ResizeSpace := GetBorderSpace;

  if (WindowState = wsNormal) and (BorderStyle in [bsSizeable, bsSizeToolWin]) and (Msg.YPos - BoundsRect.Top <= ResizeSpace) then
  begin
    if Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace then
      Msg.Result := HTTOPLEFT
    else if BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace then
      Msg.Result := HTTOPRIGHT
    else
      Msg.Result := HTTOP;
  end;
end;

end.
