object frmConfigurarValorCombustiveis: TfrmConfigurarValorCombustiveis
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configurar Valor dos Combust'#237'veis do Dia'
  ClientHeight = 125
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 7
    Top = 8
    Width = 378
    Height = 60
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object lblPrecoGasolina: TLabel
      Left = 8
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Pre'#231'o da Gasolina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrecoOleoDiesel: TLabel
      Left = 192
      Top = 8
      Width = 125
      Height = 13
      Caption = 'Pre'#231'o do '#211'leo Diesel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPrecoGasolina: TEdit
      Left = 8
      Top = 24
      Width = 178
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPrecoGasolinaChange
      OnClick = edtPrecoGasolinaClick
    end
    object edtPrecoOleoDiesel: TEdit
      Left = 192
      Top = 24
      Width = 178
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edtPrecoOleoDieselChange
      OnClick = edtPrecoOleoDieselClick
    end
  end
  object Panel2: TPanel
    Left = 7
    Top = 68
    Width = 378
    Height = 48
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TButton
      Left = 152
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Default = True
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
end
