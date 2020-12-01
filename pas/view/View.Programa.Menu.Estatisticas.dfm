object FrmEstatisticas: TFrmEstatisticas
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FrmEstatisticas'
  ClientHeight = 494
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrograma: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 494
    Margins.Left = 1
    Margins.Top = 4
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 423
    object PnlInformacoes: TPanel
      AlignWithMargins = True
      Left = 30
      Top = 107
      Width = 615
      Height = 337
      Margins.Left = 30
      Margins.Top = 10
      Margins.Right = 30
      Margins.Bottom = 50
      Align = alClient
      BevelOuter = bvNone
      Color = 15067885
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 266
      object LblPais: TLabel
        Left = 27
        Top = 13
        Width = 121
        Height = 32
        Margins.Left = 40
        Margins.Top = 20
        Caption = 'Status Pais'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LblAtualizado: TLabel
        Left = 43
        Top = 216
        Width = 301
        Height = 28
        Margins.Left = 40
        Margins.Top = 20
        Caption = 'Atualizado em 21/11/2020 - 14:25'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 43
        Top = 249
        Width = 280
        Height = 28
        Margins.Left = 40
        Margins.Top = 20
        Caption = 'Fonte covid19-brazil-api.now.sh'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LblInformacoes: TLabel
        Left = 43
        Top = 49
        Width = 165
        Height = 112
        Margins.Left = 40
        Margins.Top = 20
        Caption = 'XXXX Confirmados'#13#10'XXXX Ativos'#13#10'XXXX Recuperados'#13#10'XXXX  Mortes'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object PnlLinha: TPanel
        Left = 27
        Top = 207
        Width = 558
        Height = 2
        BevelOuter = bvNone
        Caption = 'PnlLinha'
        Color = 7366145
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
      end
    end
    object PnlTop: TPanel
      Left = 0
      Top = 0
      Width = 675
      Height = 97
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PnlTop'
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 1
      object Label1: TLabel
        Left = 30
        Top = 21
        Width = 182
        Height = 32
        Margins.Left = 40
        Margins.Top = 20
        Caption = 'Selecione o Pa'#237's'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object CmbPais: TComboBox
        Left = 30
        Top = 59
        Width = 401
        Height = 26
        Color = 15067885
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366144
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Selecione o Pa'#237's'
        TextHint = 'Selecione o Pa'#237's'
      end
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://covid19-brazil-api.now.sh/api/report/v1'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 592
    Top = 64
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'pais'
        Options = [poAutoCreated]
        Value = 'brazil'
      end>
    Resource = '{pais}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 592
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 592
    Top = 176
  end
end
