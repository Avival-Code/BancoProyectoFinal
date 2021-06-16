object Cajero_Pago: TCajero_Pago
  Left = 0
  Top = 0
  Caption = 'Realizar Pago'
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
    Left = 200
    Top = 352
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
    Left = 200
    Top = 356
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
  object preguntaCuentaStaticText: TStaticText
    Left = 200
    Top = 24
    Width = 199
    Height = 20
    Caption = 'N'#250'mero de Cuenta del Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object numeroCuentaField: TEdit
    Left = 200
    Top = 50
    Width = 265
    Height = 21
    TabOrder = 2
  end
  object buscarButton: TButton
    Left = 471
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = RealizarBusqueda
  end
  object nombresStaticText: TStaticText
    Left = 200
    Top = 104
    Width = 65
    Height = 20
    Caption = 'Nombres:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object apellidosStaticText: TStaticText
    Left = 200
    Top = 144
    Width = 67
    Height = 20
    Caption = 'Apellidos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object tipoStaticText: TStaticText
    Left = 200
    Top = 224
    Width = 89
    Height = 20
    Caption = 'Tipo Cuenta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object numeroCuentaStaticText: TStaticText
    Left = 200
    Top = 184
    Width = 132
    Height = 20
    Caption = 'N'#250'mero de Cuenta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object nombresText: TStaticText
    Left = 360
    Top = 104
    Width = 136
    Height = 17
    Caption = '---------------------------------'
    TabOrder = 8
  end
  object apellidosText: TStaticText
    Left = 360
    Top = 144
    Width = 136
    Height = 17
    Caption = '---------------------------------'
    TabOrder = 9
  end
  object numeroCuentaText: TStaticText
    Left = 360
    Top = 184
    Width = 139
    Height = 20
    Caption = '---------------------------'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object tipoText: TStaticText
    Left = 360
    Top = 224
    Width = 140
    Height = 17
    Caption = '----------------------------------'
    TabOrder = 11
  end
  object cantidadStaticText: TStaticText
    Left = 200
    Top = 286
    Width = 124
    Height = 20
    Caption = 'Cantidad a Pagar: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object cantidadField: TEdit
    Left = 200
    Top = 312
    Width = 265
    Height = 21
    TabOrder = 13
  end
  object pagoButton: TButton
    Left = 471
    Top = 310
    Width = 106
    Height = 25
    Caption = 'Realizar Pago'
    TabOrder = 14
    OnClick = RealizarPago
  end
end
