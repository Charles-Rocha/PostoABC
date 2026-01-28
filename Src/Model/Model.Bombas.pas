unit Model.Bombas;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, untDM, Model.Connection, FireDAC.Stan.Param,
  VCL.Dialogs;

type
  TBomba = class
    private
      //
    public
      Constructor Create;
      Destructor Destroy; override;

      function ListarBombas(out erro: string): TFDQuery;
  end;

implementation

{ TBomba }

uses untPrincipal;

constructor TBomba.Create;
begin
  Model.Connection.Conecta;
end;

destructor TBomba.Destroy;
begin
  Model.Connection.Desconecta;
end;

function TBomba.ListarBombas(out erro: string): TFDQuery;
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
        SQL.Add('SELECT B.ID, B.BOMBA, B.ID_TANQUE ');
        SQL.Add('FROM BOMBAS B ');
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
