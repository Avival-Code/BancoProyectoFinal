program BancoProject;

uses
  Vcl.Forms,
  LoginPage in 'LoginPage.pas' {LoginForm},
  ClientMainMenu in 'ClientMainMenu.pas' {Client_MainMenu},
  GerenteMainMenu in 'GerenteMainMenu.pas' {Gerente_MainMenu},
  CajeroMainMenu in 'CajeroMainMenu.pas' {Cajero_MainMenu},
  CajeroDeposito in 'CajeroDeposito.pas' {Cajero_Deposito},
  CajeroRetiro in 'CajeroRetiro.pas' {Cajero_Retiro},
  CajeroPago in 'CajeroPago.pas' {Cajero_Pago},
  CajeroCorte in 'CajeroCorte.pas' {Cajero_Corte},
  GerenteRegistrarUsuario in 'GerenteRegistrarUsuario.pas' {Gerente_RegistrarUsuario},
  GerenteAperturaCuenta in 'GerenteAperturaCuenta.pas' {Gerente_AperturaCuenta},
  GerenteReportes in 'GerenteReportes.pas' {Gerente_Reportes},
  Data in 'Data.pas' {DataModule1: TDataModule},
  StringValidatorFile in 'StringValidatorFile.pas',
  LoginSessionFile in 'LoginSessionFile.pas',
  OutputMessagesFile in 'OutputMessagesFile.pas',
  Enumerations in 'Enumerations.pas',
  GerenteCargosSource in 'GerenteCargosSource.pas' {GerenteCargos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCajero_Deposito, Cajero_Deposito);
  Application.CreateForm(TGerente_AperturaCuenta, Gerente_AperturaCuenta);
  Application.CreateForm(TGerente_RegistrarUsuario, Gerente_RegistrarUsuario);
  Application.CreateForm(TCajero_MainMenu, Cajero_MainMenu);
  Application.CreateForm(TGerente_MainMenu, Gerente_MainMenu);
  Application.CreateForm(TClient_MainMenu, Client_MainMenu);
  Application.CreateForm(TCajero_Retiro, Cajero_Retiro);
  Application.CreateForm(TCajero_Pago, Cajero_Pago);
  Application.CreateForm(TCajero_Corte, Cajero_Corte);
  Application.CreateForm(TGerente_Reportes, Gerente_Reportes);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TGerenteCargos, GerenteCargos);
  Application.Run;
end.
