object Cajero_Corte: TCajero_Corte
  Left = 0
  Top = 0
  Caption = 'Reportar Corte'
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
  object errorText: TLabel
    Left = 208
    Top = 448
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object successText: TLabel
    Left = 208
    Top = 452
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
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
  object StaticText1: TStaticText
    Left = 392
    Top = 22
    Width = 192
    Height = 20
    Caption = 'Movimientos Realizados Hoy:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object dineroEntranteStaticText: TStaticText
    Left = 208
    Top = 296
    Width = 148
    Height = 20
    Caption = 'Total Dinero Entrante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dineroSalienteStaticText: TStaticText
    Left = 208
    Top = 336
    Width = 147
    Height = 20
    Caption = 'Total Dinero Saliente: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 208
    Top = 376
    Width = 207
    Height = 20
    Caption = 'Dinero en Caja al Inicio del D'#237'a: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object dineroInicioField: TEdit
    Left = 429
    Top = 372
    Width = 108
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = SetBalance
  end
  object dineroEntranteText: TStaticText
    Left = 369
    Top = 299
    Width = 168
    Height = 17
    Caption = '-----------------------------------------'
    TabOrder = 6
  end
  object dineroSalienteText: TStaticText
    Left = 369
    Top = 336
    Width = 168
    Height = 17
    Caption = '-----------------------------------------'
    TabOrder = 7
  end
  object balanceStaticText: TStaticText
    Left = 208
    Top = 416
    Width = 110
    Height = 20
    Caption = 'Balance del D'#237'a: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object balanceText: TStaticText
    Left = 369
    Top = 416
    Width = 168
    Height = 17
    Caption = '----------------------------------------'
    TabOrder = 9
  end
  object enviarCorteButton: TButton
    Left = 614
    Top = 536
    Width = 147
    Height = 25
    Caption = 'Enviar Reporte de Corte'
    TabOrder = 10
    OnClick = EnviarCorte
  end
  object DBGrid1: TDBGrid
    Left = 240
    Top = 48
    Width = 505
    Height = 217
    DataSource = DataModule1.MovimientoDS
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
