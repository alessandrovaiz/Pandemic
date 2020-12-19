inherited FrmListarPaciente: TFrmListarPaciente
  Caption = 'FrmListarPaciente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlHeader: TPanel
    inherited PnlNomePrograma: TPanel
      Width = 720
      ExplicitWidth = 720
      inherited LblNomePrograma: TLabel
        Width = 720
        Height = 29
        Caption = 'Paciente'
        ExplicitWidth = 57
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
          Caption = 'SELECIONAR'
          OnClick = BtnOkClick
        end
      end
    end
  end
  inherited DBGridDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'id_per'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nam_per'
        Title.Caption = 'Nome'
        Width = 529
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf_per'
        Title.Caption = 'CPF'
        Width = 130
        Visible = True
      end>
  end
  inherited FDQDados: TFDQuery
    SQL.Strings = (
      'select id_per, nam_per, cpf_per from person order by id_per')
  end
end
