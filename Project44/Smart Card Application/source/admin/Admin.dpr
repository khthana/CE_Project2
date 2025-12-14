program Admin;

uses
  Forms,
  UAdminMain in 'UAdminMain.pas' {Mainfrm},
  UChangeRate in 'UChangeRate.pas' {ChangeRatefrm},
  ULoginAdmin in 'ULoginAdmin.pas' {Loginfrm},
  UCardInfo in 'UCardInfo.pas' {CardInfofrm},
  UIncBal in 'UIncBal.pas' {IncBalfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainfrm, Mainfrm);
  Application.CreateForm(TChangeRatefrm, ChangeRatefrm);
  Application.CreateForm(TLoginfrm, Loginfrm);
  Application.CreateForm(TCardInfofrm, CardInfofrm);
  Application.CreateForm(TIncBalfrm, IncBalfrm);
  Application.Run;
end.
