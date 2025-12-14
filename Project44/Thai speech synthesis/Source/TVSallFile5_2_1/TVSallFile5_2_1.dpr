program TVSallFile5_2_1;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.pas' {MainForm},
  About in 'ABOUT.PAS' {AboutBox},
  CutWord in 'CutWord.pas',
  FileMerge in 'FileMerge.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
  end.
 
