unit customdbmodule;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataModule1 = class(TDataModule)
    Database1: TDatabase;
    Query1: TQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
        Database1.Connected := true;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
        Database1.Connected := False; 
end;

end.
