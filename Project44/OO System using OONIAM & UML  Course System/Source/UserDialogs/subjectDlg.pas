unit subjectDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, ComCtrls, StdCtrls, ExtCtrls, Buttons, RefComboBox,
  User_Subject_TLB, User_SubjectDescription_TLB;

type
  TSubjectDialog = class(TEditDialog)
    edThaiCode: TLabeledEdit;
    edThaiName: TLabeledEdit;
    edEnglishCode: TLabeledEdit;
    edEnglishName: TLabeledEdit;
    edCredit: TLabeledEdit;
    Label1: TLabel;
    lblSubjectTo: TLabel;
    edExtID: TLabeledEdit;
    PageControl1: TPageControl;
    shtPrereq: TTabSheet;
    shtSubCourse: TTabSheet;
    lstPrereq: TListView;
    lstSubCourse: TListView;
    Label3: TLabel;
    cmbClassRef: TReferenceComboBox;
    shtPosGrd: TTabSheet;
    lstPosGrd: TListView;
    Memo1: TMemo;
    btnAssignNew: TSpeedButton;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    btnAssignSubCourse: TSpeedButton;
    btnDeleteSubCourse: TSpeedButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnAssignSubCourseClick(Sender: TObject);
  private
    mObject : Variant;
    procedure SyncObjectToScreen;override;
    procedure SyncScreenToObject;override;
    procedure ClearScreen;override;
    procedure UpdateOptions;
  public
    class function Edit(oid : string): boolean;
    class function NewSubject(_parent : string) : Variant;
  end;

var
  SubjectDialog: TSubjectDialog;

implementation

uses resultDlg, Cache, constant, CacheObject_TLB, ArrayOfObjects_TLB,
  selectSubjectDlg, User_Department_TLB, User_Faculty_TLB,
  User_ResultType_TLB, User_SubjectBachelor_TLB, selecSchDlg,
  User_SubCourse_TLB, User_Teacher_TLB;

{$R *.dfm}

{ TSubjectDialog }

procedure TSubjectDialog.ClearScreen;
begin
  edExtID.Text := '';
  edThaiCode.Text := '';
  edThaiName.Text := '';
  edEnglishCode.Text := '';
  edEnglishName.Text := '';
  edCredit.Text := '';
  lstPrereq.Items.Clear;
  lstSubCourse.Items.Clear;
end;

class function TSubjectDialog.Edit(oid: string): boolean;
var mClass : string;
begin
  if not assigned(SubjectDialog) then SubjectDialog := TSubjectDialog.Create(Application);
  with SubjectDialog do
  try

    UpdateOptions;

    mObject := NULL;
    mObject := Cache.OpenObject(SUBJECT_CLASS,oid);

    // get inherite class
    mClass := mObject.GetClassName;

    mObject.Sys_Close;

    // re-open
    mObject := null;
    mObject := (Cache.OpenObject(mClass,oid));

    cmbClassRef.Enabled := false;
    cmbClassRef.AddNew(0,mClass);
    cmbClassRef.ItemIndex := 0;

    SyncObjectToScreen;

    lblSubjectTo.Caption := mObject.IsOf.ThaiName + ',' + mObject.IsOf.IsOf.ThaiName;

    if ShowModal = mrOK then
    begin

      SyncScreenToObject;

      mObject.Sys_Save(0);
    end;
  except

  end;
end;

class function TSubjectDialog.NewSubject(_parent: string): Variant;
var dep : Department;
    rs : ResultSet;
begin
  if not assigned(SubjectDialog) then SubjectDialog := TSubjectDialog.Create(Application);
  with SubjectDialog do
  try
    // load template classes
      cmbClassRef.ClearItems;
      cmbClassRef.AddNew(SUBJECT_BACHELOR_CLASS,'รายวิชาปริญญาตรี (มาตรฐาน)');
      cmbClassRef.AddNew(SUBJECT_MASTER_CLASS,'รายวิชาปริญญาโท (มาตรฐาน)');
      cmbClassRef.AddNew(SUBJECT_DOCTOR_CLASS,'รายวิชาปริญญาเอก (มาตรฐาน)');
      cmbClassRef.Enabled := true;
      rs := Cache.Query('User.mCustomize',QUERY_DETAILS);
      rs.Execute('2','','','','','','','','','','','','','','','');
      while rs.Next do
      begin
        cmbClassRef.AddNew(String(rs.GetData(2)),String(rs.GetData(4)));
      end;
      rs.Close;
    //
    dep := Department(Cache.OpenObjectI(DEPARTMENT_CLASS,_parent));
    lblSubjectTo.Caption := dep.ThaiName + ',' + Faculty(dep.IsOf).ThaiName;
    dep.Sys_Close;

    UpdateOptions;

    ClearScreen;

    if ShowModal = mrOK then
    begin
      mObject := Cache.MyFactory.New(cmbClassRef.strReference,'0');
//      mObject := (Cache.NewObject(cmbClassRef.strReference));

      SyncScreenToObject;

      mObject.IsOfSetObjectID(_parent);
      mObject.Sys_Save(0);
    end;
  except

  end;
end;

procedure TSubjectDialog.SyncObjectToScreen;
var subjects,posGrds,subcourses : SYS_ArrayOfObjects;
    subject,posgrd,subcourse : Variant;
    key : WideString;
    item : TListItem;
begin
  inherited;
  // single value
  edExtID.Text := mObject.ExtSubjectID;
  edThaiCode.Text := mObject.Thai.Code;
  edThaiName.Text := mObject.Thai.Name;
  edEnglishCode.Text := mObject.English.Code;
  edEnglishName.Text := mObject.English.Name;
  edCredit.Text := FloatToStr(mObject.Credit);

  // array value
  posGrds := SYS_ArrayOfObjects( IUnknown( mObject.PossibleGrades));
  key := '';
  posgrd := posGrds.GetNext(key);
	while Length(key) > 0 do
  begin
    item := lstPosGrd.FindCaption(-1,posgrd.Display,false,false,false);
    if item <> nil then item.Checked := true;
		posgrd := posGrds.GetNext( key);
  end;
  posgrds.SYS_Close;

  lstPrereq.Items.Clear;
  subjects := SYS_ArrayOfObjects( IUnknown( mObject.PreRequisites));
  key := '';
  subject := subjects.GetNext( key );
  while Length(key) > 0 do
  begin
    item := lstPrereq.Items.Add;
    item.Caption := subject.Thai.Code;
    item.SubItems.Add( subject.Thai.Name );
    item.SubItems.Add( subject.Sys_Oid );
    subject := subjects.GetNext(key);
  end;
  subjects.SYS_CLose;

  lstSubCourse.Items.Clear;
  subcourses := SYS_ArrayOfObjects( IUnknown( mObject.SubCourses));
  key := '';
  subcourse := subcourses.GetNext(key);
  while Length(key) > 0 do
  begin
    item := lstSubcourse.Items.Add;
    item.Caption := subcourse.SectionNo;
    item.SubItems.Add( subcourse.Teacher.Thai.FirstName + '   ' +subcourse.Teacher.Thai.LastName );
    item.SubItems.Add( subject.Sys_Oid );
    subcourse := subcourses.GetNext(key);
  end;
  subcourses.SYS_Close;

end;

procedure TSubjectDialog.SyncScreenToObject;
var
    subj : Variant;
    grd : ResultType;
    subjects,grds : SYS_ArrayOfObjects;
    i : integer;
begin
  inherited;
  try
    // single value
//    mObject.SetSubjectLevel;
    mObject.ExtSubjectID := edExtID.Text;
    (mObject.Thai).Code := edThaiCode.Text;
    (mObject.Thai).Name := edThaiName.Text;
    (mObject.English).Code := edEnglishCode.Text;
    (mObject.English).Name := edEnglishName.Text;
    mObject.Credit := StrToFloat(edCredit.Text);

    // array value
    grds := SYS_ArrayOfObjects(IUnknown(mObject.PossibleGrades));
    grds.Clear;
    for i := 0 to lstPosGrd.Items.Count -1 do
    if lstPosGrd.Items[i].Checked then
    begin
      grd := ResultType(Cache.OpenObjectI(RESULTTYPE_CLASS,IntToStr(lstPosGrd.Items[i].ImageIndex)));
      grds.SetAt(grd,grd.Display);
      grd.Sys_Close;
    end;

    subjects := SYS_ArrayOfObjects(IUnknown(mObject.Prerequisites));
    subjects.Clear;
    subjects := SYS_ArrayOfObjects( IUnknown( mObject.PreRequisites));
    for i := 0 to lstPrereq.Items.Count -1 do
    begin
      subj := Cache.OpenObject(SUBJECT_CLASS,IntToStr(lstPrereq.Items[i].ImageIndex));
      subjects.SetAt(subj,subj.ExtSubjectID);
      subj.Sys_Close;
    end;
  except

  end;
end;

procedure TSubjectDialog.UpdateOptions;
var rs : IResultSet;
    ls : TListItem;
begin
  inherited;
  rs := Cache.Query( RESULTTYPE_CLASS, QUERY_DETAILS);
  with rs do
  try
    lstPosGrd.Items.Clear;
    Execute('','','','','','','','','','','','','','','','');
    while Next do
    begin
      ls := lstPosGrd.Items.Add;
      ls.Caption := GetData(2);
      ls.SubItems.Add(GetData(3));
      ls.ImageIndex := StrToInt(GetData(1));
    end;
    Close;
  except

  end;
end;

procedure TSubjectDialog.btnAddClick(Sender: TObject);
var
    oid : string;
    lst : TListItem;
    rs : ResultSet;
begin
  inherited;
  oid := TSelectSubjectDialog.Select(cmbClassRef.strReference);
  if length(oid) > 0 then
  begin
//    obj := xdmu.MyFactory.OpenId(SUBJECT_CLASS,oid,0);
    rs := Cache.Query( SUBJECT_CLASS, 'Select');
    rs.Execute(oid,'','','','','','','','','','','','','','','');
    while rs.Next do
    begin
      lst := lstPreReq.Items.Add;
      lst.Caption := rs.GetData(2);
      lst.SubItems.Add(rs.GetData(3));
      lst.ImageIndex := StrToInt(rs.GetData(1));
    end;
    rs.Close;
  end;
end;

procedure TSubjectDialog.btnAssignSubCourseClick(Sender: TObject);
var subc : Variant;
    lst : TListItem;
begin
  inherited;
  subc := TSelectSchDialog.AddNew(mObject.IsOf.SYS_ID);
  lst := lstSubCourse.Items.Add;
  lst.Caption := IntToStr(subc.SectionNo);
  lst.SubItems.Add(subc.Teacher.Thai.FirstName + ' ' + subc.Teacher.Thai.LastName);
  lst.SubItems.Add(subc.Schedules.Day.Thai);
end;

end.
