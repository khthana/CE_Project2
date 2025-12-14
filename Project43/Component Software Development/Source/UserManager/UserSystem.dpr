library UserSystem;

uses
  ComServ,
  UserSystem_TLB in 'UserSystem_TLB.pas',
  AdminManager_Source in 'AdminManager_Source.pas' {AdminManager: CoClass},
  MemberManager_Source in 'MemberManager_Source.pas' {MemberManager: CoClass},
  OlalaTour_Connect_TLB in 'C:\Program Files\Borland\Delphi5\Imports\OlalaTour_Connect_TLB.pas',
  FoodType_Source in 'FoodType_Source.pas' {FoodType: CoClass},
  TravellerManager_Source in 'TravellerManager_Source.pas' {TravellerManager: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
