program CFMv2;

uses
  Forms,
  Main in 'C:\CFM\Delphi\Main.pas' {MainForm},
  reinit in 'C:\CFM\Delphi\reinit.pas',
  MnForm in 'C:\CFM\Delphi\MnForm.pas' {DlForm},
  AboutTTY in 'C:\CFM\Delphi\AboutTTY.pas' {AboutBoxForm},
  SettingsDlg in 'C:\CFM\Delphi\SettingsDlg.pas' {SettingsForm},
  Open_ASM in 'C:\CFM\Delphi\Open_ASM.pas' {Form1},
  FmxUtils in 'C:\CFM\Delphi\FmxUtils.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Controller for Microrobot';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDlForm, DlForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
