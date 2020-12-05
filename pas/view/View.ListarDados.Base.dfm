inherited FrmListarDadosBase: TFrmListarDadosBase
  BorderStyle = bsSingle
  Caption = 'FrmListarDadosBase'
  ClientHeight = 388
  ClientWidth = 752
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 758
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 30
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 15067885
    ParentBackground = False
    TabOrder = 0
    object PnlNomePrograma: TPanel
      Left = 0
      Top = 0
      Width = 699
      Height = 29
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 15067885
      ParentBackground = False
      TabOrder = 0
      object LblNomePrograma: TLabel
        Left = 0
        Top = 0
        Width = 699
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'Listar dados base'
        Color = -1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -1
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        ExplicitWidth = 120
        ExplicitHeight = 21
      end
    end
    object PnlBordaHeade: TPanel
      Left = 0
      Top = 29
      Width = 752
      Height = 1
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = -1
      ParentBackground = False
      TabOrder = 1
    end
    object PnlIconesMenu: TPanel
      Left = 699
      Top = 0
      Width = 53
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      Caption = 'PnlIconesMenu'
      ShowCaption = False
      TabOrder = 2
      object PnlFechar: TPanel
        Left = 24
        Top = 0
        Width = 29
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlFechar'
        ShowCaption = False
        TabOrder = 0
        object ImgFechar: TImage
          Left = 0
          Top = 0
          Width = 29
          Height = 29
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000000473424954080808087C0864880000000970
            4859730000006F0000006F01F1A2DC430000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A000000804944415478DA63
            6460605809C43BFEFFFF3F9F8104C0C8C89808A43C18810488311B88D38086CC
            23527312909A05C4A98C404DC802040D41570B36009B04319AC1623003081982
            4B0EC5009CB6E03318DD00740D50219C5EC36A009A210C78C385260650E4058A
            0291A268A428215194941928CD4C40622F102F21333BC700001370A2158A6421
            F90000000049454E44AE426082}
          ExplicitTop = -6
          ExplicitWidth = 50
          ExplicitHeight = 48
        end
        object BtnFechar: TSpeedButton
          Left = 0
          Top = 0
          Width = 29
          Height = 29
          Align = alClient
          Flat = True
          OnClick = BtnFecharClick
          ExplicitLeft = 27
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
    end
  end
  object PnlBottom: TPanel
    Left = 0
    Top = 344
    Width = 752
    Height = 44
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Color = 15067885
    ParentBackground = False
    TabOrder = 1
    object PnlBotoes: TPanel
      Left = 344
      Top = 0
      Width = 408
      Height = 44
      Align = alRight
      BevelOuter = bvNone
      Caption = 'PnlBotoes'
      ShowCaption = False
      TabOrder = 0
      object PnlBotao: TPanel
        Left = 13
        Top = 7
        Width = 120
        Height = 30
        BevelOuter = bvNone
        Color = 7366144
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366144
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object BtnOk: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 30
          Align = alClient
          Caption = 'OK'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object PnlCancelar: TPanel
        Left = 280
        Top = 7
        Width = 120
        Height = 30
        BevelOuter = bvNone
        Color = 16514043
        ParentBackground = False
        TabOrder = 1
        object BtnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 30
          Cursor = crHandPoint
          Align = alClient
          Caption = 'CANCELAR'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BtnFecharClick
          ExplicitLeft = 7
          ExplicitTop = -1
        end
      end
      object Panel1: TPanel
        Left = 147
        Top = 7
        Width = 120
        Height = 30
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object BtnExcluir: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 30
          Cursor = crHandPoint
          Align = alClient
          Caption = 'EXCLUIR'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BtnExcluirClick
          ExplicitLeft = -48
          ExplicitWidth = 149
          ExplicitHeight = 41
        end
      end
    end
  end
  object DBGridDados: TDBGrid
    Left = 0
    Top = 30
    Width = 752
    Height = 314
    Align = alClient
    DataSource = DSDados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDadosDblClick
  end
  object DSDados: TDataSource
    DataSet = FDQDados
    Left = 24
    Top = 344
  end
  object FDQDados: TFDQuery
    Connection = DMPrincipal.FDConnection
    SQL.Strings = (
      'SELECT * FROM ALUNO')
    Left = 80
    Top = 344
  end
end
