object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pandemic'
  ClientHeight = 472
  ClientWidth = 914
  Color = clBtnFace
  Constraints.MinWidth = 844
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 914
    Height = 49
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
      Left = 169
      Top = 0
      Width = 745
      Height = 48
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      BevelOuter = bvNone
      Color = 15067885
      ParentBackground = False
      TabOrder = 0
      object LblNomePrograma: TLabel
        Left = 0
        Top = 0
        Width = 745
        Height = 48
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
        ExplicitWidth = 396
        ExplicitHeight = 37
      end
    end
    object PnlBordaHeade: TPanel
      Left = 0
      Top = 48
      Width = 914
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
    object PnlHeaderMenu: TPanel
      Left = 0
      Top = 0
      Width = 169
      Height = 48
      Margins.Left = 1
      Margins.Top = 4
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Color = 11382189
      ParentBackground = False
      TabOrder = 2
      object LblNomeApp: TLabel
        Left = 0
        Top = 0
        Width = 169
        Height = 48
        Align = alClient
        Alignment = taCenter
        Caption = 'Pandemic'
        Color = 7366145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7366145
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 115
        ExplicitHeight = 37
      end
    end
    object PnlIconesMenu: TPanel
      Left = 768
      Top = 0
      Width = 146
      Height = 48
      Align = alRight
      BevelOuter = bvNone
      Caption = 'PnlIconesMenu'
      ShowCaption = False
      TabOrder = 3
      object PnlFechar: TPanel
        Left = 96
        Top = 0
        Width = 50
        Height = 48
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlFechar'
        ShowCaption = False
        TabOrder = 0
        object ImgFechar: TImage
          Left = 0
          Top = 0
          Width = 50
          Height = 48
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
        end
        object BtnFechar: TSpeedButton
          Left = 0
          Top = 0
          Width = 50
          Height = 48
          Align = alClient
          Flat = True
          ExplicitLeft = 27
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object PnlMaximizar: TPanel
        Left = 46
        Top = 0
        Width = 50
        Height = 48
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlFechar'
        ShowCaption = False
        TabOrder = 1
        object ImgMaximizar: TImage
          Left = 0
          Top = 0
          Width = 50
          Height = 48
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000000473424954080808087C0864880000000970
            4859730000007600000076014E7B26080000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A0000003C4944415478DA63
            646060780DC4220CE481378C40E23F10CB00F13712357301F11398013C40FC95
            4403B881F8CBA801A3060C330328CA4C9464E7D7002B1D2DD8FF833D37000000
            0049454E44AE426082}
          ExplicitTop = -6
        end
        object BtnMaximizar: TSpeedButton
          Left = 0
          Top = 0
          Width = 50
          Height = 48
          Align = alClient
          Flat = True
          ExplicitLeft = 27
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object PnlMinimizar: TPanel
        Left = -4
        Top = 0
        Width = 50
        Height = 48
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlFechar'
        ShowCaption = False
        TabOrder = 2
        object ImgMinimizar: TImage
          Left = 0
          Top = 0
          Width = 50
          Height = 48
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000000473424954080808087C0864880000000970
            4859730000005D0000005D0155602E940000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A000000224944415478DA63
            FCFFFF3F03258071D480C1600010370CAC01031F06A306506E0000472B2AE756
            F39DD10000000049454E44AE426082}
          ExplicitTop = -6
        end
        object BtnMinimizar: TSpeedButton
          Left = 0
          Top = 0
          Width = 50
          Height = 48
          Align = alClient
          Flat = True
          ExplicitLeft = -6
          ExplicitTop = -6
        end
      end
    end
  end
  object PnlMenu: TPanel
    Left = 0
    Top = 49
    Width = 169
    Height = 423
    Margins.Left = 2
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      165
      419)
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
      TabOrder = 0
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
  end
  object PnlPrograma: TPanel
    Left = 169
    Top = 49
    Width = 745
    Height = 423
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
end
