unit CajeroCorte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBGrids, Data, FireDAC.Stan.Param,
  Data.DB, Vcl.Grids, Enumerations, OutputMessagesFile, StringValidatorFile;

type
  TCajero_Corte = class(TForm)
    background: TShape;
    sidebarBackground: TShape;
    regresarButton: TButton;
    StaticText1: TStaticText;
    dineroEntranteStaticText: TStaticText;
    dineroSalienteStaticText: TStaticText;
    StaticText2: TStaticText;
    dineroInicioField: TEdit;
    dineroEntranteText: TStaticText;
    dineroSalienteText: TStaticText;
    balanceStaticText: TStaticText;
    balanceText: TStaticText;
    enviarCorteButton: TButton;
    DBGrid1: TDBGrid;
    errorText: TLabel;
    successText: TLabel;
    procedure ReturnToMainMenu(Sender: TObject);
    procedure SetBalance(Sender: TObject);
    procedure EnviarCorte(Sender: TObject);
  private
    output : OutputMessages;
    validator : StringValidator;
    movimientosRealizados : Integer;
    procedure ShowData();
    procedure SetBalanceText();
    procedure RegistrarCorte();
    function ValidateDineroInicio() : boolean;
    function CalculateTotal() : Integer;
    function GetCajeroKey( claveUsuario : Integer ) : Integer;
    { Private declarations }
  public
    procedure ShowMovements();
    { Public declarations }
  end;

var
  Cajero_Corte: TCajero_Corte;

implementation

Uses CajeroMainMenu, LoginPage;

{$R *.dfm}

procedure TCajero_Corte.ShowMovements();
begin
  with DataModule1.MovimientoTable do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := LoginForm.session.GetKey;
      ParamByName( 'fecha' ).AsDate := Date;
      Open;
    end;
  ShowData();
end;

procedure TCajero_Corte.SetBalance(Sender: TObject);
begin
  validator := StringValidator.Create;
  if ValidateDineroInicio() then
    begin
      SetBalanceText();
    end
  else
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.AmountInvalid;
    end;
end;

procedure TCajero_Corte.SetBalanceText();
var
  dayTotal : Integer;
begin
  if dineroInicioField.Text = output.NoMessage() then
    begin
      balanceText.Caption := IntToStr( StrToInt( dineroEntranteText.Caption ) + StrToInt( dineroSalienteText.Caption ) );
    end
  else
    begin
      dayTotal := StrToInt( dineroEntranteText.Caption ) + StrToInt( dineroSalienteText.Caption );
      balanceText.Caption := IntToStr( dayTotal + StrToInt( dineroInicioField.Text ) );
    end;
end;

procedure TCajero_Corte.ShowData();
var
  dineroEntrante, dineroSaliente : Integer;
begin
  dineroEntrante := 0;
  dineroSaliente := 0;
  movimientosRealizados := 0;
  with DataModule1.MovimientoTable do
    begin
      First;
      while not Eof do
      begin
        movimientosRealizados := movimientosRealizados + 1;
        if ( FieldByName( 'ClaveCajero' ).AsInteger = LoginForm.session.GetKey ) and
           ( FieldByName( 'FechaRealizada' ).AsString = DateToStr( Date ) ) then
            begin
              if ( FieldByName( 'TipoMovimiento' ).AsInteger = ord( TipoMovimiento.Abono ) ) or
                 ( FieldByName( 'TipoMovimiento' ).AsInteger = ord( TipoMovimiento.Pago ) ) then
                begin
                  dineroSaliente := dineroSaliente + FieldByName( 'Cantidad' ).AsInteger;
                end
              else if FieldByName( 'TipoMovimiento' ).AsInteger = ord( TipoMovimiento.Retiro ) then
                begin
                  dineroEntrante := dineroEntrante + FieldByName( 'Cantidad' ).AsInteger;
                end;
            end;
        Next;
      end;
      dineroEntranteText.Caption := IntToStr( dineroEntrante );
      dineroSalienteText.Caption := IntToStr( dineroSaliente );
    end;
end;

procedure TCajero_Corte.EnviarCorte(Sender: TObject);
begin
  if not ( balanceText.Caption = output.EmptyBalance() ) then
    begin
      RegistrarCorte();
      errorText.Caption := output.NoMessage;
      successText.Caption := output.CorteSuccessfullySent();
    end
  else
    begin
      successText.Caption := output.NoMessage;
      errorText.Caption := output.EnterStartOfDayAmount;
    end;
end;

procedure TCajero_Corte.RegistrarCorte();
begin
  DataModule1.Cortes.Active := TRUE;
  DataModule1.Cortes.Insert;
  DataModule1.Cortes.FieldByName( 'ClaveCajero' ).AsInteger := GetCajeroKey( LoginForm.session.GetKey );
  DataModule1.Cortes.FieldByName( 'CantidadInicial' ).AsInteger := StrToInt( dineroInicioField.Text );
  DataModule1.Cortes.FieldByName( 'DineroIngresado' ).AsInteger := StrToInt( dineroEntranteText.Caption );
  DataModule1.Cortes.FieldByName( 'DineroRetirado' ).AsInteger := StrToInt( dineroSalienteText.Caption );
  DataModule1.Cortes.FieldByName( 'CantidadFinal' ).AsInteger := CalculateTotal();
  DataModule1.Cortes.FieldByName( 'MovimientosRealizados' ).AsInteger := movimientosRealizados;
  DataModule1.Cortes.FieldByName( 'Fecha' ).AsString := DateToStr( Date );
  DataModule1.Cortes.Post;
  DataModule1.Cortes.Active := False;
end;

function TCajero_Corte.GetCajeroKey( claveUsuario : Integer ) : Integer;
begin
  with DataModule1.CajeroTable do
    begin
      Close;
      Prepare;
      ParamByName( 'clave' ).AsInteger := claveUsuario;
      Open;

      if DataModule1.CajeroTable.RecordCount <> 0 then
        begin
          Exit( DataModule1.CajeroTable.Fields[ 0 ].AsInteger );
        end;
    end;
end;

function TCajero_Corte.CalculateTotal() : Integer;
begin
  Result := StrToInt( dineroInicioField.Text ) + StrToInt( dineroEntranteText.Caption ) - StrToInt( dineroSalienteText.Caption );
end;

procedure TCajero_Corte.ReturnToMainMenu(Sender: TObject);
begin
  Cajero_MainMenu.Show;
  Cajero_Corte.Hide;
end;

function TCajero_Corte.ValidateDineroInicio() : boolean;
begin
  Exit( validator.AreNumbersValid( dineroInicioField.Text ) );
end;

end.
