program Stock_prj;

uses
  Forms,
  Menu in 'Menu.pas' {Frmmenu},
  Request in 'Request.pas' {Frmrequest},
  Module in 'Module.pas' {DataModule1: TDataModule},
  Pay in 'Pay.pas' {frmpay},
  Register in 'Register.pas' {Frmregis};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmmenu, Frmmenu);
  Application.CreateForm(TFrmrequest, Frmrequest);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrmpay, frmpay);
  Application.CreateForm(TFrmregis, Frmregis);
  Application.Run;
end.
