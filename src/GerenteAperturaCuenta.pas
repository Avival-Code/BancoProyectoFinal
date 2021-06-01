unit GerenteAperturaCuenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TGerente_AperturaCuenta = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    StaticText1: TStaticText;
    usuarios: TScrollBox;
    usuarioField: TEdit;
    buscarButton: TButton;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    tipoCuentaStaticText: TStaticText;
    tipoCuentaBox: TComboBox;
    domicilioStaticText: TStaticText;
    tasaInteresStaticText: TStaticText;
    tasaInteresField: TEdit;
    crearCuentaButton: TButton;
    ingresoMensualStaticText: TStaticText;
    ingresoMensualField: TEdit;
    errorText: TStaticText;
    procedure ReturnToMainMenu(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Gerente_AperturaCuenta: TGerente_AperturaCuenta;

implementation

Uses GerenteMainMenu;

{$R *.dfm}

procedure TGerente_AperturaCuenta.ReturnToMainMenu(Sender: TObject);
begin
  Gerente_MainMenu.Show;
  Gerente_AperturaCuenta.Hide;
end;

end.
