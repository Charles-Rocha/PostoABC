unit Model.Abastecimentos;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, untDM, Model.Connection, FireDAC.Stan.Param;

type
  TAbastecimento = class
    private
      FId: Integer;
      FData: string;
      FDataInicial: string;
      FDataFinal: string;
      FQuantidadeLitros: double;
      FPrecoCombustivel: double;
      FValor: double;
      FValorImposto: double;
      FIdBomba: integer;

    public
      Constructor Create;
      Destructor Destroy; override;

      property Id: Integer read FId write FId;
      property Data: string read FData write FData;
      property DataInicial: string read FDataInicial write FDataInicial;
      property DataFinal: string read FDataFinal write FDataFinal;
      property QuantidadeLitros: double read FQuantidadeLitros write FQuantidadeLitros;
      property PrecoCombustivel: double read FPrecoCombustivel write FPrecoCombustivel;
      property Valor: double read FValor write FValor;
      property ValorImposto: double read FValorImposto write FValorImposto;
      property IdBomba: integer read FIdBomba write FIdBomba;

      function ListarAbastecimentos(out erro: string): TFDQuery;
      function ListarAbastecimentosPorDatas(out erro: string): TFDQuery;
      function InserirAbastecimento(out erro: string): boolean;
      function EditarAbastecimento(out erro: string): boolean;
      procedure DeletarAbastecimento(out erro: string);
  end;

implementation

{ TAbastecimento }

uses untPrincipal;

constructor TAbastecimento.Create;
begin
  Model.Connection.Conecta;
end;

destructor TAbastecimento.Destroy;
begin
  Model.Connection.Desconecta;
end;

function TAbastecimento.ListarAbastecimentos(out erro: string): TFDQuery;
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
        SQL.Add('SELECT V.ID, V.DATA, V.QTD_LITROS, V.PRECO_COMBUSTIVEL, V.VALOR, V.VALOR_IMPOSTO, ');
        SQL.Add('V.ID_BOMBA, B.BOMBA, B.ID_TANQUE, T.TANQUE, T.ID_COMBUSTIVEL, C.COMBUSTIVEL ');
        SQL.Add('FROM ABASTECIMENTOS V ');
        SQL.Add('INNER JOIN BOMBAS B ON B.ID = V.ID_BOMBA ');
        SQL.Add('INNER JOIN TANQUES T ON T.ID = B.ID_TANQUE ');
        SQL.Add('INNER JOIN COMBUSTIVEIS C ON C.ID = T.ID_COMBUSTIVEL ');
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

function TAbastecimento.ListarAbastecimentosPorDatas(out erro: string): TFDQuery;
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

        SQL.Add('SELECT V.DATA, T.TANQUE, B.BOMBA, V.VALOR ');
        SQL.Add('FROM ABASTECIMENTOS V ');
        SQL.Add('INNER JOIN BOMBAS B ON B.ID = V.ID_BOMBA ');
        SQL.Add('INNER JOIN TANQUES T ON T.ID = B.ID_TANQUE ');
        SQL.Add('WHERE 1=1 ');
        SQL.Add('AND V.DATA BETWEEN :Datainicial AND :DataFinal ');

        ParamByName('DataInicial').Value := FDataInicial;
        ParamByName('DataFinal').Value := FDataFinal;

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

function TAbastecimento.InserirAbastecimento(out erro: string): boolean;
var
  qry: TFDQuery;
begin
  erro := EmptyStr;
  result := true;
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := DM.FDConnection1;

    with qry do
      begin
        Active := false;
        SQL.Clear;

        SQL.Add('INSERT INTO ABASTECIMENTOS (DATA, QTD_LITROS, PRECO_COMBUSTIVEL, VALOR, VALOR_IMPOSTO, ID_BOMBA) ');
        SQL.Add('VALUES(:Data, :QuantidadeLitros, :PrecoCombustivel, :Valor, :ValorImposto, :IdBomba) ');

        ParamByName('Data').Value := copy(FData, 7, 4) + '-' + copy(FData, 4, 2) + '-' + copy(FData, 1, 2);
        ParamByName('QuantidadeLitros').Value := FQuantidadeLitros;
        ParamByName('PrecoCombustivel').Value := FPrecoCombustivel;
        ParamByName('Valor').Value := FValor;
        ParamByName('ValorImposto').Value := FValorImposto;
        ParamByName('IdBomba').Value := IdBomba;
        ExecSQL;
        //Active := true;
      end;

    qry.Free;
  except on e: exception do
    begin
      erro := 'Erro ao inserir Abastecimento: ' + e.Message;
      result := false;
    end;
  end;
end;

function TAbastecimento.EditarAbastecimento(out erro: string): boolean;
var
  qry: TFDQuery;
begin
  erro := EmptyStr;
  result := true;
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := DM.FDConnection1;

    with qry do
      begin
        //Active := false;
        SQL.Clear;
        SQL.Add('UPDATE ABASTECIMENTOS SET DATA=:Data, QTD_LITROS=:QuantidadeLitros, ');
        SQL.Add('PRECO_COMBUSTIVEL=:PrecoCombustivel, VALOR=:Valor, VALOR_IMPOSTO=:ValorImposto, ID_BOMBA=:IdBomba');
        SQL.Add('WHERE Id = :Id');

        ParamByName('Id').Value := FId;
        ParamByName('Data').Value := copy(FData, 7, 4) + '-' + copy(FData, 4, 2) + '-' + copy(FData, 1, 2);
        ParamByName('QuantidadeLitros').Value := FQuantidadeLitros;
        ParamByName('PrecoCombustivel').Value := FPrecoCombustivel;
        ParamByName('Valor').Value := FValor;
        ParamByName('ValorImposto').Value := FValorImposto;
        ParamByName('IdBomba').Value := FIdBomba;
        ExecSQL;
        //Active := true;
      end;

    qry.Free;

  except on e: exception do
    begin
      erro := 'Erro ao editar Abastecimento: ' + e.Message;
      result := false;
    end;
  end;
end;

procedure TAbastecimento.DeletarAbastecimento(out erro: string);
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := DM.FDConnection1;

    with qry do
      begin
        //Active := false;
        SQL.Clear;
        SQL.Add('DELETE FROM ABASTECIMENTOS WHERE Id = :Id');
        ParamByName('Id').Value := FId;
        ExecSQL;
        //Active := true;
      end;

    qry.Free;
    erro := EmptyStr;
  except on e: exception do
    begin
      erro := 'Erro ao excluir Abastecimento: ' + e.Message;
    end;
  end;
end;

end.
