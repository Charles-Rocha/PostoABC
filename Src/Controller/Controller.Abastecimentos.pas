unit Controller.Abastecimentos;

interface

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, Model.Abastecimentos,
     VCL.Dialogs;

procedure ListarAbastecimentos(mtAbastecimentos: TFDMemTable; out erro: string);
procedure ListarAbastecimentosPorDatas(mtAbastecimentosPorDatas: TFDMemTable;
  pDataInicial, pDataFinal: string; out erro: string);
function InserirAbastecimento(pData: string; pQuantidadeLitros, pPrecoCombustivel,
  pValor, pValorImposto: double; pIdBomba: integer; out erro: string): boolean;
function EditarAbastecimento(pIdAbastecimento: integer; pData: string; pQuantidadeLitros,
  pPrecoCombustivel, pValor, pValorImposto: double; pIdBomba: integer; out erro: string): boolean;
function DeletarAbastecimento(pIdAbastecimento: integer; out erro: string): boolean;

implementation

uses untDM;

procedure ListarAbastecimentos(mtAbastecimentos: TFDMemTable; out erro: string);
var
  abastecimento: TAbastecimento;
  qry: TFDQuery;
begin
  try
    abastecimento := TAbastecimento.Create;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry := abastecimento.ListarAbastecimentos(erro);
    mtAbastecimentos.Data := qry.Data;
  finally
    qry.Free;
    abastecimento.Free;
  end;
end;

procedure ListarAbastecimentosPorDatas(mtAbastecimentosPorDatas: TFDMemTable;
  pDataInicial, pDataFinal: string; out erro: string);
var
  abastecimento: TAbastecimento;
  qry: TFDQuery;
begin
  try
    abastecimento := TAbastecimento.Create;
    abastecimento.DataInicial := pDataInicial;
    abastecimento.DataFinal := pDataFinal;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry := abastecimento.ListarAbastecimentosPorDatas(erro);
    mtAbastecimentosPorDatas.Data := qry.Data;
  finally
    qry.Free;
    abastecimento.Free;
  end;
end;

function InserirAbastecimento(pData: string; pQuantidadeLitros, pPrecoCombustivel,
  pValor, pValorImposto: double; pIdBomba: integer; out erro: string): boolean;
var
  abastecimento: TAbastecimento;
begin
  result := true;
  abastecimento := TAbastecimento.Create;

  try
    try
      abastecimento.Data := pData;
      abastecimento.QuantidadeLitros := pQuantidadeLitros;
      abastecimento.PrecoCombustivel := pPrecoCombustivel;
      abastecimento.Valor := pValor;
      abastecimento.ValorImposto := pValorImposto;
      abastecimento.IdBomba := pIdBomba;
      abastecimento.InserirAbastecimento(erro);

      if erro <> EmptyStr then
        raise Exception.Create(erro);

    except on e: exception do
      begin
        result := false;
      end;
    end;
  finally
    abastecimento.Free;
  end;
end;

function EditarAbastecimento(pIdAbastecimento: integer; pData: string; pQuantidadeLitros, pPrecoCombustivel,
  pValor, pValorImposto: double; pIdBomba: integer; out erro: string): boolean;
var
  abastecimento: TAbastecimento;
begin
  result := true;
  abastecimento := TAbastecimento.Create;

  try
    try
      abastecimento.Id := pIdAbastecimento;
      abastecimento.Data := pData;
      abastecimento.QuantidadeLitros := pQuantidadeLitros;
      abastecimento.PrecoCombustivel := pPrecoCombustivel;
      abastecimento.Valor := pValor;
      abastecimento.ValorImposto := pValorImposto;
      abastecimento.IdBomba := pIdBomba;
      abastecimento.EditarAbastecimento(erro);

      if erro <> EmptyStr then
        raise Exception.Create(erro);

    except on e: exception do
      begin
        result := false;
      end;
    end;

  finally
    abastecimento.Free;
  end;
end;

function DeletarAbastecimento(pIdAbastecimento: integer; out erro: string): boolean;
var
  abastecimento: TAbastecimento;
begin
  result := false;
  try
    abastecimento := TAbastecimento.Create;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  try
    try
      abastecimento.Id := pIdAbastecimento;
      abastecimento.DeletarAbastecimento(erro);

      if erro <> EmptyStr then
        raise Exception.Create(erro)
      else
        result := true;

    except on e: exception do
      begin
        erro := 'Erro ao deletar lançamento: ' + e.Message;
      end;
    end;

  finally
    abastecimento.Free;
  end;
end;

end.

