program Inventory;

uses
  Forms,
  Main in 'Main.pas' {Fr_Main},
  Recieve in 'Recieve.pas' {Fr_Recieve},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  CompanyDetail in 'CompanyDetail.pas' {Fr_Company},
  Depart in 'Depart.pas' {Fr_Depart},
  TypeAdd in 'TypeAdd.pas' {Fr_Type},
  InventoryDetail in 'InventoryDetail.pas' {Fr_Inventory},
  Buy_Detail in 'Buy_Detail.pas' {Fr_Buy_Detail},
  EditVoucher in 'EditVoucher.pas' {Fr_EditVoucher},
  Print_Bring in 'Print_Bring.pas' {Fr_Bring_Print},
  Edit_Inven in 'Edit_Inven.pas' {Fr_Edit_Inven},
  Print_Voucher in 'Print_Voucher.pas' {Fr_Print_Voucher},
  Print_Inven_Cat in 'Print_Inven_Cat.pas' {Fr_InVen_CAT},
  Print_Year in 'Print_Year.pas' {Fr_Print_Year},
  Print_Voucher2 in 'Print_Voucher2.pas' {Fr_PVoucher2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFr_Main, Fr_Main);
  Application.CreateForm(TFr_Recieve, Fr_Recieve);
  Application.CreateForm(TFr_Company, Fr_Company);
  Application.CreateForm(TFr_Depart, Fr_Depart);
  Application.CreateForm(TFr_Type, Fr_Type);
  Application.CreateForm(TFr_Inventory, Fr_Inventory);
  Application.CreateForm(TFr_Buy_Detail, Fr_Buy_Detail);
  Application.CreateForm(TFr_EditVoucher, Fr_EditVoucher);
  Application.CreateForm(TFr_Bring_Print, Fr_Bring_Print);
  Application.CreateForm(TFr_Edit_Inven, Fr_Edit_Inven);
  Application.CreateForm(TFr_Print_Voucher, Fr_Print_Voucher);
  Application.CreateForm(TFr_InVen_CAT, Fr_InVen_CAT);
  Application.CreateForm(TFr_Print_Year, Fr_Print_Year);
  Application.CreateForm(TFr_PVoucher2, Fr_PVoucher2);
  Application.Run;
end.
