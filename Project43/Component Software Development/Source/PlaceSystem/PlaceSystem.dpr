library PlaceSystem;

uses
  ComServ,
  PlaceSystem_TLB in 'PlaceSystem_TLB.pas',
  PlaceProperty_Source in 'PlaceProperty_Source.pas' {PlaceProperty: CoClass},
  ActivityManager_Source in 'ActivityManager_Source.pas' {ActivityManager: CoClass},
  CategoryManager_Source in 'CategoryManager_Source.pas' {CategoryManager: CoClass},
  FestivalManager_Source in 'FestivalManager_Source.pas' {FestivalManager: CoClass},
  PlaceManager_Source in 'PlaceManager_Source.pas' {PlaceManager: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
