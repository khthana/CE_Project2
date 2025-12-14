unit Timimg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TGraphTime = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Query1: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
    Position:Integer;
    start:Integer;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure UpdateTimmingState;
  end;

var
  GraphTime: TGraphTime;

implementation

{$R *.dfm}

procedure TGraphTime.SetPath(s:String);
Begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Process'; // set initial directory
End;

procedure TGraphTime.FormShow(Sender: TObject);
Var i:Integer;
begin{
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select SerialOut,NameOut,PinNameOut From ConnectP');
  Query1.SQL.Append('Where  SerialOut<>'+chr(39)+'-'+chr(39));
  Query1.SQL.Append('Group by SerialOut,NameOut,PinNameOut');
  Query1.Active := True;}

  Position:=0;
  start:=1;

  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From PinValue');
  Query1.Active := True;

  Query1.First;
  For i:=1 To Query1.RecordCount Do
  begin
    Query1.Next;
  End;

end;

procedure TGraphTime.UpdateTimmingState;
Var i:Integer;
begin
  If start=1 Then
  Begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From PinValue');
  Query1.Active := True;
  Query1.First;
  Image1.Height := 40*(Query1.RecordCount+1);

  For i:=1 To Query1.RecordCount Do
  begin
    Image1.Canvas.TextOut(0,(40*i),Query1.Fields[0].AsString+':'+
                                    Query1.Fields[1].AsString+':'+
                                    Query1.Fields[2].AsString);

    If Image1.Canvas.Pixels[100+Position-1,(40*i)+15-(15*Query1.Fields[3].AsInteger)]<>0 Then
      Begin
        Image1.Canvas.MoveTo(100+Position-1,(40*i));
        Image1.Canvas.LineTo(100+Position-1,(40*i)+15);
      End;
    Image1.Canvas.MoveTo(100+Position  ,(40*i)+15-(15*Query1.Fields[3].AsInteger) );
    Image1.Canvas.LineTo(100+Position+1,(40*i)+15-(15*Query1.Fields[3].AsInteger) );
    Query1.Next;
  End;

  Image1.Width:=100+Position+10;
  Inc(Position);
  End;
End;

procedure TGraphTime.FormResize(Sender: TObject);
begin
  ScrollBox1.Width := GraphTime.Width-48;
  ScrollBox1.Height := GraphTime.Height-64;
end;

end.

