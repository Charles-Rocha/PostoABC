unit Controller.Tanques;

interface

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, Model.Abastecimentos, Model.Tanques;

procedure ListarTanques(mtTanques: TFDMemTable; out erro: string);

implementation

uses untDM;

procedure ListarTanques(mtTanques: TFDMemTable; out erro: string);
var
  tanque: TTanque;
  qry: TFDQuery;
begin
  try
    tanque := TTanque.Create;
  except on e: exception do
    begin
      erro := 'Erro encontrado: ' + e.Message;
      exit;
    end;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry := tanque.ListarTanques(erro);
    mtTanques.Data := qry.Data;
  finally
    qry.Free;
    tanque.Free;
  end;
end;

end.

