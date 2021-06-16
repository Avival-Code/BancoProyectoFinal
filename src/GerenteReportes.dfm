object Gerente_Reportes: TGerente_Reportes
  Left = 0
  Top = 0
  Caption = 'Reportes y Balance General'
  ClientHeight = 600
  ClientWidth = 800
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
    Top = -1
    Width = 800
    Height = 601
    Brush.Color = clWindowFrame
  end
  object sidebarBackground: TShape
    Left = 0
    Top = -1
    Width = 169
    Height = 601
    Brush.Color = clSilver
  end
  object regresarButton: TButton
    Left = 0
    Top = 567
    Width = 169
    Height = 33
    Caption = 'Regresar'
    TabOrder = 0
    OnClick = ReturnToMainMenu
  end
  object balanceGeneralText: TStaticText
    Left = 416
    Top = 16
    Width = 137
    Height = 23
    Caption = 'Balance General'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object ingresosStaticText: TStaticText
    Left = 208
    Top = 56
    Width = 117
    Height = 20
    Caption = 'Ingresos del D'#237'a: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object egresosStaticText: TStaticText
    Left = 520
    Top = 56
    Width = 107
    Height = 20
    Caption = 'Egresos del D'#237'a:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ingresosText: TStaticText
    Left = 344
    Top = 56
    Width = 77
    Height = 20
    Caption = 'ingresosText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object egresosText: TStaticText
    Left = 633
    Top = 56
    Width = 74
    Height = 20
    Caption = 'egresosText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object clientesStaticText: TStaticText
    Left = 208
    Top = 112
    Width = 60
    Height = 20
    Caption = 'Clientes:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object reporteGeneralClientesButton: TButton
    Left = 534
    Top = 248
    Width = 179
    Height = 25
    Caption = 'Generar Reporte General Clientes'
    TabOrder = 7
    OnClick = GetClientGeneralReport
  end
  object cajerosStaticText: TStaticText
    Left = 208
    Top = 320
    Width = 58
    Height = 20
    Caption = 'Cajeros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object reporteGeneralCajerosButton: TButton
    Left = 374
    Top = 488
    Width = 179
    Height = 25
    Caption = 'Generar Reporte General Cajeros'
    TabOrder = 9
    OnClick = GetCajeroGeneralReport
  end
  object reporteCajeroButton: TButton
    Left = 576
    Top = 488
    Width = 137
    Height = 25
    Caption = 'Generar Reporte Cajero'
    TabOrder = 10
    OnClick = GetSpecificCashierReport
  end
  object reporteCuentasAtrasadas: TButton
    Left = 520
    Top = 536
    Width = 193
    Height = 25
    Caption = 'Generar Reporte Cuentas Vencidas'
    TabOrder = 11
    OnClick = GetCuentasVencidasReport
  end
  object balanceStaticText: TStaticText
    Left = 520
    Top = 88
    Width = 97
    Height = 20
    Caption = 'Balance Neto: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object balanceText: TStaticText
    Left = 633
    Top = 88
    Width = 73
    Height = 20
    Caption = 'balanceText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object clientesGrid: TDBGrid
    Left = 208
    Top = 131
    Width = 505
    Height = 87
    DataSource = DataModule1.ClienteAllDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cajerosGrid: TDBGrid
    Left = 208
    Top = 338
    Width = 505
    Height = 87
    DataSource = DataModule1.CajeroAllDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object reporteIngresosButton: TButton
    Left = 344
    Top = 536
    Width = 147
    Height = 25
    Caption = 'Generar Reporte Ingresos'
    TabOrder = 16
    OnClick = GetReporteIngresos
  end
end
