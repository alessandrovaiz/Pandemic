object FrmCadastroBase: TFrmCadastroBase
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FrmCadastroBase'
  ClientHeight = 494
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
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
    Color = 14671839
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 423
    object PnlNavBar: TPanel
      Left = 0
      Top = 0
      Width = 675
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PnlNavBar'
      ShowCaption = False
      TabOrder = 0
      object LblCadastro: TLabel
        Left = 89
        Top = 0
        Width = 487
        Height = 33
        ParentCustomHint = False
        Align = alClient
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Novo Paciente'
        Color = clBtnFace
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = 4276014
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Layout = tlCenter
        ExplicitWidth = 121
        ExplicitHeight = 25
      end
      object PnlVoltar: TPanel
        Left = 0
        Top = 0
        Width = 89
        Height = 33
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'PnlVoltar'
        ShowCaption = False
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 41
          Height = 33
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000110000
            001E0806000000CA3BF52F000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
            0E4944415478DAC5D5DD0D82301007701B127865037103DC4037E0EB5D477003
            DD8011F48D072075031CC1119804FC37D2A87CF6DA072F21574AF2A3B49783AD
            0C8273EE8561583303C06FDB964751B4D142F23CDF5996C581B8711C33325296
            E511E92AEFC908801352FA3D4742005C90CEFD7965640A50468AA2B831C60E53
            CF67111CA1DB348DD8C060EE25938800707C152E7F69A5A388A8C20EF054F66B
            8050810122CB9802206A20EFB2EF00B10297007C907E19FF0F112301A1A052ED
            CFE96D2C755F7E114D688888C8B2CCB36DBBC2D0D34688D0344280E611456819
            5180D41009398EC3475A833A2262ACC760FC4C92644BEAF67D08F90164AFF5F3
            927DD7089110D2DA08E9A000C8FD051AD3D61FBFFE05E30000000049454E44AE
            426082}
        end
        object Label1: TLabel
          Left = 47
          Top = 8
          Width = 34
          Height = 16
          Caption = 'Voltar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11382189
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BtnVoltar: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 33
          Align = alClient
          Flat = True
          ExplicitLeft = 40
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object Panel1: TPanel
        Left = 576
        Top = 0
        Width = 99
        Height = 33
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 1
        object LblListar: TLinkLabel
          Left = 8
          Top = 8
          Width = 79
          Height = 17
          Caption = '<a href="">Listar Pacientes</a>'
          TabOrder = 0
        end
      end
    end
  end
end
