unit selecSchDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, RefComboBox, Buttons, ExtCtrls, User_SubCourse_TLB;

type
  TSelectSchDialog = class(TEditDialog)
    cmbRefTeacher: TReferenceComboBox;
    cmbRefDay: TReferenceComboBox;
    cmbRefPeriod: TReferenceComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSection: TLabeledEdit;
    edStudentNum: TLabeledEdit;
  private
    { Private declarations }
    procedure LoadParams(_parent : string);
  public
    class function AddNew(_parent : string) : Variant;
  end;

var
  SelectSchDialog: TSelectSchDialog;

implementation

uses Cache, CacheObject_TLB, constant, User_Teacher_TLB;



{$R *.dfm}

{ TSelectSchDialog }

class function TSelectSchDialog.AddNew( _parent : string): Variant;
var obj,obj2 : Variant;
begin
  if not assigned(SelectSchDialog) then SelectSchDialog := TSelectSchDialog.Create(Application);
  with SelectSchDialog do
  try
    LoadParams(_parent);
    if ShowModal = mrOK then
    begin
      obj := Cache.NewObject('User.SubCourse');
      obj.SectionNo := StrToInt(edSection.Text);
      obj.StudentInClass := StrToInt(edStudentNum.Text);
      obj.TeacherSetObjectId(cmbRefTeacher.strReference);
      obj.Schedule.DaySetObjectId(cmbRefDay.strReference);
      obj.Schedule.PeriodSetObjectId(cmbRefPeriod.strReference);

      obj.SYS_Save(0);
      result := obj;
    end
    else result := NULL;
  except
    result := NULL;
  end;
end;

procedure TSelectSchDialog.LoadParams;
var rs : ResultSet;
begin
  cmbRefDay.ClearItems;
  cmbRefPeriod.ClearItems;
  cmbRefTeacher.ClearItems;
  rs := Cache.Query(WORKDAY_CLASS,QUERY_DETAILS);
  rs.Execute('','','','','','','','','','','','','','','','');
  while rs.Next do
    cmbRefDay.AddNew(rs.GetData(1),rs.GetData(2) + ' ('+ rs.GetData(3) + ')');
  rs.Close;

  rs := Cache.Query(PERIOD_CLASS,QUERY_DETAILS);
  rs.Execute('','','','','','','','','','','','','','','','');
  while rs.Next do
    cmbRefPeriod.AddNew(String(rs.GetData(1)),TimeToStr(rs.GetData(3)) +'-'+ TimeToStr(rs.GetData(4)));
  rs.Close;

  rs := Cache.Query(TEACHER_CLASS,QUERY_IS_OF);
  rs.Execute(_parent,'','','','','','','','','','','','','','','');
  while rs.Next do
    cmbRefTeacher.AddNew(rs.GetData(1),rs.GetData(4) + rs.GetData(2) + ' '+ rs.GetData(3));
  rs.Close;
end;

end.
