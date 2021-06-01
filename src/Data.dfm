object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 444
  Width = 495
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
  object UsuarioUpdate: TFDUpdateSQL
    Connection = BancoconnectionConnection
    InsertSQL.Strings = (
      'INSERT INTO bancodb.usuario'
      '(nombres, apellidos, telefono, correoelectronico, '
      '  usuario, contrasena)'
      'VALUES (:nombres, :apellidos, :telefono, :correoelectronico, '
      '  :usuario, :contrasena)')
    ModifySQL.Strings = (
      'UPDATE bancodb.usuario'
      
        'SET nombres = :nombres, apellidos = :apellidos, telefono = :tele' +
        'fono, '
      '  correoelectronico = :correoelectronico, usuario = :usuario, '
      '  contrasena = :contrasena'
      'WHERE claveusuario = :claveusuario')
    DeleteSQL.Strings = (
      'DELETE FROM bancodb.usuario'
      'WHERE claveusuario = :claveusuario')
    FetchRowSQL.Strings = (
      
        'SELECT claveusuario, nombres, apellidos, telefono, correoelectro' +
        'nico, '
      '  usuario, contrasena'
      'FROM bancodb.usuario'
      'WHERE claveusuario = :old_claveusuario')
    Left = 280
    Top = 288
  end
  object Usuarios: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.usuario'
    TableName = 'bancoDB.usuario'
    Left = 280
    Top = 392
  end
  object Clientes: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.cliente'
    TableName = 'bancoDB.cliente'
    Left = 360
    Top = 392
  end
  object Domicilios: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.domicilio'
    TableName = 'bancoDB.domicilio'
    Left = 280
    Top = 336
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
        Value = Null
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
  object Movimientos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.movimiento'
    TableName = 'bancoDB.movimiento'
    Left = 360
    Top = 288
  end
  object Debitos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.debito'
    TableName = 'bancoDB.debito'
    Left = 424
    Top = 392
  end
  object Creditos: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.credito'
    TableName = 'bancoDB.credito'
    Left = 360
    Top = 336
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
  object Cortes: TFDTable
    Connection = BancoconnectionConnection
    UpdateOptions.UpdateTableName = 'bancoDB.reportedecorte'
    TableName = 'bancoDB.reportedecorte'
    Left = 424
    Top = 336
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
end
