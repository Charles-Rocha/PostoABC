object frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Filtro do Relat'#243'rio'
  ClientHeight = 101
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object pnlFiltrarDataInicialFinal: TPanel
    Left = 0
    Top = 0
    Width = 272
    Height = 101
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 273
    ExplicitHeight = 105
    object Label1: TLabel
      Left = 133
      Top = 28
      Width = 6
      Height = 15
      Caption = 'a'
    end
    object lblDataFinalCompra: TLabel
      Left = 144
      Top = 8
      Width = 55
      Height = 15
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDataInicialCompra: TLabel
      Left = 8
      Top = 8
      Width = 61
      Height = 15
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object cdpDataFinal: TCalendarPicker
      Left = 144
      Top = 24
      Width = 120
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
      DisabledColor = 2278143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      SelectionColor = clRed
      TabOrder = 1
      TextHint = 'Selecionar'
      TodayColor = 10774084
    end
    object cdpDataInicial: TCalendarPicker
      Left = 8
      Top = 24
      Width = 120
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
      DisabledColor = 2278143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      SelectionColor = clRed
      TabOrder = 0
      TextHint = 'Selecionar'
      TodayColor = 10774084
    end
    object btnImprimir: TButton
      Left = 99
      Top = 62
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 2
      OnClick = btnImprimirClick
    end
  end
  object dtsListarAbastecimentosPorDatas: TDataSource
    Left = 80
    Top = 48
  end
end
