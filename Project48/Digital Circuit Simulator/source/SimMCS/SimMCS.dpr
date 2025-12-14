program SimMCS;

uses
  Forms,
  MainCT in 'MainCT.pas' {MainPage},
  ControlPro in 'ControlPro.pas' {ControllerProp},
  HexMCS in 'HexMCS.pas' {HexCode},
  memMCS in 'memMCS.pas' {Memory},
  RegMCS in 'RegMCS.pas' {MCSReg},
  SimSCR in 'SimSCR.pas' {SimScreen},
  Report in 'Report.pas' {MCSReport},
  RouteMCS in 'RouteMCS.pas' {RouteTable},
  ErReport in 'ErReport.pas' {ErrReport},
  FState in 'FState.pas' {FindState},
  Timimg in 'Timimg.pas' {GraphTime};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainPage, MainPage);
  Application.CreateForm(TControllerProp, ControllerProp);
  Application.CreateForm(THexCode, HexCode);
  Application.CreateForm(TMemory, Memory);
  Application.CreateForm(TMCSReg, MCSReg);
  Application.CreateForm(TSimScreen, SimScreen);
  Application.CreateForm(TMCSReport, MCSReport);
  Application.CreateForm(TRouteTable, RouteTable);
  Application.CreateForm(TErrReport, ErrReport);
  Application.CreateForm(TFindState, FindState);
  Application.CreateForm(TGraphTime, GraphTime);
  Application.Run;
end.
