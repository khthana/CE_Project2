unit RegMCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables;

type
  TMCSReg = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure RefreshScreen;
    procedure UpdateGridTable;
    procedure UpdateTitle;
  end;

var
  MCSReg: TMCSReg;

implementation

{$R *.dfm}
procedure TMCSReg.SetPath(s:String);
begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
End;

procedure TMCSReg.FormShow(Sender: TObject);
begin
  UpdateGridTable;
  RefreshScreen;
end;

procedure TMCSReg.RefreshScreen;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT Serial,Name,X,Y FROM MCS');
  Query1.Active := True;
  UpdateTitle;
End;

procedure TMCSReg.UpdateGridTable;
Begin
  StringGrid1.ColWidths[0]:=50;
  StringGrid1.ColWidths[1]:=80;
  StringGrid1.ColWidths[2]:=40;
  StringGrid1.ColWidths[3]:=120;

  StringGrid1.Cells[0,0] := 'REG';
  StringGrid1.Cells[1,0] := 'BIN';
  StringGrid1.Cells[2,0] := 'HEX';
  StringGrid1.Cells[3,0] := 'DESCRIPTION';

  StringGrid1.Cells[0,1] := 'P0';   StringGrid1.Cells[3,1] := 'Port 0';
  StringGrid1.Cells[0,2] := 'P1';   StringGrid1.Cells[3,2] := 'Port 1';
  StringGrid1.Cells[0,3] := 'P2';   StringGrid1.Cells[3,3] := 'Port 2';
  StringGrid1.Cells[0,4] := 'P3';   StringGrid1.Cells[3,4] := 'Port 3';
  StringGrid1.Cells[0,5] := 'PSW';  StringGrid1.Cells[3,5] := 'Program Status Word';
  StringGrid1.Cells[0,6] := 'CY';   StringGrid1.Cells[3,6] := 'Carry Flag';
  StringGrid1.Cells[0,7] := 'AC';   StringGrid1.Cells[3,7] := 'Auxiliary Carry';
  StringGrid1.Cells[0,8] := 'F0';   StringGrid1.Cells[3,8] := 'Flag 0';
  StringGrid1.Cells[0,9] := 'RS1';  StringGrid1.Cells[3,9] := 'Register Bank 1';
  StringGrid1.Cells[0,10] := 'RS0';  StringGrid1.Cells[3,10] := 'Register Bank 0';
  StringGrid1.Cells[0,11] := 'OV';   StringGrid1.Cells[3,11] := 'Overflow';
  StringGrid1.Cells[0,12] := 'P';    StringGrid1.Cells[3,12] := 'Even Parity';
  StringGrid1.Cells[0,13] := 'B';    StringGrid1.Cells[3,13] := 'B Register';
  StringGrid1.Cells[0,14] := 'SP';   StringGrid1.Cells[3,14] := 'Stack Pointer';
  StringGrid1.Cells[0,15] := 'DPTR'; StringGrid1.Cells[3,15] := 'Data Pointer';
  StringGrid1.Cells[0,16] := 'TH1';  StringGrid1.Cells[3,16] := 'Timer High 0';
  StringGrid1.Cells[0,17] := 'TH0';  StringGrid1.Cells[3,17] := 'Timer High 1';
  StringGrid1.Cells[0,18] := 'TL1';  StringGrid1.Cells[3,18] := 'Timer Low 0';
  StringGrid1.Cells[0,19] := 'TL0';  StringGrid1.Cells[3,19] := 'Timer Low 1';
  StringGrid1.Cells[0,20] := 'TMOD'; StringGrid1.Cells[3,20] := 'Timer Mode Control';
  StringGrid1.Cells[0,21] := 'TCON'; StringGrid1.Cells[3,21] := 'Timer Counter Control';
  StringGrid1.Cells[0,22] := 'PCON'; StringGrid1.Cells[3,22] := 'Power Control Register';
  StringGrid1.Cells[0,23] := 'SBUF'; StringGrid1.Cells[3,23] := 'Serial Data Buffer';
  StringGrid1.Cells[0,24] := 'SCON'; StringGrid1.Cells[3,24] := 'Serial Port Control';
  StringGrid1.Cells[0,25] := 'IE';   StringGrid1.Cells[3,25] := 'Interupt Enabled';
  StringGrid1.Cells[0,26] := 'IP';   StringGrid1.Cells[3,26] := 'Interupt Piority';
End;

procedure TMCSReg.UpdateTitle;
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

end.
