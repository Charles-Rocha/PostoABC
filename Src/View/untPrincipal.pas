unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    BancodeDados1: TMenuItem;
    Configurar1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Ajuda1: TMenuItem;
    Configurar2: TMenuItem;
    ValorCombustveis1: TMenuItem;
    Relatrios1: TMenuItem;
    Abastecimentos2: TMenuItem;
    pnlPrincipal: TPanel;
    Image1: TImage;
    Sobre1: TMenuItem;
    procedure Abastecimentos1Click(Sender: TObject);
    procedure Configurar1Click(Sender: TObject);
    procedure ValorCombustveis1Click(Sender: TObject);
    procedure Abastecimentos2Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untAbastecimentos, untConfigurarBancoDados, untConfigurarValorCombustiveis, untFiltroRelAbastecimentos, untSobre;

procedure TfrmPrincipal.Abastecimentos1Click(Sender: TObject);
begin
  frmAbastecimentos.ShowModal;
end;

procedure TfrmPrincipal.Abastecimentos2Click(Sender: TObject);
begin
  frmFiltroRelAbastecimentos.ShowModal;
end;

procedure TfrmPrincipal.Configurar1Click(Sender: TObject);
begin
  frmConfigurarBancoDados.ShowModal;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.ValorCombustveis1Click(Sender: TObject);
begin
  frmConfigurarValorCombustiveis.ShowModal;
end;

end.
