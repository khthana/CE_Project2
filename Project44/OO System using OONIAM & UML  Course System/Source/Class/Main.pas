unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, Menus, ExtCtrls, DBCtrls, DBTables,
  Db,MyUnits, StdCtrls, AppEvnts,Buttons, ActnList,
  DBActns, StdActns, workpage, Gauges, ActnMan, ActnCtrls,inifiles, XPMenu,
  worktool, ArrayOfObjects_TLB,CacheObject_TLB;

type
  TMainform = class(TForm)
    MainMenu: TMainMenu;
    mnu1: TMenuItem;
    mnuExplorer: TMenuItem;
    mnu3: TMenuItem;
    mnu4: TMenuItem;
    mnu5: TMenuItem;
    mOption: TMenuItem;
    mnuCloseActive: TMenuItem;
    mnuPrint: TMenuItem;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    mnuAbout: TMenuItem;
    N22: TMenuItem;
    mnuExitProgram: TMenuItem;
    mnuSystem: TMenuItem;
    TimeConnect: TTimer;
    N24: TMenuItem;
    mnuConnect: TMenuItem;
    mnuDisConnect: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    PopM: TPopupMenu;
    N25: TMenuItem;
    MainCoolBar: TCoolBar;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    PanelsToolbar: TPanel;
    MyPagePanel: TPanel;
    spClosePanel: TPanel;
    N26: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    MySQL: TMenuItem;
    SQLlog: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    XPMenu: TXPMenu;
    StatusPanel: TPanel;
    StatusGauge: TGauge;
    Status: THeaderControl;
    MyPage: TMyTool;
    ActionList1: TActionList;
    aSave: TAction;
    aOpen: TAction;
    aAdd: TAction;
    aDelete: TAction;
    aRun: TAction;
    aPrint: TAction;
    Image: TImage;
    tOption: TSpeedButton;
    tPrint: TSpeedButton;
    tSave: TSpeedButton;
    tOpen: TSpeedButton;
    tAdd: TSpeedButton;
    tDelete: TSpeedButton;
    tRun: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure F2Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N18Click(Sender: TObject);
    procedure mnuDisConnectClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure StatusResize(Sender: TObject);
    procedure BT1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SQLlogClick(Sender: TObject);
    procedure ToolButtonsClick(Sender : TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure actionExecute(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure TimeConnectTimer(Sender: TObject);
    procedure mnuExplorerClick(Sender: TObject);
    procedure tOpenClick(Sender: TObject);
  private
    { Private declarations }
    fHint : string;
    COMPUTERNAME : string[255];
    procedure MapCommand(cmd : cmdCustomCommand);
    procedure AssignDispatchEvent;
    { Event Dispatches }
    procedure mnuExitProgramClick(Sender: TObject);
    procedure ConnectDatabase(level : smallint);
    procedure ConnectClick(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure Closeactiveapplication1Click(Sender: TObject);
  public
    procedure SetStatus(s1, s2: string);
    { Public declarations }
  end;

var
  Mainform: TMainform;
implementation

uses constant, command, FormX, explorer, Cache, selectSubjectDlg, splash;

{$R *.DFM}

procedure TMainform.MapCommand(cmd : cmdCustomCommand);
begin
    if ActiveMDIChild = nil then Abort;
    TCommandForm(ActiveMDIChild).MDISendCommand(cmd);
end;

procedure TMainform.FormCreate(Sender: TObject);
var n : cardinal;
    st : string[255];
begin
  with TFrmSplash.Create(Application) do
  try
    Show;
  except

  end;
  //Cache := TCache.Create(Application);
  getComputerName(@st[1],n);
  SetLength(st,n);
  COMPUTERNAME := st;
  Caption := Caption + ' on ' + COMPUTERNAME;
  AssignDispatchEvent;
  if DEFAULTINTERFACE then
  begin
    Color := clSkyBlue;
  end;
  XPMenu.Active := DEFAULTINTERFACE;
  PopM.OwnerDraw := DEFAULTINTERFACE;
  TimeConnect.Enabled := true;
end;

procedure TMainform.mnuExitProgramClick(Sender: TObject);
begin
    Close;
end;

procedure TMainform.ConnectDatabase(level : smallint);
var obj : Variant;
begin
  Cache.InitCache;
  mnuConnect.Enabled := not Cache.myFactory.IsConnected;
  mnuDisConnect.Enabled := Cache.myFactory.IsConnected;
  mnuExplorer.Enabled := Cache.MyFactory.IsConnected;
  mnu3.Enabled := Cache.myFactory.IsConnected;
  mnu4.Enabled := mnu3.Enabled;
  Status.Sections[2].ImageIndex := IIF(Cache.myFactory.IsConnected,8,9);
  while MDIChildCount > 0 do
    MDIChildren[0].free;
  SetStatus('','');
  if Cache.MyFactory.IsConnected then
  begin
    obj := Cache.MyFactory.Static('User.Dummy');
    Caption := 'บุษราคัม'+' on '+COMPUTERNAME + ':<connecting to '+trim(string(obj.GetLuckyName))+'>';
    Application.Title := 'Hello : '+trim(string(obj.GetLuckyName));
    mnuExplorer.Click;
  end;
end;


procedure TMainform.ConnectClick(Sender: TObject);
begin
    ConnectDatabase(1);
end;

procedure TMainform.ShowHint(Sender: TObject);
begin
try
  if Application.Hint = ''
  then Status.Sections[0].Text := fHint
  else
  begin
    if ActiveMDIChild <> nil then
      fHint := TCommandForm(ActiveMDIChild).MyHint;
    Status.Sections[0].Text := Application.Hint;
  end;
except

end;
end;

procedure TMainform.Closeactiveapplication1Click(Sender: TObject);
begin
  ActiveMDIChild.free;
end;

procedure TMainform.AssignDispatchEvent;
begin
    //ToolButton1.OnClick := ToolButtonsClick;
    tOption.OnClick := ToolButtonsClick;
    tSave.OnClick := ToolButtonsClick;
    tPrint.OnClick := ToolButtonsClick;
    tOpen.OnClick := ToolButtonsClick;
    tAdd.OnClick := ToolButtonsClick;
    tDelete.OnClick := ToolButtonsClick;
    tRun.OnClick := ToolButtonsClick;


    mnuExitProgram.OnClick := mnuExitProgramClick;
    mnuConnect.OnClick := ConnectClick;
    ApplicationEvents.OnHint := ShowHint;
    mnuCloseActive.OnClick := Closeactiveapplication1Click;
    mnuPrint.OnClick := print1Click;
    mnu3.Enabled := false;
    mnu4.Enabled := false;
    mnuDisConnect.Enabled := false;
end;


procedure TMainform.ToolButtonsClick(Sender: TObject);
var i : smallint;
begin
  PopM.Items.Clear;
  if ActiveMDIChild = nil then exit;
  if Sender = tOpen then TCommandForm(ActiveMDIChild).GetContext(cmdOPEN,PopM)
  else if Sender = tSave then TCommandForm(ActiveMDIChild).GetContext(cmdSAVE,PopM)
  else if Sender = tAdd then TCommandForm(ActiveMDIChild).GetContext(cmdADD,PopM)
  else if Sender = tDelete then TCommandForm(ActiveMDIChild).GetContext(cmdDELETE,PopM)
  else if Sender = tRun then TCommandForm(ActiveMDIChild).GetContext(cmdRUN,PopM)
  else if Sender = tPrint then TCommandForm(ActiveMDIChild).PrintDlg;

  if PopM.Items.Count > 0 then
  begin
    for i := 0 to PopM.Items.Count -1 do
    begin
      PopM.Items[i].OnMeasureItem := XPMenu.MeasureItem;
      PopM.Items[i].OnDrawItem := XPMenu.DrawItem;
    end;
    PopM.Popup(Left + TWinControl(Sender).Parent.Left,Top + PanelsToolbar.Top+TWinControl(Sender).Top+22)
  end;
end;

procedure TMainform.F2Execute(Sender: TObject);
begin
  MapCommand(cmdOPEN);
end;

procedure TMainform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ThaiDlg('คุณต้องการออกจากโปรแกรม',mtConfirmation,[mbYes,mbNo],0) = mrNo then CanClose := false;
end;

procedure TMainform.N18Click(Sender: TObject);
var i : smallint;
    f : boolean;
begin
{  f := false;
  for i := 0 to MDIChildCount-1 do
  if MDIChildren[i] is TTestParameter then
  begin
    TestParameter := TTestParameter(MDIChildren[i]);
    f := true;
  end;
  if not f then TestParameter := TTestParameter.Create(Self);
  TestParameter.Show;
  MyPage.SetCaption(TCommandForm(TestParameter));
}
end;

procedure TMainform.mnuDisConnectClick(Sender: TObject);
begin
  Cache.myFactory.Disconnect;
  mnu3.Enabled := false;
  mnu4.Enabled := false;
  Status.Sections[2].ImageIndex := 9;
  mnuDisConnect.Enabled := false;
  mnuConnect.Enabled := true;
  while MDIChildCount > 0 do
    MDIChildren[0].free;
  SetStatus('','');
  Caption := 'บุษราคัม'+' on '+COMPUTERNAME ;
end;

procedure TMainform.Print1Click(Sender: TObject);
begin
  //if not assigned(fprintdlg) then fprintdlg := TfprintDlg.Create(Application);
  //fprintdlg.ShowModal;
  ToolButtonsCLick(tPrint);
end;

procedure TMainform.StatusResize(Sender: TObject);
begin
  Status.Sections[0].Width := Status.Width - 190;
end;

procedure TMainform.BT1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button =  mbRight then ConnectDatabase(-1);
end;

procedure TMainform.SetStatus(s1, s2: string);
begin
  Status.Sections[0].Text := s1;
  Status.Sections[1].Text := s2;
end;

procedure TMainform.SQLlogClick(Sender: TObject);
begin
  if MDIChildCount > 0 then
  TCommandForm(ActiveMDIChild).MDISendCommand(cmdSHOWLOG);  
end;

procedure TMainform.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  ThaiDlg('%$#@'+#13 + 'โปรแกรมเมอร์หน้าแตก'+#13+e.Message,mtError,[mbCancel],0);
end;

procedure TMainform.actionExecute(Sender: TObject);
begin
  PopM.Items.Clear;
  if ActiveMDIChild = nil then exit;
  if Sender = aOpen then TCommandForm(ActiveMDIChild).GetContext(cmdOPEN,PopM)
  else if Sender = aSave then TCommandForm(ActiveMDIChild).GetContext(cmdSAVE,PopM)
  else if Sender = aRun then TCommandForm(ActiveMDIChild).GetContext(cmdRUN,PopM)
  else if Sender = aPrint then TCommandForm(ActiveMDIChild).PrintDlg;
end;

procedure TMainform.ImageClick(Sender: TObject);
begin
    TSelectSubjectDialog.Select(SUBJECT_BACHELOR_CLASS);
end;

procedure TMainform.TimeConnectTimer(Sender: TObject);
begin
  TimeConnect.Enabled := false;
//  Image.Enabled := false;
end;

procedure TMainform.mnuExplorerClick(Sender: TObject);
var i : smallint;
    f : boolean;
begin
  f := false;
  for i := 0 to MDIChildCount-1 do
  if MDIChildren[i] is TExplore then
  begin
    Explore := TExplore(MDIChildren[i]);
    f := true;
  end;
  if not f then Explore := TExplore.Create(Self);
  Explore.Show;
  MyPage.SetCaption(TCommandForm(Explore));

end;

procedure TMainform.tOpenClick(Sender: TObject);
begin
  Self.MapCommand(cmdOPEN);
end;

end.

