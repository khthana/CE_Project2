unit programDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ExtCtrls, ComCtrls, Buttons, RefComboBox,
  User_Course_TLB, User_Department_TLB,ArrayOfObjects_TLB, User_Faculty_TLB, User_Category_TLB, User_SubjectGrp_TLB;

type
  TProgramDialog = class(TEditDialog)
    PageControl: TPageControl;
    shtDescription: TTabSheet;
    shtSpec: TTabSheet;
    cmbClassRef: TReferenceComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    grbThai: TGroupBox;
    edThaiFullName: TLabeledEdit;
    edThaiName: TLabeledEdit;
    edThaiShortName: TLabeledEdit;
    grpEnglish: TGroupBox;
    edEngFullName: TLabeledEdit;
    edEngName: TLabeledEdit;
    edEngShortName: TLabeledEdit;
    shtSubject: TTabSheet;
    Label4: TLabel;
    ReferenceComboBox1: TReferenceComboBox;
    Label5: TLabel;
    memObjective: TMemo;
    edPreGraduate: TLabeledEdit;
    edExtCourseID: TLabeledEdit;
    edPeriod: TLabeledEdit;
    edRequire: TLabeledEdit;
    lstSubject: TListView;
    cmbCatRef: TReferenceComboBox;
    cmbGrpRef: TReferenceComboBox;
    btnCatAdd: TSpeedButton;
    btnCatDelete: TSpeedButton;
    btnGrpAdd: TSpeedButton;
    btnGrpDelete: TSpeedButton;
    btnSubjectAdd: TSpeedButton;
    btnSubjectDelete: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    edSubRequire: TLabeledEdit;
    edMinAvg: TLabeledEdit;
    edAllMinAvg: TLabeledEdit;
    procedure cmbCatRefClick(Sender: TObject);
    procedure btnSubjectAddClick(Sender: TObject);
    procedure cmbGrpRefClick(Sender: TObject);
  private
    //tmpObj : Variant;
    mObject : Variant;
    ptrCat : Category;
    ptrGrp : SubjectGrp;
    ptrSubjects : SYS_ArrayOfObjects;
    procedure SyncObjectToScreen;override;
    procedure SyncScreenToObject;override;
    procedure ClearScreen;override;
  public
    class function Edit(oid : string): boolean;
    class function NewProgram(_parent : string) : Variant;
  end;

var
  ProgramDialog: TProgramDialog;

implementation

uses CacheObject_TLB, constant,  Cache,
  User_CourseDescription_TLB, selectSubjectDlg;

{$R *.dfm}

{ TProgramDialog }

class function TProgramDialog.Edit(oid: string): boolean;
var
  rs : ResultSet;
  id : wideString;
  mClass : string;
  dummy : Variant;
begin
  if not assigned(ProgramDialog) then ProgramDialog := TProgramDialog.Create(Application);
  with ProgramDialog do
  try

    mObject := NULL;
    mObject := Cache.OpenObject(COURSE_CLASS,oid);

    // get inherite class
    mClass := mObject.GetClassName;

    // get parent of course
    label3.Caption := mObject.IsOf.ThaiName + ',' + mObject.IsOf.IsOf.ThaiName;
    mObject.Sys_Close;


    // SyncObjectToControl
    SyncObjectToScreen;

    cmbClassRef.Enabled := false;
    cmbClassRef.AddNew(0,mClass);
    cmbClassRef.ItemIndex := 0;
    // end sync

    shtSubject.Enabled := true;

    if ShowModal = mrOK then // apply changed
    begin
      // SyncControlToObject
      SyncScreenToObject;

      ptrGrp.SYS_Close;
      ptrCat.SYS_Close;
      mObject.Sys_Save(0);
      Result := true;
    end
    else Result := false;
    mObject.Sys_Close;
  except

  end;
end;

class function TProgramDialog.NewProgram(_parent : string): Variant;
var
  rs : ResultSet;
  id : wideString;
  tmp : Department;
  cats,grps : SYS_ArrayOfObjects;
  cat : Category;
  grp : SubjectGrp;
begin
  if not assigned(ProgramDialog) then ProgramDialog := TProgramDialog.Create(Application);
  with ProgramDialog do
  try
    // load template classes
      cmbClassRef.ClearItems;
      cmbClassRef.AddNew(COURSE_BACHELOR_CLASS,'หลักสูตรปริญญาตรี (มาตรฐาน)');
      cmbClassRef.AddNew(COURSE_MASTER_CLASS,'หลักสูตรปริญญาโท (มาตรฐาน)');
      cmbClassRef.AddNew(COURSE_DOCTOR_CLASS,'หลักสูตรปริญญาเอก (มาตรฐาน)');
      cmbClassRef.Enabled := true;
      rs := Cache.Query('User.mCustomize',QUERY_DETAILS);
      rs.Execute('1','','','','','','','','','','','','','','','');
      while rs.Next do
      begin
        cmbClassRef.AddNew(String(rs.GetData(2)),String(rs.GetData(4)));
      end;
      rs.Close;
    //

    tmp := Department(Cache.OpenObjectI(DEPARTMENT_CLASS,_parent));
    label3.Caption := tmp.ThaiName + ',' + Faculty(tmp.IsOf).ThaiName;
    tmp.Sys_Close;

    // set controls empty
    ClearScreen;

    shtSubject.Enabled := false;
    if ShowModal = mrOK then
    begin
      mObject := NULL;
      Caption := cmbClassRef.strReference;
      mObject := Cache.NewObject(cmbClassRef.strReference);

      cats := SYS_ArrayOfObjects(IUnknown(mObject.Categories));
      cat := Category(Cache.NewObjectI(CATEGORY_CLASS));
      cat.Name := 'Core Course';
      cat.Required := 0;
      cat.MinAvg := 0;
      grps := SYS_ArrayOfObjects(IUnknown(cat.SubjectGrps));
      grp := SubjectGrp(Cache.NewObjectI(SUBJECTGRP_CLASS));

      grp.Required := 0;
      grp.Name := 'General';
      grp.MinAvg := 0;
      grps.SetAt(grp,'1');
      cats.SetAt(cat,'1');

      cat := Category(Cache.NewObjectI(CATEGORY_CLASS));
      cat.Name := 'Major Course';
      cat.Required := 0;
      cat.MinAvg := 0;
      grps := SYS_ArrayOfObjects(IUnknown(cat.SubjectGrps));
      grp := SubjectGrp(Cache.NewObjectI(SUBJECTGRP_CLASS));

      grp.Required := 0;
      grp.Name := 'Major Elective';
      grp.MinAvg := 0;
      grps.SetAt(grp,'1');
      cats.SetAt(cat,'2');

      mObject.IsOfSetObjectID (_parent);

      SyncScreenToObject;

      mObject.Sys_Save(0);

      Result := mObject;
    end
    else Result := NULL;

  except

  end;
end;


procedure TProgramDialog.SyncObjectToScreen;
var i : smallint;
    key : WideString;
    categories,groups : SYS_ArrayOfObjects;
    cate : Category;
    grp : SubjectGrp;
begin
  inherited;
  edThaiFullName.Text := mObject.Thai.FullName;
  edThaiName.Text := mObject.Thai.Name;
  edThaiShortName.Text := mObject.Thai.ShortName;
  edEngFullName.Text := mObject.English.FullName;
  edEngName.Text := mObject.English.Name;
  edEngShortName.Text := mObject.English.ShortName;
  edRequire.Text := IntToStr('0'+mObject.Require);
  edPeriod.Text := IntToStr('0'+mObject.Period);
  edAllMinAvg.Text := FloatToStr('0' + mObject.MinAvg);
  lstSubject.Items.Clear;
  // array
  key := '';
  cmbCatRef.ClearItems;
  categories := SYS_ArrayOfObjects( IUnknown(mObject.Categories));
  cate := Category(categories.GetNext(key));
	while Length(key) > 0 do
  begin
    cmbCatRef.AddNew(trim(key),cate.Name);
    cate := Category(categories.GetNext(key));
  end;
  cmbCatRef.FindReference('1');
  cmbCatRefClick(nil);
end;

procedure TProgramDialog.SyncScreenToObject;
begin
  inherited;
    //mObject.SetCourseLevel;

    mObject.Thai.FullName := edThaiFullName.Text;
    mObject.Thai.Name := edThaiName.Text;
    mObject.Thai.ShortName := edThaiShortName.Text;
    mObject.English.FullName := edEngFullName.Text;
    mObject.English.Name := edEngName.Text;
    mObject.English.ShortName := edEngShortName.Text;

    mObject.Require := StrToFloat(edRequire.Text);
    mObject.Period := StrToInt(edPeriod.Text);
    mObject.MinAvg := StrToFloat(edAllMinAvg.Text);
  if ptrCat <> nil then
  begin
    ptrCat.Required := StrToFloat('0'+edSubRequire.Text);
    ptrCat.MinAvg := StrToFloat('0'+edMinAvg.Text);
    ptrCat.SYS_Save(0);
  end;
end;

procedure TProgramDialog.cmbCatRefClick(Sender: TObject);
var tmpCat,tmpGrp : SYS_ArrayOfObjects;
begin
  inherited;

  tmpCat := SYS_ArrayOfObjects(IUnknown(mObject.Categories));

  if ptrCat <> nil then
  begin
    ptrCat.Required := StrToFloat('0'+edSubRequire.Text);
    ptrCat.MinAvg := StrToFloat('0'+edMinAvg.Text);
    ptrCat.SYS_Save(0);
  end;
  if ptrGrp <> nil then
  begin
    ptrGrp.SYS_Save(0);
  end;
  ptrCat := Category(tmpCat.GetAt(cmbCatRef.strReference));
  tmpGrp := SYS_ArrayOfObjects(IUnknown(ptrCat.SubjectGrps));
  ptrGrp := SubjectGrp(tmpGrp.GetAt('1'));
  cmbGrpRef.ClearItems;
  cmbGrpRef.AddNew('1',ptrGrp.Name);
  cmbGrpRef.FindReference('1');

  edSubRequire.Text := FloatToStr(ptrCat.Required);
  edMinAvg.Text := FloatToStr(ptrCat.MinAvg);
  cmbGrpRefClick(nil);
end;

procedure TProgramDialog.btnSubjectAddClick(Sender: TObject);
var res : string;
    obj : Variant;
    lst : TListItem;
begin
  inherited;
  res := TSelectSubjectDialog.Select(SUBJECT_CLASS);
  if res <> '' then
  begin
    obj := Cache.OpenObject(SUBJECT_CLASS,res);
    ptrSubjects.SetAt(obj,obj.SYS_id);
    lst := lstSubject.Items.Add;
    lst.Caption := obj.ExtSubjectId;
    lst.SubItems.Add(obj.Thai.Name);
    lst.SubItems.Add(FloatToStr(obj.Credit));
  end;
end;

procedure TProgramDialog.cmbGrpRefClick(Sender: TObject);
var lst : TListItem;
    obj : Variant;
    key : WideString;
begin
  inherited;
  lstSubject.Items.Clear;
  ptrSubjects := SYS_ArrayOfObjects(ptrGrp.Subjects);
  obj := ptrSubjects.GetNext(key);
	while Length(key) > 0 do
  begin
    lst := lstSubject.Items.Add;
    lst.Caption := obj.ExtSubjectId;
    lst.SubItems.Add(String(obj.Thai.Name));
    lst.SubItems.Add(FloatToStr(obj.Credit));
    lst.SubItems.Add(String(obj.SYS_id));
    obj := ptrSubjects.GetNext(key);
  end;

end;

procedure TProgramDialog.ClearScreen;
begin
  inherited;
  edThaiFullName.Text := '';
  edThaiName.Text := '';
  edThaiShortName.Text := '';
  edEngFullName.Text := '';
  edEngName.Text := '';
  edEngShortName.Text := '';
  edRequire.Text := '0';
  edPeriod.Text := '0';
  edAllMinAvg.Text := '0';
  edMinAvg.Text := '0';
  edSubRequire.Text := '0';
  lstSubject.Items.Clear;
  cmbCatRef.ClearItems;
end;

end.

