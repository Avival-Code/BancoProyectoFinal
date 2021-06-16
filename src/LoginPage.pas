unit LoginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data, StringValidatorFile,
  FireDAC.Stan.Param, GerenteMainMenu, ClientMainMenu, CajeroMainMenu, LoginSessionFile, OutputMessagesFile;

type
  TLoginForm = class(TForm)
    background: TShape;
    screenPurpose: TLabel;
    usernameText: TEdit;
    passwordText: TEdit;
    username: TLabel;
    password: TLabel;
    LoginButton: TButton;
    errorText: TLabel;
    procedure Login(Sender: TObject);
  private
    validator : StringValidator;
    output : OutputMessages;
    procedure DoesUserExist();
    procedure ChangeScreenGerente( claveUsuario: integer );
    procedure ChangeScreenCliente( claveUsuario: integer );
    procedure ChangeScreenCajero( claveUsuario: integer );
  public
    session : LoginSession;
    procedure Logout();
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.Login(Sender: TObject);
begin
  errorText.Caption := '';
  validator := StringValidator.Create;
  session := LoginSession.Create;
  if not validator.AreLoginArgsValid( usernameText.Text, passwordText.Text ) then
    begin
      errorText.Caption :=  output.LoginArgsInvalid;
    end
  else
    begin
      DoesUserExist();
    end;
end;

procedure TLoginForm.Logout;
begin
  session.Logout;
  usernameText.Clear;
  passwordText.Clear;
end;

procedure TLoginForm.DoesUserExist;
begin
  with DataModule1.UsuarioTableSingle do
    begin
      Close;
      Prepare;
      ParamByName( 'usuario' ).AsString := usernameText.Text;
      Open;

      if DataModule1.UsuarioTableSingle.RecordCount <> 0 then
        begin
          if DataModule1.UsuarioTableSingle.Fields[ 6 ].AsString = passwordText.Text then
            begin
              session.Login( DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger );
              ChangeScreenGerente( DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger );
              ChangeScreenCliente( DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger );
              ChangeScreenCajero( DataModule1.UsuarioTableSingle.Fields[ 0 ].AsInteger );
            end
          else
            begin
              errorText.Caption := output.PasswordIncorrect;
            end;
        end
      else
        begin
          errorText.Caption := output.UserNotFound;
        end;

    end;
end;

procedure TLoginForm.ChangeScreenGerente( claveUsuario: integer );
begin
  with DataModule1.GerenteTable do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := claveUsuario;
      Open;

      if ( DataModule1.GerenteTable.RecordCount <> 0 ) and
         ( DataModule1.GerenteTable.Fields[ 1 ].AsInteger = claveUsuario ) then
         begin
          Gerente_MainMenu.Show;
          LoginForm.Hide;
         end;
    end;
end;

procedure TLoginForm.ChangeScreenCliente( claveUsuario: integer );
begin
  with DataModule1.ClienteTable do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := claveUsuario;
      Open;

      if ( DataModule1.ClienteTable.RecordCount <> 0 ) and
         ( DataModule1.ClienteTable.Fields[ 1 ].AsInteger = claveUsuario ) then
         begin
          Client_MainMenu.Show;
          Client_MainMenu.ShowCuentas();
          LoginForm.Hide;
         end;
    end;
end;

procedure TLoginForm.ChangeScreenCajero( claveUsuario: integer );
begin
  with DataModule1.CajeroTable do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := claveUsuario;
      Open;

      if ( DataModule1.CajeroTable.RecordCount <> 0 ) and
         ( DataModule1.CajeroTable.Fields[ 1 ].AsInteger = claveUsuario ) then
         begin
          session.SetSpecialKey( DataModule1.CajeroTable.Fields[ 0 ].AsInteger );
          Cajero_MainMenu.Show;
          LoginForm.Hide;
         end;
    end;
end;
end.
