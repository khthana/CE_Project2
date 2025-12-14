program EditLib;

uses
  Forms,
  DevMain in 'DevMain.pas' {DevComp},
  DevCreat in 'DevCreat.pas' {ECComp},
  FuncTB in 'FuncTB.pas' {FnTable},
  DecPins in 'DecPins.pas' {PinsComp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDevComp, DevComp);
  Application.CreateForm(TECComp, ECComp);
  Application.CreateForm(TFnTable, FnTable);
  Application.CreateForm(TPinsComp, PinsComp);
  Application.Run;
end.
