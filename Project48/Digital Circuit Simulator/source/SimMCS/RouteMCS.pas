unit RouteMCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ExtCtrls, ComCtrls;

type
  TRouteTable = class(TForm)
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    Query5: TQuery;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer0: TTimer;
    Timer3: TTimer;
    Query6: TQuery;
    Query7: TQuery;
    Timer4: TTimer;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Query8: TQuery;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer0Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure CopyLineFormTable;
    procedure ClearLineTable;
    procedure ClearDotTable;
    Procedure ClearBufferPTable;
    procedure ClearConnectPTable;
    Function  GetLinePushDot:Boolean; Overload;
    Function  GetLinePushDot(x1,y1,x2,y2:Integer):Boolean; Overload;
    Procedure AppendDotToDataBase(x,y:integer);
    Procedure FindJunctionToDB(x,y:integer);
    Procedure ClearJunctionTable;
    Function  FindLineOnJunction(Var x1,y1,x2,y2:integer):Boolean;
    Procedure DetectItemOnDot;
    Function  CheckFinishState:Boolean;
    Procedure TranslateFunction;
    procedure UpdateTitle;
  end;

var
  RouteTable: TRouteTable;

implementation

{$R *.dfm}

procedure TRouteTable.SetPath(s:String);
begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
  Query2.Active := False;
  Query2.DatabaseName := MyPath+'Data'; // set initial directory
  Query3.Active := False;
  Query3.DatabaseName := MyPath+'Data'; // set initial directory
  Query4.Active := False;
  Query4.DatabaseName := MyPath+'Data'; // set initial directory
  Query5.Active := False;
  Query5.DatabaseName := MyPath+'Lib'; // set initial directory
  Query6.Active := False;
  Query6.DatabaseName := MyPath+'Data'; // set initial directory
  Query7.Active := False;
  Query7.DatabaseName := MyPath+'Data'; // set initial directory
  Query8.Active := False;
  Query8.DatabaseName := MyPath+'Data'; // set initial directory
End;

procedure TRouteTable.FormShow(Sender: TObject);
begin
  ClearBufferPTable;
  ClearConnectPTable;
  ClearLineTable;
  CopyLineFormTable;
  Timer0.Enabled := True;
end;

procedure TRouteTable.ClearLineTable;
Var i:Integer;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('Select * From ErrReport');
  Query2.Active := True;

  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('Select * From Routing');
  Query2.Active := True;

  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;
End;

procedure TRouteTable.ClearConnectPTable;
Var i:Integer;
begin
  Query7.Active := False;
  Query7.SQL.Clear;
  Query7.SQL.Append('Select * From ConnectP');
  Query7.Active := True;

  For i:=1 To Query7.RecordCount Do
    Query7.Delete;
  Query7.Edit;
  Query7.Post;
End;

Procedure TRouteTable.ClearDotTable;
Var i:Integer;
begin
  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('Select * From RouteDot');
  Query3.Active := True;

  For i:=1 To Query3.RecordCount Do
    Query3.Delete;
  Query3.Edit;
  Query3.Post;
End;

Procedure TRouteTable.ClearBufferPTable;
Var i:Integer;
begin
  Query6.Active := False;
  Query6.SQL.Clear;
  Query6.SQL.Append('Select * From BufferP');
  Query6.Active := True;

  For i:=1 To Query6.RecordCount Do
    Query6.Delete;
  Query6.Edit;
  Query6.Post;
End;

Procedure TRouteTable.ClearJunctionTable;
Var i:Integer;
begin
  Query4.Active := False;
  Query4.SQL.Clear;
  Query4.SQL.Append('Select * From RouteJun');
  Query4.Active := True;

  For i:=1 To Query4.RecordCount Do
    Query4.Delete;
  Query4.Edit;
  Query4.Post;
End;

procedure TRouteTable.CopyLineFormTable;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select Serial,X1,Y1,X2,Y2 From SimMCS');
  Query1.SQL.Append('Where Flag=4');
  Query1.Active := True;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('Select * From Routing');
  Query2.Active := True;

  Query1.First;
  For i:=1 To Query1.RecordCount Do
  Begin
    If Query2.Fields[0].AsString<>'' Then
      Query2.Append
    Else
      Query2.Edit;
    Query2.Fields[0].AsString := Query1.Fields[0].AsString;
    Query2.Fields[1].AsString := Query1.Fields[1].AsString;
    Query2.Fields[2].AsString := Query1.Fields[2].AsString;
    Query2.Fields[3].AsString := Query1.Fields[3].AsString;
    Query2.Fields[4].AsString := Query1.Fields[4].AsString;
    Query2.Post;
    Query1.Next;
  End;

  Query1.Active := False;
  Query2.Active := False;
End;

Procedure TRouteTable.AppendDotToDataBase(x,y:integer);
Begin
  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('Select * From RouteDot');
  Query3.Active := True;

  If Query3.Fields[0].AsString<>'' Then
    Query3.Append
  Else
    Query3.Edit;
  Query3.Fields[0].AsInteger := x;
  Query3.Fields[1].AsInteger := y;
  Query3.Post;
  Query3.Active := False;
End;

Function TRouteTable.GetLinePushDot:Boolean;
Var i:Integer;
    x1,y1,x2,y2:Integer;
    min,max,m,c:Integer;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('Select * From Routing');
  Query2.SQL.Append('Where Name<>'+chr(39)+chr(39));
  Query2.Active := True;

  If Query2.Fields[0].AsString<>'' Then
  Begin
    x1:=Query2.Fields[1].AsInteger;
    y1:=Query2.Fields[2].AsInteger;
    x2:=Query2.Fields[3].AsInteger;
    y2:=Query2.Fields[4].AsInteger;

    Query2.Delete;
    Query2.Edit;
    Query2.Post;

    If x1<>x2 Then
    Begin
      m:=0;
      c:=y1;
      If x1>x2 Then
      Begin
        min:=x2;
        max:=x1;
      End
      Else
      Begin
        min:=x1;
        max:=x2;
      End;
    End
    Else
    Begin
      m:=1;
      c:=x1;
      If y1>y2 Then
      Begin
        min:=y2;
        max:=y1;
      End
      Else
      Begin
        min:=y1;
        max:=y2;
      End;
    End;

    For i:=min To Max Do
    Begin
      If m=0 Then
      Begin
        x1:=i;
        y1:=c;
      End
      Else
      Begin
        x1:=c;
        y1:=i;
      End;

      AppendDotToDataBase(x1,y1);
      FindJunctionToDB(x1-1,y1-1);
    End;

    GetLinePushDot:=True;
  End
  Else
    GetLinePushDot:=False;

  Query2.Active := False;
End;

Function TRouteTable.GetLinePushDot(x1,y1,x2,y2:Integer):Boolean;
Var i:Integer;
    min,max,m,c:Integer;
begin
  If (x1>0) And (X2>0) And (Y1>0) And (Y2>0) Then
  Begin
    If x1<>x2 Then
    Begin
      m:=0;
      c:=y1;
      If x1>x2 Then
      Begin
        min:=x2;
        max:=x1;
      End
      Else
      Begin
        min:=x1;
        max:=x2;
      End;
    End
    Else
    Begin
      m:=1;
      c:=x1;
      If y1>y2 Then
      Begin
        min:=y2;
        max:=y1;
      End
      Else
      Begin
        min:=y1;
        max:=y2;
      End;
    End;

    For i:=min To Max Do
    Begin
      If m=0 Then
      Begin
        x1:=i;
        y1:=c;
      End
      Else
      Begin
        x1:=c;
        y1:=i;
      End;

      AppendDotToDataBase(x1,y1);
      FindJunctionToDB(x1-1,y1-1);
    End;

    GetLinePushDot:=True;
  End
  Else
    GetLinePushDot:=False;

  Query2.Active := False;
End;

Procedure TRouteTable.FindJunctionToDB(x,y:integer);
Begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From SimMCS');
  Query1.SQL.Append('Where Flag=5 and X1='+IntToStr(x)+' and Y1='+IntToStr(y));
  Query1.Active := True;

  If Query1.Fields[0].AsString<>'' Then
  Begin
    Query4.Active := False;
    Query4.SQL.Clear;
    Query4.SQL.Append('Select * From RouteJun');
    Query4.Active := True;

    If Query4.Fields[0].AsString<>'' Then
      Query4.Append
    Else
      Query4.Edit;

    Query4.Fields[0].AsString  := Query1.Fields[0].AsString;
    Query4.Fields[1].AsInteger := x;
    Query4.Fields[2].AsInteger := y;
    Query4.Post;
    Query4.Active := False;
  End;
End;

Function TRouteTable.FindLineOnJunction(Var x1,y1,x2,y2:integer):Boolean;
Var x,y:Integer;
Begin
  Query4.Active := False;
  Query4.SQL.Clear;
  Query4.SQL.Append('Select * From RouteJun');
  Query4.SQL.Append('Where Serial<>'+Chr(39)+Chr(39));
  Query4.Active := True;

  If Query4.Fields[0].AsString<>'' Then
  Begin
    x:=Query4.Fields[1].AsInteger;
    y:=Query4.Fields[2].AsInteger;

    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('Select * From Routing');
    Query2.SQL.Append('Where X1<='+IntToStr(x+1)+' And '+
                            'X2>='+IntToStr(x+1)+' And '+
                            'Y1<='+IntToStr(y+1)+' And '+
                            'Y2>='+IntToStr(y+1));
    Query2.Active := True;
    If Query2.RecordCount<=1 Then
    Begin
      Query4.Delete;
      Query4.Edit;
      Query4.Post;
    End;

    If Query2.Fields[0].AsString<>'' Then
    Begin
      x1:=Query2.Fields[1].AsInteger;
      y1:=Query2.Fields[2].AsInteger;
      x2:=Query2.Fields[3].AsInteger;
      y2:=Query2.Fields[4].AsInteger;

      Query2.Delete;
      Query2.Edit;
      Query2.Post;
    End
    Else
    Begin
      x1:=-1;
      y1:=-1;
      x2:=-1;
      y2:=-1;
    End;

    Query2.Active := False;
    Query4.Active := False;
    FindLineOnJunction:=True;
  End
  Else
  Begin
    Query2.Active := False;
    Query4.Active := False;
    FindLineOnJunction:=False;
  End;

  Query2.Active := False;
  Query4.Active := False;
End;

procedure TRouteTable.Timer1Timer(Sender: TObject);
Var x1,y1,x2,y2:Integer;
begin
  If FindLineOnJunction(x1,y1,x2,y2) Then
  Begin
    GetLinePushDot(x1,y1,x2,y2);
  End
  Else
  Begin
    Timer1.Enabled := False;
    Timer2.Enabled := True;
  End;

end;

Procedure TRouteTable.DetectItemOnDot;
Var i,j,k,cx,cy,dx,dy,px,py:Integer;
Begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From SimMcs');
  Query1.Active := True;

  Query4.Active := False;
  Query4.SQL.Clear;
  Query4.SQL.Append('Select * From RouteDot');
  Query4.Active := True;

  ClearBufferPTable;

  Query6.Active := False;
  Query6.SQL.Clear;
  Query6.SQL.Append('Select * From BufferP');
  Query6.Active := True;

  Query4.First;
  For i:=1 To Query4.RecordCount Do
  Begin
    dx:=Query4.Fields[0].AsInteger;
    dy:=Query4.Fields[1].AsInteger;

    Query1.First;
    For j:=1 To Query1.RecordCount Do
    Begin
      px:=Query1.Fields[2].AsInteger;
      py:=Query1.Fields[3].AsInteger;

      Case Query1.Fields[6].AsInteger Of
      1:Begin
          Query5.Active:=False;
          Query5.SQL.Clear;
          Query5.SQL.Append('SELECT * FROM Pin'+Query1.Fields[1].AsString);
          Query5.SQL.Append('Where CType<>0');
          Query5.Active:=True;
          Query5.First;

          For k:=1 To Query5.RecordCount Do
          Begin
            cx:=Query5.Fields[2].AsInteger-1;
            cy:=Query5.Fields[3].AsInteger-1;
            If (px+cx=dx) and (py+cy=dy) Then
            Begin
              If Query6.Fields[0].AsString='' Then
                Query6.Edit
              Else
                Query6.Append;

              Query6.Fields[0].AsString := Query1.Fields[0].AsString;
              Query6.Fields[1].AsString := Query1.Fields[1].AsString;
              Query6.Fields[2].AsString := Query5.Fields[0].AsString;
              Query6.Fields[3].AsString := Query5.Fields[1].AsString;
              Query6.Post;
            End;

            Query5.Next;
          End;
        End;
      2:Begin
          If (px+1=dx) and (py+2=dy) Then
          Begin
            If Query6.Fields[0].AsString='' Then
              Query6.Edit
            Else
              Query6.Append;

            Query6.Fields[0].AsString := '-';
            Query6.Fields[1].AsString := 'VCC';
            Query6.Fields[2].AsString := '1';
            Query6.Fields[3].AsString := '0';
            Query6.Post;
          End;
        End;
      3:Begin
          If (px+1=dx) and (py+1=dy) Then
          Begin
            If Query6.Fields[0].AsString='' Then
              Query6.Edit
            Else
              Query6.Append;

            Query6.Fields[0].AsString := '-';
            Query6.Fields[1].AsString := 'GND';
            Query6.Fields[2].AsString := '0';
            Query6.Fields[3].AsString := '0';
            Query6.Post;
          End;
        End;
      End;

      Query1.Next;
    End;
    Query4.Next;
  End;
  Query1.Active := False;
  Query4.Active := False;
  Query6.Active := False;
End;

Procedure TRouteTable.TranslateFunction;
Var i:Integer;
    serial,name,pinname:String;
Begin
  Query8.Active := False;
  Query8.SQL.Clear;
  Query8.SQL.Append('Select * From ErrReport');
  Query8.Active := True;

  Query7.Active := False;
  Query7.SQL.Clear;
  Query7.SQL.Append('Select * From ConnectP');
  Query7.Active := True;

  Query6.Active := False;
  Query6.SQL.Clear;
  Query6.SQL.Append('Select * From BufferP');
  Query6.SQL.Append('Where Serial='+chr(39)+'-'+chr(39));
  Query6.Active := True;

  If Query6.RecordCount=0 Then
  Begin
    Query6.Active := False;
    Query6.SQL.Clear;
    Query6.SQL.Append('Select * From BufferP');
    Query6.SQL.Append('Where PinType=2');
    Query6.Active := True;
  End;

  If Query6.RecordCount>0 Then
  Begin
    serial  := Query6.Fields[0].AsString;
    name    := Query6.Fields[1].AsString;
    pinname := Query6.Fields[2].AsString;

    Query6.Active := False;
    Query6.SQL.Clear;
    Query6.SQL.Append('Select * From BufferP');
    Query6.SQL.Append('Where PinType=1');
    Query6.Active := True;
    Query6.First;
    For i:=1 To Query6.RecordCount Do
    Begin
      If Query7.Fields[0].AsString='' Then
      Query7.Edit
      Else
      Query7.Append;
      Query7.Fields[0].AsString  := Query6.Fields[0].AsString;
      Query7.Fields[1].AsString  := Query6.Fields[1].AsString;
      Query7.Fields[2].AsString  := Query6.Fields[2].AsString;
      Query7.Fields[3].AsString  := Serial;
      Query7.Fields[4].AsString  := Name;
      Query7.Fields[5].AsString  := PinName;
      Query7.Post;
      Query6.Next;
    End;
  End
  Else
  Begin
    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('Select * From BufferP');
    Query2.Active := True;
    Query2.First;
    For i:=1 To Query2.RecordCount Do
    Begin
      If Query8.Fields[0].AsString='' Then
        Query8.Edit
      Else
        Query8.Append;
      Query8.Fields[0].AsString  := 'Warning : '+Query2.Fields[0].AsString+':'
                                                +Query2.Fields[1].AsString+':'
                                                +Query2.Fields[2].AsString
                                                +' -> Can Not Connection';
      Query8.Post;
      Query2.Next;
    End;
  End;

  Query6.Active := False;
  Query7.Active := False;
  Query8.Active := False;
End;

procedure TRouteTable.Timer2Timer(Sender: TObject);
begin
  DetectItemOnDot;
  Timer2.Enabled:=False;
  Timer3.Enabled:=True;
end;

procedure TRouteTable.Timer0Timer(Sender: TObject);
begin
  ClearDotTable;
  ClearJunctionTable;

  GetLinePushDot;
  Timer0.Enabled :=False;
  Timer1.Enabled :=True;
end;

Function TRouteTable.CheckFinishState:Boolean;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('Select * From Routing');
  Query2.SQL.Append('Where Name<>'+chr(39)+chr(39));
  Query2.Active := True;

  If Query2.Fields[0].AsString='' Then
    CheckFinishState:=True
  Else
    CheckFinishState:=False;

  Query2.Active := False;
End;

procedure TRouteTable.Timer3Timer(Sender: TObject);
begin
  TranslateFunction;
  Timer3.Enabled:=False;
  Timer4.Enabled:=True;
end;

procedure TRouteTable.Timer4Timer(Sender: TObject);
begin
  If Not(CheckFinishState) Then
    Timer0.Enabled :=True
  Else
    Begin
      Query7.Active := False;
      Query7.SQL.Clear;
      Query7.SQL.Append('Select * From ConnectP');
      Query7.Active := True;
      UpdateTitle;
    End;
  Timer4.Enabled :=False;
end;

procedure TRouteTable.Button1Click(Sender: TObject);
begin
  RouteTable.Close;
  Query7.Active := False;
end;

procedure TRouteTable.UpdateTitle;
begin
  DBGrid1.Columns.Items[0].Width:=60;
  DBGrid1.Columns.Items[0].Title.Caption := 'Serial IN';
  DBGrid1.Columns.Items[1].Width:=90;
  DBGrid1.Columns.Items[1].Title.Caption := 'IC Name IN';
  DBGrid1.Columns.Items[2].Width:=80;
  DBGrid1.Columns.Items[2].Title.Caption := 'Pin Name IN';
  DBGrid1.Columns.Items[3].Width:=60;
  DBGrid1.Columns.Items[3].Title.Caption := 'Serial OUT';
  DBGrid1.Columns.Items[4].Width:=90;
  DBGrid1.Columns.Items[4].Title.Caption := 'IC Name OUT';
  DBGrid1.Columns.Items[5].Width:=80;
  DBGrid1.Columns.Items[5].Title.Caption := 'Pin Name OUT';
end;

end.
