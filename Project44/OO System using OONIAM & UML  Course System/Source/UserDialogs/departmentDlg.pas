unit departmentDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ExtCtrls, Buttons, ComCtrls,  User_Department_TLB,
  User_Faculty_TLB;

type
  TDepartmentDialog = class(TEditDialog)
    edThaiName: TLabeledEdit;
    edEnglishName: TLabeledEdit;
    ListView: TListView;
  private

  public
    class function NewDepartment(_parent : string) : Department;
    class function Edit(oid : string) : boolean;
  end;

var
  DepartmentDialog: TDepartmentDialog;

implementation

uses constant, CacheObject_TLB, Cache;

{$R *.dfm}

{ TDepartmentDialog }

class function TDepartmentDialog.Edit(oid: string): boolean;
var mObject : Department ;
    rs : IResultSet;
    lst : TListItem;
begin
  if not assigned(DepartmentDialog) then DepartmentDialog := TDepartmentDialog.Create(Application);
  with DepartmentDialog do
  try
    mObject := Department(Cache.OpenObjectI(DEPARTMENT_CLASS,oid));
    edThaiName.Text := mObject.ThaiName;
    edEnglishName.Text := mObject.EnglishName;
    Caption := Faculty(mObject.IsOf).ThaiName;
    listview.Items.Clear;

    rs := Cache.Query( COURSE_CLASS, QUERY_IS_OF);
    with rs do
    try
      Execute(Oid,'','','','','','','','','','','','','','','');
      while Next do
      begin
        lst := listview.Items.Add;
        lst.Caption := GetData(2);
        case StrToInt(GetData(4)) of
        1:lst.SubItems.Add('ปริญญาบัณฑิต');
        2:lst.SubItems.Add('ปริญญามหาบัณฑิต');
        3:lst.SubItems.Add('ปริญญาเดุษฎีบัณฑิต');
        end;
        lst.SubItems.Add(GetData (1));
        lst.ImageIndex := 15;
  		end;
      Close;
    except
      Close;
    end;

    if ShowModal = mrOK then
    begin
      mObject.ThaiName := edThaiName.Text;
      mObject.EnglishName := edEnglishName.Text;
      mObject.Sys_Save(1);
      Result := true;
    end
    else Result := false;
  except
    Result := false;
  end;
end;

class function TDepartmentDialog.NewDepartment(_parent : string): Department;
var mObject : Department;
begin
  if not assigned(DepartmentDialog) then DepartmentDialog := TDepartmentDialog.Create(Application);
  with DepartmentDialog do
  try
    edThaiName.Text := '';
    edEnglishName.Text := '';
    listview.Items.Clear;
    if ShowModal = mrOK then
    begin
      mObject := Department(Cache.NewObjectI(DEPARTMENT_CLASS));
      mObject.ThaiName := edThaiName.Text;
      mObject.EnglishName := edEnglishName.Text;
      mObject.IsOfSetObjectID(_parent);
      mObject.Sys_Save(1);
      Result := mObject;
    end
    else Result := nil;
  except
    Result := nil;
  end;
end;


end.
