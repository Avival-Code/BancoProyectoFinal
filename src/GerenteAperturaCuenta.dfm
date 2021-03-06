object Gerente_AperturaCuenta: TGerente_AperturaCuenta
  Left = 0
  Top = 0
  Caption = 'Apertura de Cuenta'
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
  object StaticText1: TStaticText
    Left = 192
    Top = 24
    Width = 211
    Height = 20
    Caption = 'Introduce el Usuario del Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object usuarioField: TEdit
    Left = 409
    Top = 23
    Width = 224
    Height = 21
    TabOrder = 2
    Text = 'Usuario...'
  end
  object buscarButton: TButton
    Left = 639
    Top = 21
    Width = 98
    Height = 25
    Caption = 'Buscar usuario'
    TabOrder = 3
    OnClick = ShowUserData
  end
  object nombresStaticText: TStaticText
    Left = 192
    Top = 136
    Width = 69
    Height = 20
    Caption = 'Nombres: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object apellidosStaticText: TStaticText
    Left = 192
    Top = 177
    Width = 71
    Height = 20
    Caption = 'Apellidos: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object tipoCuentaStaticText: TStaticText
    Left = 192
    Top = 271
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
  object tipoCuentaBox: TComboBox
    Left = 320
    Top = 271
    Width = 145
    Height = 21
    TabOrder = 7
    Text = 'Tipos...'
  end
  object tasaInteresStaticText: TStaticText
    Left = 192
    Top = 320
    Width = 115
    Height = 20
    Caption = 'Tasa de Inter'#233's: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object tasaInteresField: TEdit
    Left = 320
    Top = 319
    Width = 145
    Height = 21
    TabOrder = 9
    Text = 'Tasa de Inter'#233's...'
  end
  object crearCuentaButton: TButton
    Left = 639
    Top = 512
    Width = 98
    Height = 25
    Caption = 'Crear Cuenta'
    TabOrder = 10
  end
  object ingresoMensualStaticText: TStaticText
    Left = 192
    Top = 368
    Width = 120
    Height = 20
    Caption = 'Ingreso Mensual: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object ingresoMensualField: TEdit
    Left = 320
    Top = 367
    Width = 145
    Height = 21
    TabOrder = 12
    Text = 'Ingreso Mensual...'
  end
  object errorText: TStaticText
    Left = 192
    Top = 544
    Width = 4
    Height = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object usuarioGrid: TDBGrid
    Left = 192
    Top = 50
    Width = 545
    Height = 71
    DataSource = DataModule1.UsuarioUsuarioDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = RecoverUserInformation
  end
  object nombresText: TStaticText
    Left = 320
    Top = 136
    Width = 54
    Height = 20
    Caption = 'nombres'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object apellidosText: TStaticText
    Left = 320
    Top = 177
    Width = 79
    Height = 20
    Caption = 'apellidosText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
end
