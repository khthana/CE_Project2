unit SimSCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, ImgList, DB, DBTables, Grids,
  DBGrids, StdCtrls;

type
  TSimScreen = class(TForm)
    Image1: TImage;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Query6: TQuery;
    Query7: TQuery;
    Timer1: TTimer;
    Query8: TQuery;
    Query9: TQuery;
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    Query5: TQuery;
    Timer2: TTimer;
    Query10: TQuery;
    ToolButton10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
    Buffer,BG:TBitmap;
    Mx,My:Integer;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure InitailBuffer;
    procedure UpdateScreenSize;
    procedure DrawScreenItem;
    Function  GetStringInWing(s_in:String):String;
    procedure DrawToBG(x,y:integer; fname:String);
    Function  GetStringHeadWing(s_in:String):String;
    procedure ProcessAllComponent;
    procedure DrawToImage(x,y:integer; fname:String);
    procedure DrawStartItemOnScreen;
    procedure ResetItemState;
//*************************************************//
    procedure ClearAllDataBase;
    procedure CopyPinConnection;
    procedure FindingOutPut;
    Function  CheckEndState:Boolean;
  end;

var
  SimScreen: TSimScreen;

implementation

uses Timimg;

{$R *.dfm}

procedure TSimScreen.SetPath(s:String);
Begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
  Query2.Active := False;
  Query2.DatabaseName := MyPath+'Data'; // set initial directory
  Query3.Active := False;
  Query3.DatabaseName := MyPath+'Process'; // set initial directory
  Query4.Active := False;
  Query4.DatabaseName := MyPath+'Lib'; // set initial directory
  Query5.Active := False;
  Query5.DatabaseName := MyPath+'Process'; // set initial directory

  Query6.Active := False;
  Query6.DatabaseName := MyPath+'Data'; // set initial directory
  Query7.Active := False;
  Query7.DatabaseName := MyPath+'Lib'; // set initial directory
  Query8.Active := False;
  Query8.DatabaseName := MyPath+'Process'; // set initial directory
  Query9.Active := False;
  Query9.DatabaseName := MyPath+'Lib'; // set initial directory

  Query10.Active := False;
  Query10.DatabaseName := MyPath+'Process'; // set initial directory

  GraphTime.SetPath(MyPath);
End;

procedure TSimScreen.FormShow(Sender: TObject);
begin
  UpdateScreenSize;
  InitailBuffer;
  DrawScreenItem;
  DrawStartItemOnScreen;
  ResetItemState;
end;

procedure TSimScreen.ResetItemState;
Var i:Integer;
begin
  Query8.Active := False;
  Query8.SQL.Clear;
  Query8.SQL.Append('SELECT * FROM ItemState');
  Query8.Active := True;
  For i:=1 To Query8.RecordCount Do
    Query8.Delete;
  Query8.Edit;
  Query8.Post;

  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=1');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  Begin
    If Query8.Fields[0].AsString<>'' Then
      Query8.Append
    Else
      Query8.Edit;
    Query8.Fields[0].AsString := Query6.Fields[0].AsString;
    Query8.Fields[1].AsInteger := 0;
    Query8.Post;
    Query6.Next;
  End;

End;

procedure TSimScreen.InitailBuffer;
Var i,x1,y1,x2,y2,px,py:Integer;
    s,sStye:String;
begin
  Buffer := TBitmap.Create;
  BG := TBitmap.Create;
  BG.LoadFromFile(Mypath+'Pic\BG000000.BMP');

  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=4');
  Query6.Active:=True;
// Draw All Line
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    x1:=Query6.Fields[2].AsInteger;
    y1:=Query6.Fields[3].AsInteger;
    x2:=Query6.Fields[4].AsInteger;
    y2:=Query6.Fields[5].AsInteger;
    BG.Canvas.Pen.Width:=3;
    BG.Canvas.Pen.Color := StrToInt(GetStringInWing(Query6.Fields[1].AsString));
    BG.Canvas.MoveTo(x1*20,y1*20);
    BG.Canvas.LineTo(x2*20,y2*20);
    Query6.Next;
  End;
// Draw All Vcc
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=2');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    DrawToBG(Query6.Fields[2].AsInteger,Query6.Fields[3].AsInteger,MyPath+'Pic\Wire\Vcc.Bmp');
    Query6.Next;
  End;
// Draw All GND
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=3');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    DrawToBG(Query6.Fields[2].AsInteger,Query6.Fields[3].AsInteger,MyPath+'Pic\Wire\Gnd.Bmp');
    Query6.Next;
  End;
// Draw All Junction
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=5');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    DrawToBG(Query6.Fields[2].AsInteger,Query6.Fields[3].AsInteger,MyPath+'Pic\Wire\Point.Bmp');
    Query6.Next;
  End;
// Draw All Text
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=7');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    BG.Canvas.TextOut(Query6.Fields[2].AsInteger*20,Query6.Fields[3].AsInteger*20,
                      GetStringInWing(Query6.Fields[1].AsString));
    Query6.Next;
  End;
// Draw All AT89C52
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=8');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    DrawToBG(Query6.Fields[2].AsInteger,Query6.Fields[3].AsInteger,MyPath+'Lib\AT89C52.BMP');
    Query6.Next;
  End;
// Draw All AT89C52
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=9');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  If Query6.Fields[0].AsString<>'' Then
  Begin
    DrawToBG(Query6.Fields[2].AsInteger,Query6.Fields[3].AsInteger,MyPath+'Lib\AT89C2052.BMP');
    Query6.Next;
  End;
// Draw All Net Label
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=6');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  Begin
    If Query6.Fields[0].AsString<>'' Then
    begin
      sStye:=GetStringHeadWing(Query6.Fields[1].AsString);
      s:=GetStringInWing(Query6.Fields[1].AsString);
      px:=Query6.Fields[2].AsInteger*20;
      py:=Query6.Fields[3].AsInteger*20;

      If sStye='NetL' Then
      Begin
        DrawToBG(px Div 20,py Div 20,MyPath+'Pic\Wire\NetL.Bmp');
        BG.Canvas.TextOut(px-((length(s)-1)*6)-5,py+13,s);
      End
      Else
      If sStye='NetU' Then
      Begin
        DrawToBG(px Div 20,py Div 20,MyPath+'Pic\Wire\NetU.Bmp');
        BG.Canvas.TextOut(px-((length(s)Div 2)*6)+18,py-10,s);
      End
      Else
      If sStye='NetR' Then
      Begin
        DrawToBG(px Div 20,py Div 20,MyPath+'Pic\Wire\NetR.Bmp');
        BG.Canvas.TextOut(px+38,py+13,s);
      End
      Else
      Begin
        DrawToBG(px Div 20,py Div 20,MyPath+'Pic\Wire\NetD.Bmp');
        BG.Canvas.TextOut(px-((length(s)Div 2)*6)+18,py+35,s);
      End;
    End;

    Query6.Next;
  End;

  Query6.Active:=False;
end;

procedure TSimScreen.UpdateScreenSize;
begin
  Image1.Left := 8;
  Image1.Top  := ToolBar1.Height + 8;
  Image1.Picture.LoadFromFile(MyPath+'Pic\BG000000.BMP');
  Image1.AutoSize :=True;
end;

procedure TSimScreen.ToolButton7Click(Sender: TObject);
begin
  SimScreen.Left:=10;
  SimScreen.Top:=10;

  SimScreen.Width :=Image1.Width+24;
  SimScreen.Height:=ToolBar1.Height+Image1.Height+48;
end;

procedure TSimScreen.FormResize(Sender: TObject);
begin
  If SimScreen.Width>Image1.Width+24 Then
    SimScreen.Width :=Image1.Width+24;
  If SimScreen.Height>ToolBar1.Height+Image1.Height+48 Then
    SimScreen.Height:=ToolBar1.Height+Image1.Height+48;
end;

procedure TSimScreen.DrawScreenItem;
begin
  Image1.Canvas.Draw(0,0,BG);
End;

Function TSimScreen.GetStringInWing(s_in:String):String;
Var i,j:Integer;
    s:String;
Begin
  s:='';
  For j:=1 To Length(s_in) Do
    if s_in[j]='(' Then
      break;
  Inc(j);
  For i:=j To Length(s_in) Do
    if s_in[i]=')' Then
      break
    Else
      s:=s+s_in[i];

  GetStringInWing:=s;
End;

procedure TSimScreen.DrawToBG(x,y:integer; fname:String);
Begin
  Buffer.LoadFromFile(fname);
  Buffer.TransparentColor := RGB(255,0,255);
  Buffer.TransparentMode := tmAuto;
  Buffer.Transparent := True;
  BG.Canvas.Draw(x*20,y*20,Buffer);
End;

procedure TSimScreen.DrawToImage(x,y:integer; fname:String);
Begin
  Buffer.LoadFromFile(fname);
  Buffer.TransparentColor := RGB(255,0,255);
  Buffer.TransparentMode := tmAuto;
  Buffer.Transparent := True;
  Image1.Canvas.Draw(x*20,y*20,Buffer);
End;

procedure TSimScreen.ToolButton9Click(Sender: TObject);
begin
  FormShow(Sender);
end;

Function TSimScreen.GetStringHeadWing(s_in:String):String;
Var j:Integer;
    s:String;
Begin
  s:='';
  For j:=1 To Length(s_in) Do
    if s_in[j]='(' Then
      break
    Else
      s:=s+s_in[j];
  GetStringHeadWing:=s;
End;

procedure TSimScreen.ToolButton1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  ToolButton1.Enabled := False;
  ToolButton4.Enabled := True;
end;

procedure TSimScreen.ToolButton2Click(Sender: TObject);
begin
  ProcessAllComponent;
end;

procedure TSimScreen.DrawStartItemOnScreen;
Var i,x,y:Integer;
    ItemName,BmpName:String;
begin
  DrawScreenItem;

  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=1');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  Begin
    If Query6.Fields[0].AsString<>'' Then
    Begin
      ItemName:=Query6.Fields[1].AsString;
      X:=Query6.Fields[2].AsInteger;
      Y:=Query6.Fields[3].AsInteger;

      Query7.Active:=False;
      Query7.SQL.Clear;
      Query7.SQL.Append('SELECT * FROM LibComp');
      Query7.SQL.Append('Where LName='+Chr(39)+ItemName+Chr(39));
      Query7.Active:=True;

      If Query6.Fields[0].AsString<>'' Then
      Begin
        BmpName:=Query7.Fields[3].AsString;
        DrawToImage(x,y,Mypath+'Lib\'+BmpName);
      End;
    End;
    Query6.Next;
  End;
  Query6.Active:=False;
  Query7.Active:=False;
end;

procedure TSimScreen.ProcessAllComponent;
Var i,j,x,y,StateNow:Integer;
    ItemName,BmpName,Serial,buf:String;
begin
  DrawScreenItem;
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=1');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  Begin
    If Query6.Fields[0].AsString<>'' Then
    Begin
      Serial:=Query6.Fields[0].AsString;
      ItemName:=Query6.Fields[1].AsString;
      X:=Query6.Fields[2].AsInteger;
      Y:=Query6.Fields[3].AsInteger;

      Query10.Active := False;
      Query10.SQL.Clear;
      Query10.SQL.Append('SELECT * FROM PinValue');
      Query10.SQL.Append('Where Serial='+chr(39)+Serial+chr(39));
      Query10.Active := True;

      Query10.First;
      buf:='';
      For j:=1 To Query10.RecordCount Do
      Begin
        buf:=buf+'AND '+Query10.Fields[2].AsString+'='+chr(39)+Query10.Fields[3].AsString+chr(39);
        Query10.Next;
      End;

      Query8.Active:=False;
      Query8.SQL.Clear;
      Query8.SQL.Append('SELECT * FROM ItemState');
      Query8.SQL.Append('Where Serial='+Chr(39)+Serial+Chr(39));
      Query8.Active:=True;

      If Query8.RecordCount>0 Then    // HAVE THIS SERIAL
      Begin
        StateNow:=Query8.Fields[1].AsInteger;

        Query7.Active:=False;
        Query7.SQL.Clear;
        Query7.SQL.Append('SELECT PictureName FROM Fn'+ItemName);
        Query7.SQL.Append('Where PresentState='+IntToSTr(StateNow) );
        Query7.SQL.Append('And   Flag=0');
        Query7.SQL.Append(Buf);
        Query7.Active:=True;
                                             
        If Query7.RecordCount>0 Then    // HAVE THIS SERIAL
        Begin                               
          BmpName:=Query7.Fields[0].AsString;
        End
        Else
        Begin
          Query7.Active:=False;
          Query7.SQL.Clear;
          Query7.SQL.Append('SELECT * FROM LibComp');
          Query7.SQL.Append('Where LName='+Chr(39)+ItemName+Chr(39));
          Query7.Active:=True;
          BmpName:=Query7.Fields[3].AsString;
        End;

        If BmpName<>'' Then
          DrawToImage(x,y,Mypath+'Lib\'+BmpName);
      End;

    End;
    Query6.Next;
  End;
  Query6.Active:=False;
  Query7.Active:=False;
  Query8.Active:=False;
end;

procedure TSimScreen.ToolButton4Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  ToolButton1.Enabled := True;
  ToolButton4.Enabled := False;
end;

procedure TSimScreen.Timer1Timer(Sender: TObject);
begin
  ProcessAllComponent;
  
  ClearAllDataBase;
  CopyPinConnection;
  Timer1.Enabled:=False;
  Timer2.Enabled:=True;
end;

procedure TSimScreen.Image1Click(Sender: TObject);
Var i,p_max_x,p_max_y,p_min_x,p_min_y:Integer;
    ItemName,BmpName,Serial:String;
begin
  If ToolButton1.Enabled=False Then
  Begin
  Query6.Active:=False;
  Query6.SQL.Clear;
  Query6.SQL.Append('SELECT * FROM SimMCS');
  Query6.SQL.Append('Where Flag=1');
  Query6.Active:=True;
  Query6.First;
  For i:=1 To Query6.RecordCount Do
  Begin
    Serial:=Query6.Fields[0].AsString;
    ItemName:=Query6.Fields[1].AsString;

    If Serial<>'' Then
    Begin
      p_min_x:=Query6.Fields[2].AsInteger-1;
      p_min_y:=Query6.Fields[3].AsInteger-1;

      Query7.Active:=False;
      Query7.SQL.Clear;
      Query7.SQL.Append('SELECT LBmpName FROM LibComp');
      Query7.SQL.Append('Where LName='+chr(39)+ItemName+chr(39));
      Query7.Active:=True;

      If Query7.RecordCount>0 Then
      Begin
        BmpName:=Query7.Fields[0].AsString;
        Buffer.LoadFromFile(MyPath+'Lib\'+BmpName);
        p_max_x:=p_min_x+(Buffer.Width Div 20)+1;
        p_max_y:=p_min_y+(Buffer.Height Div 20)+1;

        If (mx>p_min_x) And (mx<p_max_x) And (my>p_min_y) And (my<p_max_y) Then
        Begin
          Query8.Active:=False;
          Query8.SQL.Clear;
          Query8.SQL.Append('SELECT * FROM ItemState');
          Query8.SQL.Append('Where Serial='+Chr(39)+Serial+Chr(39));
          Query8.Active:=True;

          Query9.Active:=False;
          Query9.SQL.Clear;
          Query9.SQL.Append('SELECT NextState FROM Fn'+ItemName);
          Query9.SQL.Append('Where EventState = '+Chr(39)+'2'+Chr(39));
          Query9.SQL.Append('And PresentState='+Query8.Fields[1].AsString);
          Query9.Active:=True;

          If Query9.RecordCount>0 Then
          Begin
            Query8.Edit;
            Query8.Fields[1].AsInteger:=Query9.Fields[0].AsInteger;
            Query8.Post;
          End;

        End;

      End;
    End;

    Query6.Next;
  End;
  Query6.Active:=False;
  Query8.Active:=False;
  End;
end;

procedure TSimScreen.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  mx:=X Div 20;
  my:=Y Div 20;
end;           

procedure TSimScreen.ClearAllDataBase;
Var i:Integer;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.Active := True;
  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;
  Query2.Active := False;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT * FROM PinValue');
  Query3.Active := True;
  For i:=1 To Query3.RecordCount Do
    Query3.Delete;
  Query3.Edit;
  Query3.Post;
  Query3.Active := False;
end;

procedure TSimScreen.CopyPinConnection;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM ConnectP');
  Query1.SQL.Append('Where NameOut<>'+Chr(39)+'VCC'+Chr(39));
  Query1.SQL.Append('And NameOut<>'+Chr(39)+'GND'+Chr(39));
  Query1.Active := True;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.Active := True;
  For i:=1 To Query1.RecordCount Do
  Begin
    If Query2.Fields[0].AsString='' Then
      Query2.Edit
    Else
      Query2.Append;

    Query2.Fields[0].AsString:=Query1.Fields[0].AsString;
    Query2.Fields[1].AsString:=Query1.Fields[1].AsString;
    Query2.Fields[2].AsString:=Query1.Fields[2].AsString;
    Query2.Fields[3].AsString:=Query1.Fields[3].AsString;
    Query2.Fields[4].AsString:=Query1.Fields[4].AsString;
    Query2.Fields[5].AsString:=Query1.Fields[5].AsString;
    Query2.Post;

    Query1.Next;
  End;

  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM ConnectP');
  Query1.SQL.Append('Where NameOut='+Chr(39)+'VCC'+Chr(39));
  Query1.SQL.Append('Or NameOut='+Chr(39)+'GND'+Chr(39));
  Query1.Active := True;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT * FROM PinValue');
  Query3.Active := True;
  For i:=1 To Query1.RecordCount Do
  Begin
    If Query3.Fields[0].AsString='' Then
      Query3.Edit
    Else
      Query3.Append;

    Query3.Fields[0].AsString:=Query1.Fields[0].AsString;
    Query3.Fields[1].AsString:=Query1.Fields[1].AsString;
    Query3.Fields[2].AsString:=Query1.Fields[2].AsString;
    Query3.Fields[3].AsString:=Query1.Fields[5].AsString;
    Query3.Post;

    Query1.Next;
  End;

  Query1.Active := False;
  Query2.Active := False;
  Query3.Active := False;
end;

Function TSimScreen.CheckEndState:Boolean;
Begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.SQL.Append('Where SerialIN<>'+Chr(39)+Chr(39));
  Query2.Active := True;

  If Query2.RecordCount>0 Then
    CheckEndState:=False
  Else
    CheckEndState:=True;
  Query2.Active := False;
End;


procedure TSimScreen.FindingOutPut;
Var StateOn,SerialIn,NameIn,PinIn,SerialOut,NameOut,PinOut,buf:String;
    i:Integer;
    LoopState:Boolean;
    BufSQL:String;
begin
  LoopState:=True;
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.SQL.Append('Where SerialIN<>'+Chr(39)+Chr(39));
  Query2.Active := True;
  Query2.First;

  SerialIn  :=Query2.Fields[0].AsString;
  NameIn    :=Query2.Fields[1].AsString;
  PinIn     :=Query2.Fields[2].AsString;
  SerialOut :=Query2.Fields[3].AsString;
  NameOut   :=Query2.Fields[4].AsString;
  PinOut    :=Query2.Fields[5].AsString;

  Query5.Active := False;
  Query5.SQL.Clear;
  Query5.SQL.Append('SELECT * FROM ItemState');
  Query5.SQL.Append('Where Serial='+Chr(39)+SerialOut+Chr(39));
  Query5.Active := True;
  StateOn:=Query5.Fields[1].AsString;

  BufSQL:='';
  BufSQL:=BufSQL+' '+'Select '+PinOut+'In From Fn'+NameOut;
  BufSQL:=BufSQL+' '+'Where PresentState='+Chr(39)+StateOn+Chr(39);

  Query2.Delete;
  Query2.Edit;
  Query2.Post;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT State FROM PinValue');
  Query3.SQL.Append('Where Serial='+chr(39)+SerialOut+chr(39));
  Query3.SQL.Append('And Name='+chr(39)+NameOut+chr(39));
  Query3.SQL.Append('And Pin='+chr(39)+PinOut+chr(39));
  Query3.Active := True;

  If Query3.RecordCount>0 Then
  Begin
    buf:=Query3.Fields[0].AsString;

    Query3.Append;
    Query3.Fields[0].AsString:=SerialIN;
    Query3.Fields[1].AsString:=NameIN;
    Query3.Fields[2].AsString:=PinIN;
    Query3.Fields[3].AsString:=buf;
    Query3.Post;
  End
  Else
  Begin
    Query4.Active := False;
    Query4.SQL.Clear;
    Query4.SQL.Append('SELECT CName FROM Pin'+NameOut);
    Query4.SQL.Append('Where CType=1');
    Query4.Active := True;

    For i:=1 To Query4.RecordCount Do
    Begin
      Buf:=Query4.Fields[0].AsString;

      Query2.Active := False;
      Query2.SQL.Clear;
      Query2.SQL.Append('SELECT * FROM PinRound');
      Query2.SQL.Append('Where SerialIN='+Chr(39)+SerialOut+Chr(39));
      Query2.SQL.Append('And NameIN='+Chr(39)+NameOut+Chr(39));
      Query2.SQL.Append('And PinNameIN='+Chr(39)+PinOut+Chr(39));
      Query2.Active := True;
      If Query2.RecordCount>0 Then
      Begin
      // If Pin Input Wait Another
        Query2.Append;
        Query2.Fields[0].AsString:=SerialIn;
        Query2.Fields[1].AsString:=NameIn;
        Query2.Fields[2].AsString:=PinIn;
        Query2.Fields[3].AsString:=SerialOut;
        Query2.Fields[4].AsString:=NameOut;
        Query2.Fields[5].AsString:=PinOut;
        Query2.Post;
        LoopState:=False;
        Break;
      End
      Else
      Begin
        Query3.Active := False;
        Query3.SQL.Clear;
        Query3.SQL.Append('SELECT State FROM PinValue');
        Query3.SQL.Append('Where Serial='+chr(39)+SerialOut+chr(39));
        Query3.SQL.Append('And Name='+chr(39)+NameOut+chr(39));
        Query3.SQL.Append('And Pin='+chr(39)+Buf+chr(39));
        Query3.Active := True;
        // check input have in table
        If Query3.RecordCount>0 Then
        Begin
          BufSQL:=BufSQL+' '+'And '+Buf+'='+Chr(39)+Query3.Fields[0].AsString+Chr(39);
        End
        Else
        Begin
          BufSQL:=BufSQL+' '+'And '+Buf+'='+Chr(39)+'1'+Chr(39);
        End;
      End;
      Query4.Next;
    End;

    If LoopState Then
    Begin
      Query4.Active := False;
      Query4.SQL.Clear;
      Query4.SQL.Append(BufSQL);
      Query4.Active := True;

      Query3.Active := False;
      Query3.SQL.Clear;
      Query3.SQL.Append('SELECT * FROM PinValue');
      Query3.Active := True;

      Query3.Append;
      Query3.Fields[0].AsString:=SerialIn;
      Query3.Fields[1].AsString:=NameIn;
      Query3.Fields[2].AsString:=PinIn;
      If Query4.RecordCount>0 Then
        Query3.Fields[3].AsString:=Query4.Fields[0].AsString
      Else
        Query3.Fields[3].AsString:='1';
      Query3.Post;
    End;
  End;

  Query2.Active := False;
  Query3.Active := False;
  Query4.Active := False;
  Query5.Active := False;
End;

procedure TSimScreen.Timer2Timer(Sender: TObject);
begin
  If CheckEndState Then
  Begin
    Timer1.Enabled := True;
    Timer2.Enabled := False;
    GraphTime.UpdateTimmingState;
  End
  Else
    FindingOutPut;
end;

procedure TSimScreen.ToolButton10Click(Sender: TObject);
begin
GraphTime.Show;
end;

end.

