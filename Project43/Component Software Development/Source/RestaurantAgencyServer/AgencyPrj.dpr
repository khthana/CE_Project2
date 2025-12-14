library AgencyPrj;

uses
  ComServ,
  AgencyPrj_TLB in 'AgencyPrj_TLB.pas',
  AgencyImp in 'AgencyImp.pas' {RestaurantAgency: CoClass},
  ADODB_TLB in 'c:\program files\borland\Delphi5\Imports\ADODB_TLB.pas',
  COMSVCSLib_TLB in 'c:\program files\borland\Delphi5\Imports\COMSVCSLib_TLB.pas',
  MSSQL2K_RestaurantPrj_TLB in 'c:\program files\borland\Delphi5\Imports\MSSQL2K_RestaurantPrj_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
