unit MainCT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, Menus, StdCtrls, Grids, DB,
  DBTables, ImgList;

type
  TMainPage = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Image1: TImage;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    Query1: TQuery;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Image2: TImage;
    Memo1: TMemo;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ColorDialog1: TColorDialog;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton18: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    ComboBox2: TComboBox;
    Image3: TImage;
    Button2: TButton;
    ToolButton30: TToolButton;
    Memo2: TMemo;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Print1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    View1: TMenuItem;
    Comtroller1: TMenuItem;
    Simulation1: TMenuItem;
    ZommIn1: TMenuItem;
    ZoomOut1: TMenuItem;
    FitScreen1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    Help1: TMenuItem;
    Run1: TMenuItem;
    StepByStep1: TMenuItem;
    Pause1: TMenuItem;
    Stop1: TMenuItem;
    Reset1: TMenuItem;
    SimulateHelp1: TMenuItem;
    ControllerHelp1: TMenuItem;
    N4: TMenuItem;
    About1: TMenuItem;
    HexCode1: TMenuItem;
    N5: TMenuItem;
    Simulation2: TMenuItem;
    memory1: TMenuItem;
    Regidter1: TMenuItem;
    reeConnector1: TMenuItem;
    HexCode2: TMenuItem;
    Routing1: TMenuItem;
    N6: TMenuItem;
    ErrorReport1: TMenuItem;
    N7: TMenuItem;
    ShowAll1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ZommIn1Click(Sender: TObject);
    procedure ZoomOut1Click(Sender: TObject);
    procedure FitScreen1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure HexCode1Click(Sender: TObject);
    procedure HexCode2Click(Sender: TObject);
    procedure memory1Click(Sender: TObject);
    procedure Regidter1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure ShowAll1Click(Sender: TObject);
    procedure Simulation2Click(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure reeConnector1Click(Sender: TObject);
    procedure Routing1Click(Sender: TObject);
    procedure ErrorReport1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
    LineWidth:Integer;
    PositionX:Integer;
    PositionY:Integer;
    PositionStartX:Integer;
    PositionStartY:Integer;
    PositionStopX:Integer;
    PositionStopY:Integer;
    NetName:String;
    ItemName:String;
    BmpItemName:String;
    BG:TBitmap;
    PCompBuffer:TBitmap;
    ScreenBuffer:TBitmap;
    FlagStatus:Integer;
    FlagClick:Integer;
    ScaleBuffer:Integer;
    MyFileName:String;
  public
    { Public declarations }
    procedure InitialComponent;
    procedure UpdateSizeWindow;
    procedure UpdateSch;
    procedure LoadComponent;
    procedure LoadItemComponent;
    procedure LoadItemDescription;
    procedure UpdateScreen_Item_Compnent;
    procedure UpdateColorButton;
    procedure UpdateButtonWire;
    procedure SetComponentBuffer(name:String; BmpName:String);
    procedure UpdateProjectViews;
    procedure CheckScaleToComponent;
    procedure AppendDataBase(Iname:String; px1:Integer; py1:Integer;
                             px2:Integer; py2:Integer; Fs:Integer);
    procedure Reload_Screen_Buffer;
    procedure DrawImageToBuffer(x:Integer; y:Integer; BmpName:String;
                                BufImage:TBitmap);
    procedure CheckSelectMoveItem;
    procedure CheckPlaceNewItem;
    Function  GetStringInWing(s_in:String):String;
    Function  GetStringHeadWing(s_in:String):String;
    procedure UpdateDataBaseController;
    procedure SaveProgramToFile(StateSaveAs:Boolean);
  end;

Const MaxScale:Integer = 4;
      MinScale:Integer = -3;
      MyPath:String = 'C:\SimMCS\';
var
  MainPage: TMainPage;

implementation

uses ControlPro, HexMCS, memMCS, RegMCS, SimSCR, Report, RouteMCS,
  ErReport, FState;

{$R *.dfm}

procedure TMainPage.FormShow(Sender: TObject);
begin
  InitialComponent;
  UpdateSizeWindow;
  LoadComponent;
  UpdateColorButton;
  UpdateSch;
end;

procedure TMainPage.InitialComponent;
Var i:Integer;
Begin
  MyFileName:='';
  LineWidth:=3;
  ItemName:='';
  ScaleBuffer:=0;
  Query1.DatabaseName := MyPath+'Lib'; // set initial directory
  BG := TBitmap.Create;
  BG.LoadFromFile(MyPath+'PIC\BG000000.BMP');
  ScreenBuffer := TBitmap.Create;
  ScreenBuffer.LoadFromFile(MyPath+'PIC\BG000000.BMP');
  FlagStatus:=0;
  FlagClick:=0;

  Query2.Active := False;
  Query2.DatabaseName := MyPath+'Data'; // set initial directory
  Query4.Active := False;
  Query4.DatabaseName := MyPath+'Data'; // For Move Item
  
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM MCS');
  Query2.Active := True;
  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM SimMCS');
  Query2.Active := True;
  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;

  Query3.Active := False;
  Query3.DatabaseName := MyPath+'Lib'; // set initial directory
  Image3.Picture.LoadFromFile(MyPath+'Lib\AT89C52.Bmp');

//*********************************************************************
//      For Initial Tab Controller
//*********************************************************************
  ComboBox2.ItemIndex:=0;

  HexCode.SetPath(MyPath);
  Memory.SetPath(MyPath);
  MCSReg.SetPath(MyPath);
  SimScreen.SetPath(MyPath);
  RouteTable.SetPath(MyPath);
  ErrReport.SetPath(MyPath);
End;

procedure TMainPage.UpdateSizeWindow;
Begin
  ScrollBox1.Left   := 0;
  ScrollBox1.Top    := ToolBar1.Height+8;
  ScrollBox1.Height := MainPage.ClientHeight - ScrollBox1.Top-24;
  ScrollBox1.Width  := 250;

  PageControl1.Left := 0;
  PageControl1.Top := 0;
  PageControl1.Height := ScrollBox1.Height-4;
  PageControl1.Width := ScrollBox1.Width-4;

  TreeView1.Top :=  8;
  TreeView1.Left := 8;
  TreeView1.Width := PageControl1.Width - TreeView1.Left -16 ;
  TreeView1.Height := PageControl1.Height - TreeView1.Top - 40;

  Memo1.Height := 100;
  Memo1.Left  := 8;
  Memo1.Top   := PageControl1.Height - Memo1.Height - 32;
  Memo1.Width := PageControl1.Width - 24;

//  Image2.Picture.LoadFromFile('Pic\BG000000.BMP');
  Image2.Stretch := True;
  Image2.Left := 55;
  Image2.Width := 120;
  Image2.Height := 120;
  Image2.Top := Memo1.Top - Image2.Height - 16;

  Button1.Left := 8;
  Button1.Top  := Image2.Top - Button1.Height -16;
  Button1.Width :=  PageControl1.Width - 24;

  ComboBox1.Left  := 8;
  ComboBox1.Top   := 16;
  ComboBox1.Width := PageControl1.Width - 24;

  StringGrid1.Left := 8;
  StringGrid1.Width := PageControl1.Width - 24;
  StringGrid1.Top := ComboBox1.Top+ComboBox1.Height+16;
  StringGrid1.Height := Image2.Top - StringGrid1.Top - 32 -Button1.Height;
  StringGrid1.ColWidths[0] := StringGrid1.Width - 32;

  ScrollBox2.Left   := ScrollBox1.Left+ScrollBox1.Width+8;
  ScrollBox2.Top    := ToolBar1.Height+8;
  ScrollBox2.Width  := MainPage.ClientWidth-ScrollBox2.Left-8;
  ScrollBox2.Height := MainPage.ClientHeight - ScrollBox2.Top-24;

//************************ Controller **************************
  ComboBox2.Left  := 8;
  ComboBox2.Top   := 16;
  ComboBox2.Width := PageControl1.Width - 24;

  Image3.Top := ComboBox2.Top + ComboBox2.Height +8;
  Image3.Left := 8;
  Image3.Height :=420;
  Image3.Width := 200;

  Button2.Left := 8;
  Button2.Top  := Image3.Top + Image3.Height + 16;
  Button2.Width :=  PageControl1.Width - 24;

  Memo2.Left  := 8;
  Memo2.Top   := Button2.Top+Button2.Height+16;
  Memo2.Width := PageControl1.Width - 24;
  Memo2.Height := PageControl1.Height - Memo2.Top - 32;
End;

procedure TMainPage.UpdateSch;
Begin
  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Picture.LoadFromFile(MyPath+'Pic\BG000000.BMP');
  Image1.Stretch := True;
  Image1.Width  := Image1.Picture.Width;
  Image1.Height  := Image1.Picture.Height;
End;

procedure TMainPage.FormResize(Sender: TObject);
begin
  UpdateSizeWindow;
end;

procedure TMainPage.LoadComponent;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT LType FROM LibComp');
  Query1.SQL.Append('Group By LType');
  Query1.Active := True;

  ComboBox1.Items.Clear;
  For i:=1 to Query1.RecordCount Do
  Begin
    ComboBox1.Items.Append( Query1.Fields[0].AsString );
    Query1.Next;
  End;
  ComboBox1.ItemIndex := 0;
  Query1.Active := False;
  LoadItemComponent;
  LoadItemDescription;
end;

procedure TMainPage.LoadItemComponent;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT LName FROM LibComp');
  Query1.SQL.Append('Where LType = '+chr(39)+ComboBox1.Text+chr(39));
  Query1.Active := True;

  Query1.First;
  StringGrid1.RowCount := Query1.RecordCount+1;
  StringGrid1.Cells[0,0]:='Name';
  For i:=1 to Query1.RecordCount Do
  Begin
    StringGrid1.Cells[0,i]  := Query1.Fields[0].AsString;
    Query1.Next;
  End;
  Query1.Active := False;
end;

procedure TMainPage.LoadItemDescription;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM LibComp');
  Query1.SQL.Append('Where LName = '+chr(39)+StringGrid1.Cells[0,StringGrid1.Row]+chr(39));
  Query1.Active := True;

  Memo1.Lines.Clear;
  Memo1.Lines.Append('Name : '+Query1.Fields[0].AsString);
  Memo1.Lines.Append('Type : '+Query1.Fields[1].AsString);
  Memo1.Lines.Append('Description : '+Query1.Fields[2].AsString);
  Memo1.Lines.Append('Pins : '+Query1.Fields[4].AsString);
//  Memo1.Lines.Append('BmpName : '+Query1.Fields[3].AsString);
  BmpItemName:=Query1.Fields[3].AsString;
  Image2.Picture.LoadFromFile(Query1.DatabaseName+'\'+BmpItemName);
  Query1.Active := False;
end;

procedure TMainPage.ComboBox1Change(Sender: TObject);
begin
  LoadItemComponent;
  LoadItemDescription;
end;

procedure TMainPage.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LoadItemComponent;
  LoadItemDescription;
end;

procedure TMainPage.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  IF ((trunc((X+10)/20)<>PositionX) Or ((trunc(Y+10)/20)<>PositionY) ) Then
  Begin
  StatusBar1.Panels.Items[1].Text := 'Position  '+
                                     IntToStr( (trunc((X+10)/20)) )+':'+
                                     IntToStr( (trunc((Y+10)/20)) );
  If (FlagStatus>0) Then
    StatusBar1.Panels.Items[2].Text := ItemName
  Else
    StatusBar1.Panels.Items[2].Text := '';

    If (FlagStatus=0) Then
    Begin
      PositionX:=trunc((X+10)/20);
      PositionY:=trunc((Y+10)/20);
      Image1.Cursor := crArrow;
    End
    Else
    If (FlagStatus=1) Or (FlagStatus=8) Or (FlagStatus=9) Then
    Begin
      UpdateScreen_Item_Compnent;
      PositionX:=trunc((X+10)/20);
      PositionY:=trunc((Y+10)/20);
      Image1.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);
      Image1.Cursor := crCross;
    End
    Else
    If (FlagStatus=2) Or (FlagStatus=3) Or (FlagStatus=5) Then
    Begin
      UpdateScreen_Item_Compnent;
      PositionX:=trunc((X+10)/20)-1;
      PositionY:=trunc((Y+10)/20)-1;
      Image1.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);
      Image1.Cursor := crCross;
    End
    Else
    If (FlagStatus=4) Then
    Begin
      UpdateScreen_Item_Compnent;
      PositionX:=trunc((X+10)/20);
      PositionY:=trunc((Y+10)/20);

      If (FlagClick=1) Then
      Begin
        Image1.Canvas.Pen.Color := ColorDialog1.Color;
        Image1.Canvas.Pen.Width:=LineWidth;
        Image1.Canvas.MoveTo(PositionStartX*20,PositionStartY*20);

        If abs(abs(PositionX)-abs(PositionStartX))>
           abs(abs(PositionY)-abs(PositionStartY)) Then
           Begin
            PositionStopX:=PositionX;
            PositionStopY:=PositionStartY;
           End
           Else
           Begin
            PositionStopX:=PositionStartX;
            PositionStopY:=PositionY;
           End;
           Image1.Canvas.LineTo(PositionStopX*20,PositionStopY*20);
      End;
      Image1.Canvas.Pen.Width := 1;
      Image1.Canvas.Ellipse((PositionX)*20-2,(PositionY)*20-2,
                            (PositionX)*20+2,(PositionY)*20+2);
      Image1.Cursor := crCross;
    End
    Else
    If (FlagStatus=6) Then
    Begin
      UpdateScreen_Item_Compnent;
      PositionX:=trunc((X+10)/20)-1;
      PositionY:=trunc((Y+10)/20)-1;
      Image1.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);
      If ItemName='NetL' Then
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)-1)*6)-5,(PositionY*20)+13,NetName)
      Else
      If ItemName='NetU' Then
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)Div 2)*6)+18,(PositionY*20)-10,NetName)
      Else
      If ItemName='NetR' Then
        Image1.Canvas.TextOut((PositionX*20)+38,(PositionY*20)+13,NetName)
      Else
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)Div 2)*6)+18,(PositionY*20)+35,NetName);
      Image1.Cursor := crCross;
    End
    Else
    If (FlagStatus=7) Then
    Begin
      UpdateScreen_Item_Compnent;
      PositionX:=trunc((X+10)/20);
      PositionY:=trunc((Y+10)/20);
      Image1.Canvas.TextOut((PositionX*20),(PositionY*20),ItemName);
      Image1.Cursor := crCross;
    End
    Else
      Image1.Cursor := crArrow;
  End;
end;

procedure TMainPage.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If (Button=mbRight) and (flagStatus>0)Then
  Begin
    UpdateDataBaseController;  
    FlagStatus:=0;
    FlagClick:=0;
    UpdateScreen_Item_Compnent;
    UpdateButtonWire;
    StatusBar1.Panels.Items[2].Text := '';
  End
  Else
  If Button=mbMiddle Then
  Begin
    if (FlagStatus=6) Then
    Begin
      If ItemName='NetL' Then
      SetComponentBuffer('NetU',MyPath+'Pic\Wire\NetU.Bmp')
      Else
      If ItemName='NetU' Then
      SetComponentBuffer('NetR',MyPath+'Pic\Wire\NetR.Bmp')
      Else
      If ItemName='NetR' Then
      SetComponentBuffer('NetD',MyPath+'Pic\Wire\NetD.Bmp')
      Else
      SetComponentBuffer('NetL',MyPath+'Pic\Wire\NetL.Bmp');

      UpdateScreen_Item_Compnent;
      Image1.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);

      If ItemName='NetL' Then
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)-1)*6)-5,(PositionY*20)+13,NetName)
      Else
      If ItemName='NetU' Then
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)Div 2)*6)+18,(PositionY*20)-10,NetName)
      Else
      If ItemName='NetR' Then
        Image1.Canvas.TextOut((PositionX*20)+38,(PositionY*20)+13,NetName)
      Else
        Image1.Canvas.TextOut((PositionX*20)-((length(NetName)Div 2)*6)+18,(PositionY*20)+35,NetName);
    End;
  End;

  If (Button=mbLeft) and (FlagStatus=0) and (ScaleBuffer=0) Then
  Begin
    CheckSelectMoveItem;
  End
  Else
  If (Button=mbLeft) and (FlagStatus>0) Then
  Begin
    CheckPlaceNewItem;
    UpdateDataBaseController;
  End;
end;

procedure TMainPage.UpdateDataBaseController;
Begin
  If (FlagStatus=8) Or (FlagStatus=9) Then
  Begin
    ControllerProp.UpdateHexDataBase;
    HexCode.RefreshScreen;
    Memory.RefreshScreen;
    MCSReg.RefreshScreen;
  End;
End;

procedure TMainPage.CheckSelectMoveItem;
Var i:Integer;
    Xmin,XMax,YMin,YMax:Integer;
    BufReadPic:TBitmap;
Begin
  BufReadPic := TBitmap.Create();
  // FOR MOVE ITEM
  Query4.Active := False;
  Query4.SQL.Clear;
  Query4.SQL.Append('SELECT * FROM SimMCS');
  Query4.Active := True;

  Query4.First;
  For i:= 1 To Query4.RecordCount Do
    Begin
      case Query4.Fields[6].AsInteger Of
      1:Begin
          Query3.Active := False;
          Query3.SQL.Clear;
          Query3.SQL.Append('Select * From LibComp');
          Query3.SQL.Append('Where LName='+chr(39)+Query4.Fields[1].AsString+chr(39));
          Query3.Active := True;
          Query3.Last;
          BufReadPic.LoadFromFile(MyPath+'Lib\'+Query3.Fields[3].AsString);
          Xmin:=Query4.Fields[2].AsInteger;
          Xmax:=Query4.Fields[2].AsInteger+((BufReadPic.Width) Div 20);
          Ymin:=Query4.Fields[3].AsInteger;
          Ymax:=Query4.Fields[3].AsInteger+((BufReadPic.Height)Div 20);
          BufReadPic.FreeImage;
        End;
      2:Begin // VCC
          Xmin:=Query4.Fields[2].AsInteger+0;
          Xmax:=Query4.Fields[2].AsInteger+1;
          Ymin:=Query4.Fields[3].AsInteger+1;
          Ymax:=Query4.Fields[3].AsInteger+1;
        End;
      3:Begin // GND
          Xmin:=Query4.Fields[2].AsInteger+1;
          Xmax:=Query4.Fields[2].AsInteger+1;
          Ymin:=Query4.Fields[3].AsInteger+1;
          Ymax:=Query4.Fields[3].AsInteger+2;
        End;
      4:Begin // Line
//**************** X
          If Query4.Fields[2].AsInteger<Query4.Fields[4].AsInteger Then
          Begin
            Xmin:=Query4.Fields[2].AsInteger;
            Xmax:=Query4.Fields[4].AsInteger;
          End
          Else
          Begin
            Xmin:=Query4.Fields[4].AsInteger;
            Xmax:=Query4.Fields[2].AsInteger;
          End;
//***************** Y
          If Query4.Fields[3].AsInteger<Query4.Fields[5].AsInteger Then
          Begin
            Ymin:=Query4.Fields[3].AsInteger;
            Ymax:=Query4.Fields[5].AsInteger;
          End
          Else
          Begin
            Ymin:=Query4.Fields[5].AsInteger;
            Ymax:=Query4.Fields[3].AsInteger;
          End;
        End;
      5:Begin // Junction
          Xmin:=Query4.Fields[2].AsInteger+1;
          Xmax:=Query4.Fields[2].AsInteger+1;
          Ymin:=Query4.Fields[3].AsInteger+1;
          Ymax:=Query4.Fields[3].AsInteger+1;
        End;
      6:Begin // Net
          If GetStringHeadWing(Query4.Fields[1].AsString)='NetL' Then
          Begin
            Xmin:=Query4.Fields[2].AsInteger-(Length(GetStringInWing(Query4.Fields[1].AsString))Div 4);
            Xmax:=Query4.Fields[2].AsInteger+1;
            Ymin:=Query4.Fields[3].AsInteger+1;
            Ymax:=Query4.Fields[3].AsInteger+1;
          End
          Else
          If GetStringHeadWing(Query4.Fields[1].AsString)='NetR' Then
          Begin
            Xmin:=Query4.Fields[2].AsInteger+1;
            Xmax:=Query4.Fields[2].AsInteger+1+(Length(GetStringInWing(Query4.Fields[1].AsString))Div 4);
            Ymin:=Query4.Fields[3].AsInteger+1;
            Ymax:=Query4.Fields[3].AsInteger+1;
          End
          Else
          If GetStringHeadWing(Query4.Fields[1].AsString)='NetU' Then
          Begin
            Xmin:=Query4.Fields[2].AsInteger+1-(Length(GetStringInWing(Query4.Fields[1].AsString))Div 8);
            Xmax:=Query4.Fields[2].AsInteger+1+(Length(GetStringInWing(Query4.Fields[1].AsString))Div 8);
            Ymin:=Query4.Fields[3].AsInteger;
            Ymax:=Query4.Fields[3].AsInteger+1;
          End
          Else
          If GetStringHeadWing(Query4.Fields[1].AsString)='NetD' Then
          Begin
            Xmin:=Query4.Fields[2].AsInteger+1-(Length(GetStringInWing(Query4.Fields[1].AsString))Div 8);
            Xmax:=Query4.Fields[2].AsInteger+1+(Length(GetStringInWing(Query4.Fields[1].AsString))Div 8);
            Ymin:=Query4.Fields[3].AsInteger+1;
            Ymax:=Query4.Fields[3].AsInteger+2;
          End
          Else
          Begin // if error
            Xmin:=Query4.Fields[2].AsInteger;
            Xmax:=Query4.Fields[2].AsInteger;
            Ymin:=Query4.Fields[3].AsInteger;
            Ymax:=Query4.Fields[3].AsInteger;
          End
        End;
      7:Begin // Label
          Xmin:=Query4.Fields[2].AsInteger;
          Xmax:=XMin+(Length(Query4.Fields[1].AsString)Div 4);
          Ymin:=Query4.Fields[3].AsInteger;
          Ymax:=Query4.Fields[3].AsInteger;
        End;
      8,9:Begin
          If Query4.Fields[6].AsInteger=8 Then
            BufReadPic.LoadFromFile(MyPath+'Lib\AT89C52.BMP')
          Else
            BufReadPic.LoadFromFile(MyPath+'Lib\AT89C2052.BMP');
          Xmin:=Query4.Fields[2].AsInteger;
          Xmax:=Query4.Fields[2].AsInteger+((BufReadPic.Width) Div 20);
          Ymin:=Query4.Fields[3].AsInteger;
          Ymax:=Query4.Fields[3].AsInteger+((BufReadPic.Height)Div 20);
          BufReadPic.FreeImage;
        End
      Else
        Begin{
          Xmin:=Query4.Fields[2].AsInteger;
          Xmax:=Query4.Fields[2].AsInteger;
          Ymin:=Query4.Fields[3].AsInteger;
          Ymax:=Query4.Fields[3].AsInteger;
          }
          Xmin:=-1;
          Xmax:=-1;
          Ymin:=-1;
          Ymax:=-1;
        End;
      End;

      If (PositionX>=XMin) And
         (PositionX<=XMax) And
         (PositionY>=YMin) And
         (PositionY<=YMax) Then
         Begin
          FlagStatus:=Query4.Fields[6].AsInteger;
          case FlagStatus Of
            1:Begin
                Query3.Active := False;
                Query3.SQL.Clear;
                Query3.SQL.Append('Select * From LibComp');
                Query3.SQL.Append('Where LName='+chr(39)+Query4.Fields[1].AsString+chr(39));
                Query3.Active := True;
                Query3.Last;
                If (Query3.RecordCount>0) and (Query3.Fields[3].AsString<>'') Then
                  SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Lib\'+Query3.Fields[3].AsString);
              End;
            2:Begin
                SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Pic\Wire\Vcc.Bmp');
              End;
            3:Begin
                SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Pic\Wire\Gnd.Bmp');
              End;
            4:Begin
                ItemName:=GetStringHeadWing(Query4.Fields[1].AsString);
//                NetName:=GetStringInWing(Query4.Fields[1].AsString);
                FlagClick:=1;
                If (Abs(PositionX-Query4.Fields[2].AsInteger)+
                    Abs(PositionX-Query4.Fields[3].AsInteger))>
                   (Abs(PositionX-Query4.Fields[4].AsInteger)+
                    Abs(PositionX-Query4.Fields[5].AsInteger)) Then
                    Begin
                      PositionStartX:=Query4.Fields[2].AsInteger;
                      PositionStartY:=Query4.Fields[3].AsInteger;
                    End
                Else
                    Begin
                      PositionStartX:=Query4.Fields[4].AsInteger;
                      PositionStartY:=Query4.Fields[5].AsInteger;
                    End;
              End;
            5:Begin
                SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Pic\Wire\Point.Bmp');
              End;
            6:Begin
                ItemName:=GetStringHeadWing(Query4.Fields[1].AsString);
                NetName:=GetStringInWing(Query4.Fields[1].AsString);

                If ItemName='NetL' Then
                  SetComponentBuffer('NetL',MyPath+'Pic\Wire\NetL.Bmp')
                Else
                If ItemName='NetU' Then
                  SetComponentBuffer('NetU',MyPath+'Pic\Wire\NetU.Bmp')
                Else
                If ItemName='NetR' Then
                  SetComponentBuffer('NetR',MyPath+'Pic\Wire\NetR.Bmp')
                Else
                  SetComponentBuffer('NetD',MyPath+'Pic\Wire\NetD.Bmp');
              End;
            7:Begin
                ItemName:=GetStringInWing(Query4.Fields[1].AsString);
              End;
            8:Begin
                SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Lib\AT89C52.Bmp');
              End;
            9:Begin
                SetComponentBuffer(Query4.Fields[1].AsString,MyPath+'Lib\AT89C2052.Bmp');
              End;
          End;
          Query4.Delete;
          Query4.Edit;
          Query4.Post;
          Break;
        End;
      Query4.Next;
    End;
//    UpdateScreen_Item_Compnent;     //it not clear screen
  Query4.Active := False;
  Reload_Screen_Buffer;       //clear screen and redraw again
  UpdateProjectViews;
End;

procedure TMainPage.CheckPlaceNewItem;
Begin
    If (FlagStatus=1) Or (FlagStatus=8) Or (FlagStatus=9) Then
    Begin
      ScreenBuffer.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);
      AppendDataBase(ItemName,PositionX,PositionY,-1,-1,FlagStatus);
    End;
    If (FlagStatus=2) Or (FlagStatus=3) Or (FlagStatus=5) Then
    Begin
      ScreenBuffer.Canvas.Draw(PositionX*20,PositionY*20,PCompBuffer);
      AppendDataBase(ItemName,PositionX,PositionY,-1,-1,FlagStatus);
    End;
    If (FlagStatus=4) Then
    Begin
      If FlagClick=0 Then
      Begin
        FlagClick:=1;
        PositionStartX:=PositionX;
        PositionStartY:=PositionY;
      End
      Else
      Begin
        ScreenBuffer.Canvas.Pen.Color := ColorDialog1.Color;
        ScreenBuffer.Canvas.Pen.Width := LineWidth;
        AppendDataBase(ItemName+'('+IntToStr(ColorDialog1.Color)+')',
                       PositionStartX,PositionStartY,
                       PositionStopX,PositionStopY,FlagStatus);
        ScreenBuffer.Canvas.MoveTo(PositionStartX*20,PositionStartY*20);
        ScreenBuffer.Canvas.LineTo(PositionStopX*20,PositionStopY*20);

        PositionStartX:=PositionStopX;
        PositionStartY:=PositionStopY;
      End;
    End;
    If (FlagStatus=6) Then
    Begin
      AppendDataBase(ItemName+'('+NetName+')',PositionX,PositionY,-1,-1,FlagStatus);
      Reload_Screen_Buffer;
    End;
    If (FlagStatus=7) Then
    Begin
      ScreenBuffer.Canvas.TextOut((PositionX*20),(PositionY*20),ItemName);
      AppendDataBase('TEXT('+ItemName+')',PositionX,PositionY,-1,-1,FlagStatus);
    End;
    UpdateProjectViews;
End;

procedure TMainPage.AppendDataBase(Iname:String; px1:Integer; py1:Integer;
                                   px2:Integer; py2:Integer; Fs:Integer);
Var MaxSerial,i:Integer;
begin
    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('SELECT Max(Serial) FROM SimMCS');
    Query2.Active := True;

    If Query2.Fields[0].AsString='' Then
        MaxSerial:=0
    Else
        MaxSerial:=Query2.Fields[0].AsInteger+1;

    For i:=0 To MaxSerial-1 Do
    Begin
      Query2.Active := False;
      Query2.SQL.Clear;
      Query2.SQL.Append('SELECT Serial FROM SimMCS');
      Query2.SQL.Append('Where Serial ='+IntToStr(i));
      Query2.Active := True;

      If Query2.RecordCount=0 Then
      Begin
        MaxSerial:=i;
        break;
      End;
    End;

    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('SELECT * FROM SimMCS');
    Query2.Active := True;

    Query2.Append;
    Query2.Fields[0].AsInteger := MaxSerial;
    Query2.Fields[1].AsString  := Iname;
    Query2.Fields[2].AsInteger := PX1;
    Query2.Fields[3].AsInteger := PY1;
    Query2.Fields[4].AsInteger := PX2;
    Query2.Fields[5].AsInteger := PY2;
    Query2.Fields[6].AsInteger := FS;
    Query2.Fields[7].AsInteger := Query2.RecordCount+1;
    Query2.Post;
    Query2.Active := False;
End;

procedure TMainPage.UpdateProjectViews;
Var i:Integer;
begin
  TreeView1.Items.Item[0].DeleteChildren;
  TreeView1.Items.Item[1].DeleteChildren;
  TreeView1.Items.Item[2].DeleteChildren;
//*********************** MCS *********************************
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM SimMCS');
  Query2.SQL.Append('WHERE Flag=8 Or Flag=9');
  Query2.Active := True;
  Query2.First;
  For i:=1 To Query2.RecordCount Do
  Begin
    If Query2.Fields[0].AsString<>'' Then
    Begin
      TreeView1.Items.AddChild(TreeView1.Items[2],
                               Query2.Fields[1].AsString+
                               ' -> '+
                               Query2.Fields[2].AsString+' : '+
                               Query2.Fields[3].AsString);
    End;
    Query2.Next;
  End;
  Query2.Active := False;
//*********************** WIRE *********************************
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM SimMCS');
  Query2.SQL.Append('WHERE Flag>1 AND Flag<8');
  Query2.Active := True;
  Query2.First;
  For i:=1 To Query2.RecordCount Do
  Begin
    If Query2.Fields[0].AsString<>'' Then
    Begin
      If Query2.Fields[4].AsInteger>=0 Then
      TreeView1.Items.AddChild(TreeView1.Items[1],
                               Query2.Fields[1].AsString+
                               ' -> '+
                               Query2.Fields[2].AsString+' : '+
                               Query2.Fields[3].AsString+
                               ' - '+
                               Query2.Fields[4].AsString+' : '+
                               Query2.Fields[5].AsString)
      Else
      TreeView1.Items.AddChild(TreeView1.Items[1],
                               Query2.Fields[1].AsString+
                               ' -> '+
                               Query2.Fields[2].AsString+' : '+
                               Query2.Fields[3].AsString);
    End;
    Query2.Next;
  End;
  Query2.Active := False;
//*********************** Component *********************************
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM SimMCS');
  Query2.SQL.Append('WHERE Flag=1');
  Query2.Active := True;
  Query2.First;
  For i:=1 To Query2.RecordCount Do
  Begin
    If Query2.Fields[0].AsString<>'' Then
    Begin
      TreeView1.Items.AddChild(TreeView1.Items[0],
                               Query2.Fields[1].AsString+
                               ' -> '+
                               Query2.Fields[2].AsString+' : '+
                               Query2.Fields[3].AsString);
    End;
    Query2.Next;
  End;
  Query2.Active := False;

  TreeView1.Items.Item[2].Expand(True);
  TreeView1.Items.Item[1].Expand(True);
  TreeView1.Items.Item[0].Expand(True);
End;

procedure TMainPage.Button1Click(Sender: TObject);
begin
  FlagStatus:=1;
  UpdateButtonWire;
  SetComponentBuffer(StringGrid1.Cells[0,StringGrid1.Row],Query1.DatabaseName+'\'+BmpItemName);
end;

procedure TMainPage.UpdateScreen_Item_Compnent;
begin
  Image1.Canvas.Draw(0,0,ScreenBuffer);
  Image1.Width:=Image1.Picture.Width + Trunc(Image1.Picture.Width*(ScaleBuffer/4));
  Image1.Height:=Image1.Picture.Height + Trunc(Image1.Picture.Height*(ScaleBuffer/4));
end;

procedure TMainPage.Reload_Screen_Buffer;
Var i,px,py:Integer;
    s,s2:String;
begin
  ScreenBuffer.Canvas.Draw(0,0,BG);

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM SimMCS');
  Query2.Active := True;
  Query2.First;
  For i:=1 To Query2.RecordCount Do
  Begin
    If Query2.Fields[0].AsString<>'' Then
    Begin
      case Query2.Fields[6].AsInteger Of
        1:Begin
          If Query2.Fields[1].AsString<>'' Then
            Begin
            Query3.Active := False;
            Query3.SQL.Clear;
            Query3.SQL.Append('Select * From LibComp');
            Query3.SQL.Append('Where LName='+chr(39)+Query2.Fields[1].AsString+chr(39));
            Query3.Active := True;
            Query3.Last;
            If (Query3.RecordCount>0) and (Query3.Fields[3].AsString<>'') Then
              DrawImageToBuffer(Query2.Fields[2].AsInteger*20,
                                Query2.Fields[3].AsInteger*20,
                                MyPath+'Lib\'+Query3.Fields[3].AsString,
                                ScreenBuffer);
            End;
          End;
        2:DrawImageToBuffer(Query2.Fields[2].AsInteger*20,
                            Query2.Fields[3].AsInteger*20,
                            MyPath+'Pic\Wire\Vcc.Bmp',
                            ScreenBuffer);
        3:DrawImageToBuffer(Query2.Fields[2].AsInteger*20,
                            Query2.Fields[3].AsInteger*20,
                            MyPath+'Pic\Wire\Gnd.Bmp',
                            ScreenBuffer);
        4:Begin
            ScreenBuffer.Canvas.Pen.Color:=StrToInt(GetStringInWing(Query2.Fields[1].AsString));
            ScreenBuffer.Canvas.Pen.Width:=LineWidth;
            ScreenBuffer.Canvas.MoveTo(Query2.Fields[2].AsInteger*20,
                                       Query2.Fields[3].AsInteger*20);
            ScreenBuffer.Canvas.LineTo(Query2.Fields[4].AsInteger*20,
                                       Query2.Fields[5].AsInteger*20);
          End;
        5:DrawImageToBuffer(Query2.Fields[2].AsInteger*20,
                            Query2.Fields[3].AsInteger*20,
                            MyPath+'Pic\Wire\Point.Bmp',
                            ScreenBuffer);
        6:Begin
            s:=GetStringHeadWing(Query2.Fields[1].AsString);
            s2:=GetStringInWing(Query2.Fields[1].AsString);
            px:=Query2.Fields[2].AsInteger*20;
            py:=Query2.Fields[3].AsInteger*20;

            If s='NetL' Then
            Begin
              DrawImageToBuffer(px,py,MyPath+'Pic\Wire\NetL.Bmp',ScreenBuffer);
              ScreenBuffer.Canvas.TextOut(px-((length(s2)-1)*6)-5,py+13,s2);
            End
            Else
            If s='NetU' Then
            Begin
              DrawImageToBuffer(px,py,MyPath+'Pic\Wire\NetU.Bmp',ScreenBuffer);
              ScreenBuffer.Canvas.TextOut(px-((length(s2)Div 2)*6)+18,py-10,s2);
            End
            Else
            If s='NetR' Then
            Begin
              DrawImageToBuffer(px,py,MyPath+'Pic\Wire\NetR.Bmp',ScreenBuffer);
              ScreenBuffer.Canvas.TextOut(px+38,py+13,s2);
            End
            Else
            Begin
              DrawImageToBuffer(px,py,MyPath+'Pic\Wire\NetD.Bmp',ScreenBuffer);
              ScreenBuffer.Canvas.TextOut(px-((length(s2)Div 2)*6)+18,py+35,s2);
            End;

          End;
        7:ScreenBuffer.Canvas.TextOut(Query2.Fields[2].AsInteger*20,
                                      Query2.Fields[3].AsInteger*20,
                                      GetStringInWing(Query2.Fields[1].AsString));
        8,9:Begin
          DrawImageToBuffer(Query2.Fields[2].AsInteger*20,
                            Query2.Fields[3].AsInteger*20,
                            MyPath+'Lib\'+Query2.Fields[1].AsString+'.BMP',
                            ScreenBuffer);
          End;
      End;
    End;
    Query2.Next;
  End;
End;

Function TMainPage.GetStringHeadWing(s_in:String):String;
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

Function TMainPage.GetStringInWing(s_in:String):String;
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

procedure TMainPage.ToolButton11Click(Sender: TObject);
begin
  If ScaleBuffer<MaxScale Then
  Begin
    ScaleBuffer:=ScaleBuffer+1;
    ToolButton12.Enabled := True;
  End
  Else
    ToolButton11.Enabled := False;

  UpdateScreen_Item_Compnent;
  CheckScaleToComponent;
end;

procedure TMainPage.ToolButton12Click(Sender: TObject);
begin
  If ScaleBuffer>MinScale Then
  Begin
    ScaleBuffer:=ScaleBuffer-1;
    ToolButton11.Enabled := True;
  End
  Else
    ToolButton12.Enabled := False;

  UpdateScreen_Item_Compnent;
  CheckScaleToComponent;
end;

procedure TMainPage.ToolButton13Click(Sender: TObject);
begin
  ScaleBuffer:=0;
  ToolButton11.Enabled := True;
  ToolButton12.Enabled := True;
  UpdateScreen_Item_Compnent;
  CheckScaleToComponent;
end;

procedure TMainPage.CheckScaleToComponent;
Begin
  If ScaleBuffer=0 Then
  Begin
    Button1.Enabled       := True;
    ToolButton16.Enabled  := True;
    ToolButton17.Enabled  := True;
    ToolButton18.Enabled  := True;
    ToolButton19.Enabled  := True;
    ToolButton20.Enabled  := True;
    ToolButton21.Enabled  := True;
  End
  Else
  Begin
    Button1.Enabled       := False;
    ToolButton16.Enabled  := False;
    ToolButton17.Enabled  := False;
    ToolButton18.Enabled  := False;
    ToolButton19.Enabled  := False;
    ToolButton20.Enabled  := False;
    ToolButton21.Enabled  := False;
    FlagStatus:=0;
    UpdateButtonWire;
  End;
End;

procedure TMainPage.ToolButton2Click(Sender: TObject);
Var f:TextFile;
    i,j:Integer;
    Buf_Cmd,Buf_Item:String;
begin
  If OpenDialog1.Execute Then
  Begin
    MyFileName:=OpenDialog1.FileName;
    AssignFile(F,MyFileName);
    Reset(F);

    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('SELECT * FROM SimMCS');
    Query2.Active := True;

    Readln(F,Buf_Cmd);
    If Buf_Cmd='SimMCS' Then
    Begin

      For i:=1 To Query2.RecordCount Do
        Query2.Delete;
      Query2.Edit;
      Query2.Post;

      Repeat
        If Query2.Fields[0].AsString='' Then
          Query2.Edit
        Else
          Query2.Append;

        Readln(F,Buf_Cmd);
        j:=1;
        For i:=0 To 7 Do
        Begin
          Buf_Item:='';
          Repeat Buf_Item:=Buf_Item+Buf_Cmd[j]; Inc(j); Until Buf_Cmd[j]=',';
          Inc(j);
          Query2.Fields[i].AsString:=Buf_Item;
        End;
        Query2.Post;
      Until EOF(F);
    End
    Else
      MessageDlg('! File Structure Not Miss Math',mtError,[mbOk],0);

    CloseFile(F);
    Query2.Active := False;

    Reload_Screen_Buffer;
    UpdateProjectViews;
    UpdateScreen_Item_Compnent;
  End;
end;

procedure TMainPage.ToolButton4Click(Sender: TObject);
begin
  SaveProgramToFile(False);
end;

procedure TMainPage.SaveProgramToFile(StateSaveAs:Boolean);
Var f:TextFile;
    i:Integer;
    Buf_Cmd,FName:String;
    SaveState:Boolean;
begin
  If (MyFileName='') Or (StateSaveAs) Then
  Begin
     SaveState:=SaveDialog1.Execute;
     If SaveState Then
      MyFileName:=SaveDialog1.FileName;
  End
  Else
    SaveState:=True;

  If SaveState Then
  Begin
    FName:=MyFileName;
    If (FName[Length(FName)-3]='.') and
       (FName[Length(FName)-2]='S') and
       (FName[Length(FName)-1]='M') and
       (FName[Length(FName)-0]='C') Then
    Else
      FName:=FName+'.SMC';

    AssignFile(F,FName);
    Rewrite(F);
    Writeln(F,'SimMCS');

    Query2.Active := False;
    Query2.SQL.Clear;
    Query2.SQL.Append('SELECT * FROM SimMCS');
    Query2.SQL.Append('WHERE Flag>0');
    Query2.Active := True;

    Query2.First;
    For i:=1 To Query2.RecordCount Do
    Begin
      Buf_Cmd:=Query2.Fields[0].AsString+','+Query2.Fields[1].AsString+','+
               Query2.Fields[2].AsString+','+Query2.Fields[3].AsString+','+
               Query2.Fields[4].AsString+','+Query2.Fields[5].AsString+','+
               Query2.Fields[6].AsString+','+Query2.Fields[7].AsString+',';
      Writeln(F,Buf_Cmd);
      Query2.Next;
    End;

    CloseFile(F);
    Query2.Active := False;
  End;
end;

procedure TMainPage.ToolButton29Click(Sender: TObject);
begin
  If ColorDialog1.Execute Then
  Begin
    UpdateColorButton;
  End;
end;

procedure TMainPage.UpdateColorButton;
Var PicBuf:TBitmap;
    i:Integer;
Begin
  PicBuf := TBitmap.Create;

  Imagelist1.GetBitmap(24,PicBuf);
  For i:=2 to PicBuf.Height-3 Do
  Begin
    PicBuf.Canvas.Pen.Color := ColorDialog1.Color;
    PicBuf.Canvas.MoveTo(2,i);
    PicBuf.Canvas.LineTo(PicBuf.Width-2,i);
  End;

  PicBuf.SaveToFile(MyPath+'Pic\Menu\Color.bmp');
  PicBuf.LoadFromFile(MyPath+'Pic\Menu\Color.bmp');
  Imagelist1.Delete(24);
  Imagelist1.Insert(24,PicBuf,PicBuf);
End;

procedure TMainPage.UpdateButtonWire;
begin
  ToolButton16.Down:=False;
  ToolButton17.Down:=False;
  ToolButton18.Down:=False;
  ToolButton19.Down:=False;
  ToolButton20.Down:=False;
  ToolButton21.Down:=False;

  case FlagStatus Of
    2:ToolButton16.Down:=True;
    3:ToolButton17.Down:=True;
    4:ToolButton18.Down:=True;
    5:ToolButton19.Down:=True;
    6:ToolButton20.Down:=True;
    7:ToolButton21.Down:=True;
  End;

    UpdateScreen_Item_Compnent;
end;

procedure TMainPage.SetComponentBuffer(name:String; BmpName:String);
begin
  ItemName:=Name;
  PCompBuffer := TBitmap.Create;
  PCompBuffer.LoadFromFile(BmpName);
  PCompBuffer.TransparentColor := RGB(255,0,255);
  PCompBuffer.TransparentMode := tmAuto;
  PCompBuffer.Transparent := True;
end;

procedure TMainPage.DrawImageToBuffer(x:Integer; y:Integer; BmpName:String;
                                      BufImage:TBitmap);
  Var BufBitmap:TBitmap;
begin
  BufBitmap := TBitmap.Create;
  BufBitmap.LoadFromFile(BmpName);
  BufBitmap.TransparentColor := RGB(255,0,255);
  BufBitmap.TransparentMode := tmAuto;
  BufBitmap.Transparent := True;
  BufImage.Canvas.Draw(x,y,BufBitmap);
end;

procedure TMainPage.ToolButton16Click(Sender: TObject);
begin
  FlagStatus:=2;
  UpdateButtonWire;
  SetComponentBuffer('Power',MyPath+'Pic\Wire\Vcc.Bmp');
end;

procedure TMainPage.ToolButton17Click(Sender: TObject);
begin
  FlagStatus:=3;
  UpdateButtonWire;
  SetComponentBuffer('Ground',MyPath+'Pic\Wire\Gnd.Bmp');
end;

procedure TMainPage.ToolButton18Click(Sender: TObject);
begin
  FlagStatus:=4;
  UpdateButtonWire;
  SetComponentBuffer('Wire',MyPath+'Pic\Wire\Point.Bmp');
end;

procedure TMainPage.ToolButton19Click(Sender: TObject);
begin
  FlagStatus:=5;
  UpdateButtonWire;
  SetComponentBuffer('Junction',MyPath+'Pic\Wire\Point.Bmp');
end;

procedure TMainPage.ToolButton20Click(Sender: TObject);
begin
  NetName := InputBox('Set Net Pins', 'Pin Name', '');
  if NetName<>'' Then
  Begin
    FlagStatus:=6;
    UpdateButtonWire;
    SetComponentBuffer('NetL',MyPath+'Pic\Wire\NetL.Bmp');
  End;
end;

procedure TMainPage.ToolButton21Click(Sender: TObject);
begin
  ItemName := InputBox('Set Text Label', 'Text', '');
  if ItemName<>'' Then
  Begin
    FlagStatus:=7;
    UpdateButtonWire;
  End;
end;

procedure TMainPage.Button2Click(Sender: TObject);
begin
  UpdateButtonWire;
  If ComboBox2.ItemIndex=0 Then
  Begin
    SetComponentBuffer(ComboBox2.Text,MyPath+'Lib\AT89C52.BMP');
    FlagStatus:=8;
  end
  Else
  Begin
    SetComponentBuffer(ComboBox2.Text,MyPath+'Lib\AT89C2052.BMP');
    FlagStatus:=9;
  end;
end;

procedure TMainPage.ComboBox2Change(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 Then
    Image3.Picture.LoadFromFile(MyPath+'Lib\AT89C52.BMP')
  Else
    Image3.Picture.LoadFromFile(MyPath+'Lib\AT89C2052.BMP')
end;

procedure TMainPage.Exit1Click(Sender: TObject);
begin
  MainPage.Close;
end;

procedure TMainPage.ZommIn1Click(Sender: TObject);
begin
  ToolButton11Click(Sender);
end;

procedure TMainPage.ZoomOut1Click(Sender: TObject);
begin
  ToolButton12Click(Sender);
end;

procedure TMainPage.FitScreen1Click(Sender: TObject);
begin
  ToolButton13Click(Sender);
end;

procedure TMainPage.ToolButton1Click(Sender: TObject);
begin
  if MessageDlg('Do you want new Program',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  begin
    FormShow(Sender);
    UpdateProjectViews;
  end;

end;

procedure TMainPage.New1Click(Sender: TObject);
begin
  ToolButton1Click(Sender);
end;

procedure TMainPage.Open1Click(Sender: TObject);
begin
  ToolButton2Click(Sender);
end;

procedure TMainPage.HexCode1Click(Sender: TObject);
begin
  ControllerProp.ShowModal;
  HexCode.RefreshScreen;
  Memory.RefreshScreen;
end;

procedure TMainPage.HexCode2Click(Sender: TObject);
begin
  If HexCode.Showing Then
  Begin
    MainMenu1.Items.Items[2].Items[7].Checked := False;
    HexCode.Close;
  End
  Else
  Begin
    MainMenu1.Items.Items[2].Items[7].Checked := True;
    HexCode.Show;
  End;
end;

procedure TMainPage.memory1Click(Sender: TObject);
begin
  If Memory.Showing Then
  Begin
    MainMenu1.Items.Items[2].Items[5].Checked := False;
    Memory.Close;
  End
  Else
  Begin
    MainMenu1.Items.Items[2].Items[5].Checked := True;
    Memory.Show;
  End;
end;

procedure TMainPage.Regidter1Click(Sender: TObject);
begin
  If MCSReg.Showing Then
  Begin
    MainMenu1.Items.Items[2].Items[6].Checked := False;
    MCSReg.Close;
  End
  Else
  Begin
    MainMenu1.Items.Items[2].Items[6].Checked := True;
    MCSReg.Show;
  End;
end;

procedure TMainPage.SaveAs1Click(Sender: TObject);
begin
  SaveProgramToFile(True);
end;

procedure TMainPage.ShowAll1Click(Sender: TObject);
begin
  MainMenu1.Items.Items[2].Items[4].Checked := True;
  MainMenu1.Items.Items[2].Items[5].Checked := True;
  MainMenu1.Items.Items[2].Items[6].Checked := True;
  MainMenu1.Items.Items[2].Items[7].Checked := True;
  MainMenu1.Items.Items[2].Items[8].Checked := True;
  HexCode.Show;
  Memory.Show;
  MCSReg.Show;
  SimScreen.Show;
  MCSReport.Show;
end;

procedure TMainPage.Simulation2Click(Sender: TObject);
begin
  If SimScreen.Showing Then
  Begin
    MainMenu1.Items.Items[2].Items[4].Checked := False;
    SimScreen.Close;
  End
  Else
  Begin
    MainMenu1.Items.Items[2].Items[4].Checked := True;
    SimScreen.Show;
  End;
end;

procedure TMainPage.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LoadItemComponent;
  LoadItemDescription;
end;

procedure TMainPage.reeConnector1Click(Sender: TObject);
begin
  If MCSReport.Showing Then
  Begin
    MainMenu1.Items.Items[2].Items[8].Checked := False;
    MCSReport.Close;
  End
  Else
  Begin
    MainMenu1.Items.Items[2].Items[8].Checked := True;
    MCSReport.Show;
  End;
end;

procedure TMainPage.Routing1Click(Sender: TObject);
begin
  RouteTable.ShowModal;
end;

procedure TMainPage.ErrorReport1Click(Sender: TObject);
begin
  ErrReport.ShowModal;
end;

procedure TMainPage.ToolButton6Click(Sender: TObject);
begin
//  FindState.SetPath(MyPath);
//  FindState.Show;
end;

End.
