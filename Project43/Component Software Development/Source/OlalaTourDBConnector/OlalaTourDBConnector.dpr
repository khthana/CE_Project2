library OlalaTourDBConnector;

uses
  ComServ,
  OlalaTourDBConnector_TLB in 'OlalaTourDBConnector_TLB.pas',
  OlalaTourDBConnector_Source in 'OlalaTourDBConnector_Source.pas' {OlalaTourDBConnector: CoClass},
  COMSVCSLib_TLB in 'C:\Program Files\Borland\Delphi5\Imports\COMSVCSLib_TLB.pas',
  ADODB_TLB in 'C:\Program Files\Borland\Delphi5\Imports\ADODB_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
