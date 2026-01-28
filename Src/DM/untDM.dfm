object DM: TDM
  Height = 327
  Width = 550
  object qryAbastecimentos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT V.ID, V.DATA, V.QTD_LITROS, V.PRECO_COMBUSTIVEL, V.VALOR,' +
        ' V.VALOR_IMPOSTO, '
      
        'V.ID_BOMBA, B.BOMBA, B.ID_TANQUE, T.TANQUE, T.ID_COMBUSTIVEL, C.' +
        'COMBUSTIVEL'
      'FROM ABASTECIMENTOS V'
      'INNER JOIN BOMBAS B ON B.ID = V.ID_BOMBA'
      'INNER JOIN TANQUES T ON T.ID = B.ID_TANQUE'
      'INNER JOIN COMBUSTIVEIS C ON C.ID = T.ID_COMBUSTIVEL;')
    Left = 152
    Top = 16
  end
  object mtAbastecimentos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 128
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\PostABC\BD\POSTOABC.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object mtBombas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 256
    Top = 128
  end
  object mtTanques: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 336
    Top = 128
  end
  object mtCombustiveis: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 128
  end
  object mtAbastecimentosPorDatas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 185
  end
end
