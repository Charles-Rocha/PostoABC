unit Controller.Bombas;

interface

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, Model.Abastecimentos, Model.Bombas;

procedure ListarBombas(mtBombas: TFDMemTable; out erro: string);

implementation

uses untDM;

procedure ListarBombas(mtBombas: TFDMemTable; out erro: string);
var
  bomba: TBomba;
  qry: TFDQuery;
begin
  try
    bomba := TBomba.Create;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry := bomba.ListarBombas(erro);
    mtBombas.Data := qry.Data;
  finally
    qry.Free;
    bomba.Free;
  end;
end;

end.

