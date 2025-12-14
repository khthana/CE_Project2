program libsys;

uses
  Forms,
  mainmenu in 'mainmenu.pas' {menuform},
  member in 'member.pas' {memberform},
  service in 'service.pas' {serviceform},
  data in 'data.pas' {dataform},
  module in 'module.pas' {databasemd: TDataModule},
  classmodule in 'classmodule.pas' {classmd: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmenuform, menuform);
  Application.CreateForm(Tmemberform, memberform);
  Application.CreateForm(Tserviceform, serviceform);
  Application.CreateForm(Tdataform, dataform);
  Application.CreateForm(Tdatabasemd, databasemd);
  Application.CreateForm(Tclassmd, classmd);
  Application.Run;
end.
