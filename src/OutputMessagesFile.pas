unit OutputMessagesFile;

interface

Type
  OutputMessages = Class
    public
    function NameInvalid() : String;
    function LastNamesInvalid() : String;
    function PhoneInvalid() : String;
    function EmailInvalid() : String;
    function UsernameInvalid() : String;
    function PasswordInvalid() : String;
    function PasswordIncorrect() : String;
    function PasswordsDoNotMatch() : String;
    function LoginArgsInvalid() : String;
    function UserNotFound() : String;
    function StreetInvalid() : String;
    function ColoniaInvalid() : String;
    function CityInvalid() : String;
    function StateInvalid() : String;
    function NumbersInvalid() : String;
    function ClientAlreadyExists() : String;
    function ClientCreatedSuccessfully() : String;
    function NoMessage() : String;
    function DebitTypeAccount() : String;
    function CreditTypeAccount() : String;
    function CreditTypeNotAllowed() : String;
    function DebitTypeNotAllowed() : String;
    function DepositSuccessful() : String;
    function AccountNotFound() : String;
    function AccountNumberInvalid() : String;
    function DepositAmountInvalid() : String;
    function WithdrawalAmountInvalid() : String;
    function PaymentAmountInvalid() : String;
    function InsufficientFunds() : String;
    function WithdrawAmountExceedsCreditLimit() : String;
    function WithdrawalSuccessful() : String;
    function PaymentSuccessful() : String;
    function PaymentAmountExceedsDebt() : String;
    function AmountInvalid() : String;
    function CorteSuccessfullySent() : String;
    function EmptyBalance() : String;
    function EnterStartOfDayAmount() : String;
    private
  End;

implementation
function OutputMessages.NameInvalid() : String;
begin
  Result := 'Los nombres introducidos no son validos.';
end;

function OutputMessages.LastNamesInvalid() : String;
begin
  Result := 'Los apellidos introducidos no son validos.';
end;

function OutputMessages.PhoneInvalid() : String;
begin
  Result := 'El telefono introducido no es valido.';
end;

function OutputMessages.EmailInvalid() : String;
begin
  Result := 'El correo introducido no es valido.';
end;

function OutputMessages.UsernameInvalid() : String;
begin
  Result := 'El nombre de usuario no es valido.';
end;

function OutputMessages.PasswordInvalid() : String;
begin
  Result := 'La contraseña introducida no es valida.';
end;

function OutputMessages.PasswordIncorrect() : String;
begin
  Result := 'La contraseña es incorrecta.';
end;

function OutputMessages.PasswordsDoNotMatch() : String;
begin
  Result := 'Las contraseñas no coinciden.';
end;

function OutputMessages.LoginArgsInvalid() : String;
begin
  Result := 'La información introducida no es valida.';
end;

function OutputMessages.UserNotFound() : String;
begin
  Result := 'No se encontró un usuario con la información introducida.';
end;

function OutputMessages.StreetInvalid() : String;
begin
  Result := 'La calle no es valida.';
end;

function OutputMessages.ColoniaInvalid() : String;
begin
  Result := 'La colonia no es valida.';
end;

function OutputMessages.CityInvalid() : String;
begin
  Result := 'La ciudad no es valida.';
end;

function OutputMessages.StateInvalid() : String;
begin
  Result := 'El estado no es valido.';
end;

function OutputMessages.NumbersInvalid() : String;
begin
  Result := 'Los números no son validos.';
end;

function OutputMessages.ClientAlreadyExists() : String;
begin
  Result := 'El cliente ya existe en la base de datos.';
end;

function OutputMessages.ClientCreatedSuccessfully() : String;
begin
  Result := 'El cliente fue creado exitosamente.';
end;

function OutputMessages.NoMessage() : String;
begin
  Result := '';
end;

function OutputMessages.DebitTypeAccount() : String;
begin
  Result := 'Debito';
end;

function OutputMessages.CreditTypeAccount() : String;
begin
  Result := 'Credit';
end;

function OutputMessages.CreditTypeNotAllowed() : String;
begin
  Result := 'No se permiten cuentas de tipo credito.';
end;

function OutputMessages.DebitTypeNotAllowed;
begin
  Result := 'No se permiten cuentas de tipo debito.';
end;

function OutputMessages.DepositSuccessful() : String;
begin
  Result := 'El deposito se realizo con exito.';
end;

function OutputMessages.AccountNotFound() : String;
begin
  Result := 'No se encontro una cuenta con esa clave.';
end;

function OutputMessages.AccountNumberInvalid() : String;
begin
  Result := 'El numero de cuenta no es valido.';
end;

function OutputMessages.DepositAmountInvalid() : String;
begin
  Result := 'La cantidad a depositar no es valida.';
end;

function OutputMessages.WithdrawalAmountInvalid() : String;
begin
  Result := 'La cantidad a retirar no es valida.';
end;

function outputMessages.PaymentAmountInvalid() : String;
begin
  Result := 'La cantidad a pagar no es valida.';
end;

function outputMessages.InsufficientFunds() : String;
begin
  Result := 'No hay suficiente saldo en la cuenta.';
end;

function outputMessages.WithdrawAmountExceedsCreditLimit() : String;
begin
  Result := 'Cantidad deseada sobrepasa el limite de credito permitido.';
end;

function outputMessages.WithdrawalSuccessful() : String;
begin
  Result := 'El retiro se realizao con exito.';
end;

function outputMessages.PaymentSuccessful() : String;
begin
  Result := 'El pago se realizao con exito.';
end;

function outputMessages.PaymentAmountExceedsDebt() : String;
begin
  Result := 'La cantidad de pago es mayor a la deuda del cliente.';
end;

function outputMessages.AmountInvalid() : String;
begin
  Result := 'El monto introducido no es valido.';
end;

function outputMessages.CorteSuccessfullySent() : String;
begin
  Result := 'El reporte de corte se envio con exito.';
end;

function outputMessages.EmptyBalance() : String;
begin
  Result := '----------------------------------------';
end;

function outputMessages.EnterStartOfDayAmount() : String;
begin
  Result := 'Por favor introduce la cantidad de dinero en caja al inicio del dia.';
end;

end.
