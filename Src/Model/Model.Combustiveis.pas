unit Model.Combustiveis;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, untDM, Model.Connection, FireDAC.Stan.Param;

type
  TCombustivel = class
    private
      //
    public
      Constructor Create;
      Destructor Destroy; override;

      function ListarCombustiveis(out erro: string): TFDQuery;
  end;

implementation

{ TCombustivel }

uses untPrincipal;

constructor TCombustivel.Create;
begin
  Model.Connection.Conecta;
end;

destructor TCombustivel.Destroy;
begin
  Model.Connection.Desconecta;
end;

function TCombustivel.ListarCombustiveis(out erro: string): TFDQuery;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('SELECT C.ID, C.COMBUSTIVEL ');
        SQL.Add('FROM COMBUSTIVEIS C ');
        SQL.Add('WHERE 1=1');

        Active := true;
        FetchAll;
      end;

    erro := EmptyStr;
    result := qry;
  except on e: exception do
    begin
      erro := 'Erro na consulta: ' + e.Message;
      result := nil;
    end;
  end;
end;

end.
