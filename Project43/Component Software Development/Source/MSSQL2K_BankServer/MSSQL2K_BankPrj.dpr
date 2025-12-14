library MSSQL2K_BankPrj;

uses
  ComServ,
  MSSQL2K_BankPrj_TLB in 'MSSQL2K_BankPrj_TLB.pas',
  MSSQL2K_BankImp in 'MSSQL2K_BankImp.pas' {MSSQL2K_Bank: CoClass},
  ADODB_TLB in 'C:\Program Files\Borland\Delphi5\Imports\ADODB_TLB.pas',
  COMSVCSLib_TLB in 'C:\Program Files\Borland\Delphi5\Imports\COMSVCSLib_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
