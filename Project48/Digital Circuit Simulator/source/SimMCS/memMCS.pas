unit memMCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables;

type
  TMemory = class(TForm)
    StringGrid1: TStringGrid;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure UpdateTitle;
    procedure RefreshScreen;
  end;

var
  Memory: TMemory;

implementation

{$R *.dfm}

procedure TMemory.SetPath(s:String);
Begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
End;

procedure TMemory.FormShow(Sender: TObject);
Begin
  RefreshScreen;
end;

procedure TMemory.UpdateTitle;
begin
  DBGrid1.Columns.Items[0].Width:=55;
  DBGrid1.Columns.Items[0].Title.Caption := 'Serial';
  DBGrid1.Columns.Items[1].Width:=140;
  DBGrid1.Columns.Items[1].Title.Caption := 'Name';
  DBGrid1.Columns.Items[2].Width:=30;
  DBGrid1.Columns.Items[2].Title.Caption := 'X';
  DBGrid1.Columns.Items[3].Width:=30;
  DBGrid1.Columns.Items[3].Title.Caption := 'Y';
{
  //NOT SHOW
  DBGrid1.Columns.Items[4].Width:=190;
  DBGrid1.Columns.Items[4].Title.Caption := 'File Name';
  DBGrid1.Columns.Items[5].Width:=50;
  DBGrid1.Columns.Items[5].Title.Caption := 'XTAL';
}
end;

procedure TMemory.RefreshScreen;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT Serial,Name,X,Y FROM MCS');
  Query1.Active := True;

  StringGrid1.RowCount := 257;
  StringGrid1.ColWidths[0] := 25;
  For i:=0 To 7 Do
  Begin
    StringGrid1.ColWidths[1+i] := 25;
    StringGrid1.Cells[1+i,0]   := IntToHex(7-i,1);
  End;
  StringGrid1.ColWidths[9] := 50;
  StringGrid1.Cells[9,0] := 'Byte';

  For i:=0 To 255 Do
  Begin
    StringGrid1.Cells[0,1+i]   := IntToHex(i,2);
  End;

  UpdateTitle;
End;

end.
