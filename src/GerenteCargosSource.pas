unit GerenteCargosSource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data;

type
  TGerenteCargos = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    cargoAnualButton: TButton;
    cargoMensual: TButton;
    multaNoPagoButton: TButton;
    procedure AplicarCargoAnual(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GerenteCargos: TGerenteCargos;

implementation

{$R *.dfm}

procedure TGerenteCargos.AplicarCargoAnual(Sender: TObject);
begin
  with DataModule1.Creditos do
    begin

    end;
end;

end.
