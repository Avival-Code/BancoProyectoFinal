object Gerente_RegistrarUsuario: TGerente_RegistrarUsuario
  Left = 0
  Top = 0
  Caption = 'Registro de Usuario'
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
    Left = 224
    Top = 579
    Width = 4
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object successText: TLabel
    Left = 224
    Top = 579
    Width = 4
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -12
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
    Left = 408
    Top = 16
    Width = 145
    Height = 23
    Caption = 'Registrar usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object nombresStaticText: TStaticText
    Left = 224
    Top = 56
    Width = 69
    Height = 20
    Caption = 'Nombres: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object apellidosStaticText: TStaticText
    Left = 224
    Top = 104
    Width = 71
    Height = 20
    Caption = 'Apellidos: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object telefonoStaticText: TStaticText
    Left = 224
    Top = 152
    Width = 64
    Height = 20
    Caption = 'Tel'#233'fono:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object correoStaticText: TStaticText
    Left = 224
    Top = 198
    Width = 128
    Height = 20
    Caption = 'Correo Electr'#243'nico:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object domicilioStaticText: TStaticText
    Left = 368
    Top = 352
    Width = 210
    Height = 20
    Caption = 'Detalles de Domicilio del Usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object calleStaticText: TStaticText
    Left = 224
    Top = 391
    Width = 43
    Height = 20
    Caption = 'Calle: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object coloniaStaticText: TStaticText
    Left = 494
    Top = 392
    Width = 59
    Height = 20
    Caption = 'Colonia: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object estadoStaticText: TStaticText
    Left = 224
    Top = 448
    Width = 53
    Height = 20
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object municipioStaticText: TStaticText
    Left = 494
    Top = 448
    Width = 72
    Height = 20
    Caption = 'Municipio: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object numeroInternoStaticText: TStaticText
    Left = 224
    Top = 496
    Width = 115
    Height = 20
    Caption = 'N'#250'mero Interno: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object numeroExternoStaticText: TStaticText
    Left = 224
    Top = 544
    Width = 116
    Height = 20
    Caption = 'N'#250'mero Externo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object nombresField: TEdit
    Left = 315
    Top = 55
    Width = 352
    Height = 21
    TabOrder = 13
  end
  object apellidosField: TEdit
    Left = 315
    Top = 103
    Width = 352
    Height = 21
    TabOrder = 14
  end
  object telefonoField: TEdit
    Left = 315
    Top = 151
    Width = 352
    Height = 21
    TabOrder = 15
  end
  object correoField: TEdit
    Left = 368
    Top = 197
    Width = 299
    Height = 21
    TabOrder = 16
  end
  object calleField: TEdit
    Left = 296
    Top = 391
    Width = 169
    Height = 21
    TabOrder = 17
  end
  object coloniaField: TEdit
    Left = 567
    Top = 391
    Width = 162
    Height = 21
    TabOrder = 18
  end
  object estadoField: TEdit
    Left = 296
    Top = 447
    Width = 169
    Height = 21
    TabOrder = 19
  end
  object municipioField: TEdit
    Left = 567
    Top = 447
    Width = 162
    Height = 21
    TabOrder = 20
  end
  object numeroInternoField: TEdit
    Left = 360
    Top = 495
    Width = 206
    Height = 21
    TabOrder = 21
  end
  object numeroExternoField: TEdit
    Left = 360
    Top = 543
    Width = 206
    Height = 21
    TabOrder = 22
  end
  object registrarButton: TButton
    Left = 614
    Top = 552
    Width = 115
    Height = 25
    Caption = 'Registrar Usuario'
    TabOrder = 23
    OnClick = RegisterUser
  end
  object usuarioStaticText: TStaticText
    Left = 224
    Top = 240
    Width = 61
    Height = 20
    Caption = 'Usuario: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
  end
  object contrasenaStaticText: TStaticText
    Left = 224
    Top = 282
    Width = 88
    Height = 20
    Caption = 'Contrase'#241'a: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
  end
  object usuarioField: TEdit
    Left = 315
    Top = 239
    Width = 352
    Height = 21
    TabOrder = 26
  end
  object contrasenaField: TEdit
    Left = 315
    Top = 281
    Width = 352
    Height = 21
    PasswordChar = '*'
    TabOrder = 27
  end
  object confirmarContrasenaField: TEdit
    Left = 315
    Top = 320
    Width = 352
    Height = 21
    PasswordChar = '*'
    TabOrder = 28
  end
end
