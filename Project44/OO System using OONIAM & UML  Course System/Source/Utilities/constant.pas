unit constant;

interface

const PROGRAMNAME = 'TOPAZ';

  FACULTY_CLASS = 'User.Faculty';

  DEPARTMENT_CLASS = 'User.Department';

  COURSE_CLASS = 'User.Course';
  COURSE_BACHELOR_CLASS = 'User.CourseBachelor';
  COURSE_MASTER_CLASS = 'User.CourseMaster';
  COURSE_DOCTOR_CLASS = 'User.CourseDoctor';

  STUDENT_CLASS = 'User.Student';
  STUDENT_BACHELOR_CLASS = 'User.StudentBachelor';
  STUDENT_MASTER_CLASS = 'User.StudentMaster';
  STUDENT_DOCTOR_CLASS = 'User.StudentDoctor';

  SUBJECT_CLASS = 'User.Subject';
  SUBJECT_BACHELOR_CLASS = 'User.SubjectBachelor';
  SUBJECT_MASTER_CLASS = 'User.SubjectMaster';
  SUBJECT_DOCTOR_CLASS = 'User.SubjectDoctor';

  TEACHER_CLASS = 'User.Teacher';

  RESULTTYPE_CLASS = 'User.ResultType';
  WORKDAY_CLASS = 'User.WorkDay';
  POSEDU_CLASS = 'User.PositionEducation';
  PERIOD_CLASS = 'User.Period';

  CATEGORY_CLASS = 'User.Category';
  SUBJECTGRP_CLASS = 'User.SubjectGrp';
  QUERY_DETAILS = 'QueryDetails';
  QUERY_IS_OF = 'QueryIsOf';
  
var DEFAULTINTERFACE : boolean;

implementation
uses registry,windows, MyUnits;

procedure Init;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_USERS;
    if OpenKey('.DEFAULT\SOFTWARE\Millennium.2001',false)
    then DEFAULTINTERFACE := IIF(ReadInteger('Default Interface')=0,false,true)
    else DEFAULTINTERFACE := true;
    CloseKey;
    Free;
  except
    DEFAULTINTERFACE := true;
    Free;
  end;
end;


initialization
  init;
end.
