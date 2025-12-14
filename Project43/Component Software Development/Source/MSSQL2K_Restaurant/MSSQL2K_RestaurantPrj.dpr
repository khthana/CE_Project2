library MSSQL2K_RestaurantPrj;

uses
  ComServ,
  MSSQL2K_RestaurantPrj_TLB in 'MSSQL2K_RestaurantPrj_TLB.pas',
  MSSQL2K_RestaurantImp in 'MSSQL2K_RestaurantImp.pas' {MSSQL2K_Restaurant: CoClass},
  ADODB_TLB in 'c:\program files\borland\Delphi5\Imports\ADODB_TLB.pas',
  COMSVCSLib_TLB in 'c:\program files\borland\Delphi5\Imports\COMSVCSLib_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
