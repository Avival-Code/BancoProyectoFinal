unit CajeroMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CajeroCorte, CajeroDeposito,
  CajeroPago, CajeroRetiro;

type
  TCajero_MainMenu = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    cerrarSesiónButton: TButton;
    reportarCorteButton: TButton;
    realizarPagoButton: TButton;
    realizarRetiroButton: TButton;
    realizarDepositoButton: TButton;
    bienvenidoStaticText: TStaticText;
    preguntaStaticText: TStaticText;
    procedure ShowDepositos(Sender: TObject);
    procedure ShowRetiros(Sender: TObject);
    procedure ShowPagos(Sender: TObject);
    procedure ShowCorte(Sender: TObject);
    procedure Logout(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cajero_MainMenu: TCajero_MainMenu;

implementation

uses LoginPage;
{$R *.dfm}

procedure TCajero_MainMenu.Logout(Sender: TObject);
begin
  LoginForm.Show;
  LoginForm.Logout;
  Cajero_MainMenu.Hide;
end;

procedure TCajero_MainMenu.ShowCorte(Sender: TObject);
begin
  Cajero_Corte.Show;
  Cajero_Corte.ShowMovements();
  Cajero_MainMenu.Hide;
end;

procedure TCajero_MainMenu.ShowDepositos(Sender: TObject);
begin
  Cajero_Deposito.Show;
  Cajero_MainMenu.Hide;
end;

procedure TCajero_MainMenu.ShowPagos(Sender: TObject);
begin
  Cajero_Pago.Show;
  Cajero_MainMenu.Hide;
end;

procedure TCajero_MainMenu.ShowRetiros(Sender: TObject);
begin
  Cajero_Retiro.Show;
  Cajero_MainMenu.Hide;
end;

end.
