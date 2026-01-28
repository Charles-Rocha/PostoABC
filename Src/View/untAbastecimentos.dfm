inherited frmAbastecimentos: TfrmAbastecimentos
  Caption = 'Abastecimentos'
  ClientHeight = 530
  ClientWidth = 714
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 730
  ExplicitHeight = 569
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Width = 714
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 714
    inherited btnCancelar: TBitBtn
      Left = 536
      ExplicitLeft = 536
    end
    inherited btnGravar: TBitBtn
      Left = 624
      ExplicitLeft = 624
    end
    inherited btnLimpar: TBitBtn
      OnClick = btnLimparClick
    end
  end
  inherited pnlDBGrid: TPanel
    Top = 162
    Width = 714
    Height = 349
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 162
    ExplicitWidth = 714
    ExplicitHeight = 349
    inherited dbgBaseCadastro: TDBGrid
      Width = 710
      Height = 345
      DataSource = dtsDBGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BOMBA'
          Title.Caption = 'Bomba'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TANQUE'
          Title.Caption = 'Tanque'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMBUSTIVEL'
          Title.Caption = 'Combust'#237'vel'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_COMBUSTIVEL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o Combust'#237'vel'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_LITROS'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd. Litros'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_IMPOSTO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor do Imposto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end>
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 511
    Width = 714
    Panels = <
      item
        Text = 'Total de registros:'
        Width = 50
      end>
    ExplicitTop = 511
    ExplicitWidth = 714
  end
  object pnlCampos: TPanel [3]
    Left = 0
    Top = 58
    Width = 714
    Height = 104
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object lblData: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdLitros: TLabel
      Left = 184
      Top = 56
      Width = 61
      Height = 13
      Caption = 'Qtd. Litros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorImposto: TLabel
      Left = 536
      Top = 56
      Width = 100
      Height = 13
      Caption = 'Valor do Imposto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBomba: TLabel
      Left = 184
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Bomba:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTanque: TLabel
      Left = 360
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Tanque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 360
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCombustível: TLabel
      Left = 536
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Combust'#237'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrecoCombustivel: TLabel
      Left = 8
      Top = 56
      Width = 163
      Height = 13
      Caption = 'Pre'#231'o do Combust'#237'vel no Dia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQuantidadeLitros: TEdit
      Left = 182
      Top = 72
      Width = 170
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      OnChange = edtQuantidadeLitrosChange
      OnClick = edtQuantidadeLitrosClick
    end
    object edtValor: TEdit
      Left = 358
      Top = 72
      Width = 170
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 4
      OnChange = edtValorChange
      OnClick = edtValorClick
    end
    object edtValorImposto: TEdit
      Left = 536
      Top = 72
      Width = 170
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 5
      OnChange = edtValorImpostoChange
      OnClick = edtValorImpostoClick
    end
    object edtPrecoCombustivel: TEdit
      Left = 8
      Top = 72
      Width = 170
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      Text = '6,32'
      OnChange = edtPrecoCombustivelChange
      OnClick = edtPrecoCombustivelClick
    end
    object cdpData: TCalendarPicker
      Left = 8
      Top = 23
      Width = 170
      Height = 23
      BorderColor = clSilver
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -13
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -20
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      CalendarHeaderInfo.FontColor = 10774084
      Color = clWhite
      DisabledColor = clLightcoral
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      OnCloseUp = cdpDataCloseUp
      ParentFont = False
      PopupMenu = popDataVenda
      SelectionColor = clRed
      TabOrder = 0
      TextHint = 'Selecionar'
      TodayColor = 10774084
    end
    object dbLookupComboBoxBombas: TDBLookupComboBox
      Left = 184
      Top = 24
      Width = 170
      Height = 21
      KeyField = 'ID'
      ListField = 'BOMBA'
      ListSource = dtsBombas
      TabOrder = 1
      OnCloseUp = dbLookupComboBoxBombasCloseUp
    end
    object DBLookupComboBoxTanques: TDBLookupComboBox
      Left = 360
      Top = 24
      Width = 170
      Height = 21
      Enabled = False
      KeyField = 'ID'
      ListField = 'TANQUE'
      ListSource = dtsTanques
      TabOrder = 6
    end
    object DBLookupComboBoxCombustiveis: TDBLookupComboBox
      Left = 536
      Top = 24
      Width = 170
      Height = 21
      Enabled = False
      KeyField = 'ID'
      ListField = 'COMBUSTIVEL'
      ListSource = dtsCombustiveis
      TabOrder = 7
    end
  end
  inherited dtsDBGrid: TDataSource
    DataSet = DM.qryAbastecimentos
    Left = 32
    Top = 448
  end
  object dtsBombas: TDataSource
    Left = 104
    Top = 448
  end
  object dtsTanques: TDataSource
    Left = 176
    Top = 448
  end
  object dtsCombustiveis: TDataSource
    Left = 264
    Top = 448
  end
  object popDataVenda: TPopupMenu
    Left = 358
    Top = 448
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      ImageIndex = 27
      OnClick = Limpar1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SelecionarDataAtual1: TMenuItem
      Caption = 'Selecionar Data Atual'
      ImageIndex = 28
      OnClick = SelecionarDataAtual1Click
    end
  end
end
