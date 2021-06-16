object GerenteCargos: TGerenteCargos
  Left = 0
  Top = 0
  Caption = 'Cargos'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object background: TShape
    Left = -16
    Top = -40
    Width = 800
    Height = 601
    Brush.Color = clWindowFrame
  end
  object sidebarBackground: TShape
    Left = 0
    Top = -40
    Width = 169
    Height = 601
    Brush.Color = clSilver
  end
  object regresarButton: TButton
    Left = 0
    Top = 528
    Width = 169
    Height = 33
    Caption = 'Regresar'
    TabOrder = 0
  end
  object cargoAnualButton: TButton
    Left = 400
    Top = 56
    Width = 139
    Height = 33
    Caption = 'Aplicar Cargo Anual'
    TabOrder = 1
    OnClick = AplicarCargoAnual
  end
  object cargoMensual: TButton
    Left = 400
    Top = 176
    Width = 139
    Height = 33
    Caption = 'Aplicar Cargo Mensual'
    TabOrder = 2
  end
  object multaNoPagoButton: TButton
    Left = 400
    Top = 288
    Width = 139
    Height = 33
    Caption = 'Aplicar Multa No Pago'
    TabOrder = 3
  end
end
