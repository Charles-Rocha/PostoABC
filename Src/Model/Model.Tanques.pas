unit Model.Tanques;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, untDM, Model.Connection, FireDAC.Stan.Param;

type
  TTanque = class
    private
      //
    public
      Constructor Create;
      Destructor Destroy; override;

      function ListarTanques(out erro: string): TFDQuery;
  end;

implementation

{ TTanque }

uses untPrincipal;

constructor TTanque.Create;
begin
  Model.Connection.Conecta;
end;

destructor TTanque.Destroy;
begin
  Model.Connection.Desconecta;
end;

function TTanque.ListarTanques(out erro: string): TFDQuery;
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
        SQL.Add('SELECT T.ID, T.TANQUE, T.ID_COMBUSTIVEL ');
        SQL.Add('FROM TANQUES T ');
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
