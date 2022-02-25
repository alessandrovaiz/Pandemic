inherited FrmCadastroSintoma: TFrmCadastroSintoma
  Caption = 'FrmCadastroSintoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrograma: TPanel
    object Label2: TLabel [0]
      Left = 31
      Top = 62
      Width = 32
      Height = 17
      ParentCustomHint = False
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Caption = 'T'#237'tulo'
      Color = clBtnFace
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = 4276014
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Layout = tlCenter
    end
    inherited PnlNavBar: TPanel
      TabOrder = 1
      inherited LblCadastro: TLabel
        Width = 487
        Height = 33
        Caption = 'Cadastrar Sintoma'
        ExplicitWidth = 155
      end
      inherited Panel1: TPanel
        inherited LblListar: TLinkLabel
          Width = 76
          Caption = '<a href="">Listar Sintomas</a>'
          ExplicitWidth = 76
        end
      end
    end
    object EdtSintoma: TEdit [2]
      Left = 31
      Top = 85
      Width = 609
      Height = 21
      TabOrder = 0
    end
    inherited PnlBotao: TPanel
      TabOrder = 3
    end
  end
end
