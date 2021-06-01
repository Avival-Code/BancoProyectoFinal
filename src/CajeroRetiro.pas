unit CajeroRetiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, StringValidatorFile, OutputMessagesFile,
  Data, FireDAC.Stan.Param, Enumerations;

type
  TCajero_Retiro = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    preguntaCuentaStaticText: TStaticText;
    numeroCuentaField: TEdit;
    buscarButton: TButton;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    numeroCuentaStaticText: TStaticText;
    nombresText: TStaticText;
    apellidosText: TStaticText;
    numeroCuentaText: TStaticText;
    cantidadStaticText: TStaticText;
    cantidadField: TEdit;
    retiroButton: TButton;
    tipoStaticText: TStaticText;
    tipoText: TStaticText;
    errorText: TLabel;
    successText: TLabel;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure RealizarBusqueda(Sender: TObject);
    procedure RealizarRetiro(Sender: TObject);
  private
    validator : StringValidator;
    output : OutputMessages;
    procedure FillInUserInfo( claveUsuario: Integer );
    procedure FillInAccountInfo( numeroCuenta: String );
    procedure FillDebitAccountInfo( numeroCuenta: String );
    procedure FillCreditAccountInfo( numeroCuenta: String );
    procedure BuscarCuenta();
    procedure Withdraw();
    procedure WithdrawFromDebit();
    procedure WithdrawFromCredit();
    procedure UpdateDebitAccount( newTotal : Integer );
    procedure UpdateCreditAccount( newTotal : Integer );
    procedure RegisterWithdrawal();
    function ValidateAccountNumber() : boolean;
    function ValidateAmount() : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cajero_Retiro: TCajero_Retiro;

implementation

Uses CajeroMainMenu, LoginPage;

{$R *.dfm}

procedure TCajero_Retiro.RealizarBusqueda(Sender: TObject);
begin
  validator := StringValidator.Create;
  if ValidateAccountNumber() then
    begin
      errorText.Caption := output.NoMessage;
      successText.Caption := output.NoMessage;
      BuscarCuenta();
    end;
end;

procedure TCajero_Retiro.RealizarRetiro(Sender: TObject);
begin
  if ValidateAmount() then
    begin
      Withdraw();
    end;
end;

procedure TCajero_Retiro.ReturnToMainMenu(Sender: TObject);
begin
  Cajero_MainMenu.Show;
  Cajero_Retiro.Hide;
end;

procedure TCajero_Retiro.BuscarCuenta();
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

procedure TCajero_Retiro.FillInUserInfo( claveUsuario: Integer );
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

procedure TCajero_Retiro.FillInAccountInfo( numeroCuenta : String );
begin
  FillDebitAccountInfo( numeroCuenta );
  FillCreditAccountInfo( numeroCuenta );
end;

procedure TCajero_Retiro.FillDebitAccountInfo( numeroCuenta: string );
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
        end;
    end;
end;

procedure TCajero_Retiro.FillCreditAccountInfo( numeroCuenta: string );
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
        end;
    end;
end;

procedure TCajero_Retiro.Withdraw;
begin
  if tipoText.Caption = output.DebitTypeAccount then
    begin
      WithdrawFromDebit();
    end
  else
    begin
      WithdrawFromCredit();
    end;
end;

procedure TCajero_Retiro.WithdrawFromDebit(  );
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
        if not ( StrToInt( cantidadField.Text ) > DataModule1.DebitoTable.Fields[ 2 ].AsInteger ) then
          begin
            newTotal := DataModule1.DebitoTable.Fields[ 2 ].AsInteger - StrToInt( cantidadField.Text );
            UpdateDebitAccount( newTotal );
            RegisterWithdrawal();
            successText.Caption := output.WithdrawalSuccessful;
          end
        else
          begin
            errorText.Caption := output.InsufficientFunds;
          end;
      end;
  end;
end;

procedure TCajero_Retiro.WithdrawFromCredit();
var
  newTotal : Integer;
begin
  with DataModule1.CreditoTable do
  begin
    Close;
    Prepare;
    ParamByName( 'numero' ).AsString := numeroCuentaField.Text;
    Open;

    if DataModule1.CreditoTable.RecordCount <> 0 then
      begin
        if not ( StrToInt( cantidadField.Text ) > ( DataModule1.CreditoTable.Fields[ 3 ].AsInteger - DataModule1.CreditoTable.Fields[ 2 ].AsInteger ) ) then
          begin
            newTotal := DataModule1.CreditoTable.Fields[ 2 ].AsInteger + StrToInt( cantidadField.Text );
            UpdateCreditAccount( newTotal );
            RegisterWithdrawal();
            successText.Caption := output.WithdrawalSuccessful;
          end
        else
          begin
            errorText.Caption := output.WithdrawAmountExceedsCreditLimit;
          end;
      end;
  end;
end;

procedure TCajero_Retiro.UpdateDebitAccount( newTotal : Integer );
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

procedure TCajero_Retiro.UpdateCreditAccount( newTotal : Integer );
begin
  with DataModule1.Creditos do
    begin
      Active := TRUE;
      IndexFieldNames := 'NumeroCuenta';
      if DataModule1.Creditos.FindKey( [ numeroCuentaField.Text ] ) then
        begin
          DataModule1.Creditos.Edit;
          DataModule1.Creditos.FieldByName( 'SaldoUtilizado' ).AsInteger := newTotal;
          DataModule1.Creditos.Post;
        end;
      Active := FALSE;
    end;
end;

procedure TCajero_Retiro.RegisterWithdrawal();
begin
  DataModule1.Movimientos.Active := TRUE;
  DataModule1.Movimientos.Insert;
  DataModule1.Movimientos.FieldByName( 'NumeroCuenta' ).AsString := numeroCuentaField.Text;
  DataModule1.Movimientos.FieldByName( 'ClaveCajero' ).AsInteger := LoginPage.LoginForm.session.GetKey;
  DataModule1.Movimientos.FieldByName( 'FechaRealizada' ).AsString := DateToStr( Date );
  DataModule1.Movimientos.FieldByName( 'TipoMovimiento' ).AsInteger := ord( TipoMovimiento.Retiro );
  DataModule1.Movimientos.FieldByName( 'Cantidad' ).AsInteger := StrToInt( cantidadField.Text );
  DataModule1.Movimientos.Post;
  DataModule1.Movimientos.Active := False;
end;

function TCajero_Retiro.ValidateAccountNumber() : boolean;
begin
  if not validator.IsAccountNumberValid( numeroCuentaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.AccountNumberInvalid();
      Exit( False );
    end;
  Result := True;
end;

function TCajero_Retiro.ValidateAmount() : boolean;
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
