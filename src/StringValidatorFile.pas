unit StringValidatorFile;

interface

Type
  StringValidator = Class
    public
      constructor Create;
      function AreLoginArgsValid( username: String; password: String ) : boolean;
      function AreUserArgsValid( names, lastNames, phone, email, username, password, confirmPassword : String ) : boolean;
      function AreDirectionArgsValid( street, city, colonia, state, numeroInterno, numeroExterno : String ) : boolean;
      function IsUsernameValid( username: String ) : boolean;
      function IsPasswordValid( password: String ) : boolean;
      function DoPasswordsMatch( passwordOne, passwordTwo: String ) : boolean;
      function IsAccountNumberValid( accountNumber : String ) : boolean;
      function IsTransactionAmountValid( amount : String ) : boolean;
      function AreNamesValid( nombres: String ) : boolean;
      function AreLastNamesValid( lastNames: String ) : boolean;
      function IsPhoneValid( phone: String ) : boolean;
      function IsEmailValid( email: String ) : boolean;
      function IsStreetValid( street: String ) : boolean;
      function IsColoniaValid( colonia: String ) : boolean;
      function IsCityValid( city: String ) : boolean;
      function IsStateValid( state: String ) : boolean;
      function AreNumbersValid( number: String ) : boolean;
      function IsStringValidSize( value: String; minLength: integer; maxLength: integer ) : boolean;
      function HasValidCharacters( value: String ) : boolean;
      function HasValidNumbers( number: String ) : boolean;
      function IsAccountValidSize( accountNumber : String ) : boolean;
    private
      usernameMinLength, passwordMinLength, usernameMaxLength, passwordMaxLength,
      nameMinLength, nameMaxLength, lastNameMinLength, lastNameMaxLength,
      phoneMinLength, phoneMaxLength, emailMinLength, emailMaxLength, streetMinLength,
      streetMaxLength, colMinLength, colMaxLength, cityMinLength, cityMaxLength,
      stateMinLength, stateMaxLength, accountNumberLength : integer;
  End;

implementation
constructor StringValidator.Create;
begin
  nameMinLength := 3;
  lastNameMinLength := 6;
  emailMinLength := 10;
  usernameMinLength := 5;
  passwordMinLength := 8;
  phoneMinLength := 10;
  streetMinLength := 5;
  colMinLength := 5;
  cityMinLength := 5;
  stateMinLength := 5;
  nameMaxLength := 50;
  lastNameMaxLength := 50;
  emailMaxLength := 50;
  usernameMaxLength := 20;
  passwordMaxLength := 20;
  phoneMaxLength := 10;
  streetMaxLength := 50;
  colMaxLength := 50;
  cityMaxLength := 50;
  stateMaxLength := 50;
  accountNumberLength := 16;
end;

function StringValidator.AreLoginArgsValid( username: string; password: string ) : boolean;
begin
  if ( IsUsernameValid( username ) ) and  ( IsPasswordValid( password ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.AreUserArgsValid( names: string; lastNames: string; phone: string;
                                           email: string; username: string; password: string;
                                           confirmPassword: string ) : boolean;
begin
  if AreNamesValid( names ) and AreLastNamesValid( lastNames ) and
     IsPhoneValid( phone ) and IsEmailValid( email ) and
     IsUsernameValid( username ) and IsPasswordValid( password ) and
     DoPasswordsMatch( password, confirmPassword ) then
      begin
        Exit( True );
      end;
  Result := False;
end;

function StringValidator.AreDirectionArgsValid( street: string; city: string; colonia: string;
                                                state: string; numeroInterno: string;
                                                numeroExterno: string ) : boolean;
begin
  if IsStreetValid( street ) and IsCityValid( city ) and
     IsColoniaValid( colonia ) and IsStateValid( state  ) and
     AreNumbersValid( numeroInterno ) and AreNumbersValid( numeroExterno ) then
      begin
        Exit( True );
      end;
   Result := False;
end;

function StringValidator.IsUsernameValid( username: string ) : boolean;
begin
  if ( IsStringValidSize( username, usernameMinLength, usernameMaxLength ) ) and
     ( HasValidCharacters( username ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsPasswordValid( password: string ) : boolean;
begin
  if ( IsStringValidSize( password, passwordMinLength, passwordMaxLength ) ) and
     ( HasValidCharacters( password ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.DoPasswordsMatch( passwordOne: string; passwordTwo: string ) : boolean;
begin
  if passwordOne = passwordTwo then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsAccountNumberValid( accountNumber: string ) : boolean;
begin
  if IsAccountValidSize( accountNumber ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsTransactionAmountValid( amount : String ) : boolean;
begin
  if HasValidNumbers( amount ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.AreNamesValid( nombres: string ) : boolean;
begin
  if ( IsStringValidSize( nombres, nameMinLength, nameMaxLength ) ) and
     ( HasValidCharacters( nombres ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.AreLastNamesValid( lastNames: string ) : boolean;
begin
  if ( IsStringValidSize( lastNames, lastNameMinLength, lastNameMaxLength ) ) and
     ( HasValidCharacters( lastNames ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsPhoneValid( phone: string ) : boolean;
begin
  if ( IsStringValidSize( phone, phoneMinLength, phoneMaxLength ) ) and
     ( HasValidCharacters( phone ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsEmailValid( email: string ) : boolean;
begin
  if ( IsStringValidSize( email, emailMinLength, emailMaxLength ) ) and
     ( HasValidCharacters( email ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsStreetValid( street: string ) : boolean;
begin
  if ( IsStringValidSize( street, streetMinLength, streetMaxLength ) ) and
     ( HasValidCharacters( street ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsColoniaValid( colonia: string ) : boolean;
begin
  if ( IsStringValidSize( colonia, colMinLength, colMaxLength ) ) and
     ( HasValidCharacters( colonia ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsCityValid( city: string ) : boolean;
begin
  if ( IsStringValidSize( city, cityMinLength, cityMaxLength ) ) and
     ( HasValidCharacters( city ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsStateValid( state: string ) : boolean;
begin
  if ( IsStringValidSize( state, stateMinLength, stateMaxLength ) ) and
     ( HasValidCharacters( state ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.AreNumbersValid( number: string ) : boolean;
begin
  if ( HasValidNumbers( number ) ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsStringValidSize( value: string; minLength: integer; maxLength: integer ) : boolean;
begin
  if ( Length( value ) >= minLength ) and ( Length( value ) <= maxLength ) then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.IsAccountValidSize( accountNumber : String ) : boolean;
begin
  if Length( accountNumber ) = accountNumberLength then
    begin
      Exit( True );
    end;
  Result := False;
end;

function StringValidator.HasValidCharacters( value: string ) : boolean;
var
  currentChar : Char;
  hasValidCharacters : boolean;
begin
  hasValidCharacters := True;
  for currentChar in value do
    begin
      if ( ord( currentChar ) = 39 ) or ( ord( currentChar ) = 59 ) or
      ( ord( currentChar ) = 61 ) or ( ord( currentChar ) = 124 ) then
        begin
          hasValidCharacters := False;
        end;
    end;
    Result := hasValidCharacters;
end;

function StringValidator.HasValidNumbers( number: string ) : boolean;
var
  currentChar : Char;
  hasValidNumbers : boolean;
begin
  hasValidNumbers := True;
  for currentChar in number do
    begin
      if ( ord( currentChar ) < 48 ) or ( ord( currentChar ) > 57 ) then
        begin
          hasValidNumbers := False;
        end;
    end;
    Result := hasValidNumbers;
end;
end.
