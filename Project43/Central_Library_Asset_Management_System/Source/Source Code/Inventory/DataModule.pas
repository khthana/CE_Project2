unit DAtaModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls;

type
  TDM = class(TDataModule)
    Ds_Company: TDataSource;
    Database1: TDatabase;
    Qr_Transaction: TQuery;
    Qr_Company: TQuery;
    Ds_Inventory_Detail: TDataSource;
    Qr_Inventory_Detail: TQuery;
    Ds_Depart: TDataSource;
    Qr_Depart: TQuery;
    Ds_Show_Inven: TDataSource;
    Qr_Show_Inven: TQuery;
    Ds_Show_Bring: TDataSource;
    Qr_Show_Bring: TQuery;
    Tb_Type: TTable;
    Qr_Voucher: TQuery;
    Ds_Voucher: TDataSource;
    Ds_Buy_Detail: TDataSource;
    Qr_Buy_Detail: TQuery;
    Ds_Year: TDataSource;
    Qr_Year: TQuery;
    DataSource1: TDataSource;
    Query1: TQuery;
    Ds_Off: TDataSource;
    Qr_Off: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.DFM}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
     try
          Qr_Company.Active := True;
          Qr_Depart.Active := True;
          Qr_Inventory_Detail.Active := True;
     Except
          ShowMessage('ไม่พบฐานข้อมูล');
     end;
end;

end.
