object LoginForm: TLoginForm
  Left = 0
  Top = 0
  Caption = 'LoginForm'
  ClientHeight = 249
  ClientWidth = 305
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
    Width = 305
    Height = 449
    Brush.Color = clWindowFrame
  end
  object screenPurpose: TLabel
    Left = 108
    Top = 40
    Width = 95
    Height = 19
    Caption = 'Iniciar Sesi'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object username: TLabel
    Left = 128
    Top = 85
    Width = 40
    Height = 13
    Caption = 'Usuario:'
  end
  object password: TLabel
    Left = 116
    Top = 141
    Width = 60
    Height = 13
    Caption = 'Contrase'#241'a:'
  end
  object errorText: TLabel
    Left = 22
    Top = 228
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object usernameText: TEdit
    Left = 56
    Top = 104
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object passwordText: TEdit
    Left = 56
    Top = 160
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object LoginButton: TButton
    Left = 174
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Iniciar Sesi'#243'n'
    TabOrder = 2
    OnClick = Login
  end
end
