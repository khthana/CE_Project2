program Durable_Manage;

uses
  Forms,
  Com_Detail in 'Com_Detail.pas' {Fr_Com_Detail},
  Department in 'Department.pas' {Fr_Department},
  Company in 'Company.pas' {Fr_Company},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Room in 'Room.pas' {Fr_Room},
  TypeUnit in 'TypeUnit.pas' {Fr_Type},
  Officer in 'Officer.pas' {Fr_Officer},
  Durable in 'Durable.pas' {Fr_Durable_Detail},
  Receive in 'Receive.pas' {Fr_Receive},
  History in 'History.pas' {Fr_History},
  Print_Status in 'Print_Status.pas' {Fr_Print_Status},
  Print_Check in 'Print_Check.pas' {Fr_Print_Check},
  Print_Expire in 'Print_Expire.pas' {Fr_Print_Expire},
  Print_Maintian in 'Print_Maintian.pas' {Fr_Print_Maintain},
  Main_Durable in 'Main_Durable.pas' {Fr_Durable};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Durable Management';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFr_Durable, Fr_Durable);
  Application.CreateForm(TFr_Receive, Fr_Receive);
  Application.CreateForm(TFr_Com_Detail, Fr_Com_Detail);
  Application.CreateForm(TFr_Department, Fr_Department);
  Application.CreateForm(TFr_Company, Fr_Company);
  Application.CreateForm(TFr_Room, Fr_Room);
  Application.CreateForm(TFr_Durable_Detail, Fr_Durable_Detail);
  Application.CreateForm(TFr_Type, Fr_Type);
  Application.CreateForm(TFr_Officer, Fr_Officer);
  Application.CreateForm(TFr_History, Fr_History);
  Application.CreateForm(TFr_Print_Status, Fr_Print_Status);
  Application.CreateForm(TFr_Print_Check, Fr_Print_Check);
  Application.CreateForm(TFr_Print_Expire, Fr_Print_Expire);
  Application.CreateForm(TFr_Print_Maintain, Fr_Print_Maintain);
  Application.Run;
end.
