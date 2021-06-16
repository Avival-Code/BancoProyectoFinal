object Gerente_MainMenu: TGerente_MainMenu
  Left = 0
  Top = 0
  Caption = 'Men'#250' Principal'
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
  object cerrarSesiónButton: TButton
    Left = 0
    Top = 567
    Width = 169
    Height = 33
    Caption = 'CerrarSesi'#243'n'
    TabOrder = 0
    OnClick = Logout
  end
  object reportesButton: TButton
    Left = 0
    Top = 536
    Width = 169
    Height = 33
    Caption = 'Reportes'
    TabOrder = 1
    OnClick = ShowReportes
  end
  object aperturaCuentaButton: TButton
    Left = 0
    Top = 505
    Width = 169
    Height = 33
    Caption = 'Apertura de Cuenta'
    TabOrder = 2
    OnClick = ShowAperturaCuenta
  end
  object registrarUsuario: TButton
    Left = 0
    Top = 474
    Width = 169
    Height = 33
    Caption = 'Registrar Usuario'
    TabOrder = 3
    OnClick = ShowRegistroUsuario
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
    TabOrder = 4
  end
  object preguntaStaticText: TStaticText
    Left = 16
    Top = 40
    Width = 130
    Height = 17
    Caption = #191'En qu'#233' te puedo ayudar?'
    TabOrder = 5
  end
  object cargosButton: TButton
    Left = 0
    Top = 368
    Width = 169
    Height = 33
    Caption = 'Cargos'
    TabOrder = 6
  end
end
