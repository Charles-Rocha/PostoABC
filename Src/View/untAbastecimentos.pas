unit untAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untTelaBaseCRUD, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXCalendars, Vcl.DBCtrls, IniFiles, Vcl.Menus;

type
  TTipoCadastro = (eInserir, eEditar, eBuscar, eNenhum);

type
  TfrmAbastecimentos = class(TfrmTelaBaseCRUD)
    pnlCampos: TPanel;
    lblData: TLabel;
    lblQtdLitros: TLabel;
    lblValorImposto: TLabel;
    lblBomba: TLabel;
    lblTanque: TLabel;
    lblValor: TLabel;
    lblCombustível: TLabel;
    edtQuantidadeLitros: TEdit;
    edtValor: TEdit;
    edtValorImposto: TEdit;
    edtPrecoCombustivel: TEdit;
    lblPrecoCombustivel: TLabel;
    cdpData: TCalendarPicker;
    dbLookupComboBoxBombas: TDBLookupComboBox;
    dtsBombas: TDataSource;
    DBLookupComboBoxTanques: TDBLookupComboBox;
    DBLookupComboBoxCombustiveis: TDBLookupComboBox;
    dtsTanques: TDataSource;
    dtsCombustiveis: TDataSource;
    popDataVenda: TPopupMenu;
    Limpar1: TMenuItem;
    N3: TMenuItem;
    SelecionarDataAtual1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbLookupComboBoxBombasCloseUp(Sender: TObject);
    procedure edtQuantidadeLitrosChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtQuantidadeLitrosClick(Sender: TObject);
    procedure edtPrecoCombustivelChange(Sender: TObject);
    procedure edtPrecoCombustivelClick(Sender: TObject);
    procedure edtValorClick(Sender: TObject);
    procedure edtValorImpostoClick(Sender: TObject);
    procedure edtValorImpostoChange(Sender: TObject);
    procedure cdpDataCloseUp(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure SelecionarDataAtual1Click(Sender: TObject);
  private
    { Private declarations }
    FTipoCadastro: TTipoCadastro;
    FCancelar: boolean;
    FPrecoGasolina: string;
    FPrecoDiesel: string;

    function CalcularValorTotal: double;
    function CalcularValorImposto: double;
    procedure CarregarAbastecimentos;
    procedure CarregarBombas;
    procedure CarregarTanques;
    procedure CarregarCombustiveis;
    procedure CarregarPrecosCombustiveis;
    procedure HabilitarControles;
    procedure DesabilitarControles;
    procedure FormatarFonteCalendario(Calendario: TCalendarPicker);
    procedure LimparControles;
    procedure OnAfterScrollAbastecimentos(DataSet: TDataSet);
    procedure OnPrecoCombustivelGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure OnQuantidadeLitrosGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure OnValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure OnValorImpostoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure PreencherCamposAbastecimentos;
    procedure PreencherCamposDeValores;
    function ValidarCamposObrigatorios: boolean;
  public
    { Public declarations }
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

{$R *.dfm}

uses untDM, Controller.Abastecimentos, Controller.Bombas, Controller.Tanques, Controller.Combustiveis, untUniversal;

procedure TfrmAbastecimentos.FormatarFonteCalendario(Calendario: TCalendarPicker);
begin
  if Calendario.IsEmpty then
    Calendario.Font.Color := clGray
  else
    Calendario.Font.Color := clBlack;
end;

procedure TfrmAbastecimentos.FormShow(Sender: TObject);
begin
  FTipoCadastro := eNenhum;
  FCancelar := false;

  CarregarAbastecimentos;
  CarregarBombas;
  CarregarTanques;
  CarregarCombustiveis;
  CarregarPrecosCombustiveis;

  if DM.mtAbastecimentos.IsEmpty then
    LimparControles
  else
    PreencherCamposAbastecimentos;

  DesabilitarControles;
  inherited;
end;

procedure TfrmAbastecimentos.HabilitarControles;
begin
  cdpData.Enabled := true;
  edtQuantidadeLitros.Enabled := true;
  dbLookupComboBoxBombas.Enabled := true;
  PreencherCamposAbastecimentos;
  cdpData.SetFocus;
end;

procedure TfrmAbastecimentos.btnApagarClick(Sender: TObject);
var
  sErro: string;
  bResultado: boolean;
begin
  Case Application.MessageBox(PChar('Tem certeza que deseja apagar o registro selecionado?'),
                                    'Aviso', MB_YesNo + MB_IconExclamation) of
  IdYes:
    begin
      try
        try
          bResultado := DeletarAbastecimento(DM.mtAbastecimentos.FieldByName('ID').AsInteger, sErro);
          if not bResultado then
            begin
              Application.MessageBox(PChar(sErro), 'Aviso', mb_Ok + mb_IconExclamation)
            end
          else
            begin
              CarregarAbastecimentos;

              if DM.mtAbastecimentos.IsEmpty then
                LimparControles
              else
                PreencherCamposAbastecimentos;
            end;
        except
          on E : Exception do
            Application.MessageBox(PChar('Erro encontrado! ' + E.Message),'Aviso',mb_Ok+mb_IconExclamation);
        end;
      finally
        begin
          FTipoCadastro := eNenhum;
          StatusBar1.Panels[0].Text := 'Total de registros: ' + IntToStr(DM.mtAbastecimentos.RecordCount);
        end;
      end;
    end;
  IdNo:
    begin
      DesabilitarControles;
    end;
  end;
  inherited;
end;

procedure TfrmAbastecimentos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FCancelar := true;
  DesabilitarControles;
  LimparControles;
  PreencherCamposAbastecimentos;
  FCancelar := false;
  FTipoCadastro := eNenhum;
end;

procedure TfrmAbastecimentos.btnEditarClick(Sender: TObject);
var
  CurrentRecord: TBookMark;
begin
  inherited;
  FTipoCadastro := eEditar;
  CurrentRecord := dbgBaseCadastro.DataSource.DataSet.GetBookmark;
  FormatarFonteCalendario(cdpData);
  HabilitarControles;
  dbgBaseCadastro.DataSource.DataSet.GotoBookmark(CurrentRecord);
  dbgBaseCadastro.DataSource.DataSet.FreeBookmark(CurrentRecord);
end;

procedure TfrmAbastecimentos.btnGravarClick(Sender: TObject);
var
  bResultado: boolean;
  sDataCompra, sQuantidadeLitros, sPrecoCombustivel, sValor, sErro: string;
  dQuantidadeLitros, dPrecoCombustivel, dValor, dValorImposto: double;
  iIdAbastecimento, iIdBomba: integer;
begin
  if not ValidarCamposObrigatorios then
    exit;

  iIdAbastecimento := DM.mtAbastecimentos.FieldByName('ID').AsInteger;
  sDataCompra := DateToStr(cdpData.Date);
  sQuantidadeLitros := StringReplace(edtQuantidadeLitros.Text, '.', EmptyStr, [rfReplaceAll]);
  dQuantidadeLitros := StrToFloat(sQuantidadeLitros);
  sPrecoCombustivel := StringReplace(edtPrecoCombustivel.Text, '.', EmptyStr, [rfReplaceAll]);
  dPrecoCombustivel := StrToFloat(sPrecoCombustivel);
  sValor := StringReplace(edtValor.Text, '.', EmptyStr, [rfReplaceAll]);
  dValor := StrToFloat(sValor);
  dValorImposto := StrToFloat(edtValorImposto.Text);
  iIdBomba := dbLookupComboBoxBombas.KeyValue;

  bResultado := false;

  try
    if FTipoCadastro = eInserir then
      bResultado := InserirAbastecimento(sDataCompra, dQuantidadeLitros, dPrecoCombustivel, dValor,
                                         dValorImposto, iIdBomba, sErro);

    if FTipoCadastro = eEditar then
      bResultado := EditarAbastecimento(iIdAbastecimento, sDataCompra, dQuantidadeLitros,
                                        dPrecoCombustivel, dValor, dValorImposto, iIdBomba, sErro);
    try
      if not bResultado then
        begin
          Application.MessageBox(PChar(sErro), 'Aviso', mb_Ok + mb_IconExclamation)
        end
      else
        begin
          CarregarAbastecimentos;

          if DM.mtAbastecimentos.IsEmpty then
            LimparControles
          else
            PreencherCamposAbastecimentos;
        end;
    except
      on E : Exception do
        Application.MessageBox(PChar('Erro encontrado! ' + E.Message),'Aviso',mb_Ok+mb_IconExclamation);
      end;
    finally
      if bResultado then
        begin
          DesabilitarControles;
          FTipoCadastro := eNenhum;
        end;
      StatusBar1.Panels[0].Text := 'Total de registros: ' + IntToStr(DM.mtAbastecimentos.RecordCount);
    end;
  if bResultado then
    inherited;
end;

procedure TfrmAbastecimentos.btnInserirClick(Sender: TObject);
begin
  inherited;
  FTipoCadastro := eInserir;
  FormatarFonteCalendario(cdpData);
  HabilitarControles;
  LimparControles;
  CarregarBombas;
  PreencherCamposDeValores;
end;

procedure TfrmAbastecimentos.btnLimparClick(Sender: TObject);
begin
  inherited;
  LimparControles;
end;

function TfrmAbastecimentos.CalcularValorTotal: double;
var
  dPrecoCombustivel, dTotal: double;
  dQuantidadeLitros: double;
  sPrecoCombustivel, sQuantidadeLitros: string;
begin
  if (edtPrecoCombustivel.Text = EmptyStr) or (edtPrecoCombustivel.Text = '0,0000') then
    dPrecoCombustivel := 0
  else
    begin
      sPrecoCombustivel := StringReplace(edtPrecoCombustivel.Text, '.', EmptyStr, [rfReplaceAll]);
      dPrecoCombustivel := StrToFloat(sPrecoCombustivel);
    end;

  sQuantidadeLitros := StringReplace(edtQuantidadeLitros.Text, '.', EmptyStr, [rfReplaceAll]);

  if edtQuantidadeLitros.Text = EmptyStr then
    dQuantidadeLitros := 1
  else
    dQuantidadeLitros := StrToFloat(sQuantidadeLitros);

  dTotal := (dPrecoCombustivel * dQuantidadeLitros);
  result := dTotal;
end;

function TfrmAbastecimentos.CalcularValorImposto: double;
var
  dValor, dTotal: double;
  sValor: string;
begin
  if (edtValor.Text = EmptyStr) or (edtValor.Text = '0,0000') then
    dValor := 0
  else
    begin
      sValor := StringReplace(edtValor.Text, '.', EmptyStr, [rfReplaceAll]);
      dValor := StrToFloat(sValor);
    end;

  dTotal := (dValor * 13) / 100;
  result := dTotal;
end;

procedure TfrmAbastecimentos.CarregarAbastecimentos;
var
  sErro: string;
  CurrentRecord: TBookMark;
begin
  if DM.mtAbastecimentos.Active then
    DM.mtAbastecimentos.EmptyDataSet;

  DM.mtAbastecimentos.Close;
  ListarAbastecimentos(DM.mtAbastecimentos, sErro);
  dtsDBGrid.DataSet := DM.mtAbastecimentos;

  CurrentRecord := dbgBaseCadastro.DataSource.DataSet.GetBookmark;

  DM.mtAbastecimentos.AfterScroll := OnAfterScrollAbastecimentos;
  DM.mtAbastecimentos.FieldByName('PRECO_COMBUSTIVEL').OnGetText := OnPrecoCombustivelGetText;
  DM.mtAbastecimentos.FieldByName('QTD_LITROS').OnGetText := OnQuantidadeLitrosGetText;
  DM.mtAbastecimentos.FieldByName('VALOR').OnGetText := OnValorGetText;
  DM.mtAbastecimentos.FieldByName('VALOR_IMPOSTO').OnGetText := OnValorImpostoGetText;

  dbgBaseCadastro.DataSource.DataSet.GotoBookmark(CurrentRecord);
  dbgBaseCadastro.DataSource.DataSet.FreeBookmark(CurrentRecord);
end;

procedure TfrmAbastecimentos.CarregarBombas;
var
  sErro: string;
begin
  DM.mtBombas.Close;
  ListarBombas(DM.mtBombas, sErro);
  dtsBombas.DataSet := DM.mtBombas;
  dbLookupComboBoxBombas.KeyValue := -1;
end;

procedure TfrmAbastecimentos.CarregarTanques;
var
  sErro: string;
begin
  DM.mtTanques.Close;
  ListarTanques(DM.mtTanques, sErro);
  dtsTanques.DataSet := DM.mtTanques;
  dbLookupComboBoxTanques.KeyValue := DM.mtBombas.FieldByName('ID_TANQUE').AsInteger;
end;

procedure TfrmAbastecimentos.cdpDataCloseUp(Sender: TObject);
begin
  FormatarFonteCalendario(cdpData);
end;

procedure TfrmAbastecimentos.CarregarCombustiveis;
var
  sErro: string;
begin
  DM.mtCombustiveis.Close;
  ListarCombustiveis(DM.mtCombustiveis, sErro);
  dtsCombustiveis.DataSet := DM.mtCombustiveis;
  dbLookupComboBoxCombustiveis.KeyValue := DM.mtTanques.FieldByName('ID_COMBUSTIVEL').AsInteger;
end;

procedure TfrmAbastecimentos.CarregarPrecosCombustiveis;
var
  ArqIni : TIniFile;
begin
  PreencherCamposDeValores;
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config\postoabc_config.ini');

  try
    FPrecoGasolina := ArqIni.ReadString('Precos', 'Gasolina', 'Erro ao ler valor');
    FPrecoDiesel := ArqIni.ReadString('Precos', 'OleoDiesel', 'Erro ao ler valor');
  finally
    ArqIni.Free;
  end;
end;

procedure TfrmAbastecimentos.dbLookupComboBoxBombasCloseUp(Sender: TObject);
begin
  inherited;
  CarregarTanques;
  CarregarCombustiveis;

  if DBLookupComboBoxCombustiveis.Text = 'Gasolina' then
    edtPrecoCombustivel.Text := FPrecoGasolina;
  if DBLookupComboBoxCombustiveis.Text = 'Óleo Diesel' then
    edtPrecoCombustivel.Text := FPrecoDiesel;
end;

procedure TfrmAbastecimentos.DesabilitarControles;
begin
  cdpData.Enabled := false;
  edtQuantidadeLitros.Enabled := false;
  dbLookupComboBoxBombas.Enabled := false;
end;

procedure TfrmAbastecimentos.edtPrecoCombustivelChange(Sender: TObject);
var
  dValor: double;
begin
  dValor := 0;

  if not FCancelar then
    begin
      edtPrecoCombustivel.Text := FormatarMoeda(edtPrecoCombustivel.Text);
      edtPrecoCombustivel.SelStart := Length(edtPrecoCombustivel.Text);
    end;

  if FTipoCadastro <> eBuscar then
    dValor := CalcularValorTotal;

  edtValor.Text := FormatFloat('#,##0.0000', dValor);
end;

procedure TfrmAbastecimentos.edtPrecoCombustivelClick(Sender: TObject);
begin
  edtPrecoCombustivel.SelStart := Length(edtPrecoCombustivel.Text);
end;

procedure TfrmAbastecimentos.edtQuantidadeLitrosChange(Sender: TObject);
var
  dValor: double;
begin
  dValor := 0;

  if not FCancelar then
    begin
      edtQuantidadeLitros.Text := FormatarMoeda(edtQuantidadeLitros.Text);
      edtQuantidadeLitros.SelStart := Length(edtQuantidadeLitros.Text);
    end;

  if FTipoCadastro <> eBuscar then
    dValor := CalcularValorTotal;

  edtValor.Text := FormatFloat('#,##0.0000', dValor);
end;

procedure TfrmAbastecimentos.edtQuantidadeLitrosClick(Sender: TObject);
begin
  edtQuantidadeLitros.SelStart := Length(edtQuantidadeLitros.Text);
end;

procedure TfrmAbastecimentos.edtValorChange(Sender: TObject);
var
  dValor: double;
begin
  dValor := 0;
  if not FCancelar then
    begin
      edtValor.Text := FormatarMoeda(edtValor.Text);
      edtValor.SelStart := Length(edtValor.Text);
    end;

  if FTipoCadastro <> eBuscar then
    dValor := CalcularValorImposto;

  edtValorImposto.Text := FormatFloat('#,##0.0000', dValor);
end;

procedure TfrmAbastecimentos.edtValorClick(Sender: TObject);
begin
  edtValor.SelStart := Length(edtValor.Text);
end;

procedure TfrmAbastecimentos.edtValorImpostoChange(Sender: TObject);
begin
  if not FCancelar then
    begin
      edtValorImposto.Text := FormatarMoeda(edtValorImposto.Text);
      edtValorImposto.SelStart := Length(edtValorImposto.Text);
    end;
end;

procedure TfrmAbastecimentos.edtValorImpostoClick(Sender: TObject);
begin
  edtValorImposto.SelStart := Length(edtValorImposto.Text);
end;

procedure TfrmAbastecimentos.Limpar1Click(Sender: TObject);
begin
  cdpData.IsEmpty := true;
  FormatarFonteCalendario(cdpData);
end;

procedure TfrmAbastecimentos.LimparControles;
begin
  cdpData.IsEmpty := true;
  dbLookupComboBoxBombas.KeyValue := -1;
  dbLookupComboBoxTanques.KeyValue := -1;
  dbLookupComboBoxCombustiveis.KeyValue := -1;
  edtPrecoCombustivel.Clear;
  edtQuantidadeLitros.Clear;
  edtValor.Clear;
  edtValorImposto.Clear;
end;

procedure TfrmAbastecimentos.OnAfterScrollAbastecimentos(DataSet: TDataSet);
begin
  if (FTipoCadastro = eEditar) or (FTipoCadastro = eNenhum) then
    PreencherCamposAbastecimentos;
end;

procedure TfrmAbastecimentos.OnPrecoCombustivelGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not DM.mtAbastecimentos.IsEmpty then
    Text := FormatFloat('###,###,###,###,###,##0.0000', Sender.AsFloat);
end;

procedure TfrmAbastecimentos.OnQuantidadeLitrosGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not DM.mtAbastecimentos.IsEmpty then
    Text := FormatFloat('###,###,###,###,###,##0.0000', Sender.AsFloat);
end;

procedure TfrmAbastecimentos.OnValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not DM.mtAbastecimentos.IsEmpty then
    Text := FormatFloat('###,###,###,###,###,##0.0000', Sender.AsFloat);
end;

procedure TfrmAbastecimentos.OnValorImpostoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not DM.mtAbastecimentos.IsEmpty then
    Text := FormatFloat('###,###,###,###,###,##0.0000', Sender.AsFloat);
end;

procedure TfrmAbastecimentos.PreencherCamposAbastecimentos;
var
  sData: string;
begin
  if DM.mtAbastecimentos.FieldByName('Data').AsString <> EmptyStr then
    begin
      sData := DM.mtAbastecimentos.FieldByName('Data').AsString;
      cdpData.Date := StrToDate(sData);
    end;

  dbLookupComboBoxBombas.KeyValue := DM.mtAbastecimentos.FieldByName('ID_BOMBA').AsInteger;
  dbLookupComboBoxTanques.KeyValue := DM.mtAbastecimentos.FieldByName('ID_TANQUE').AsInteger;
  dbLookupComboBoxCombustiveis.KeyValue := DM.mtAbastecimentos.FieldByName('ID_COMBUSTIVEL').AsInteger;
  edtPrecoCombustivel.Text := FormatFloat('#,##0.0000', DM.mtAbastecimentos.FieldByName('PRECO_COMBUSTIVEL').AsFloat);
  edtQuantidadeLitros.Text := FormatFloat('#,##0.0000', DM.mtAbastecimentos.FieldByName('QTD_LITROS').AsFloat);
  edtValor.Text := FormatFloat('#,##0.0000', DM.mtAbastecimentos.FieldByName('VALOR').AsFloat);
  edtValorimposto.Text := FormatFloat('#,##0.0000', DM.mtAbastecimentos.FieldByName('VALOR_IMPOSTO').AsFloat);
  StatusBar1.Panels[0].Text := 'Total de registros: ' + IntToStr(DM.mtAbastecimentos.RecordCount);
end;

procedure TfrmAbastecimentos.PreencherCamposDeValores;
begin
  edtPrecoCombustivel.Text := '0,0000';
  edtQuantidadeLitros.Text := '0,0000';
  edtValor.Text := '0,0000';
  edtValorImposto.Text := '0,0000';
end;

procedure TfrmAbastecimentos.SelecionarDataAtual1Click(Sender: TObject);
begin
  cdpData.Date := Date;
  FormatarFonteCalendario(cdpData);
end;

function TfrmAbastecimentos.ValidarCamposObrigatorios: boolean;
begin
  result := true;

  if cdpData.IsEmpty then
    begin
      Application.MessageBox('O campo Data é de preenchimento obrigatório', 'Aviso', mb_Ok + mb_IconExclamation);
      result := false;
      cdpData.SetFocus;
      exit;
    end
  else
    begin
      if cdpData.Date > Date then
        begin
          Application.MessageBox('O campo Data não pode ser maior que a data atual', 'Aviso', mb_Ok + mb_IconExclamation);
          result := false;
          cdpData.SetFocus;
          exit;
        end;
    end;

  if edtQuantidadeLitros.Text = '' then
    begin
      Application.MessageBox('O campo Qtd. Litros é de preenchimento obrigatório', 'Aviso', mb_Ok + mb_IconExclamation);
      result := false;
      edtQuantidadeLitros.SetFocus;
      exit;
    end;

  if dbLookupComboBoxBombas.Text = '' then
    begin
      Application.MessageBox('O campo Bomba é de preenchimento obrigatório', 'Aviso', mb_Ok + mb_IconExclamation);
      result := false;
      dbLookupComboBoxBombas.SetFocus;
      exit;
    end;
end;

end.
