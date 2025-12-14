unit ErReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables;

type
  TErrReport = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;    
  public
    { Public declarations }
    procedure SetPath(s:String);
  end;

var
  ErrReport: TErrReport;

implementation

{$R *.dfm}

procedure TErrReport.Button1Click(Sender: TObject);
begin
  Query1.Active := False;
  ErrReport.Close;
end;

procedure TErrReport.SetPath(s:String);
begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
End;

procedure TErrReport.FormShow(Sender: TObject);
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From ErrReport');
  Query1.Active := True;
end;

end.
