unit Controller.Combustiveis;

interface

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, Model.Abastecimentos, Model.Combustiveis;

procedure ListarCombustiveis(mtCombustiveis: TFDMemTable; out erro: string);

implementation

uses untDM;

procedure ListarCombustiveis(mtCombustiveis: TFDMemTable; out erro: string);
var
  combustivel: TCombustivel;
  qry: TFDQuery;
begin
  try
    combustivel := TCombustivel.Create;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  qry := TFDQuery.Create(nil);

  try
    qry := combustivel.ListarCombustiveis(erro);
    mtCombustiveis.Data := qry.Data;
  finally
    qry.Free;
    combustivel.Free;
  end;
end;

end.

