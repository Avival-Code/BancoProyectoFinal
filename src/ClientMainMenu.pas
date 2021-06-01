unit ClientMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Enumerations,
  Vcl.Grids, Vcl.DBGrids, Data, FireDAC.Stan.Param, OutputMessagesFile, RTTI;

type
  TClient_MainMenu = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    cerrarSesiónButton: TButton;
    Cuentas: TLabel;
    StaticText1: TStaticText;
    bienvenidoStaticText: TStaticText;
    saldoStaticText: TStaticText;
    creditoDebidoStaticText: TStaticText;
    creditoLimiteStaticText: TStaticText;
    tipoStaticText: TStaticText;
    saldoText: TStaticText;
    creditoDebidoText: TStaticText;
    tipoText: TStaticText;
    creditoLimiteText: TStaticText;
    reporteMovimientosButton: TButton;
    tipoCreditoStaticText: TStaticText;
    tipoCreditoText: TStaticText;
    tasaInteresStaticText: TStaticText;
    tasaInteresText: TStaticText;
    interesDebidoStaticText: TStaticText;
    interesDebidoText: TStaticText;
    cuentasGrid: TDBGrid;
    movimientosGrid: TDBGrid;
    procedure Logout(Sender: TObject);
    procedure ShowAccountInfo(Column: TColumn);
  private
    selectedAccountNumber : String;
    output : OutputMessages;
    procedure GetAccountNumber();
    procedure LoadDebitAccountValues();
    procedure LoadCreditAccountValues();
    procedure ShowMovements();
    { Private declarations }
  public
    procedure ShowCuentas();
    { Public declarations }
  end;

var
  Client_MainMenu: TClient_MainMenu;

implementation

uses LoginPage;
{$R *.dfm}

procedure TClient_MainMenu.Logout(Sender: TObject);
begin
  LoginForm.Show;
  LoginForm.Logout;
  Client_MainMenu.Hide;
end;

procedure TClient_MainMenu.ShowAccountInfo(Column: TColumn);
begin
  GetAccountNumber();
  LoadDebitAccountValues();
  LoadCreditAccountValues();
end;

procedure TClient_MainMenu.GetAccountNumber();
var
  current : Integer;
  dataSet : TDataSet;
begin
  if cuentasGrid.SelectedRows.Count > 0 then
    begin
      dataSet := cuentasGrid.DataSource.DataSet;
      try
        dataSet.DisableControls;
        for current := 0 to cuentasGrid.SelectedRows.Count - 1 do
          begin
            dataSet.GotoBookmark( TBookmark( Pointer( cuentasGrid.SelectedRows.Items[ current ] ) ) );
            selectedAccountNumber := dataSet.Fields[ 0 ].AsString;
          end;

      finally
        dataSet.EnableControls;
      end;
    end;
end;

procedure TClient_MainMenu.LoadDebitAccountValues();
begin
  with DataModule1.DebitoTable do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := selectedAccountNumber;
      Open;

      if DataModule1.DebitoTable.RecordCount <> 0 then
         begin
           saldoText.Caption := DataModule1.DebitoTable.Fields[ 2 ].AsString;
           tipoText.Caption := output.DebitTypeAccount;
           creditoDebidoText.Caption := output.NoMessage;
           tipoCreditoText.Caption := output.NoMessage;
           interesDebidoText.Caption := output.NoMessage;
           creditoLimiteText.Caption := output.NoMessage;
           tasaInteresText.Caption := output.NoMessage;
           ShowMovements();
         end;
    end;
end;

procedure TClient_MainMenu.LoadCreditAccountValues();
begin
  with DataModule1.CreditoTable do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := selectedAccountNumber;
      Open;

      if DataModule1.CreditoTable.RecordCount <> 0 then
         begin
           saldoText.Caption := output.NoMessage;
           tipoText.Caption := output.CreditTypeAccount;
           creditoDebidoText.Caption := DataModule1.CreditoTable.Fields[ 2 ].AsString;
           tipoCreditoText.Caption := TRttiEnumerationType.GetName( TipoCredito( DataModule1.CreditoTable.Fields[ 6 ].AsInteger ) );
           interesDebidoText.Caption := DataModule1.CreditoTable.Fields[ 5 ].AsString;
           creditoLimiteText.Caption := DataModule1.CreditoTable.Fields[ 3 ].AsString;
           tasaInteresText.Caption := DataModule1.CreditoTable.Fields[ 4 ].AsString;
           ShowMovements();
         end;
    end;
end;

procedure TClient_MainMenu.ShowMovements();
begin
  with DataModule1.MovimientoByNumero do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := selectedAccountNumber;
      Open;
    end;
end;

procedure TClient_MainMenu.ShowCuentas();
begin
  with DataModule1.CuentasByClave do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := LoginForm.session.GetKey;
      Open;
    end;
end;

end.
