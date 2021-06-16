unit GerenteReportes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBGrids, Data,
  Data.DB, Vcl.Grids;

type
  TGerente_Reportes = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    balanceGeneralText: TStaticText;
    ingresosStaticText: TStaticText;
    egresosStaticText: TStaticText;
    ingresosText: TStaticText;
    egresosText: TStaticText;
    clientesStaticText: TStaticText;
    reporteGeneralClientesButton: TButton;
    cajerosStaticText: TStaticText;
    reporteGeneralCajerosButton: TButton;
    reporteCajeroButton: TButton;
    reporteCuentasAtrasadas: TButton;
    balanceStaticText: TStaticText;
    balanceText: TStaticText;
    clientesGrid: TDBGrid;
    cajerosGrid: TDBGrid;
    reporteIngresosButton: TButton;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure GetClientGeneralReport(Sender: TObject);
    procedure GetClientReport(Sender: TObject);
    procedure GetSpecificCashierReport(Sender: TObject);
    procedure GetCuentasVencidasReport(Sender: TObject);
    procedure GetCajeroGeneralReport(Sender: TObject);
    procedure GetReporteIngresos(Sender: TObject);
  private
    selectedClientKey : string;
    selectedCashierKey : string;
    procedure ShowClientData();
    procedure ShowCajeroData();
    procedure GetSelectedClientKey();
    procedure GetSelectedCashierKey();
    procedure ShowBalance();
    { Private declarations }
  public
    procedure ShowAllData();
    { Public declarations }
  end;

var
  Gerente_Reportes: TGerente_Reportes;

implementation

Uses GerenteMainMenu;

{$R *.dfm}

procedure TGerente_Reportes.GetClientReport(Sender: TObject);
begin
  GetSelectedClientKey();
  with DataModule1.ClientReportQuery do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := selectedClientKey;
      Open;
      DataModule1.ClientReport.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.GetCuentasVencidasReport(Sender: TObject);
begin
  with DataModule1.CuentasVencidasQuery do
    begin
      Close;
      Prepare;
      Open;
      DataModule1.CuentasVencidasReport.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.GetReporteIngresos(Sender: TObject);
begin
  with DataModule1.ReporteIngresosQuery do
    begin
      Close;
      Prepare;
      Open;
      DataModule1.ReporteIngresos.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.GetCajeroGeneralReport(Sender: TObject);
begin
  with DataModule1.CashierGeneralReportQuery do
    begin
      Close;
      Prepare;
      Open;
      DataModule1.CashierGeneralReport.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.GetClientGeneralReport(Sender: TObject);
begin
with DataModule1.ClientGeneralReportQuery do
    begin
      Close;
      Prepare;
      Open;
      DataModule1.ClientGeneralReport.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.GetSpecificCashierReport(Sender: TObject);
begin
  GetSelectedCashierKey();
  with DataModule1.CashierSpecificReportQuery do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsString := selectedCashierKey;
      Open;
      DataModule1.CashierSpecificReport.ShowReport( True );
    end;
end;

procedure TGerente_Reportes.ReturnToMainMenu(Sender: TObject);
begin
  Gerente_MainMenu.Show;
  Gerente_Reportes.Hide;
end;

procedure TGerente_Reportes.ShowAllData();
begin
  ShowClientData();
  ShowCajeroData();
  ShowBalance();
end;

procedure TGerente_Reportes.ShowClientData();
begin
  with DataModule1.ClienteAll do
    begin
      Close;
      Prepare;
      Open;
    end;
end;

procedure TGerente_Reportes.ShowCajeroData();
begin
  with DataModule1.CajeroAll do
    begin
      Close;
      Prepare;
      Open;
    end;
end;

procedure TGerente_Reportes.ShowBalance();
var
  current : integer;
  totalSpent : integer;
  totalEarned : integer;
  baseBalance : integer;
begin
  totalSpent := 0;
  totalEarned := 0;
  baseBalance := 0;
  with DataModule1.MovimientosAll do
    begin
      Close;
      Prepare;
      Open;

      if DataModule1.MovimientosAll.RecordCount <> 0 then
        begin
          for current := 0 to DataModule1.MovimientosAll.Table.Rows.Count - 1 do
            begin
                if ( DataModule1.MovimientosAll.Table.Rows[ current ].GetData( 7 ) = DateToStr( Date ) ) then
                  begin
                    totalSpent := totalSpent + DataModule1.MovimientosAll.Table.Rows[ current ].GetData( 4 ).AsInt();
                    totalEarned := totalEarned + DataModule1.MovimientosAll.Table.Rows[ current ].GetData( 3 ).AsInt();
                    baseBalance := baseBalance + DataModule1.MovimientosAll.Table.Rows[ current ].GetData( 2 ).AsInt();
                  end;
            end;

        end;
    end;
  balanceText.Caption := IntToStr( baseBalance + totalEarned - totalSpent );
  egresosText.Caption := IntToStr( totalSpent );
  ingresosText.Caption := IntToStr( totalEarned );
end;

procedure TGerente_Reportes.GetSelectedClientKey();
var
  current : Integer;
  dataSet : TDataSet;
begin
  if clientesGrid.SelectedRows.Count > 0 then
    begin
      dataSet := clientesGrid.DataSource.DataSet;
      try
        dataSet.DisableControls;
        for current := 0 to clientesGrid.SelectedRows.Count - 1 do
          begin
            dataSet.GotoBookmark( TBookmark( Pointer( clientesGrid.SelectedRows.Items[ current ] ) ) );
            selectedClientKey := dataSet.Fields[ 0 ].AsString;
          end;

      finally
        dataSet.EnableControls;
      end;
    end;
end;

procedure TGerente_Reportes.GetSelectedCashierKey();
var
  current : Integer;
  dataSet : TDataSet;
begin
  if cajerosGrid.SelectedRows.Count > 0 then
    begin
      dataSet := cajerosGrid.DataSource.DataSet;
      try
        dataSet.DisableControls;
        for current := 0 to cajerosGrid.SelectedRows.Count - 1 do
          begin
            dataSet.GotoBookmark( TBookmark( Pointer( cajerosGrid.SelectedRows.Items[ current ] ) ) );
            selectedCashierKey := dataSet.Fields[ 0 ].AsString;
          end;

      finally
        dataSet.EnableControls;
      end;
    end;
end;

end.
