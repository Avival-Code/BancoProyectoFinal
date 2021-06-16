unit GerenteMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GerenteRegistrarUsuario, GerenteAperturaCuenta,
  GerenteReportes;

type
  TGerente_MainMenu = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    cerrarSesiónButton: TButton;
    reportesButton: TButton;
    aperturaCuentaButton: TButton;
    registrarUsuario: TButton;
    bienvenidoStaticText: TStaticText;
    preguntaStaticText: TStaticText;
    cargosButton: TButton;
    procedure ShowRegistroUsuario(Sender: TObject);
    procedure ShowAperturaCuenta(Sender: TObject);
    procedure ShowReportes(Sender: TObject);
    procedure Logout(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Gerente_MainMenu: TGerente_MainMenu;

implementation

uses LoginPage;
{$R *.dfm}

procedure TGerente_MainMenu.Logout(Sender: TObject);
begin
  LoginForm.Show;
  LoginForm.Logout;
  Gerente_MainMenu.Hide;
end;

procedure TGerente_MainMenu.ShowAperturaCuenta(Sender: TObject);
begin
  Gerente_AperturaCuenta.Show;
  Gerente_AperturaCuenta.PrepareClass;
  Gerente_MainMenu.Hide;
end;

procedure TGerente_MainMenu.ShowRegistroUsuario(Sender: TObject);
begin
  Gerente_RegistrarUsuario.Show;
  Gerente_MainMenu.Hide;
end;

procedure TGerente_MainMenu.ShowReportes(Sender: TObject);
begin
  Gerente_Reportes.Show;
  Gerente_Reportes.ShowAllData;
  Gerente_MainMenu.Hide;
end;

end.
