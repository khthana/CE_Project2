unit Command;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,MyUnits,db,FormX,
  StdCtrls, ExtCtrls,Menus, ComCtrls,DBGrids, Buttons,Registry;

type
  TCommandForm = class(TFormX)
    PCaption: TPanel;
    SpClose: TSpeedButton;
    spNext: TSpeedButton;
    spPrev: TSpeedButton;
    MyHeader: THeaderControl;
    procedure spPrevClick(Sender: TObject);
    procedure spNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    cID : string;
    cName : string;
    FDatasource : TDataSource;
    FModuleID : integer;
    FSaveState : boolean;
    fIntcmd : cmdCustomCommand;
    procedure mSetCaption(cap : TCaption);
    function mCaption : TCaption;
    { Private declarations }
  public
    { Public declarations }
    ReturnWorkForm : TCommandForm;
    Constructor Create(AOwner : TComponent); override;
    procedure OnMyActivate(Sender : TObject);
    procedure MDISendCommand(cmd : cmdCustomCommand);virtual;
    procedure GetContext(cmd : cmdCustomCommand;menu : TPopupMenu);virtual;
    procedure AssignDispatch;virtual;
    procedure AddMenu(menu : TPopupMenu;caption : string);
    procedure SetSaveState(s : boolean);
    procedure OnPopupClick(Sender : TObject);
    procedure PrintDlg;virtual;
  published
    property DataSource : TDataSource Read FDataSource Write FDataSource default nil;
    property MyHint : string read cName;
    property Caption : TCaption read mCaption write mSetCaption;
  end;


implementation
uses main, constant;


procedure TCommandForm.AssignDispatch;
begin

end;

constructor TCommandForm.Create(AOwner: TComponent);
var i : smallint;
  t : TObject;
  dummy : THeaderSection;
begin
  inherited Create(AOwner);
  dummy := MyHeader.Sections.Add;
  dummy.Width := Width;
  if DEFAULTINTERFACE then
  begin
    Font.Charset := THAI_CHARSET;
    Self.Color := clSkyBlue;
    MyHeader.Sections[0].Width := MyHeader.Sections[0].Width - 2;
    for i := 0 to ComponentCount -1 do
    begin
      t := Components[i];
      if(t is TComboBox) then
      begin
        TComboBox(t).BevelKind := bkSoft;
      end
      else if(t is TListBox) then
      begin
        TListBox(t).BevelKind := bkSoft;
        TListBox(t).BorderStyle := bsNone;
      end
      else if(t is TEdit) then
      begin
        TEdit(t).BevelKind := bkSoft;
        TEdit(t).BorderStyle := bsNone;
      end
      else if(t is TStaticText) then
      begin
        TStaticText(t).BevelKind := bkSoft;
        TStaticText(t).BorderStyle := sbsNone;
        TStaticText(t).ParentColor := true;
      end
      else if(t is TLabeledEdit) then
      begin
        TLabeledEdit(t).BevelKind := bkSoft;
        TLabeledEdit(t).BorderStyle := bsNone;
      end
      else if(t is TListView) then
      begin
        TListView(t).BevelKind := bkSoft;
        TListView(t).BorderStyle := bsNone;
        TListView(t).FlatScrollBars := true;
        //TListView(t).Ctl3D := false;
      end
      else if(t is TTreeView) then
      begin
        TTreeView(t).BevelKind := bkSoft;
        TTreeView(t).BorderStyle := bsNone;
        //TTreeView(t).ParentColor := true;
        //TTreeView(t).Ctl3D := false;
      end
      else if(t is TCustomDBGrid) then
      begin
        TDBGrid(t).BorderStyle := bsNone;
        //TDBGrid(t).FixedColor := clSkyBlue;
      end
    end;
  end;
  OnActivate := OnMyActivate;
  SpClose.Align := alRight;
  SpNext.Align := alRight;
  spPrev.Align := alLeft;
end;

procedure TCommandForm.MDISendCommand(cmd : cmdCustomCommand);
begin

end;
{$R *.DFM}

procedure TCommandForm.SetSaveState(s: boolean);
var i : smallint;
begin
  fSaveState := s;
  Mainform.tSave.Enabled := s;
  Mainform.MyPage.UpdateState(self,s);
end;

procedure TCommandForm.GetContext(cmd : cmdCustomCommand; menu: TPopupMenu);
begin
  menu.Items.Clear;
  fIntCmd := cmd;
end;

procedure TCommandForm.AddMenu(menu: TPopupMenu; caption: string);
var mnu : TMenuItem;
begin
  mnu := TMenuItem.Create(menu);
  mnu.Caption := Caption+'       ';
  mnu.ImageIndex := menu.Items.Count+2;
  mnu.OnClick := OnPopupClick;
  menu.Items.Add(mnu);
end;

procedure TCommandForm.OnPopupClick(Sender: TObject);
begin
  case TMenuItem(Sender).ImageIndex of
   2 : MDISendCommand(cmdUSER1);
   3 : MDISendCommand(cmdUSER2);
   4 : MDISendCommand(cmdUSER3);
   5 : MDISendCommand(cmdUSER4);
  end;
end;

procedure TCommandForm.PrintDlg;
begin

end;

procedure TCommandForm.OnMyActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
  MainForm.tSave.Enabled := fSaveState;
  Mainform.SetStatus(cName,'ID = '+ cID);
  Mainform.MyPage.UpdateState(Self,fSaveState);
end;

function TCommandForm.mCaption: TCaption;
begin
  Result := PCaption.Caption;
end;

procedure TCommandForm.mSetCaption(cap: TCaption);
begin
  PCaption.Caption := cap;
end;


procedure TCommandForm.spPrevClick(Sender: TObject);
begin
  Mainform.MyPage.Pior;
end;

procedure TCommandForm.spNextClick(Sender: TObject);
begin
  Mainform.MyPage.Next;
end;

procedure TCommandForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FSaveState
  and Mainform.tSave.Enabled
  and (ThaiDlg('ข้อมูลของ '+ cID + ':' + cName + ' มีการแก้ไข ต้องการบันทึกหรือไม่',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
       Mainform.tSave.Click;
  Action := caFree;
end;

end.
