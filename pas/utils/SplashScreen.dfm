object FrmSplashScreen: TFrmSplashScreen
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmSplashScreen'
  ClientHeight = 145
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    Color = 14151071
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -48
    ExplicitTop = -267
    ExplicitWidth = 343
    ExplicitHeight = 490
    object PnlImagem: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 30
      Width = 364
      Height = 85
      Margins.Top = 30
      Margins.Bottom = 30
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 524
      ExplicitHeight = 223
      object LblLogin: TLabel
        Left = 0
        Top = 0
        Width = 364
        Height = 85
        Align = alClient
        Alignment = taCenter
        Caption = 'Aguarde... Processando.'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 173
        ExplicitTop = 75
        ExplicitWidth = 281
        ExplicitHeight = 37
      end
    end
  end
end