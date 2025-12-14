unit car_tracking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, ExtCtrls, Grids, DBGrids, StdCtrls,
  VaClasses, VaComm, Db, Buttons,
  DBTables, Menus;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ImageList1: TImageList;
    ToolButton7: TToolButton;
    ImageList2: TImageList;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Timer1: TTimer;
    path: TTable;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    N2: TMenuItem;
    Exit2: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    SetPort1: TMenuItem;
    Exit3: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton12: TToolButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Lstart_time: TLabel;
    Lstart_date: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Ldriver: TLabel;
    Lcar_id: TLabel;
    Label3: TLabel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    PrinterSetup1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Database1: TDatabase;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Lspeed: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Lend_time: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Lend_date: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Llat: TLabel;
    Llong: TLabel;
    Ltime: TLabel;
    Ln: TLabel;
    Le: TLabel;
    Ltrack_id: TLabel;
    Label26: TLabel;
    Label10: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    GroupBox3: TGroupBox;
    Lnotice1: TLabel;
    Lnotice2: TLabel;
    Lnotice3: TLabel;
    unit_r: TLabel;
    num_r: TLabel;
    unit_b: TLabel;
    num_b: TLabel;
    Label43: TLabel;
    unit_g: TLabel;
    num_g: TLabel;
    gps: TQuery;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetPort1Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure Exit3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure About1Click(Sender: TObject);

  private
    { Private declarations }
  public
    start_rate,brake_rate,stop_rate,track_id,x_d,y_d: Integer;
    start1,stop1,brake1,eversim,reco :boolean;
    lat,long,xpoint1,ypoint1,xpoint2,ypoint2,n,e,speed,date,time : string;
    direction_n,direction_e : char;
  end;
type
  arraytype = array [0..10] of Integer;
var
  Form1: TForm1;
  Intrate,start_rate,brake_rate,stop_rate,stmp1,stmp2,stmp3,btmp1,btmp2,btmp3: Integer;
  car_id,driver,start_date,start_time,end_date,end_time,position,notice1,notice2,notice3,old_lat,old_long : String;
  start,start1,stop1,brake1,checkgoto :boolean;
  min_d :double;
  startx,starty,nowx,nowy,current_path,j,count_start,count_brake,count_stop,max_time: Integer;
  implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6;

{$R *.DFM}

procedure conclusion();
begin
    if form1.stop1 and form1.start1 and form1.brake1 then
    begin
        form1.Lnotice1.Font.color := clred;
        form1.Lnotice1.caption := 'ออกตัวกระชาก';
        form1.num_r.Font.color := clred;
        form1.num_r.caption := inttostr(count_start);
        form1.unit_r.Font.color := clred;
        form1.unit_r.visible := true;

        form1.Lnotice2.Font.color := clblue;
        form1.Lnotice2.caption := 'เบรคกระทันหัน';
        form1.num_b.Font.color := clblue;
        form1.num_b.caption := inttostr(count_brake);
        form1.unit_b.Font.color := clblue;
        form1.unit_b.visible := true;

        form1.Lnotice3.Font.color := clgreen;
        form1.Lnotice3.caption := 'จอดนาน ( '+inttostr(round(max_time+form1.stop_rate))+' นาที )';
        form1.num_g.caption := inttostr(count_stop);
        form1.unit_g.visible := true;
    end
    else if form1.stop1 and form1.start1 then
    begin
        form1.Lnotice1.Font.color := clred;
        form1.Lnotice1.caption := 'ออกตัวกระชาก';
        form1.num_r.Font.color := clred;
        form1.num_r.caption := inttostr(count_start);
        form1.unit_r.Font.color := clred;
        form1.unit_r.visible := true;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;

        form1.Lnotice2.Font.color := clgreen;
        form1.Lnotice2.caption := 'จอดนาน ( '+inttostr(round(max_time+form1.stop_rate))+' นาที )';
        form1.num_b.Font.color := clgreen;
        form1.num_b.caption := inttostr(count_stop);
        form1.unit_b.Font.color := clgreen;
        form1.unit_b.visible := true;
    end
    else if form1.stop1 and form1.brake1 then
    begin
        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;

        form1.Lnotice1.Font.color := clblue;
        form1.Lnotice1.caption := 'เบรคกระทันหัน';
        form1.num_r.Font.color := clblue;
        form1.num_r.caption := inttostr(count_brake);
        form1.unit_r.Font.color := clblue;
        form1.unit_r.visible := true;

        form1.Lnotice2.Font.color := clgreen;
        form1.Lnotice2.caption := 'จอดนาน ( '+inttostr(round(max_time+form1.stop_rate))+' นาที )';
        form1.num_b.Font.color := clgreen;
        form1.num_b.caption := inttostr(count_stop);
        form1.unit_b.Font.color := clgreen;
        form1.unit_b.visible := true;
    end
    else if form1.start1 and form1.brake1 then
    begin
        form1.Lnotice1.Font.color := clred;
        form1.Lnotice1.caption := 'ออกตัวกระชาก';
        form1.num_r.Font.color := clred;
        form1.num_r.caption := inttostr(count_start);
        form1.unit_r.Font.color := clred;
        form1.unit_r.visible := true;

        form1.Lnotice2.Font.color := clblue;
        form1.Lnotice2.caption := 'เบรคกระทันหัน';
        form1.num_b.Font.color := clblue;
        form1.num_b.caption := inttostr(count_brake);
        form1.unit_b.Font.color := clblue;
        form1.unit_b.visible := true;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;
    end
    else if form1.stop1 then
    begin
        form1.Lnotice2.caption := '';
        form1.num_b.caption := '';
        form1.unit_b.visible := false;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;

        form1.Lnotice1.Font.color := clgreen;
        form1.Lnotice1.caption := 'จอดนาน ( '+inttostr(round(max_time+form1.stop_rate))+' นาที )';
        form1.num_r.Font.color := clgreen;
        form1.num_r.caption := inttostr(count_stop);
        form1.unit_r.Font.color := clgreen;
        form1.unit_r.visible := true;
    end
    else if form1.start1 then
    begin
        form1.Lnotice1.Font.color := clred;
        form1.Lnotice1.caption := 'ออกตัวกระชาก';
        form1.num_r.Font.color := clred;
        form1.num_r.caption := inttostr(count_start);
        form1.unit_r.Font.color := clred;
        form1.unit_r.visible := true;

        form1.Lnotice2.caption := '';
        form1.num_b.caption := '';
        form1.unit_b.visible := false;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;
    end
    else if form1.brake1 then
    begin
        form1.Lnotice2.caption := '';
        form1.num_b.caption := '';
        form1.unit_b.visible := false;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;

        form1.Lnotice1.Font.color := clblue;
        form1.Lnotice1.caption := 'เบรคกระทันหัน';
        form1.num_r.Font.color := clblue;
        form1.num_r.caption := inttostr(count_brake);
        form1.unit_r.Font.color := clblue;
        form1.unit_r.visible := true;
    end
    else
    begin
        form1.Lnotice1.caption := '';
        form1.num_r.caption := '';
        form1.unit_r.visible := false;

        form1.Lnotice2.caption := '';
        form1.num_b.caption := '';
        form1.unit_b.visible := false;

        form1.Lnotice3.caption := '';
        form1.num_g.caption := '';
        form1.unit_g.visible := false;
    end;
end;

procedure shownotice();
begin
    form1.num_r.caption := '';
    form1.unit_r.visible := false;
    form1.num_b.caption := '';
    form1.unit_b.visible := false;
    form1.num_g.caption := '';
    form1.unit_g.visible := false;
    if form1.stop1 and form1.start1 and form1.brake1 then
    begin
      notice1 := form1.gps.fieldvalues['notice1'];
      notice2 := form1.gps.fieldvalues['notice2'];
      notice3 := form1.gps.fieldvalues['notice3'];
    end
    else if form1.stop1 and form1.start1 then
    begin
      notice1 := form1.gps.fieldvalues['notice1'];
      notice2 := 'a';
      notice3 := form1.gps.fieldvalues['notice3'];
    end
    else if form1.stop1 and form1.brake1 then
    begin
      notice1 := 'a';
      notice2 := form1.gps.fieldvalues['notice2'];
      notice3 := form1.gps.fieldvalues['notice3'];
    end
    else if form1.start1 and form1.brake1 then
    begin
      notice1 := form1.gps.fieldvalues['notice1'];
      notice2 := form1.gps.fieldvalues['notice2'];
      notice3 := 'a';
    end
    else if form1.stop1 then
    begin
      notice1 := 'a';
      notice2 := 'a';
      notice3 := form1.gps.fieldvalues['notice3'];
    end
    else if form1.start1 then
    begin
      notice1 := form1.gps.fieldvalues['notice1'];
      notice2 := 'a';
      notice3 := 'a';
    end
    else if form1.brake1 then
    begin
      notice1 := 'a';
      notice2 := form1.gps.fieldvalues['notice2'];
      notice3 := 'a';
    end
    else
    begin
      notice1 := 'a';
      notice2 := 'a';
      notice3 := 'a';
    end;

    if (notice1<>'a')or(notice2<>'a')or(notice3<>'a') then
    begin
    if notice1 = 'a' then
    begin
      while (notice1='a') do
      begin
        notice1 := notice2;
        notice2 := notice3;
        notice3 := 'a';
      end;
    end;
    if ((notice2 <> 'a')or(notice3 <> 'a')) then
    begin
      while (notice2='a') do
      begin
        notice2 := notice3;
        notice3 := 'a';
      end;
    end;
    end;


    if notice1<>'a' then
    begin
      if notice1[1] = 'อ' then
        form1.Lnotice1.Font.color := clred
      else if notice1[1] ='เ' then
        form1.Lnotice1.Font.Color := clblue
      else
        form1.Lnotice1.Font.color := clgreen;
      form1.Lnotice1.caption := notice1;
    end
    else
      form1.Lnotice1.caption :='';
    if notice2<>'a' then
    begin
      if notice2[1] = 'อ' then
        form1.Lnotice2.Font.color := clred
      else if notice2[1] ='เ' then
        form1.Lnotice2.Font.color := clblue
      else
        form1.Lnotice2.Font.color := clgreen;
      form1.Lnotice2.caption := notice2;
    end
    else
      form1.Lnotice2.caption :='';
    if notice3<>'a' then
    begin
      if notice3[1] = 'อ' then
        form1.Lnotice3.Font.color := clred
      else if notice3[1] ='เ' then
        form1.Lnotice3.Font.color := clblue
      else
        form1.Lnotice3.Font.color := clgreen;
      form1.Lnotice3.caption := notice3;
    end
    else
      form1.Lnotice3.caption :='';
end;
//###### get info. of that point from database #######
procedure GetfromDB();
begin
  form1.lat     := form1.gps.fieldvalues['latitude'];
  form1.long    := form1.gps.fieldvalues['longitude'];
  form1.n       := form1.gps.fieldvalues['direction_n'];
  form1.e       := form1.gps.fieldvalues['direction_e'];
  form1.speed   := form1.gps.fieldvalues['speed'];
  //form1.date    := form1.gps.fieldvalues['that_date'];
  form1.time    := form1.gps.fieldvalues['time'];
end;

//###### calculate coordinate x from latitude #######
function PostoCoorX ( pos : Integer ) : Integer;
begin//convert latitude to coordinate x
  postocoorX := round(pos/13.33);
end;

function PostoCoorY ( pos : Integer ) : Integer;
begin//convert latitude to coordinate x
  postocoory := 750-round(pos/13.33);
end;

function LatStrtoInt( pos : String) : Integer;
begin
  LatStrtoInt := round((strtofloat(pos)-43)*10000);
end;

function LongStrtoInt( pos : String) : Integer;
begin
  LongStrtoInt := round((strtofloat(pos)-46)*10000);
end;

//###### calculate latitude from coordinate x  #######
function CoortoPosX ( x : integer ) : String;
var tmp_lat : string;
begin
  if (1150/form1.image1.Width)*x >750 then
    tmp_lat := '47.'+IntToStr(round((((1150*x/form1.image1.Width)-750)*13.33)))
  else
    tmp_lat := '46.'+IntToStr(round((1150*x/form1.image1.Width)*13.33));
  CoortoPosX := 'Lat: 100.' + tmp_lat;
end;

//###### calculate longitude from coordinate y  #######
function CoortoPosY ( y : integer ) : String;
var tmp_long : string;
begin
  if round((750-y)*13.33)=10000 then
    tmp_long := '44.0000'
  else
    tmp_long := '43.'+ IntToStr(round((750-(750*y/form1.image1.height))*13.33));
  CoortoPosy := 'Long: 13.' + tmp_long;
end;

//#### find whether mouse is moving on tracking path  #####
procedure Findmousematch ( x,y : integer );
var tmp_x,tmp_y : integer;
    match : boolean;
begin
  if form1.eversim then
  begin
  form1.gps.filter   := 'track_id = '+ inttostr(form1.track_id);
  form1.gps.filtered := true;
  form1.gps.first;
  match := false;
  while (not form1.gps.eof)and (not match) do
  begin
    form1.lat   := form1.gps.fieldvalues['latitude'];
    form1.long  := form1.gps.fieldvalues['longitude'];
    tmp_x := round(PostoCoorX(Longstrtoint(form1.long))*form1.image1.width/1150);
    tmp_y := round(PostoCoorY(latstrtoint(form1.lat))*form1.image1.height/750);

    if ((tmp_x=x) and (tmp_y=y))or((tmp_x=x-1) and (tmp_y=y))or((tmp_x=x-1) and (tmp_y=y+1))or((tmp_x=x) and (tmp_y=y+1))or((tmp_x=x+1) and (tmp_y=y+1))or((tmp_x=x+1) and (tmp_y=y))or((tmp_x=x+1) and (tmp_y=y-1))or((tmp_x=x) and (tmp_y=y-1))or((tmp_x=x-1) and (tmp_y=y-1))or((tmp_x=x-2)and(tmp_y=y-2))or((tmp_x=x-2)and(tmp_y=y-1))or((tmp_x=x-2)and(tmp_y=y))or((tmp_x=x-2)and(tmp_y=y+1))or((tmp_x=x-2)and(tmp_y=y+2))or((tmp_x=x-1)and(tmp_y=y-2))or((tmp_x=x-1)and(tmp_y=y+2))or((tmp_x=x)and(tmp_y=y-2))or((tmp_x=x)and(tmp_y=y+2))or((tmp_x=x+1)and(tmp_y=y-2))or((tmp_x=x+1)and(tmp_y=y+2))or((tmp_x=x+2)and(tmp_y=y-2))or((tmp_x=x+2)and(tmp_y=y-1))or((tmp_x=x+2)and(tmp_y=y))or((tmp_x=x+2)and(tmp_y=y+1))or((tmp_x=x+2)and(tmp_y=y+2)) then
    begin
      match := true;
      form1.Llat.caption := form1.gps.fieldvalues['latitude'];
      form1.Llong.caption := form1.gps.fieldvalues['longitude'];
      form1.Ln.caption := form1.gps.fieldvalues['direction_n'];
      form1.Le.caption := form1.gps.fieldvalues['direction_e'];
      form1.Lspeed.caption := form1.gps.fieldvalues['speed']+' Km./Hr.';
      //form1.Ldate.caption := form1.gps.fieldvalues['that_date'];
      form1.Ltime.caption := form1.gps.fieldvalues['time']+' น.';
      shownotice();
    end
    else
    begin
      form1.gps.next;
      form1.Llat.caption := '----';
      form1.Llong.caption := '----';
      form1.Ln.caption := '----';
      form1.Le.caption := '----';
      form1.Lspeed.caption := '----';
      //form1.Ldate.caption := '----';
      form1.Ltime.caption := '----';
      conclusion();
    end;
  end;
  end;
end;

//###### calculate distance between 2 point  #######
function ComparePoint(x1,y1,x2,y2 : Integer ) : Integer;
begin
  ComparePoint := round(sqrt(sqr(x2-x1)+sqr(y2-y1)));
end;

//#### find point on path that projection from real point ####
function Projection ( x1,y1,x2,y2,x3,y3 : Integer ): double;
var a3,b3,c3,tmp_d,tmp_x,tmp_y : double;
begin//find vertical point from position to correct path
if y2=y1 then
begin
  form1.y_d := y1;
  form1.x_d := x3;
end
else if x2=x1 then
begin
  form1.y_d := y3;
  form1.x_d := x1;
end
else
begin
  a3 := -((x2-x1)/(y2-y1));
  b3 := (y2-y1)/(x2-x1);
  c3 := y3-y1;
  form1.x_d := round((-(b3*x1)+(a3*x3)-c3)/(a3-b3));
  form1.y_d  :=round(((y2-y1)*(form1.x_d-x1)/(x2-x1))+y1);
end;
  tmp_x := sqr(x3-form1.x_d);
  tmp_y := sqr(y3-form1.y_d);
  if ((form1.x_d>x1) and (form1.x_d<x2)) or ((form1.x_d<x1) and (form1.x_d>x2)) then
  begin
    tmp_d := sqrt(tmp_x+tmp_y);
    projection := tmp_d;
  end
  else
    projection := 10000;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Intrate := 100;
  track_id := 1;
  toolbutton5.Enabled :=false;
  toolbutton6.enabled := false;
  nowx := 10;//round(image1.width/2);
  nowy := 383;//round(image1.height/2);
  start_rate := 50;
  stop_rate  :=20;
  brake_rate :=50;
  start1 := true;
  stop1  := true;
  brake1 := true;
  reco   := true;
end;

//###### zoom in  #######
procedure TForm1.ToolButton4Click(Sender: TObject);
var
  Zoom, TempZoom, centerx,centery: Integer;
  rate : string;
begin
  //###### set the point that get from db to center of panel #######
  centerx := 295-image1.left;
  centery := 192-image1.top;
  Intrate := Intrate+10;
  Statusbar1.panels[2].text:='Zoomming Rate '+inttostr(intrate)+'%      ';
  rate := inttostr(intrate);
  Zoom := StrToIntDef(rate, 100);
  if Image1.Tag = Zoom then Exit;
  TempZoom := Image1.Tag;
  Image1.Tag := Zoom;
  Image1.Width := Round(Image1.Width * Zoom / TempZoom);
  Image1.Height := Round(Image1.Height * Zoom / TempZoom);
  if intrate > 100 then
  toolbutton5.Enabled :=true;

  image1.left := 295-round(centerx*zoom/tempzoom);
  image1.Top  := 192-round(centery*zoom/tempzoom);

  if (image1.left+image1.width<panel1.width) then
     Image1.left := panel1.width-image1.width
  else
  begin
    if image1.left > 0 then
       Image1.left := 0;
  end;
  if (image1.top+image1.height<panel1.height) then
     Image1.Top := panel1.height-image1.height
  else
  begin;
    if image1.top > 0 then
       Image1.Top := 0;
  end;
end;

//###### zoom out  #######
procedure TForm1.ToolButton5Click(Sender: TObject);
var
  Zoom, TempZoom, centerx,centery: Integer;
  rate : string;
begin
  centerx := 295-image1.left;
  centery := 192-image1.top;
  Intrate := Intrate-10;
  Statusbar1.panels[2].text:='Zoomming Rate '+inttostr(intrate)+'%      ';
  rate := inttostr(intrate);
  Zoom := StrToIntDef(rate, 100);
  if Image1.Tag = Zoom then Exit;
  TempZoom := Image1.Tag;
  Image1.Tag := Zoom;
  Image1.Width := Round(Image1.Width * Zoom / TempZoom);
  Image1.Height := Round(Image1.Height * Zoom / TempZoom);
  if Intrate <= 100 then
  toolbutton5.Enabled :=false;
  image1.left := 295-round(centerx*zoom/tempzoom);
  image1.Top  := 192-round(centery*zoom/tempzoom);
  if (image1.left+image1.width<panel1.width) then
     Image1.left := panel1.width-image1.width
  else
  begin
    if image1.left > 0 then
       Image1.left := 0;
  end;
  if (image1.top+image1.height<panel1.height) then
     Image1.Top := panel1.height-image1.height
  else
  begin;
    if image1.top > 0 then
       Image1.Top := 0;
  end;
end;

//######## simulate #########
procedure TForm1.Timer1Timer(Sender: TObject);
var pv_start,pv_stop,pv_brake : boolean;
    count_time,plotx,ploty,x1,y1,x2,y2,x3,y3 : integer;
    d : double;
begin
  if start then
  begin
    plotx := 0;
    ploty := 0;
    min_d := 10000;
    GetfromDB();
    if (lat <> '') and (long <>'') then
    begin
      if reco then
      begin
      path.First;
      while not path.eof do
      begin
        xpoint1  := path.FieldValues['xpoint1'];
        ypoint1  := path.FieldValues['ypoint1'];
        xpoint2  := path.FieldValues['xpoint2'];
        ypoint2  := path.FieldValues['ypoint2'];
        x1 := postocoorx(longstrtoint(xpoint1));
        y1 := postocoory(latstrtoint(ypoint1));
        x2 := postocoorx(longstrtoint(xpoint2));
        y2 := postocoory(latstrtoint(ypoint2));
        x3 := PostoCoorX(LongStrtoInt(long));
        y3 := PostoCoorY(LatStrtoInt(lat));
        d := projection (x1,y1,x2,y2,x3,y3);
        if d<min_d then
        begin
          min_d := d;
          plotx := x_d;
          ploty := y_d;
        end;
        path.Next;
      end;
      end
      else
      begin
        plotx := PostoCoorX(LongStrtoInt(long));
        ploty := PostoCoorY(LatStrtoInt(lat));
      end;
      Image1.Canvas.LineTo(plotx,ploty);
    end;
      //else ar ari dee
    Llat.caption := lat;
    Llong.caption := long;
    Ln.caption := n;
    Le.caption := e;
    Lspeed.caption := speed+' Km./Hr.';
    //Ldate.caption := date;
    Ltime.caption := time+' น.';
    shownotice();
    gps.next;
    //nowx := latitude+10;
    //nowy := longitude;
    j := j+1;
    if gps.EOF then
    begin
      start := false;
      toolbutton6.enabled := true;
      j := 0;
      count_start := 0;
      count_stop  := 0;
      count_brake := 0;
      count_time  := 0;
      max_time    := 0;
      pv_start    := false;
      pv_brake    := false;
      pv_stop     := false;
      gps.first;
      while not gps.Eof do
      begin
        notice1 := form1.gps.fieldvalues['notice1'];
        notice2 := form1.gps.fieldvalues['notice2'];
        notice3 := form1.gps.fieldvalues['notice3'];
        lat     := form1.gps.fieldvalues['latitude'];
        long    := form1.gps.fieldvalues['longitude'];
        image1.Canvas.Brush.Style:=bsclear;
        Image1.Canvas.Pen.Width := 4;
        if start1 then
        begin
          if (notice1<>'a') then
          begin
            if not pv_start then
            begin
              Image1.Canvas.pen.color:=clred;
              Image1.Canvas.Ellipse(postocoorX(longstrtoint(long))-20,postocoorY(latstrtoint(lat))-10,postocoorX(longstrtoint(long))+20,postocoorY(latstrtoint(lat))+10);
              pv_start := true;
              count_start := count_start+1;
            end;
          end
          else
            pv_start := false;
        end;

        if brake1 then
        begin
          if (notice2<>'a') then
          begin
            if not pv_brake then
            begin
              Image1.Canvas.pen.color:=clblue;
              Image1.Canvas.Ellipse(postocoorX(longstrtoint(long))-20,postocoorY(latstrtoint(lat))-10,postocoorX(longstrtoint(long))+20,postocoorY(latstrtoint(lat))+10);
              pv_brake := true;
              count_brake := count_brake+1;
            end;
          end
          else
            pv_brake := false;
        end;

        if stop1 then
        begin
          if (notice3<>'a') then
          begin
            if not pv_stop then
            begin
              Image1.Canvas.pen.color:=clgreen;
              Image1.Canvas.Ellipse(postocoorX(longstrtoint(long))-20,postocoorY(latstrtoint(lat))-10,postocoorX(longstrtoint(long))+20,postocoorY(latstrtoint(lat))+10);
              pv_stop := true;
              count_stop := count_stop+1;
              if count_time > max_time then
                max_time := count_time;
              count_time := 0;
            end;
            count_time := count_time+1;
          end
          else
            pv_stop := false;
        end;
        gps.next;
      end;
      max_time := count_time;
      conclusion();
    end;
  end;
end;

//###### start simulate  #######
procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  image1.Picture.LoadFromFile('map.bmp');
  gps.SQL.Text := 'select * from gps where "track_id" = '+inttostr(track_id)+' order by "code" asc';
  gps.open;
  //gps.Filter :='track_id ='+inttostr(track_id);
  //gps.filtered := true;

  long :=gps.fieldvalues['longitude'];
  lat :=gps.fieldvalues['latitude'];
  Image1.Canvas.Pen.Color := clyellow;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Width := 4;
  if (lat <> '') and (long <>'') then
    Image1.Canvas.MoveTo(PostoCoorX(longstrtoint(long)),PostoCoorY(latstrtoint(lat)));
  start := true;
  toolbutton6.enabled := false;
  gps.First;
  eversim := true;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StartX := X;
  StartY := Y;
end;

//###### show current lat/long on statusbar  #######
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Statusbar1.panels[0].text:=CoortoPosX(x);
  Statusbar1.panels[1].text:=CoortoPosY(y);
  if not start then
    Findmousematch(x,y);
end;

//###### pan  #######
procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (image1.left-startx+x+image1.width<panel1.width) then
     Image1.left := panel1.width-image1.width
  else
  begin
    if image1.left-startx+x > 0 then
       Image1.left := 0
    else
       Image1.left := image1.left-startx+x;
  end;
  if (image1.top-starty+y+image1.height<panel1.height) then
     Image1.Top := panel1.height-image1.height
  else
  begin;
    if image1.top-starty+y > 0 then
       Image1.Top := 0
    else
       Image1.Top := image1.top-starty+y;
  end;
end;

//###### setting  #######
procedure TForm1.SetPort1Click(Sender: TObject);
begin
  form2.show;
end;


//###### setting  #######
procedure TForm1.ToolButton11Click(Sender: TObject);
begin
  form2.show;
end;

//###### exit  #######
procedure TForm1.Exit3Click(Sender: TObject);
begin
  close;
end;

//###### load data from serial port #######
procedure TForm1.N1Click(Sender: TObject);
begin
  form3.show;
end;

//###### load data from serial port #######
procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  form3.show;
end;

//###### printer setup  #######
procedure TForm1.PrinterSetup1Click(Sender: TObject);
begin
  printersetupdialog1.execute;
end;

//###### generate report for that tracking  #######
procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  form4.query2.Params[0].asinteger:= track_id;
  form4.quickrep1.preview;
end;

//###### generate report for that tracking  #######
procedure TForm1.N2Click(Sender: TObject);
begin
  form4.quickrep1.preview;
end;

//###### load old data  #######
procedure TForm1.Open1Click(Sender: TObject);
begin
  form5.show;
end;

//###### load old data  #######
procedure TForm1.ToolButton8Click(Sender: TObject);
begin
  form5.show;
end;

//###### about  #######
procedure TForm1.About1Click(Sender: TObject);
begin
  form6.show;
end;

end.                                             
