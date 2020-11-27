object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 324
  Width = 548
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 216
    Top = 40
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 297
    Top = 41
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=pandemic'
      'User_Name=postgres'
      'Password=masterkey'
      'DriverID=PG')
    Left = 128
    Top = 40
  end
end
