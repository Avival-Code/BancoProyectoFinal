object Client_MainMenu: TClient_MainMenu
  Left = 0
  Top = 0
  Caption = 'Men'#250' Principal'
  ClientHeight = 601
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object background: TShape
    Left = 0
    Top = 0
    Width = 800
    Height = 601
    Brush.Color = clWindowFrame
  end
  object sidebarBackground: TShape
    Left = 0
    Top = 0
    Width = 169
    Height = 601
    Brush.Color = clSilver
  end
  object Cuentas: TLabel
    Left = 456
    Top = 24
    Width = 60
    Height = 18
    Caption = 'Cuentas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cerrarSesiónButton: TButton
    Left = 0
    Top = 568
    Width = 169
    Height = 33
    Caption = 'CerrarSesi'#243'n'
    TabOrder = 0
    OnClick = Logout
  end
  object StaticText1: TStaticText
    Left = 440
    Top = 372
    Width = 99
    Height = 22
    Caption = 'Movimientos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object bienvenidoStaticText: TStaticText
    Left = 40
    Top = 22
    Width = 73
    Height = 20
    Caption = #161'Bienvenido!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object saldoStaticText: TStaticText
    Left = 213
    Top = 152
    Width = 48
    Height = 20
    Caption = 'Saldo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object creditoDebidoStaticText: TStaticText
    Left = 213
    Top = 192
    Width = 104
    Height = 20
    Caption = 'Cr'#233'dito Debido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object creditoLimiteStaticText: TStaticText
    Left = 504
    Top = 229
    Width = 118
    Height = 20
    Caption = 'Limite de Cr'#233'dito:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object tipoStaticText: TStaticText
    Left = 504
    Top = 152
    Width = 109
    Height = 20
    Caption = 'Tipo de Cuenta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object saldoText: TStaticText
    Left = 351
    Top = 152
    Width = 59
    Height = 20
    Caption = 'saldoText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object creditoDebidoText: TStaticText
    Left = 351
    Top = 192
    Width = 107
    Height = 20
    Caption = 'creditoDebidoText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object tipoText: TStaticText
    Left = 628
    Top = 152
    Width = 50
    Height = 20
    Caption = 'tipoText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object creditoLimiteText: TStaticText
    Left = 628
    Top = 229
    Width = 102
    Height = 20
    Caption = 'creditoLimiteText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object reporteMovimientosButton: TButton
    Left = 576
    Top = 568
    Width = 182
    Height = 25
    Caption = 'Generar Reporte de Movimientos'
    TabOrder = 11
    OnClick = CreateMovementsReport
  end
  object tipoCreditoStaticText: TStaticText
    Left = 503
    Top = 192
    Width = 110
    Height = 20
    Caption = 'Tipo de Cr'#233'dito: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object tipoCreditoText: TStaticText
    Left = 628
    Top = 192
    Width = 91
    Height = 20
    Caption = 'tipoCreditoText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object tasaInteresStaticText: TStaticText
    Left = 213
    Top = 266
    Width = 111
    Height = 20
    Caption = 'Tasa de Inter'#233's:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
  end
  object tasaInteresText: TStaticText
    Left = 351
    Top = 266
    Width = 93
    Height = 20
    Caption = 'tasaInteresText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object interesDebidoStaticText: TStaticText
    Left = 213
    Top = 229
    Width = 109
    Height = 20
    Caption = 'Inter'#233's Debido: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object interesDebidoText: TStaticText
    Left = 351
    Top = 229
    Width = 107
    Height = 20
    Caption = 'interesDebidoText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
  end
  object cuentasGrid: TDBGrid
    Left = 316
    Top = 48
    Width = 333
    Height = 89
    DataSource = DataModule1.CuentasByClaveDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 18
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = ShowAccountInfo
  end
  object movimientosGrid: TDBGrid
    Left = 213
    Top = 400
    Width = 545
    Height = 151
    DataSource = DataModule1.MovimientoByNumeroDS
    TabOrder = 19
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
