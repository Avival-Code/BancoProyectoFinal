unit GerenteReportes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBGrids, Data,
  Data.DB, Vcl.Grids;

type
  TGerente_Reportes = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    balanceGeneralText: TStaticText;
    ingresosStaticText: TStaticText;
    egresosStaticText: TStaticText;
    ingresosText: TStaticText;
    egresosText: TStaticText;
    clientesStaticText: TStaticText;
    reporteClienteButton: TButton;
    reporteGeneralClientesButton: TButton;
    cajerosStaticText: TStaticText;
    buscarPorStaticText: TStaticText;
    clienteNombreNumeroField: TEdit;
    StaticText1: TStaticText;
    cajeroNombreField: TEdit;
    reporteGeneralCajerosButton: TButton;
    reporteCajeroButton: TButton;
    reporteCuentasAtrasadas: TButton;
    balanceStaticText: TStaticText;
    balanceText: TStaticText;
    clientesGrid: TDBGrid;
    cajerosGrid: TDBGrid;
    procedure ReturnToMainMenu(Sender: TObject);
  private
    procedure ShowClientData();
    procedure ShowCajeroData();
    { Private declarations }
  public
    procedure ShowAllData();
    { Public declarations }
  end;

var
  Gerente_Reportes: TGerente_Reportes;

implementation

Uses GerenteMainMenu;

{$R *.dfm}

procedure TGerente_Reportes.ReturnToMainMenu(Sender: TObject);
begin
  Gerente_MainMenu.Show;
  Gerente_Reportes.Hide;
end;

procedure TGerente_Reportes.ShowAllData();
begin
  ShowClientData();
  ShowCajeroData();
end;

procedure TGerente_Reportes.ShowClientData();
begin
  with DataModule1.ClienteAll do
    begin
      Close;
      Prepare;
      Open;
    end;
end;

procedure TGerente_Reportes.ShowCajeroData();
begin
  with DataModule1.CajeroAll do
    begin
      Close;
      Prepare;
      Open;
    end;
end;

end.
