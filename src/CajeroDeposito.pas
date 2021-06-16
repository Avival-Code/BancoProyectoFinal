unit CajeroDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data, OutputMessagesFile,
  FireDAC.Stan.Param, StringValidatorFile, Enumerations;

type
  TCajero_Deposito = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    numeroCuentaField: TEdit;
    preguntaCuentaStaticText: TStaticText;
    buscarButton: TButton;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    numeroCuentaStaticText: TStaticText;
    numeroCuentaText: TStaticText;
    apellidosText: TStaticText;
    nombresText: TStaticText;
    cantidadField: TEdit;
    cantidadStaticText: TStaticText;
    depositoButton: TButton;
    tipoStaticText: TStaticText;
    tipoText: TStaticText;
    errorText: TLabel;
    successText: TLabel;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure RealizarBusqueda(Sender: TObject);
    procedure RealizarDeposito(Sender: TObject);
  private
    output : OutputMessages;
    validator : StringValidator;
    procedure FillInUserInfo( claveUsuario : Integer );
    procedure FillInAccountInfo( numeroCuenta: String );
    procedure BuscarCuenta();
    procedure Deposit();
    procedure UpdateAccount( newTotal : Integer );
    procedure RegisterDeposit();
    function ValidateAccountNumber() : boolean;
    function ValidateAmount() : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cajero_Deposito: TCajero_Deposito;

implementation

Uses CajeroMainMenu, LoginPage;

{$R *.dfm}

procedure TCajero_Deposito.RealizarBusqueda(Sender: TObject);
begin
  validator := StringValidator.Create;
  if ValidateAccountNumber() then
    begin
      errorText.Caption := output.NoMessage;
      successText.Caption := output.NoMessage;
      BuscarCuenta();
    end;
end;

procedure TCajero_Deposito.RealizarDeposito(Sender: TObject);
begin
  if ValidateAmount() then
    begin
      Deposit();
    end;
end;

procedure TCajero_Deposito.BuscarCuenta();
begin
  with DataModule1.CuentaTable do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := numeroCuentaField.Text;
      Open;

      if DataModule1.CuentaTable.RecordCount <> 0 then
        begin
          FillInUserInfo( DataModule1.CuentaTable.Fields[ 1 ].AsInteger );
          FillInAccountInfo( numeroCuentaField.Text );
        end
      else
        begin
          successText.Caption := output.NoMessage;
          errorText.Caption := output.AccountNotFound;
        end;
    end;
end;

procedure TCajero_Deposito.FillInUserInfo( claveUsuario: Integer );
begin
  with DataModule1.UsuarioByClave do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := claveUsuario;
      Open;

      if DataModule1.UsuarioByClave.RecordCount <> 0 then
        begin
          nombresText.Caption := DataModule1.UsuarioByClave.Fields[ 1 ].AsString;
          apellidosText.Caption := DataModule1.UsuarioByClave.Fields[ 2 ].AsString;
        end;
    end;
end;

procedure TCajero_Deposito.FillInAccountInfo( numeroCuenta : String );
begin
  with DataModule1.DebitoTable do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := numeroCuenta;
      Open;

      if DataModule1.DebitoTable.RecordCount <> 0 then
        begin
          numeroCuentaText.Caption := numeroCuentaField.Text;
          tipoText.Caption :=  output.DebitTypeAccount;
        end
      else
        begin
          successText.Caption := output.NoMessage;
          errorText.Caption := output.CreditTypeNotAllowed;
        end;
    end;
end;

procedure TCajero_Deposito.Deposit();
var
  newTotal : Integer;
begin
  with DataModule1.DebitoTable do
  begin
    Close;
    Prepare;
    ParamByName( 'numero' ).AsString := numeroCuentaField.Text;
    Open;

    if DataModule1.DebitoTable.RecordCount <> 0 then
      begin
        newTotal := DataModule1.DebitoTable.Fields[ 2 ].AsInteger + StrToInt( cantidadField.Text );
        UpdateAccount( newTotal );
        RegisterDeposit();
        successText.Caption := output.DepositSuccessful;
      end;
  end;
end;

procedure TCajero_Deposito.UpdateAccount( newTotal : Integer );
begin
  with DataModule1.Debitos do
    begin
      Active := TRUE;
      IndexFieldNames := 'NumeroCuenta';
      if DataModule1.Debitos.FindKey( [ numeroCuentaField.Text ] ) then
        begin
          DataModule1.Debitos.Edit;
          DataModule1.Debitos.FieldByName( 'Saldo' ).AsInteger := newTotal;
          DataModule1.Debitos.Post;
        end;
      Active := FALSE;
    end;
end;

procedure TCajero_Deposito.RegisterDeposit();
begin
  DataModule1.Movimientos.Active := TRUE;
  DataModule1.Movimientos.Insert;
  DataModule1.Movimientos.FieldByName( 'NumeroCuenta' ).AsString := numeroCuentaField.Text;
  DataModule1.Movimientos.FieldByName( 'ClaveCajero' ).AsInteger := LoginPage.LoginForm.session.GetSpecialKey;
  DataModule1.Movimientos.FieldByName( 'FechaRealizada' ).AsString := DateToStr( Date );
  DataModule1.Movimientos.FieldByName( 'TipoMovimiento' ).AsInteger := ord( TipoMovimiento.Abono );
  DataModule1.Movimientos.FieldByName( 'Cantidad' ).AsInteger := StrToInt( cantidadField.Text );
  DataModule1.Movimientos.Post;
  DataModule1.Movimientos.Active := False;
end;

procedure TCajero_Deposito.ReturnToMainMenu(Sender: TObject);
begin
  Cajero_MainMenu.Show;
  Cajero_Deposito.Hide;
end;

function TCajero_Deposito.ValidateAccountNumber() : boolean;
begin
  if not validator.IsAccountNumberValid( numeroCuentaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.AccountNumberInvalid();
      Exit( False );
    end;
  Result := True;
end;

function TCajero_Deposito.ValidateAmount() : boolean;
begin
  if not validator.IsTransactionAmountValid( cantidadField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.DepositAmountInvalid;
      Exit( False );
    end;
  Result := True;
end;

end.
