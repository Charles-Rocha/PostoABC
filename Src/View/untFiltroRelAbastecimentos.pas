unit untFiltroRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB;

type
  TfrmFiltroRelAbastecimentos = class(TForm)
    pnlFiltrarDataInicialFinal: TPanel;
    cdpDataFinal: TCalendarPicker;
    cdpDataInicial: TCalendarPicker;
    Label1: TLabel;
    lblDataFinalCompra: TLabel;
    lblDataInicialCompra: TLabel;
    btnImprimir: TButton;
    dtsListarAbastecimentosPorDatas: TDataSource;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarAbastecimentosPorDatas(pDataInicial, pDataFinal: string);
    function ValidarCamposObrigatorios: boolean;
  public
    { Public declarations }
  end;

var
  frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos;

implementation

{$R *.dfm}

uses Controller.Abastecimentos, untDM, untRelAbastecimentos;

procedure TfrmFiltroRelAbastecimentos.btnImprimirClick(Sender: TObject);
var
  sDataInicial, sDataFinal: string;
begin
  if not ValidarCamposObrigatorios then
    exit;

  sDataInicial := copy(DateToStr(cdpDataInicial.Date), 7, 4) + '-' +
                  copy(DateToStr(cdpDataInicial.Date), 4, 2) + '-' +
                  copy(DateToStr(cdpDataInicial.Date), 1, 2);

  sDataFinal := copy(DateToStr(cdpDataFinal.Date), 7, 4) + '-' +
                copy(DateToStr(cdpDataFinal.Date), 4, 2) + '-' +
                copy(DateToStr(cdpDataFinal.Date), 1, 2);

  CarregarAbastecimentosPorDatas(sDataInicial, sDataFinal);
  frmRelAbastecimentos.relAbastecimentos.Preview();
end;

procedure TfrmFiltroRelAbastecimentos.CarregarAbastecimentosPorDatas(pDataInicial, pDataFinal: string);
var
  sErro: string;
begin
  if DM.mtAbastecimentosPorDatas.Active then
    DM.mtAbastecimentosPorDatas.EmptyDataSet;

  DM.mtAbastecimentosPorDatas.Close;
  ListarAbastecimentosPorDatas(DM.mtAbastecimentosPorDatas, pDataInicial, pDataFinal, sErro);
  dtsListarAbastecimentosPorDatas.DataSet := DM.mtAbastecimentosPorDatas;
end;

function TfrmFiltroRelAbastecimentos.ValidarCamposObrigatorios: boolean;
begin
  result := true;

  if cdpDataInicial.IsEmpty then
    begin
      Application.MessageBox('O campo Data Inicial é de preenchimento obrigatório', 'Aviso', mb_Ok + mb_IconExclamation);
      result := false;
      cdpDataInicial.SetFocus;
      exit;
    end
  else
    begin
      if cdpDataInicial.Date > Date then
        begin
          Application.MessageBox('O campo Data Inicial não pode ser maior que a data atual', 'Aviso', mb_Ok + mb_IconExclamation);
          result := false;
          cdpDataInicial.SetFocus;
          exit;
        end;
    end;

  if cdpDataFinal.IsEmpty then
    begin
      Application.MessageBox('O campo Data Final é de preenchimento obrigatório', 'Aviso', mb_Ok + mb_IconExclamation);
      result := false;
      cdpDataFinal.SetFocus;
      exit;
    end
  else
    begin
      if cdpDataFinal.Date > Date then
        begin
          Application.MessageBox('O campo Data Final não pode ser maior que a data atual', 'Aviso', mb_Ok + mb_IconExclamation);
          result := false;
          cdpDataFinal.SetFocus;
          exit;
        end;
    end;

  if cdpDataInicial.Date > cdpDataFinal.Date then
    begin
      Application.MessageBox('O campo Data Inicial não pode ser maior que Data Final', 'Aviso', mb_Ok + mb_IconExclamation);
      cdpDataInicial.SetFocus;
      exit;
    end;
end;

end.
