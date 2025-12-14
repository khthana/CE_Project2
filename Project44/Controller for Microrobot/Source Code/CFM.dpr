program CFM;

uses
  Forms,
  MDIFrame in 'C:\CFM\Delphi\MDIFrame.pas' {FrameForm},
  MDIEdit in 'C:\CFM\Delphi\MDIEdit.pas' {EditForm},
  Open_ASM in 'C:\CFM\Delphi\Open_ASM.pas' {Form1},
  MnForm in 'C:\CFM\Delphi\MnForm.pas' {DlForm},
  SettingsDlg in 'C:\CFM\Delphi\SettingsDlg.pas' {SettingsForm},
  FmxUtils in 'C:\CFM\Delphi\FmxUtils.pas',
  AboutTTY in 'C:\CFM\Delphi\AboutTTY.pas' {AboutBoxForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrameForm, FrameForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDlForm, DlForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.Run;
end.
