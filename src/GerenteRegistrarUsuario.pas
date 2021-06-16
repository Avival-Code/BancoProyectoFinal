unit GerenteRegistrarUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, StringValidatorFile, OutputMessagesFile,
  Data, FireDAC.Stan.Param;

type
  TGerente_RegistrarUsuario = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    StaticText1: TStaticText;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    telefonoStaticText: TStaticText;
    correoStaticText: TStaticText;
    domicilioStaticText: TStaticText;
    calleStaticText: TStaticText;
    coloniaStaticText: TStaticText;
    estadoStaticText: TStaticText;
    municipioStaticText: TStaticText;
    numeroInternoStaticText: TStaticText;
    numeroExternoStaticText: TStaticText;
    nombresField: TEdit;
    apellidosField: TEdit;
    telefonoField: TEdit;
    correoField: TEdit;
    calleField: TEdit;
    coloniaField: TEdit;
    estadoField: TEdit;
    municipioField: TEdit;
    numeroInternoField: TEdit;
    numeroExternoField: TEdit;
    registrarButton: TButton;
    usuarioStaticText: TStaticText;
    contrasenaStaticText: TStaticText;
    usuarioField: TEdit;
    contrasenaField: TEdit;
    confirmarContrasenaField: TEdit;
    errorText: TLabel;
    successText: TLabel;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure RegisterUser(Sender: TObject);
  private
    validator : StringValidator;
    output : OutputMessages;
    procedure CheckUserInformation();
    procedure CheckDirectionInformation();
    procedure ValidateNames();
    procedure ValidateLastNames();
    procedure ValidatePhone();
    procedure ValidateEmail();
    procedure ValidateUsername();
    procedure ValidatePassword();
    procedure DoPasswordsMatch();
    procedure ValidateStreet();
    procedure ValidateCity();
    procedure ValidateColonia();
    procedure ValidateState();
    procedure ValidateNumbers();
    procedure CreateUser();
    procedure CreateUserAddress();
    procedure CreateClient();
    function DoesUserExist() : boolean;
  public
    { Public declarations }
  end;

var
  Gerente_RegistrarUsuario: TGerente_RegistrarUsuario;

implementation

Uses GerenteMainMenu;
{$R *.dfm}

procedure TGerente_RegistrarUsuario.RegisterUser( Sender: TObject );
begin
  validator := StringValidator.Create;
  output := OutputMessages.Create;
  CheckUserInformation;
  CheckDirectionInformation;
  if validator.AreUserArgsValid( nombresField.Text, apellidosField.Text, telefonoField.Text,
                                 correoField.Text, usuarioField.Text, contrasenaField.Text,
                                 confirmarContrasenaField.Text ) and
     validator.AreDirectionArgsValid( calleField.Text, municipioField.Text, coloniaField.Text,
                                      estadoField.Text, numeroInternoField.Text, numeroExternoField.Text ) then
      begin
        if not DoesUserExist() then
          begin
            CreateUser();
            CreateUserAddress();
            CreateClient();
            errorText.Caption := output.NoMessage;
            successText.Caption := output.ClientCreatedSuccessfully;
          end
        else
          begin
            successText.Caption := output.NoMessage;
            errorText.Caption := output.ClientAlreadyExists;
          end;
      end;

end;

procedure TGerente_RegistrarUsuario.CheckUserInformation();
begin
  DoPasswordsMatch;
  ValidatePassword;
  ValidateUsername;
  ValidateEmail;
  ValidatePhone;
  ValidateLastNames;
  ValidateNames;
end;

procedure TGerente_RegistrarUsuario.CheckDirectionInformation();
begin
  ValidateNumbers;
  ValidateState;
  ValidateCity;
  ValidateColonia;
  ValidateStreet;
end;

function TGerente_RegistrarUsuario.DoesUserExist() : boolean;
begin
  with DataModule1.UsuarioTableSingle do
    begin
      Close;
      Prepare;
      ParamByName( 'usuario' ).AsString := usuarioField.Text;
      Open;

      if DataModule1.UsuarioTableSingle.RecordCount <> 0 then
        begin
          exit( True );
        end;
    end;
  Result := False;
end;

procedure TGerente_RegistrarUsuario.CreateUser();
begin
  DataModule1.Usuarios.Active := TRUE;
  DataModule1.Usuarios.Insert;
  DataModule1.Usuarios.FieldByName( 'Nombres' ).AsString := nombresField.Text;
  DataModule1.Usuarios.FieldByName( 'Apellidos' ).AsString := apellidosField.Text;
  DataModule1.Usuarios.FieldByName( 'Telefono' ).AsString := telefonoField.Text;
  DataModule1.Usuarios.FieldByName( 'CorreoElectronico' ).AsString := correoField.Text;
  DataModule1.Usuarios.FieldByName( 'Usuario' ).AsString := usuarioField.Text;
  DataModule1.Usuarios.FieldByName( 'Contrasena' ).AsString := contrasenaField.Text;
  DataModule1.Usuarios.Post;
  DataModule1.Usuarios.Active := FALSE;
end;

procedure TGerente_RegistrarUsuario.CreateUserAddress();
begin
  with DataModule1.UsuarioTableSingle do
    begin
      Close;
      Prepare;
      ParamByName( 'usuario' ).AsString := usuarioField.Text;
      Open;

      if DataModule1.UsuarioTableSingle.RecordCount <> 0 then
        begin
          DataModule1.Domicilios.Active := TRUE;
          DataModule1.Domicilios.Insert;
          DataModule1.Domicilios.FieldByName( 'ClaveUsuario' ).AsInteger := DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger;
          DataModule1.Domicilios.FieldByName( 'Calle' ).AsString := calleField.Text;
          DataModule1.Domicilios.FieldByName( 'Colonia' ).AsString := coloniaField.Text;
          DataModule1.Domicilios.FieldByName( 'Municipio' ).AsString := municipioField.Text;
          DataModule1.Domicilios.FieldByName( 'Estado' ).AsString := estadoField.Text;
          DataModule1.Domicilios.FieldByName( 'NumeroInterno' ).AsInteger := StrToInt( numeroInternoField.Text );
          DataModule1.Domicilios.FieldByName( 'NumeroExterno' ).AsInteger := StrToInt( numeroExternoField.Text );
          DataModule1.Domicilios.Post;
          DataModule1.Domicilios.Active := FALSE;
        end;
    end;
end;

procedure TGerente_RegistrarUsuario.CreateClient();
begin
  with DataModule1.UsuarioTableSingle do
    begin
      Close;
      Prepare;
      ParamByName( 'usuario' ).AsString := usuarioField.Text;
      Open;

      if DataModule1.UsuarioTableSingle.RecordCount <> 0 then
        begin
          DataModule1.Clientes.Active := TRUE;
          DataModule1.Clientes.Insert;
          DataModule1.Clientes.FieldByName( 'ClaveUsuario' ).AsInteger := DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger;
          DataModule1.Clientes.FieldByName( 'IngresoMensual' ).AsInteger := 0;
          DataModule1.Clientes.Post;
          DataModule1.Clientes.Active := FALSE;
        end;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateNames();
begin
  if not validator.AreNamesValid( nombresField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.NameInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateLastNames();
begin
  if not validator.AreLastNamesValid( apellidosField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.lastNamesInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidatePhone();
begin
  if not validator.IsPhoneValid( telefonoField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.PhoneInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateEmail();
begin
  if not validator.IsEmailValid( correoField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.EmailInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateUsername();
begin
  if not validator.IsUsernameValid( usuarioField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.UsernameInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidatePassword();
begin
  if not validator.IsPasswordValid( contrasenaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.PasswordInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.DoPasswordsMatch();
begin
  if not validator.DoPasswordsMatch( contrasenaField.Text, confirmarContrasenaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.PasswordsDoNotMatch;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateStreet();
begin
  if not validator.IsStreetValid( calleField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.StreetInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateCity();
begin
  if not validator.IsCityValid( municipioField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.CityInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateColonia();
begin
  if not validator.IsColoniaValid( coloniaField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.ColoniaInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateState();
begin
  if not validator.IsStateValid( estadoField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.StateInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ValidateNumbers();
begin
  if not validator.AreNumbersValid( numeroInternoField.Text ) or
     not validator.AreNumbersValid( numeroExternoField.Text ) then
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.NumbersInvalid;
    end;
end;

procedure TGerente_RegistrarUsuario.ReturnToMainMenu( Sender: TObject );
begin
  Gerente_MainMenu.Show;
  Gerente_RegistrarUsuario.Hide;
end;

end.
