unit Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Win.ADODB, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

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
    UsuarioByClave: TFDQuery;
    UsuarioByClaveDS: TDataSource;
    DebitoTable: TFDQuery;
    DebitoDS: TDataSource;
    CreditoTable: TFDQuery;
    CreditoDS: TDataSource;
    MovimientoTable: TFDQuery;
    MovimientoDS: TDataSource;
    CuentasByClave: TFDQuery;
    CuentasByClaveDS: TDataSource;
    MovimientoByNumero: TFDQuery;
    MovimientoByNumeroDS: TDataSource;
    ClienteAll: TFDQuery;
    ClienteAllDS: TDataSource;
    CajeroAll: TFDQuery;
    CajeroAllDS: TDataSource;
    ClientReport: TfrxReport;
    ClientReportDS: TfrxDBDataset;
    ClientReportQuery: TFDQuery;
    PDFExport: TfrxPDFExport;
    ClientGeneralReportDS: TfrxDBDataset;
    ClientGeneralReportQuery: TFDQuery;
    ClientGeneralReport: TfrxReport;
    ClientSpecificReportQuery: TFDQuery;
    ClientSpecificReport: TfrxReport;
    ClientSpecificReportDS: TfrxDBDataset;
    CashierSpecificReport: TfrxReport;
    CashierSpecificReportDS: TfrxDBDataset;
    CashierSpecificReportQuery: TFDQuery;
    CuentasVencidasQuery: TFDQuery;
    CuentasVencidasReportDS: TfrxDBDataset;
    CuentasVencidasReport: TfrxReport;
    MovimientosAll: TFDQuery;
    MovimientosAllDS: TDataSource;
    Usuarios: TFDTable;
    Domicilios: TFDTable;
    Clientes: TFDTable;
    Cajeros: TFDTable;
    Gerentes: TFDTable;
    Cuentas: TFDTable;
    Debitos: TFDTable;
    Creditos: TFDTable;
    Movimientos: TFDTable;
    Cortes: TFDTable;
    CashierGeneralReportQuery: TFDQuery;
    CashierGeneralReport: TfrxReport;
    CashierGeneralReportDS: TfrxDBDataset;
    ReporteIngresosQuery: TFDQuery;
    ReporteIngresosDS: TfrxDBDataset;
    ReporteIngresos: TfrxReport;
    ClientMovements: TFDQuery;
    UsuarioByUsuario: TFDQuery;
    UsuarioUsuarioDS: TDataSource;
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
