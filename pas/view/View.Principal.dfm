object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pandemic'
  ClientHeight = 472
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMenu: TPanel
    Left = 0
    Top = 49
    Width = 169
    Height = 423
    Margins.Left = 1
    Margins.Top = 4
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 141
    ExplicitHeight = 331
    DesignSize = (
      165
      419)
    object PnlPep: TPanel
      Left = 0
      Top = 0
      Width = 165
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 7366145
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 53
      ExplicitWidth = 169
      object BtnEntrar: TSpeedButton
        Left = 0
        Top = 0
        Width = 165
        Height = 41
        Cursor = crHandPoint
        Align = alClient
        Caption = 'PEP'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = -20
        ExplicitTop = -24
        ExplicitWidth = 149
      end
    end
    object pnlCadastro: TPanel
      Left = 0
      Top = 41
      Width = 165
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 15002349
      ParentBackground = False
      TabOrder = 1
      object BtnCadastro: TSpeedButton
        Left = 0
        Top = 0
        Width = 165
        Height = 41
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cadastros'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = -8
        ExplicitWidth = 169
      end
    end
    object PnlSair: TPanel
      Left = 0
      Top = 377
      Width = 169
      Height = 41
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Color = 15002349
      ParentBackground = False
      TabOrder = 2
      ExplicitTop = 285
      object BtnSair: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 41
        Cursor = crHandPoint
        Align = alClient
        Anchors = [akTop]
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 128
        ExplicitTop = 16
      end
    end
    object PnlRelatorio: TPanel
      Left = 0
      Top = 82
      Width = 165
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 15002349
      ParentBackground = False
      TabOrder = 3
      ExplicitTop = 95
      ExplicitWidth = 169
      object btnRelatorio: TSpeedButton
        Left = 0
        Top = 0
        Width = 165
        Height = 41
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Relat'#243'rios'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = -8
        ExplicitWidth = 169
      end
    end
    object PnlEstatistica: TPanel
      Left = 0
      Top = 123
      Width = 165
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 15002349
      ParentBackground = False
      TabOrder = 4
      ExplicitTop = 95
      ExplicitWidth = 169
      object BtnEstattistica: TSpeedButton
        Left = 0
        Top = 0
        Width = 165
        Height = 41
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Estat'#237'sticas'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = -8
        ExplicitWidth = 169
      end
    end
  end
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 49
    Margins.Left = 1
    Margins.Top = 4
    Margins.Right = 1
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 15067885
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      844
      49)
    object PnlHeaderMenu: TPanel
      Left = -124
      Top = -186
      Width = 291
      Height = 238
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      BevelOuter = bvNone
      Color = 11382189
      ParentBackground = False
      TabOrder = 0
      object LblLogin: TLabel
        Left = 147
        Top = 190
        Width = 115
        Height = 37
        Caption = 'Pandemic'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object PnlNomePrograma: TPanel
      Left = 171
      Top = 0
      Width = 673
      Height = 49
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = 15067885
      ParentBackground = False
      TabOrder = 1
      object LbNomePrograma: TLabel
        Left = 0
        Top = 0
        Width = 673
        Height = 49
        Align = alClient
        Alignment = taCenter
        Caption = 'Prontu'#225'rio Eletr'#244'nico do Paciente'
        Color = -1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        ExplicitTop = -4
      end
    end
    object PnlBordaHeade: TPanel
      Left = 0
      Top = 48
      Width = 844
      Height = 1
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = -1
      ParentBackground = False
      TabOrder = 2
      ExplicitTop = 32
    end
  end
  object PnlPrograma: TPanel
    Left = 169
    Top = 49
    Width = 675
    Height = 423
    Margins.Left = 1
    Margins.Top = 4
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 101
    ExplicitHeight = 371
  end
end
