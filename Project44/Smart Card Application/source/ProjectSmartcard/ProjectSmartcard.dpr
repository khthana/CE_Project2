program ProjectSmartcard;

uses
  Forms,
  UMain in 'UMain.pas' {Mainfrm},
  ULockForm in 'ULockForm.pas' {Form2},
  UCardInfo in 'UCardInfo.pas' {CardInfoFrm},
  UCreditDisplay in 'UCreditDisplay.pas' {CreditDisplay},
  PwdAdminDlg in 'PwdAdminDlg.pas' {AdminLoginFrm};

//PwdAdminDlg in 'PwdAdminDlg.pas' {AdminLoginFrm};

{$R *.res}

begin
  Application.ShowMainForm := false;
  Application.Initialize;
  Application.CreateForm(TMainfrm, Mainfrm);
  Application.CreateForm(TLockForm, LockForm);
  Application.CreateForm(TCardInfoFrm, CardInfoFrm);
  Application.CreateForm(TCreditDisplay, CreditDisplay);
  Application.CreateForm(TAdminLoginFrm, AdminLoginFrm);
  Application.Run;
end.
