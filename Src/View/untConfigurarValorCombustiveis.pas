unit untConfigurarValorCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles;

type
  TfrmConfigurarValorCombustiveis = class(TForm)
    Panel1: TPanel;
    lblPrecoGasolina: TLabel;
    lblPrecoOleoDiesel: TLabel;
    edtPrecoGasolina: TEdit;
    edtPrecoOleoDiesel: TEdit;
    Panel2: TPanel;
    btnSalvar: TButton;
    procedure edtPrecoGasolinaChange(Sender: TObject);
    procedure edtPrecoGasolinaClick(Sender: TObject);
    procedure edtPrecoOleoDieselChange(Sender: TObject);
    procedure edtPrecoOleoDieselClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherCamposDeValores;
  public
    { Public declarations }
  end;

var
  frmConfigurarValorCombustiveis: TfrmConfigurarValorCombustiveis;

implementation

{$R *.dfm}

uses untUniversal;

{ TfrmConfigurarValorCombustiveis }

procedure TfrmConfigurarValorCombustiveis.btnSalvarClick(Sender: TObject);
var
  ArqIni : TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config\postoabc_config.ini');
  try
    try
      ArqIni.WriteString('Precos', 'Gasolina', edtPrecoGasolina.Text);
      ArqIni.WriteString('Precos', 'OleoDiesel', edtPrecoOleoDiesel.Text);
      Close;
    except
      on E : Exception do
        begin
          Application.MessageBox(PChar('Erro encontrado. Verifique os dados fornecidos.' + #13#13 + E.Message),'Aviso',mb_Ok+mb_IconExclamation);
          exit;
        end;
    end;
  finally
    begin
      ArqIni.Free;
    end;
  end;
end;

procedure TfrmConfigurarValorCombustiveis.edtPrecoGasolinaChange(Sender: TObject);
begin
  edtPrecoGasolina.Text := FormatarMoeda(edtPrecoGasolina.Text);
  edtPrecoGasolina.SelStart := Length(edtPrecoGasolina.Text);
end;

procedure TfrmConfigurarValorCombustiveis.edtPrecoGasolinaClick(Sender: TObject);
begin
  edtPrecoGasolina.SelStart := Length(edtPrecoGasolina.Text);
end;

procedure TfrmConfigurarValorCombustiveis.edtPrecoOleoDieselChange(Sender: TObject);
begin
  edtPrecoOleoDiesel.Text := FormatarMoeda(edtPrecoOleoDiesel.Text);
  edtPrecoOleoDiesel.SelStart := Length(edtPrecoOleoDiesel.Text);
end;

procedure TfrmConfigurarValorCombustiveis.edtPrecoOleoDieselClick(Sender: TObject);
begin
  edtPrecoOleoDiesel.SelStart := Length(edtPrecoOleoDiesel.Text);
end;

procedure TfrmConfigurarValorCombustiveis.FormShow(Sender: TObject);
var
  ArqIni : TIniFile;
begin
  PreencherCamposDeValores;
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config\postoabc_config.ini');
  if not FileExists(ExtractFilePath(Application.ExeName)+'Config\postoabc_config.ini') then
    begin
      try
        ArqIni.WriteString('Dados', 'DriverID', '');
        ArqIni.WriteString('Dados', 'DatabaseName', '');
        ArqIni.WriteString('Dados', 'Username', '');
        ArqIni.WriteString('Dados', 'Password', '');
        ArqIni.WriteString('Dados', 'Port', '');
        ArqIni.WriteString('Dados', 'Server', '');

        ArqIni.WriteString('Precos', 'Gasolina', '6,3200');
        ArqIni.WriteString('Precos', 'OleoDiesel', '6,0300');
      finally
        ArqIni.Free;
      end;
    end
  else
    begin
      try
        edtPrecoGasolina.Text := ArqIni.ReadString('Precos', 'Gasolina', 'Erro ao ler valor');
        edtPrecoOleoDiesel.Text := ArqIni.ReadString('Precos', 'OleoDiesel', 'Erro ao ler valor');
      finally
        ArqIni.Free;
      end;
    end;
end;

procedure TfrmConfigurarValorCombustiveis.PreencherCamposDeValores;
begin
  edtPrecoGasolina.Text := '0,0000';
  edtPrecoOleoDiesel.Text := '0,0000';
end;

end.
