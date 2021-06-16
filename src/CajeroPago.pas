unit CajeroPago;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data, StringValidatorFile,
  OutputMessagesFile, FireDAC.Stan.Param, Enumerations;

type
  TCajero_Pago = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    preguntaCuentaStaticText: TStaticText;
    numeroCuentaField: TEdit;
    buscarButton: TButton;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    tipoStaticText: TStaticText;
    numeroCuentaStaticText: TStaticText;
    nombresText: TStaticText;
    apellidosText: TStaticText;
    numeroCuentaText: TStaticText;
    tipoText: TStaticText;
    cantidadStaticText: TStaticText;
    cantidadField: TEdit;
    pagoButton: TButton;
    errorText: TLabel;
    successText: TLabel;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure RealizarBusqueda(Sender: TObject);
    procedure RealizarPago(Sender: TObject);
  private
    validator : StringValidator;
    output : OutputMessages;
    { Private declarations }
    procedure BuscarCuenta();
    procedure Pay();
    function CalculateRemainingInterest( interestOwed : Integer; VAR remainingPaymentAmount : Integer  ) : Integer;
    function CalculateRemainingSaldo( saldoOwed: Integer; VAR remainingPaymentAmount : Integer ) : Integer;
    procedure FillInUserInfo( claveUsuario: Integer );
    procedure FillInAccountInfo( numeroCuenta : String );
    procedure UpdateCreditAccount( newUsedSaldo, newInterestOwed : Integer );
    procedure RegisterPayment();
    function ValidateAccountNumber() : boolean;
    function ValidateAmount() : boolean;
  public
    { Public declarations }
  end;

var
  Cajero_Pago: TCajero_Pago;

implementation

Uses CajeroMainMenu, LoginPage;

{$R *.dfm}

procedure TCajero_Pago.RealizarBusqueda(Sender: TObject);
begin
  validator := StringValidator.Create;
  if ValidateAccountNumber() then
    begin
      errorText.Caption := output.NoMessage;
      successText.Caption := output.NoMessage;
      BuscarCuenta();
    end;
end;

procedure TCajero_Pago.RealizarPago(Sender: TObject);
begin
  if ValidateAmount() then
    begin
      Pay();
    end;
end;

procedure TCajero_Pago.BuscarCuenta();
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

procedure TCajero_Pago.FillInUserInfo( claveUsuario: Integer );
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

procedure TCajero_Pago.FillInAccountInfo( numeroCuenta : String );
begin
  with DataModule1.CreditoTable do
    begin
      Close;
      Prepare;
      ParamByName( 'numero' ).AsString := numeroCuenta;
      Open;

      if DataModule1.CreditoTable.RecordCount <> 0 then
        begin
          numeroCuentaText.Caption := numeroCuentaField.Text;
          tipoText.Caption :=  output.CreditTypeAccount;
        end
      else
        begin
          successText.Caption := output.NoMessage;
          errorText.Caption := output.DebitTypeNotAllowed;
        end;
    end;
end;

procedure TCajero_Pago.Pay();
var
  newSaldoOwed, newInterestOwed, remainingPaymentAmount : Integer;
begin
  with DataModule1.CreditoTable do
  begin
    Close;
    Prepare;
    ParamByName( 'numero' ).AsString := numeroCuentaField.Text;
    Open;

    if DataModule1.CreditoTable.RecordCount <> 0 then
      begin
        remainingPaymentAmount := StrToInt( cantidadField.Text );
        if not ( remainingPaymentAmount > ( DataModule1.CreditoTable.Fields[ 2 ].AsInteger + DataModule1.CreditoTable.Fields[ 5 ].AsInteger ) ) then
          begin
            newInterestOwed := CalculateRemainingInterest( DataModule1.CreditoTable.Fields[ 5 ].AsInteger, remainingPaymentAmount );
            newSaldoOwed := CalculateRemainingSaldo( DataModule1.CreditoTable.Fields[ 2 ].AsInteger, remainingPaymentAmount );
            UpdateCreditAccount( newSaldoOwed, newInterestOwed );
            RegisterPayment();
            successText.Caption := output.PaymentSuccessful;
          end
        else
          begin
            errorText.Caption := output.PaymentAmountExceedsDebt;
          end;
      end;
  end;
end;

function TCajero_Pago.CalculateRemainingInterest( interestOwed : Integer; VAR remainingPaymentAmount : Integer ) : Integer;
begin
  if remainingPaymentAmount > interestOwed then
    begin
      remainingPaymentAmount := remainingPaymentAmount - interestOwed;
      Result := 0;
    end
  else
    begin
      Result := interestOwed - remainingPaymentAmount;
      remainingPaymentAmount := 0;
    end;
end;

function TCajero_Pago.CalculateRemainingSaldo( saldoOwed: Integer; VAR remainingPaymentAmount: Integer ) : Integer;
begin
  if remainingPaymentAmount = 0 then
    begin
      Result := saldoOwed;
    end
  else
    begin
      Result := saldoOwed - remainingPaymentAmount;
      remainingPaymentAmount := 0;
    end;
end;

procedure TCajero_Pago.UpdateCreditAccount( newUsedSaldo, newInterestOwed : Integer );
begin
  with DataModule1.Creditos do
    begin
      Active := TRUE;
      IndexFieldNames := 'NumeroCuenta';
      if DataModule1.Creditos.FindKey( [ numeroCuentaField.Text ] ) then
        begin
          DataModule1.Creditos.Edit;
          DataModule1.Creditos.FieldByName( 'SaldoUtilizado' ).AsInteger := newUsedSaldo;
          DataModule1.Creditos.FieldByName( 'InteresDebido' ).AsInteger := newInterestOwed;
          DataModule1.Creditos.Post;
        end;
      Active := FALSE;
    end;
end;

procedure TCajero_Pago.RegisterPayment();
begin
  DataModule1.Movimientos.Active := TRUE;
  DataModule1.Movimientos.Insert;
  DataModule1.Movimientos.FieldByName( 'NumeroCuenta' ).AsString := numeroCuentaField.Text;
  DataModule1.Movimientos.FieldByName( 'ClaveCajero' ).AsInteger := LoginPage.LoginForm.session.GetSpecialKey;
  DataModule1.Movimientos.FieldByName( 'FechaRealizada' ).AsString := DateToStr( Date );
  DataModule1.Movimientos.FieldByName( 'TipoMovimiento' ).AsInteger := ord( TipoMovimiento.Retiro );
  DataModule1.Movimientos.FieldByName( 'Cantidad' ).AsInteger := StrToInt( cantidadField.Text );
  DataModule1.Movimientos.Post;
  DataModule1.Movimientos.Active := False;
end;

procedure TCajero_Pago.ReturnToMainMenu(Sender: TObject);
begin
  Cajero_MainMenu.Show;
  Cajero_Pago.Hide;
end;

function TCajero_Pago.ValidateAccountNumber() : boolean;
begin
  if not validator.IsAccountNumberValid( numeroCuentaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.AccountNumberInvalid();
      Exit( False );
    end;
  Result := True;
end;

function TCajero_Pago.ValidateAmount() : boolean;
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
