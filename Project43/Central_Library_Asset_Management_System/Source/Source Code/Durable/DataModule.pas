unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ADODB, Db, DBTables;

type
  TDataModule1 = class(TDataModule)
    Ds_Company_Detail: TDataSource;
    Qr_Transaction: TQuery;
    Database1: TDatabase;
    Qr_Company_Detail: TQuery;
    Ds_Department_Detail: TDataSource;
    Ds_Room: TDataSource;
    Tb_Room: TTable;
    Qr_Room_Detail: TQuery;
    Ds_Room_Detail: TDataSource;
    Ds_Type: TDataSource;
    Qr_Officer_Detail: TQuery;
    Ds_Officer_Detail: TDataSource;
    Tb_Department_Detail: TTable;
    Tb_Chief: TTable;
    Ds_Chief: TDataSource;
    Qr_Type: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses Com_Detail, Company, Department, Main_Durable,
  Officer, Room, TypeUnit;

{$R *.DFM}

end.
