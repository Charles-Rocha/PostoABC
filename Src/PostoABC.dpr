program PostoABC;

uses
  Vcl.Forms,
  untPrincipal in 'View\untPrincipal.pas' {frmPrincipal},
  untTelaBaseCRUD in 'View\untTelaBaseCRUD.pas' {frmTelaBaseCRUD},
  untAbastecimentos in 'View\untAbastecimentos.pas' {frmAbastecimentos},
  untDM in 'DM\untDM.pas' {DM: TDataModule},
  Controller.Abastecimentos in 'Controller\Controller.Abastecimentos.pas',
  Model.Abastecimentos in 'Model\Model.Abastecimentos.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  Controller.Bombas in 'Controller\Controller.Bombas.pas',
  Model.Bombas in 'Model\Model.Bombas.pas',
  Controller.Tanques in 'Controller\Controller.Tanques.pas',
  Model.Tanques in 'Model\Model.Tanques.pas',
  Controller.Combustiveis in 'Controller\Controller.Combustiveis.pas',
  Model.Combustiveis in 'Model\Model.Combustiveis.pas',
  untConfigurarBancoDados in 'View\untConfigurarBancoDados.pas' {frmConfigurarBancoDados},
  untConfigurarValorCombustiveis in 'View\untConfigurarValorCombustiveis.pas' {frmConfigurarValorCombustiveis},
  untUniversal in 'View\untUniversal.pas',
  untFiltroRelAbastecimentos in 'View\untFiltroRelAbastecimentos.pas' {frmFiltroRelAbastecimentos},
  untRelAbastecimentos in 'View\untRelAbastecimentos.pas' {frmRelAbastecimentos},
  untSobre in 'View\untSobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTelaBaseCRUD, frmTelaBaseCRUD);
  Application.CreateForm(TfrmAbastecimentos, frmAbastecimentos);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmConfigurarBancoDados, frmConfigurarBancoDados);
  Application.CreateForm(TfrmConfigurarValorCombustiveis, frmConfigurarValorCombustiveis);
  Application.CreateForm(TfrmFiltroRelAbastecimentos, frmFiltroRelAbastecimentos);
  Application.CreateForm(TfrmRelAbastecimentos, frmRelAbastecimentos);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;
end.
