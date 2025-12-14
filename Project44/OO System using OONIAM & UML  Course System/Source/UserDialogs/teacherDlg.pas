unit teacherDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ExtCtrls, Buttons, User_Teacher_TLB,
  RefComboBox;

type
  TTeacherDialog = class(TEditDialog)
    Label1: TLabel;
    Label2: TLabel;
    edThaiName: TLabeledEdit;
    edEngName: TLabeledEdit;
    edEngLastName: TLabeledEdit;
    edThaiLastName: TLabeledEdit;
    Label3: TLabel;
    cmbPosEDU: TReferenceComboBox;
  private
    procedure SyncObjectToScreen;override;
    procedure SyncScreenToObject;override;
  public
    mObject : Variant;
    class function Edit(oid : string) : boolean;
    class function NewTeacher(_parent : string) : Teacher;
    { Public declarations }
  end;

var
  TeacherDialog: TTeacherDialog;

implementation

uses Cache, User_TeacherDescription_TLB, constant, CacheObject_TLB;



{$R *.dfm}

{ TTeacherDialog }

class function TTeacherDialog.Edit(oid: string): boolean;
var rs : ResultSet;
begin
  if not assigned(TeacherDialog) then TeacherDialog := TTeacherDialog.Create(Application);
  with TeacherDialog do
  try
    cmbPosEDU.ClearItems;
    rs := Cache.Query(POSEDU_CLASS,QUERY_DETAILS);
    rs.Execute('','','','','','','','','','','','','','','','');
    while rs.Next do
      cmbPosEdu.AddNew(rs.GetData(3),rs.GetData(4) + '(' + rs.GetData(6) + ')');
    rs.Close;
    mObject := Teacher(Cache.OpenObjectI(TEACHER_CLASS,oid));
    SyncObjectToScreen;
    if ShowModal = mrOK then
    begin
      SyncScreenToObject;
      mObject.SYS_Save(0);
      mObject.SYS_Close;
      result := true;
    end
    else result := false;
  except
    result := false;
  end;
end;

class function TTeacherDialog.NewTeacher(_parent: string): Teacher;
var rs : ResultSet;
begin
  if not assigned(TeacherDialog) then TeacherDialog := TTeacherDialog.Create(Application);
  with TeacherDialog do
  try
    cmbPosEDU.ClearItems;
    rs := Cache.Query(POSEDU_CLASS,QUERY_DETAILS);
    rs.Execute('','','','','','','','','','','','','','','','');
    while rs.Next do
      cmbPosEdu.AddNew(rs.GetData(3),rs.GetData(4) + '(' + rs.GetData(6) + ')');
    rs.Close;
    if ShowModal = mrOK then
    begin
      mObject := Teacher(Cache.NewObjectI(TEACHER_CLASS));
      SyncScreenToObject;
      mObject.PositionEDUSetObjectId(cmbPosEDU.strReference);
      mObject.IsOfSetObjectId(_parent);
      mObject.SYS_Save(0);
      mObject.SYS_Close;
      result := Teacher(IUnknown(mobject));
    end
    else result := nil;
  except
    result := nil;
  end;

end;

procedure TTeacherDialog.SyncObjectToScreen;
begin
  inherited;
  label2.Caption := mObject.IsOf.ThaiName + ',' + mObject.IsOf.IsOf.ThaiName;
  edThaiName.Text := mObject.Thai.FirstName;
  edThaiLastName.Text := mObject.Thai.LastName;
  edEngName.Text := mObject.English.FirstName;
  edEngLastName.Text := mObject.English.LastName;

  cmbPosEDU.FindReference(mObject.PositionEDU.SYS_ID);
end;

procedure TTeacherDialog.SyncScreenToObject;
begin
  inherited;
  mObject.Thai.FirstName := edThaiName.Text;
  mObject.Thai.LastName := edThaiLastName.Text;
  mObject.English.FirstName := edEngName.Text;
  mObject.English.LastName := edEngLastName.Text;
end;

end.
