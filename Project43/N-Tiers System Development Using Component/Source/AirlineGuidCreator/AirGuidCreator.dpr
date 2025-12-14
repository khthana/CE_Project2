library AirGuidCreator;

uses
  ComServ,
  AirGuidCreator_TLB in 'AirGuidCreator_TLB.pas',
  AirlineGuidCreator_Source in 'AirlineGuidCreator_Source.pas' {AirlineGuidCreator: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
