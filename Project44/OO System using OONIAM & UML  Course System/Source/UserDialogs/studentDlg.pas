unit studentDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ExtCtrls, Buttons, RefComboBox;

type
  TStudentDialog = class(TEditDialog)
    edThaiName: TLabeledEdit;
    edExtID: TLabeledEdit;
    edThaiLastName: TLabeledEdit;
    edEngName: TLabeledEdit;
    edEngLastName: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnTest: TButton;
    cmbRefCourse: TReferenceComboBox;
    btnAvg: TButton;
    procedure btnTestClick(Sender: TObject);
    procedure btnAvgClick(Sender: TObject);
  private
    procedure SyncObjectToScreen;override;
    procedure SyncScreenToObject;override;
  public
    mObject : Variant;
    class function Edit(oid : string) : boolean;
    class function NewStudent(_parent : string) : Variant;
  end;

var
  StudentDialog: TStudentDialog;

implementation

uses Cache, constant, CacheObject_TLB, ArrayOfObjects_TLB,
  User_Category_TLB;

{$R *.dfm}

{ TStudentDialog }

class function TStudentDialog.Edit(oid: string): boolean;
var rs : ResultSet;
begin
  if not assigned(StudentDialog) then StudentDialog := TStudentDialog.Create(Application);
  with StudentDialog do
  try
    cmbRefCourse.ClearItems;
    mObject := Cache.OpenObject(STUDENT_CLASS,oid);
    rs := Cache.Query(COURSE_CLASS,QUERY_IS_OF);
    rs.Execute(mObject.IsOf.SYS_id,'','','','','','','','','','','','','','','');
    while rs.Next do
      cmbRefCourse.AddNew(String(rs.GetData(1)),String(rs.GetData(2)));
    rs.Close;
    SyncObjectToScreen;
    if ShowModal = mrOK then
    begin
      SyncScreenToObject;
      mObject.CourseRefSetObjectId(cmbRefCourse.strReference);

      mObject.SYS_Save(0);
      mObject.SYS_Close;
      result := true;
    end
    else
    begin
      mObject.SYS_Close;
      result := false;
    end
  except
    result := false;
  end;
end;

class function TStudentDialog.NewStudent(_parent: string): Variant;
var rs : ResultSet;
begin
  if not assigned(StudentDialog) then StudentDialog := TStudentDialog.Create(Application);
  with StudentDialog do
  try
    cmbRefCourse.ClearItems;
    rs := Cache.Query(COURSE_CLASS,QUERY_IS_OF);
    rs.Execute(_parent,'','','','','','','','','','','','','','','');
    while rs.Next do
      cmbRefCourse.AddNew(String(rs.GetData(1)),String(rs.GetData(2)));
    rs.Close;
    if ShowModal = mrOK then
    begin
      mObject := Cache.NewObject(STUDENT_BACHELOR_CLASS);
      SyncScreenToObject;
      mObject.CourseRefSetObjectId(cmbRefCourse.strReference);
      mObject.IsOfSetObjectId(_parent);
      mObject.SYS_Save(0);
      mObject.SYS_Close;
      result := mobject;
    end
    else result := NULL;
  except
    result := NULL;
  end;

end;

procedure TStudentDialog.SyncObjectToScreen;
begin
  inherited;
  label2.Caption := mObject.IsOf.ThaiName + ',' + mObject.IsOf.IsOf.ThaiName;
  edExtID.Text := mObject.ExtStudentID;
  edThaiName.Text := mObject.Thai.Name;
  edThaiLastName.Text := mObject.Thai.Surname;
  edEngName.Text := mObject.English.Name;
  edEngLastName.Text := mObject.English.Surname;
  cmbRefCourse.FindReference(mObject.CourseRef.SYS_id);
end;

procedure TStudentDialog.SyncScreenToObject;
begin
  inherited;
  mObject.ExtStudentID := edExtID.Text;
  mObject.Thai.Name := edThaiName.Text;
  mObject.Thai.Surname := edThaiLastName.Text;
  mObject.English.Name := edEngName.Text;
  mObject.English.Surname := edEngLastName.Text;
end;

procedure TStudentDialog.btnTestClick(Sender: TObject);
var YesOrNo : integer;
    res : string;
    obj : Variant;
    avgMajor : single;
    ptrCat : Category;
    cats : SYS_ArrayOfObjects;
begin
  inherited;
//  mObject.CourseRefSetObjectId(cmbRefCourse.strReference);
  obj := mObject.CourseRef;
  cats := SYS_ArrayOfObjects(IUnknown(obj.Categories));
  ptrCat := Category(cats.GetAt('2'));
  avgMajor := ptrCat.MinAvg;
  YesOrNo :=  obj.Examine(mObject.SYS_id,obj.SYS_id,avgMajor,0);
  if YesOrNo = 1
  then res := 'จบหลักสูตร'
  else res := 'ไม่จบหลักสูตร';
  MessageDlg(res,mtInformation,[mbOK],0);
end;

procedure TStudentDialog.btnAvgClick(Sender: TObject);
begin
  inherited;
  ShowMessage('คะแนนเฉลี่ย เท่ากับ '+FloatToStr(mObject.GetAverage(mObject.SYS_id,mObject.CourseRef.SYS_id)));
end;

end.
