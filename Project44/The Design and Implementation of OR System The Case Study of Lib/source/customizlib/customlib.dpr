program customlib;

uses
  Forms,
  custom1 in 'custom1.pas' {CustomForm1},
  customdbmodule in 'customdbmodule.pas' {DataModule1: TDataModule},
  custom2 in 'custom2.pas' {CustomStep1},
  custom3 in 'custom3.pas' {CustomStep2},
  custom4 in 'custom4.pas' {CustomStep3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCustomForm1, CustomForm1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCustomStep1, CustomStep1);
  Application.CreateForm(TCustomStep2, CustomStep2);
  Application.CreateForm(TCustomStep3, CustomStep3);
  Application.Run;
end.
