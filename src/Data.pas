unit Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    BancoconnectionConnection: TFDConnection;
    CajeroTable: TFDQuery;
    UsuarioTableSingle: TFDQuery;
    usuarioSingleDS: TDataSource;
    ClienteTable: TFDQuery;
    GerenteTable: TFDQuery;
    CajeroDS: TDataSource;
    GerenteDS: TDataSource;
    ClienteDS: TDataSource;
    CuentaTable: TFDQuery;
    CuentaDS: TDataSource;
    UsuarioUpdate: TFDUpdateSQL;
    Usuarios: TFDTable;
    Clientes: TFDTable;
    Domicilios: TFDTable;
    UsuarioByClave: TFDQuery;
    UsuarioByClaveDS: TDataSource;
    DebitoTable: TFDQuery;
    DebitoDS: TDataSource;
    Movimientos: TFDTable;
    Debitos: TFDTable;
    Creditos: TFDTable;
    CreditoTable: TFDQuery;
    CreditoDS: TDataSource;
    MovimientoTable: TFDQuery;
    MovimientoDS: TDataSource;
    Cortes: TFDTable;
    CuentasByClave: TFDQuery;
    CuentasByClaveDS: TDataSource;
    MovimientoByNumero: TFDQuery;
    MovimientoByNumeroDS: TDataSource;
    ClienteAll: TFDQuery;
    ClienteAllDS: TDataSource;
    CajeroAll: TFDQuery;
    CajeroAllDS: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
