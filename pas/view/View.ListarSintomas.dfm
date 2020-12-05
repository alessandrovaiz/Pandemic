inherited FrmListarSintomas: TFrmListarSintomas
  Caption = 'FrmListarSintomas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlHeader: TPanel
    inherited PnlNomePrograma: TPanel
      Width = 720
      ExplicitWidth = 720
      inherited LblNomePrograma: TLabel
        Width = 720
        Height = 29
        Caption = 'Sintomas'
        ExplicitWidth = 720
      end
    end
    inherited PnlIconesMenu: TPanel
      Left = 720
      Width = 32
      ExplicitLeft = 720
      ExplicitWidth = 32
      inherited PnlFechar: TPanel
        Left = 3
        ExplicitLeft = 3
      end
    end
  end
  inherited PnlBottom: TPanel
    inherited PnlBotoes: TPanel
      inherited PnlBotao: TPanel
        inherited BtnOk: TSpeedButton
          OnClick = BtnOkClick
        end
      end
    end
  end
  inherited DBGridDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'id_sym'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'des_sym'
        Title.Caption = 'Descri'#231#227'o'
        Width = 670
        Visible = True
      end>
  end
  inherited FDQDados: TFDQuery
    SQL.Strings = (
      'select ID_SYM,DES_SYM from SYMPTOMS')
  end
end
