unit DecPins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, ExtCtrls, Grids;

type
  TPinsComp = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Query1: TQuery;
    Button3: TButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Query2: TQuery;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Count_Pins:Integer;
    NameTable:String;
    BitmapName:String;
    PositionX:Integer;
    PositionY:Integer;
    Px_Click:Integer;
    Py_Click:Integer;
  public
    { Public declarations }
    procedure SetPins(Pins:Integer);
    procedure UpdateTable;
    procedure Select_Item;
    procedure SetBitmap(name:String);
    procedure Draw_Grid_Image;
    procedure DrawSch;
    procedure DrawCursor(X,Y: Integer; cl:TColor);
    procedure DrawUserSelect;
    procedure UpdateDraw;
    procedure SetNameTable(Name:String);
    procedure SaveGridToDB;
    procedure CreateFnDB;
  end;

var
  PinsComp: TPinsComp;

implementation

{$R *.dfm}

procedure TPinsComp.Button2Click(Sender: TObject);
begin
  PinsComp.Close;
end;

procedure TPinsComp.SetNameTable(Name:String);
begin
  NameTable := Name;
End;

procedure TPinsComp.SetPins(Pins:Integer);
begin
  Count_Pins:=Pins;
End;

procedure TPinsComp.FormShow(Sender: TObject);
begin
  PositionX:=-1;
  PositionY:=-1;
  StringGrid1.RowCount := Count_Pins+1;
  DrawSch;
  UpdateTable;

  Px_Click := StrToInt(StringGrid1.Cells[4,StringGrid1.Row]);
  Py_Click := StrToInt(StringGrid1.Cells[5,StringGrid1.Row]);
  UpdateDraw;
end;

procedure TPinsComp.DrawSch;
  Var Image2:TBitmap;
begin
  Image1.Picture.LoadFromFile('Screen.Bmp');
  Draw_Grid_Image;

  Image2 := TBitmap.Create;
  Image2.LoadFromFile(BitmapName);
  Image2.TransparentColor := RGB(255,0,255);
  Image2.TransparentMode := tmAuto;
  Image2.Transparent := True;

  Image1.Width := Image2.Width+40;
  Image1.Height := Image2.Height+40;
  Image1.Canvas.Draw(20,20,Image2);
End;

procedure TPinsComp.UpdateTable;
const StrType:Array [0..3] of String = ('NC','IN','OUT','BIDIRECTION');
Var i:Integer;
begin
  StringGrid1.Cells[0,0] := 'Number';
  StringGrid1.Cells[1,0] := 'Name Pin';
  StringGrid1.Cells[2,0] := 'Type No';
  StringGrid1.ColWidths[3] := 100;  
  StringGrid1.Cells[3,0] := 'Type';
  StringGrid1.Cells[4,0] := 'X';
  StringGrid1.Cells[5,0] := 'Y';
  StringGrid1.Cells[6,0] := 'Description';
  StringGrid1.ColWidths[6] := 170;

  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM Pin'+NameTable);
  Query1.Active := True;

  Query1.First;
  For i:=1 To Count_Pins Do
  Begin
    StringGrid1.Cells[0,i] := IntToStr(i);
    if Query1.Fields[3].AsString='' Then
    Begin
      StringGrid1.Cells[1,i] := '';
      StringGrid1.Cells[2,i] := '0';
      StringGrid1.Cells[3,i] := 'NC';
      StringGrid1.Cells[4,i] := '-1';
      StringGrid1.Cells[5,i] := '-1';
      StringGrid1.Cells[6,i] := '';
    End
    Else
    Begin
      StringGrid1.Cells[1,i] := Query1.Fields[0].AsString;
      StringGrid1.Cells[2,i] := Query1.Fields[1].AsString;
      StringGrid1.Cells[3,i] := StrType[Query1.Fields[1].AsInteger];
      StringGrid1.Cells[4,i] := Query1.Fields[2].AsString;
      StringGrid1.Cells[5,i] := Query1.Fields[3].AsString;
      StringGrid1.Cells[6,i] := Query1.Fields[4].AsString;
    End;
    Query1.Next;
  End;

  Select_Item;
end;

procedure TPinsComp.Select_Item;
begin
  Edit1.Text := StringGrid1.Cells[1,StringGrid1.Row];
  ComboBox1.ItemIndex :=StrToInt( StringGrid1.Cells[2,StringGrid1.Row]);
  Edit2.Text := StringGrid1.Cells[4,StringGrid1.Row];
  Edit3.Text := StringGrid1.Cells[5,StringGrid1.Row];
  Edit4.Text := StringGrid1.Cells[6,StringGrid1.Row];
End;

procedure TPinsComp.StringGrid1Click(Sender: TObject);
begin
  Px_Click := StrToInt(StringGrid1.Cells[4,StringGrid1.Row]);
  Py_Click := StrToInt(StringGrid1.Cells[5,StringGrid1.Row]);
  Select_Item;
  UpdateDraw;
end;

procedure TPinsComp.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Select_Item;
end;

procedure TPinsComp.Button1Click(Sender: TObject);
begin
  SaveGridToDB;
  CreateFnDB;
  PinsComp.Close;
End;

procedure TPinsComp.CreateFnDB;
  Var i:Integer;
Begin
  If FileExists('Fn'+NameTable+'.db') Then
  Begin
    Query2.Active:=False;
    Query2.SQL.Clear;
    Query2.SQL.Append('DROP TABLE Fn'+NameTable+';');
    Query2.ExecSQL;
  End;

    Query2.Active:=False;
    Query2.SQL.Clear;
    Query2.SQL.Append('CREATE TABLE Fn'+NameTable+' (');

//********************* Create Input *********************************
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('SELECT * FROM Pin'+NameTable);
    Query1.SQL.Append('Where CType=1');
    Query1.Active:=True;

    Query1.First;
    For i:=1 To Query1.RecordCount Do
    Begin
      Query2.SQL.Append(Query1.Fields[0].AsString+' CHAR(1),');
      Query1.Next;
    End;
//********************* Create <Bi>Input *********************************
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('SELECT * FROM Pin'+NameTable);
    Query1.SQL.Append('Where CType=3');
    Query1.Active:=True;

    Query1.First;
    For i:=1 To Query1.RecordCount Do
    Begin
      Query2.SQL.Append(Query1.Fields[0].AsString+'in CHAR(1),');
      Query1.Next;
    End;
//********************* Create Output *********************************
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('SELECT * FROM Pin'+NameTable);
    Query1.SQL.Append('Where CType=2');
    Query1.Active:=True;

    Query1.First;
    For i:=1 To Query1.RecordCount Do
    Begin
      Query2.SQL.Append(Query1.Fields[0].AsString+'in CHAR(1),');
      Query1.Next;
    End;
//********************* Create <Bi>Output *********************************
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('SELECT * FROM Pin'+NameTable);
    Query1.SQL.Append('Where CType=3');
    Query1.Active:=True;

    Query1.First;
    For i:=1 To Query1.RecordCount Do
    Begin
      Query2.SQL.Append(Query1.Fields[0].AsString+'out CHAR(1),');
      Query1.Next;
    End;
//**********************************************************************
    Query2.SQL.Append('PresentState INTEGER,');
    Query2.SQL.Append('NextState    INTEGER,');
    Query2.SQL.Append('EventState   CHAR(25),');
    Query2.SQL.Append('PictureName  CHAR(25),');
    Query2.SQL.Append('Flag         INTEGER);');

    Query1.Active:=False;
    Query2.ExecSQL;
End;

procedure TPinsComp.SaveGridToDB;
Var i:Integer;
begin
  For i:=1 To Query1.RecordCount Do
    Query1.Delete;

  For i:=1 To Count_Pins Do
  Begin
    If Query1.RecordCount>0 Then
      Query1.Append
    Else
      Query1.Edit;
    Query1.Fields[0].AsString:=StringGrid1.Cells[1,i];
    Query1.Fields[1].AsString:=StringGrid1.Cells[2,i];
    Query1.Fields[2].AsString:=StringGrid1.Cells[4,i];
    Query1.Fields[3].AsString:=StringGrid1.Cells[5,i];
    Query1.Fields[4].AsString:=StringGrid1.Cells[6,i];
    Query1.Post;
  End;
end;

procedure TPinsComp.Button3Click(Sender: TObject);
begin
  StringGrid1.Cells[1,StringGrid1.Row]:=Edit1.Text;
  StringGrid1.Cells[2,StringGrid1.Row]:= IntToStr(ComboBox1.ItemIndex);
  StringGrid1.Cells[3,StringGrid1.Row]:=ComboBox1.Text;
  StringGrid1.Cells[4,StringGrid1.Row]:=Edit2.Text;
  StringGrid1.Cells[5,StringGrid1.Row]:=Edit3.Text;
  StringGrid1.Cells[6,StringGrid1.Row]:=Edit4.Text;
  UpdateDraw;
  
  If StringGrid1.Row<StringGrid1.RowCount-1 Then
    StringGrid1.Row:=StringGrid1.Row+1
  Else
    StringGrid1.Row:=1;
end;

procedure TPinsComp.SetBitmap(name:String);
Begin
  BitmapName:=name;
End;

procedure TPinsComp.Draw_Grid_Image;
Var i:Integer;
Begin
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Pen.Color := clSkyBlue;
  For i:=1 To 15 Do
    Begin
      Image1.Canvas.MoveTo(i*20,0);
      Image1.Canvas.LineTo(i*20,500);
    End;

  For i:=1 To 15 Do
    Begin
      Image1.Canvas.MoveTo(0,i*20);
      Image1.Canvas.LineTo(500,i*20);
    End;
End;

procedure TPinsComp.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  IF ((trunc((X+10)/20) <>PositionX) Or ((trunc(Y+10)/20)<>PositionY) ) Then
  Begin
    PositionX:=trunc((X+10)/20);
    PositionY:=trunc((Y+10)/20);
    UpdateDraw;
  End;
end;

procedure TPinsComp.UpdateDraw;
Begin
    DrawSch;
    DrawUserSelect;
    if (Px_Click>-1) and (Py_Click>-1) Then
      DrawCursor(Px_Click*20,Py_Click*20,clRed);
    DrawCursor(PositionX*20,PositionY*20,clBlue);
End;

procedure TPinsComp.DrawCursor(X,Y: Integer; cl:TColor);
begin
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := cl;
  Image1.Canvas.MoveTo(x-5,y-5);
  Image1.Canvas.LineTo(x+5,y+5);
  Image1.Canvas.MoveTo(x+5,y-5);
  Image1.Canvas.LineTo(x-5,y+5);
End;

procedure TPinsComp.DrawUserSelect;
Var i:Integer;
begin

  For i:=1 To StringGrid1.RowCount Do
    If i<>StringGrid1.Row Then
      If (StringGrid1.Cells[4,i]<>'') and
         (StringGrid1.Cells[5,i]<>'') Then
        If (StrToInt(StringGrid1.Cells[4,i])<>0) and
           (StrToInt(StringGrid1.Cells[5,i])<>0) Then
        Begin
          DrawCursor(StrToInt(StringGrid1.Cells[4,i])*20,
                     StrToInt(StringGrid1.Cells[5,i])*20,clLime);
        End;
End;

procedure TPinsComp.Image1Click(Sender: TObject);
begin
  Edit2.Text := IntToStr(PositionX);
  Edit3.Text := IntToStr(PositionY);
  Px_Click := PositionX;
  Py_Click := PositionY;
end;

procedure TPinsComp.ScrollBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  PositionX:=-1;
  PositionY:=-1;
  UpdateDraw;
end;

procedure TPinsComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Active := False;
  Query2.Active := False;
end;

end.
