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
      object PnlBotao: TPanel
        Left = 440
        Top = 59
        Width = 26
        Height = 26
        BevelOuter = bvNone
        Color = 7366144
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366144
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 26
          Height = 26
          Align = alClient
          AutoSize = True
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            00100804000000B5FA37EA0000000467414D410000B18F0BFC61050000000262
            4B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B0000
            000774494D4507E40C05150015C41F6B77000001114944415478DA7DD1BF2F43
            5118C6F1EF135B1321FD138A89A983C1D2B2FB952612622C1349C5E246AE4807
            2C74202A4C528B41241A090B912E06060993D83048746011891C87737BD36AEA
            19EE709ECF794FF25EF11B33489A6E5A79E29435DD1346B68C506098635B9569
            638C18D3DAAE06072448E92298D584CF02A3DA0F801D7E486FA50ED02629DAF5
            EE40D17EFAA98989F2CC840A0EBC90D5067F624ADC68CA810FD2DAAB0347BC69
            DC81077695AD03771435E7409E245DFAAAA9E35CD3A773073AB865598B557584
            129FF4C854F630C916797C9583DB3BC459D27CB8287B38C23A2D5CF16A37D9C9
            256778CC2A17024B9A19B2FF22CA23273F6F9B19561D110D6232E4F0B4D21084
            53E05F32F00D8C14573FFFBB6E110000002574455874646174653A6372656174
            6500323032302D31322D30355432313A30303A32312B30303A3030BFBC97B200
            00002574455874646174653A6D6F6469667900323032302D31322D3035543231
            3A30303A32312B30303A3030CEE12F0E0000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A0000000049454E44AE4260
            82}
          Proportional = True
          ExplicitWidth = 16
          ExplicitHeight = 16
        end
        object BtnOk: TSpeedButton
          Left = 0
          Top = 0
          Width = 26
          Height = 26
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 120
          ExplicitHeight = 30
        end
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
