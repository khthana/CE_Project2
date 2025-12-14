unit facultyDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ExtCtrls, Buttons;

type
  TFacultyDialog = class(TEditDialog)
    edThaiName: TLabeledEdit;
    edEnglishName: TLabeledEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    class function NewFaculty : Variant;
    class function Edit( oid : string) : boolean;
  end;

var
  FacultyDialog: TFacultyDialog;

implementation

uses CacheObject_TLB, constant, Cache, User_Faculty_TLB;

{$R *.dfm}

{ TFacultyDialog }

class function TFacultyDialog.NewFaculty: Variant;
var mObject : Faculty;
begin
  if not assigned(FacultyDialog) then FacultyDialog := TFacultyDialog.Create(Application);
  with FacultyDialog do
  try
    edThaiName.Text := '';
    edEnglishName.Text := '';
    if ShowModal = mrOK then //apply add new
    begin
      mObject := Faculty(Cache.NewObjectI(FACULTY_CLASS));
      mObject.ThaiName := edThaiName.Text;
      mObject.EnglishName := edEnglishName.Text;

      mObject.Sys_Save(0);
      Result := mObject;
    end
    else Result := NULL;
  except
    Result := NULL;
  end;
end;

class function TFacultyDialog.Edit(oid: string): boolean;
begin

end;

end.
