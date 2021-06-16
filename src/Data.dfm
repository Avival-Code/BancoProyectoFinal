object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 591
  Width = 775
  object BancoconnectionConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=BancoConnection')
    Connected = True
    LoginPrompt = False
    Left = 59
    Top = 7
  end
  object UsuarioTableSingle: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM bancoDB.usuario'
      'WHERE usuario = :usuario')
    Left = 67
    Top = 55
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = 'AvivalZero'
      end>
  end
  object usuarioSingleDS: TDataSource
    DataSet = UsuarioTableSingle
    Left = 160
    Top = 56
  end
  object CajeroTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM bancoDB.cajero'
      'WHERE ClaveUsuario = :clave')
    Left = 66
    Top = 197
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ClienteTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM bancoDB.cliente'
      'WHERE ClaveUsuario = :clave')
    Left = 71
    Top = 151
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object GerenteTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM bancoDB.gerente'
      'WHERE ClaveUsuario = :clave')
    Left = 68
    Top = 102
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object CajeroDS: TDataSource
    DataSet = CajeroTable
    Left = 160
    Top = 200
  end
  object GerenteDS: TDataSource
    DataSet = GerenteTable
    Left = 160
    Top = 104
  end
  object ClienteDS: TDataSource
    DataSet = ClienteTable
    Left = 160
    Top = 152
  end
  object CuentaTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM bancoDB.cuenta'
      'WHERE NumeroCuenta= :numero')
    Left = 70
    Top = 244
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object CuentaDS: TDataSource
    DataSet = CuentaTable
    Left = 152
    Top = 248
  end
  object UsuarioByClave: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Usuario '
      'WHERE ClaveUsuario = :clave')
    Left = 328
    Top = 120
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object UsuarioByClaveDS: TDataSource
    DataSet = UsuarioByClave
    Left = 424
    Top = 120
  end
  object DebitoTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Debito'
      'WHERE NumeroCuenta = :numero')
    Left = 64
    Top = 296
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DebitoDS: TDataSource
    DataSet = DebitoTable
    Left = 152
    Top = 296
  end
  object CreditoTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Credito '
      'WHERE NumeroCuenta = :numero')
    Left = 64
    Top = 344
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object CreditoDS: TDataSource
    DataSet = CreditoTable
    Left = 152
    Top = 352
  end
  object MovimientoTable: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Movimiento'
      'WHERE ClaveCajero = :clave '
      'AND FechaRealizada = :fecha')
    Left = 328
    Top = 16
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FECHA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object MovimientoDS: TDataSource
    DataSet = MovimientoTable
    Left = 416
    Top = 16
  end
  object CuentasByClave: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Cuenta'
      'WHERE ClaveUsuario = :clave')
    Left = 328
    Top = 64
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object CuentasByClaveDS: TDataSource
    DataSet = CuentasByClave
    Left = 416
    Top = 64
  end
  object MovimientoByNumero: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Movimiento'
      'WHERE NumeroCuenta = :numero')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object MovimientoByNumeroDS: TDataSource
    DataSet = MovimientoByNumero
    Left = 408
    Top = 168
  end
  object ClienteAll: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      
        'SELECT Cliente.ClaveCliente, Usuario.Nombres, Usuario.Apellidos ' +
        'FROM Usuario'
      
        'INNER JOIN Cliente ON Usuario.ClaveUsuario = Cliente.ClaveUsuari' +
        'o')
    Left = 248
    Top = 224
  end
  object ClienteAllDS: TDataSource
    DataSet = ClienteAll
    Left = 304
    Top = 224
  end
  object CajeroAll: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      
        'SELECT Cajero.ClaveCajero, Usuario.Nombres, Usuario.Apellidos FR' +
        'OM Usuario'
      'INNER JOIN Cajero ON Usuario.ClaveUsuario = Cajero.ClaveUsuario')
    Left = 360
    Top = 224
  end
  object CajeroAllDS: TDataSource
    DataSet = CajeroAll
    Left = 416
    Top = 224
  end
  object ClientReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44360.945430925900000000
    ReportOptions.LastChange = 44360.945430925900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 632
    Top = 16
    Datasets = <
      item
        DataSet = ClientReportDS
        DataSetName = 'ClientReportDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object MovimientosCliente: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de Movimientos de Cliente')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 114.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ClaveMovimiento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 182.031540000000000000
          Width = 122.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NumeroCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 360.724490000000000000
          Width = 104.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FechaRealizada')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 506.299320000000000000
          Width = 107.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TipoMovimiento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 654.874150000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = ClientReportDS
        DataSetName = 'ClientReportDS'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 114.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ClaveMovimiento'
          DataSet = ClientReportDS
          DataSetName = 'ClientReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientReportDS."ClaveMovimiento"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 182.031540000000000000
          Top = 3.779530000000000000
          Width = 122.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NumeroCuenta'
          DataSet = ClientReportDS
          DataSetName = 'ClientReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientReportDS."NumeroCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 360.724490000000000000
          Top = 3.779530000000000000
          Width = 104.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FechaRealizada'
          DataSet = ClientReportDS
          DataSetName = 'ClientReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientReportDS."FechaRealizada"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 506.299320000000000000
          Top = 3.779530000000000000
          Width = 107.000000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TipoMovimiento'
          DataSet = ClientReportDS
          DataSetName = 'ClientReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientReportDS."TipoMovimiento"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 654.874150000000000000
          Top = 3.779530000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Cantidad'
          DataSet = ClientReportDS
          DataSetName = 'ClientReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientReportDS."Cantidad"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 740.409927000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 181.039487000000000000
          Top = 4.779530000000000000
          Width = 559.370440000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Tipo Movimiento: 0=Abono, 1=Retiro, 2=Pago, 3=Multa             ' +
              '   Page [Page#]')
        end
      end
    end
  end
  object ClientReportDS: TfrxDBDataset
    UserName = 'ClientReportDS'
    CloseDataSource = False
    DataSet = ClientReportQuery
    BCDToCurrency = False
    Left = 720
    Top = 16
  end
  object ClientReportQuery: TFDQuery
    Active = True
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Movimiento '
      'WHERE NumeroCuenta = :numero')
    Left = 536
    Top = 16
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object PDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 344
    Top = 432
  end
  object ClientGeneralReportDS: TfrxDBDataset
    UserName = 'ClientGeneralReportDS'
    CloseDataSource = False
    DataSet = ClientGeneralReportQuery
    BCDToCurrency = False
    Left = 712
    Top = 72
  end
  object ClientGeneralReportQuery: TFDQuery
    Active = True
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Usuario INNER JOIN Cuenta'
      'ON Usuario.ClaveUsuario = Cuenta.ClaveUsuario')
    Left = 536
    Top = 72
  end
  object ClientGeneralReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44361.042970393500000000
    ReportOptions.LastChange = 44361.042970393500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 624
    Top = 88
    Datasets = <
      item
        DataSet = ClientGeneralReportDS
        DataSetName = 'ClientGeneralReportDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte General de Clientes')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 105.826840000000000000
        Width = 740.409927000000000000
        DataSet = ClientGeneralReportDS
        DataSetName = 'ClientGeneralReportDS'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nombres')
          ParentFont = False
          Style = 'Header'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 3.779530000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Nombres'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."Nombres"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Apellidos')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 26.456710000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Apellidos'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."Apellidos"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefono')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 49.133890000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Telefono'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."Telefono"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 71.811070000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CorreoElectronico')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 71.811070000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CorreoElectronico'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."CorreoElectronico"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NumeroCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 94.488250000000000000
          Width = 122.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NumeroCuenta'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."NumeroCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 117.165430000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FechaApertura')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 117.165430000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FechaApertura'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."FechaApertura"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 139.842610000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EstadoCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 139.842610000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'EstadoCuenta'
          DataSet = ClientGeneralReportDS
          DataSetName = 'ClientGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ClientGeneralReportDS."EstadoCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 328.819110000000000000
        Width = 740.409927000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo18: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 105.448887000000000000
          Top = 1.000000000000000000
          Width = 634.961040000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Estado Cuenta: 0=Activa, 1=Eliminada, 2=Congelada, 3=Atrasada   ' +
              '                 Page [Page#]')
        end
      end
    end
  end
  object ClientSpecificReportQuery: TFDQuery
    Connection = BancoconnectionConnection
    Left = 528
    Top = 144
  end
  object ClientSpecificReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44361.067820243060000000
    ReportOptions.LastChange = 44361.067820243060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 608
    Top = 160
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object ClientSpecificReportDS: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ClientSpecificReportQuery
    BCDToCurrency = False
    Left = 704
    Top = 176
  end
  object CashierSpecificReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44361.082733020800000000
    ReportOptions.LastChange = 44361.082733020800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 616
    Top = 248
    Datasets = <
      item
        DataSet = CashierSpecificReportDS
        DataSetName = 'CashierSpecificReportDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de Movimientos Realizados por Cajero')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 122.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NumeroCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 186.252010000000000000
          Width = 81.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ClaveCajero')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 331.504020000000000000
          Width = 104.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FechaRealizada')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 507.315090000000000000
          Width = 107.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TipoMovimiento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 659.669450000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = CashierSpecificReportDS
        DataSetName = 'CashierSpecificReportDS'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 122.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NumeroCuenta'
          DataSet = CashierSpecificReportDS
          DataSetName = 'CashierSpecificReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierSpecificReportDS."NumeroCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 186.252010000000000000
          Top = 3.779530000000000000
          Width = 81.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ClaveCajero'
          DataSet = CashierSpecificReportDS
          DataSetName = 'CashierSpecificReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierSpecificReportDS."ClaveCajero"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 331.504020000000000000
          Top = 3.779530000000000000
          Width = 104.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FechaRealizada'
          DataSet = CashierSpecificReportDS
          DataSetName = 'CashierSpecificReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierSpecificReportDS."FechaRealizada"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 507.315090000000000000
          Top = 3.779530000000000000
          Width = 107.000000000000000000
          Height = 18.897650000000000000
          DataField = 'TipoMovimiento'
          DataSet = CashierSpecificReportDS
          DataSetName = 'CashierSpecificReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierSpecificReportDS."TipoMovimiento"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 659.669450000000000000
          Top = 3.779530000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Cantidad'
          DataSet = CashierSpecificReportDS
          DataSetName = 'CashierSpecificReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierSpecificReportDS."Cantidad"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 740.409927000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 131.905597000000000000
          Top = 1.000000000000000000
          Width = 608.504330000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Tipo Movimiento: 0=Abono, 1=Retiro, 2=Pago, 3=Multa             ' +
              '                Page [Page#]')
        end
      end
    end
  end
  object CashierSpecificReportDS: TfrxDBDataset
    UserName = 'CashierSpecificReportDS'
    CloseDataSource = False
    DataSet = CashierSpecificReportQuery
    BCDToCurrency = False
    Left = 704
    Top = 264
  end
  object CashierSpecificReportQuery: TFDQuery
    Active = True
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Movimiento '
      'WHERE ClaveCajero = :clave')
    Left = 528
    Top = 224
    ParamData = <
      item
        Name = 'CLAVE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object CuentasVencidasQuery: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Cuenta '
      'INNER JOIN Usuario '
      'ON Cuenta.ClaveUsuario = Usuario.ClaveUsuario '
      'WHERE Cuenta.EstadoCuenta = 3')
    Left = 520
    Top = 296
  end
  object CuentasVencidasReportDS: TfrxDBDataset
    UserName = 'CuentasVencidasDS'
    CloseDataSource = False
    DataSet = CuentasVencidasQuery
    BCDToCurrency = False
    Left = 696
    Top = 344
  end
  object CuentasVencidasReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44361.106436400460000000
    ReportOptions.LastChange = 44361.106436400460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 616
    Top = 328
    Datasets = <
      item
        DataSet = CuentasVencidasReportDS
        DataSetName = 'CuentasVencidasDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.787880000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.787880000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de Cuentas Vencidas')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 204.094620000000000000
        Top = 105.826840000000000000
        Width = 740.787880000000000000
        DataSet = CuentasVencidasReportDS
        DataSetName = 'CuentasVencidasDS'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nombres')
          ParentFont = False
          Style = 'Header'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Nombres'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."Nombres"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Apellidos')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 22.677180000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Apellidos'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."Apellidos"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 45.354360000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefono')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 45.354360000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Telefono'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."Telefono"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 68.031540000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CorreoElectronico')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 68.031540000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CorreoElectronico'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."CorreoElectronico"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Usuario')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 90.708720000000000000
          Width = 188.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."Usuario"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Contrasena')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 113.385900000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Contrasena'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."Contrasena"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 136.063080000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NumeroCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 136.063080000000000000
          Width = 122.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NumeroCuenta'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."NumeroCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 158.740260000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FechaApertura')
          ParentFont = False
          Style = 'Header'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 158.740260000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FechaApertura'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."FechaApertura"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 181.417440000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EstadoCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 138.897650000000000000
          Top = 181.417440000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'EstadoCuenta'
          DataSet = CuentasVencidasReportDS
          DataSetName = 'CuentasVencidasDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CuentasVencidasDS."EstadoCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 370.393940000000000000
        Width = 740.787880000000000000
        object Memo20: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.787880000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo22: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 665.197280000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object MovimientosAll: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM ReporteDeCorte')
    Left = 160
    Top = 8
  end
  object MovimientosAllDS: TDataSource
    DataSet = MovimientosAll
    Left = 224
    Top = 8
  end
  object Usuarios: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.usuario'
    TableName = 'bancoDB.usuario'
    Left = 248
    Top = 288
  end
  object Domicilios: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.domicilio'
    TableName = 'bancoDB.domicilio'
    Left = 304
    Top = 288
  end
  object Clientes: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.cliente'
    TableName = 'bancoDB.cliente'
    Left = 360
    Top = 288
  end
  object Cajeros: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.cajero'
    TableName = 'bancoDB.cajero'
    Left = 416
    Top = 296
  end
  object Gerentes: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.gerente'
    TableName = 'bancoDB.gerente'
    Left = 240
    Top = 360
  end
  object Cuentas: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.cuenta'
    TableName = 'bancoDB.cuenta'
    Left = 288
    Top = 360
  end
  object Debitos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.debito'
    TableName = 'bancoDB.debito'
    Left = 352
    Top = 360
  end
  object Creditos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.credito'
    TableName = 'bancoDB.credito'
    Left = 408
    Top = 360
  end
  object Movimientos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.movimiento'
    TableName = 'bancoDB.movimiento'
    Left = 216
    Top = 432
  end
  object Cortes: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.reportedecorte'
    TableName = 'bancoDB.reportedecorte'
    Left = 288
    Top = 432
  end
  object CashierGeneralReportQuery: TFDQuery
    Active = True
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Cajero INNER JOIN ReporteDeCorte'
      'ON Cajero.ClaveCajero = ReporteDeCorte.ClaveCajero')
    Left = 504
    Top = 360
  end
  object CashierGeneralReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44361.153088553200000000
    ReportOptions.LastChange = 44361.153088553200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 608
    Top = 392
    Datasets = <
      item
        DataSet = CashierGeneralReportDS
        DataSetName = 'CashierGeneralReportDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte General de Cajeros')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 81.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ClaveCajero')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 103.677180000000000000
          Width = 99.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CantidadInicial')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 225.354360000000000000
          Width = 110.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DineroIngresado')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 354.252010000000000000
          Width = 100.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DineroRetirado')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 476.929190000000000000
          Width = 92.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CantidadFinal')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 587.826840000000000000
          Width = 155.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'MovimientosRealizados')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = CashierGeneralReportDS
        DataSetName = 'CashierGeneralReportDS'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 81.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ClaveCajero'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."ClaveCajero"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 103.677180000000000000
          Top = 3.779530000000000000
          Width = 99.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CantidadInicial'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."CantidadInicial"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 225.354360000000000000
          Top = 3.779530000000000000
          Width = 110.000000000000000000
          Height = 18.897650000000000000
          DataField = 'DineroIngresado'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."DineroIngresado"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 354.252010000000000000
          Top = 3.779530000000000000
          Width = 100.000000000000000000
          Height = 18.897650000000000000
          DataField = 'DineroRetirado'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."DineroRetirado"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 476.929190000000000000
          Top = 3.779530000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CantidadFinal'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."CantidadFinal"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 587.826840000000000000
          Top = 3.779530000000000000
          Width = 155.000000000000000000
          Height = 18.897650000000000000
          DataField = 'MovimientosRealizados'
          DataSet = CashierGeneralReportDS
          DataSetName = 'CashierGeneralReportDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[CashierGeneralReportDS."MovimientosRealizados"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 740.409927000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object CashierGeneralReportDS: TfrxDBDataset
    UserName = 'CashierGeneralReportDS'
    CloseDataSource = False
    DataSet = CashierGeneralReportQuery
    BCDToCurrency = False
    Left = 696
    Top = 408
  end
  object ReporteIngresosQuery: TFDQuery
    Active = True
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Movimiento '
      'WHERE TipoMovimiento = 0 OR TipoMovimiento = 2')
    Left = 480
    Top = 416
  end
  object ReporteIngresosDS: TfrxDBDataset
    UserName = 'ReporteIngresosDS'
    CloseDataSource = False
    DataSet = ReporteIngresosQuery
    BCDToCurrency = False
    Left = 672
    Top = 456
  end
  object ReporteIngresos: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44362.458727256900000000
    ReportOptions.LastChange = 44362.458727256900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 576
    Top = 448
    Datasets = <
      item
        DataSet = ReporteIngresosDS
        DataSetName = 'ReporteIngresosDS'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 114.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ClaveMovimiento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 136.677180000000000000
          Width = 122.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'NumeroCuenta')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 288.913420000000000000
          Width = 81.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ClaveCajero')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 400.149660000000000000
          Width = 104.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FechaRealizada')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 530.606370000000000000
          Width = 107.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TipoMovimiento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 664.063080000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = ReporteIngresosDS
        DataSetName = 'ReporteIngresosDS'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 114.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ClaveMovimiento'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."ClaveMovimiento"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 136.677180000000000000
          Top = 3.779530000000000000
          Width = 122.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NumeroCuenta'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."NumeroCuenta"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 288.913420000000000000
          Top = 3.779530000000000000
          Width = 81.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ClaveCajero'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."ClaveCajero"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 400.149660000000000000
          Top = 3.779530000000000000
          Width = 104.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FechaRealizada'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."FechaRealizada"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 530.606370000000000000
          Top = 3.779530000000000000
          Width = 107.000000000000000000
          Height = 18.897650000000000000
          DataField = 'TipoMovimiento'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."TipoMovimiento"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 664.063080000000000000
          Top = 3.779530000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Cantidad'
          DataSet = ReporteIngresosDS
          DataSetName = 'ReporteIngresosDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ReporteIngresosDS."Cantidad"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 234.330860000000000000
        Width = 740.409927000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 3.779530000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<ReporteIngresosDS."Cantidad">,MasterData1)];')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de ingresos:')
        end
      end
    end
  end
  object ClientMovements: TFDQuery
    Connection = BancoconnectionConnection
    Left = 464
    Top = 480
  end
  object UsuarioByUsuario: TFDQuery
    Connection = BancoconnectionConnection
    SQL.Strings = (
      'SELECT * FROM Usuario '
      'WHERE Usuario = :usuario ')
    Left = 40
    Top = 424
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object UsuarioUsuarioDS: TDataSource
    DataSet = UsuarioByUsuario
    Left = 128
    Top = 432
  end
end
