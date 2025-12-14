library OlalaGuidCreator;

uses
  ComServ,
  OlalaGuidCreator_TLB in 'OlalaGuidCreator_TLB.pas',
  OlalaGuidCreator_Source in 'OlalaGuidCreator_Source.pas' {OlalaGuidCreator: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
