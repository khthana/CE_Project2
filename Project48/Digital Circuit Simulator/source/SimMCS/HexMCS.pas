unit HexMCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBGrids, DB, DBTables, Grids;

type
  THexCode = class(TForm)
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    MyPath:String;
  public
    { Public declarations }
    procedure ReloadHexFile(s:String);
    procedure SetPath(s:String);
    procedure RefreshScreen;
    procedure UpdateTitle;
  end;

var
  HexCode: THexCode;

implementation

{$R *.dfm}

procedure THexCode.FormShow(Sender: TObject);
Var i:Integer;
begin
  StringGrid1.ColWidths[0] := 50;
  For i:=0 To 15 Do
  Begin
    StringGrid1.ColWidths[1+i] := 25;
    StringGrid1.Cells[1+i,0]   := IntToHex(i,2);
  End;

  RefreshScreen;
end;

procedure THexCode.SetPath(s:String);
begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory  
End;

procedure THexCode.ReloadHexFile(s:String);
Var f:TextFile;
    Position,i:Integer;
    ch_in:Char;
    Buf_Cmd:String;
begin
  If s<>'' Then
  Begin
    StringGrid1.Visible := True;
    AssignFile(F,s);
    Reset(F);
    Position:=0;
    Buf_Cmd:='';
    StringGrid1.RowCount := 1;
    Repeat
      Read(F,ch_in);
      if ( (Ch_in >= 'A') and (Ch_in <= 'F') ) Or
         ( (Ch_in >= '0') and (Ch_in <= '9') ) Then
      Begin
        Buf_Cmd:=Buf_Cmd+ch_in;
        if Length(Buf_Cmd)=2 Then
        Begin
          If ((Position Div 16) > StringGrid1.RowCount-2) And ((Position Mod 16)=0) Then
          Begin
            StringGrid1.RowCount := 2 + ( Position Div 16);
            StringGrid1.Cells[0,1+( Position Div 16)] := IntToHex(Position Div 16,4);
            For i:=1 To 16 Do
              StringGrid1.Cells[i,1+( Position Div 16)] := '';
            StringGrid1.FixedRows := 1;
          End;

          StringGrid1.Cells[1+(Position Mod 16),1+( Position Div 16) ] := Buf_Cmd;
          Position := Position + 1;
          Buf_Cmd:='';
        End;
      End;
    Until EOF(F);
    CloseFile(F);
  End
  Else
    StringGrid1.Visible := False;
end;

procedure THexCode.DBGrid1CellClick(Column: TColumn);
begin
  ReloadHexFile(Query1.Fields[4].AsString)
end;

procedure THexCode.RefreshScreen;
Begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT Serial,Name,X,Y,HexFile FROM MCS');
  Query1.Active := True;
  ReloadHexFile(Query1.Fields[4].AsString);
  UpdateTitle;
End;

procedure THexCode.UpdateTitle;
begin
  DBGrid1.Columns.Items[0].Width:=55;
  DBGrid1.Columns.Items[0].Title.Caption := 'Serial';
  DBGrid1.Columns.Items[1].Width:=140;
  DBGrid1.Columns.Items[1].Title.Caption := 'Name';
  DBGrid1.Columns.Items[2].Width:=30;
  DBGrid1.Columns.Items[2].Title.Caption := 'X';
  DBGrid1.Columns.Items[3].Width:=30;
  DBGrid1.Columns.Items[3].Title.Caption := 'Y';
  DBGrid1.Columns.Items[4].Width:=190;
  DBGrid1.Columns.Items[4].Title.Caption := 'File Name';
  {
  // Do Not Show
  DBGrid1.Columns.Items[5].Width:=50;
  DBGrid1.Columns.Items[5].Title.Caption := 'XTAL';
  }
end;

end.
