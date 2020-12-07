object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 324
  Width = 548
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\Users\Andre-VM\Documents\Pandemic\dpr\Win32\Debug'
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
      'Password=123'
      'DriverID=PG')
    Left = 128
    Top = 40
  end
  object FDQueryInsert: TFDQuery
    Connection = FDConnection
    Left = 377
    Top = 41
  end
end
