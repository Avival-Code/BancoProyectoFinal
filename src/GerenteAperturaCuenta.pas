unit GerenteAperturaCuenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data, StringValidatorFile,
  OutputMessagesFile, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param;

type
  TGerente_AperturaCuenta = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    StaticText1: TStaticText;
    usuarioField: TEdit;
    buscarButton: TButton;
    nombresStaticText: TStaticText;
    apellidosStaticText: TStaticText;
    tipoCuentaStaticText: TStaticText;
    tipoCuentaBox: TComboBox;
    tasaInteresStaticText: TStaticText;
    tasaInteresField: TEdit;
    crearCuentaButton: TButton;
    ingresoMensualStaticText: TStaticText;
    ingresoMensualField: TEdit;
    errorText: TStaticText;
    usuarioGrid: TDBGrid;
    nombresText: TStaticText;
    apellidosText: TStaticText;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure ShowUserData(Sender: TObject);
    procedure PrepareClass();
    procedure RecoverUserInformation(Column: TColumn);
  private
    validator : StringValidator;
    output : OutputMessages;
    selectedAccount : Integer;
    procedure SetUserInformation();
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

procedure TGerente_AperturaCuenta.PrepareClass;
begin
  validator := StringValidator.Create;
  output := OutputMessages.Create;
  tipoCuentaBox.Items.Add( 'Debito' );
  tipoCuentaBox.Items.Add( 'Credito' );
end;

procedure TGerente_AperturaCuenta.ShowUserData(Sender: TObject);
begin
  if validator.IsUsernameValid( usuarioField.Text ) then
    begin
      with DataModule1.UsuarioByUsuario do
        begin
          Close;
          Prepare;
          ParamByName( 'usuario' ).AsString := usuarioField.Text;
          Open;
        end;
    end
  else
    begin
      errorText.Caption := output.UsernameInvalid();
    end;
end;

procedure TGerente_AperturaCuenta.RecoverUserInformation(Column: TColumn);
var
  current : Integer;
  dataSet : TDataSet;
begin
  if usuarioGrid.SelectedRows.Count > 0 then
    begin
      dataSet := usuarioGrid.DataSource.DataSet;
      try
        dataSet.DisableControls;
        for current := 0 to usuarioGrid.SelectedRows.Count - 1 do
          begin
            dataSet.GotoBookmark( TBookmark( Pointer( usuarioGrid.SelectedRows.Items[ current ] ) ) );
            selectedAccount := dataSet.Fields[ 0 ].AsInteger;
          end;
      finally
        dataSet.EnableControls;
      end;
    end;
    SetUserInformation();
end;

procedure TGerente_AperturaCuenta.SetUserInformation;
begin
  with DataModule1.UsuarioByClave do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := selectedAccount;
      Open;

      if DataModule1.UsuarioByClave.RecordCount <> 0 then
         begin
           nombresText.Caption := DataModule1.DebitoTable.Fields[ 1 ].AsString;
           apellidosText.Caption := DataModule1.UsuarioByClave.Fields[ 2 ].AsString;
         end;
    end;
end;

end.
