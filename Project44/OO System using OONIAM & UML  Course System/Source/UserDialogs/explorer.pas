unit explorer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  command, ComCtrls, ExtCtrls, Menus,
  Registry,constant, MyUnits,  Variants, Buttons;
var
    maxID : LongInt;
    RealMaxID : LongInt;

type

  TMyNode = class(TTreeNode)
    public
      ClassName : string;
      ObjectRef : string;
  end;

  TExplore = class(TCommandForm)
    treeview: TTreeView;
    listview: TListView;
    PopupMenu: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuDelete: TMenuItem;
    N3: TMenuItem;
    mnuEdit: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure nDeleteProgClick(Sender: TObject);
    procedure mnuAddClick(Sender: TObject);
    procedure mnuEditClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
  private
    showtype : smallint;
    selectedItem : TListItem;
    SchoolNode : TTreeNode;
    AllCourses : TMyNode;
    { Private declarations }

    //Dispatches
    procedure viewDblClick(Sender: TObject);
    procedure viewContext(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ViewInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure FExpandClick(Sender: TObject);

    procedure viewSelectItem(Sender: TObject; Item: TListItem;
       Selected: Boolean);
    procedure treeviewChange(Sender: TObject; Node: TTreeNode);
    procedure viewKeyPress(Sender: TObject; var Key: Char);
    procedure treeviewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure treeviewDblClick(Sender: TObject);
    procedure studentPopUpPopup(Sender: TObject);
    procedure viewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);


    //function
    function SelectView : TListView;
    procedure FAddTeacher(_parent: string);
    procedure FAddStudent(_parent: string);
    procedure FAddCourse(_parent : string);
    procedure FAddFaculty;
    procedure FAddDepartment(_parent: string);
    procedure FAddSubject(_parent : string);

    procedure FEditCourse(oid : string);
    procedure FEditDepartment(oid : string);
    procedure FEditSubject(oid : string);
    procedure FEditFaculty(oid : string);
    procedure FEditTeacher(oid : string);
    procedure FEditStudent(oid : string);

    procedure FShowCourse(Node : TTreeNode);
    procedure FShowSubject(Node: TTreeNode);
    procedure FShowClass(Node: TTreeNode);
    procedure FShowAllCourses;
    procedure FShowTeacher(Node: TTreeNode);
    procedure FShowStudent(Node: TTreeNode);
//

  public
    { Public declarations }
    constructor Create(AOwner : TComponent) ; override;
    procedure AssignDispatch;override;
    procedure MDISendCommand(cmd : cmdCustomCommand);override;
    procedure ThreadDone(Sender : TObject);
    procedure GetContext(cmd : cmdCustomCommand;menu : TPopupMenu);override;

  end;

var
  Explore: TExplore;

implementation

uses Main, Cache,CacheObject_TLB, programDlg, facultyDlg, departmentDlg,
  subjectDlg, User_Dummy_TLB, User_Department_TLB, User_Subject_TLB,
  ArrayOfObjects_TLB, studentDlg, teacherDlg, User_Teacher_TLB;



{$R *.DFM}

procedure TExplore.AssignDispatch;
begin
  inherited;
    listview.OnDblClick := viewDblClick;
    listview.OnContextPopup := viewContext;
    listview.OnSelectItem := viewSelectItem;
    listview.OnKeyPress := viewKeyPress;
    listview.OnMouseDown := viewMouseDown;
    listview.OnInfoTip := ViewInfoTip;
    treeview.OnChange := treeviewChange;
    treeview.OnContextPopup := treeviewContextPopup;
    treeview.OnDblClick :=  treeviewDblClick;
end;


procedure TExplore.ThreadDone(Sender: TObject);
begin
  AssignDispatch;
end;
// Context for listview
procedure TExplore.viewContext(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var view : TListView;
begin
  inherited;
  view := TListView(Sender);
  view.Selected := view.GetItemAt(MousePos.X,MousePos.Y);
  if view.Selected = nil then
  begin

  end;
  if view.ViewStyle = vsIcon then
  begin

  end
end;


// assign dispatch menus


procedure TExplore.FExpandClick(Sender: TObject);
begin
  inherited;
  listview.OnDblClick(listview)
end;

procedure TExplore.viewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  inherited;
  selectedItem := Item;
end;

procedure TExplore.FEditCourse;
begin
   if TProgramDialog.Edit(oid) then treeviewchange(treeview,treeview.Selected);
end;

// -- important for this module !!!
procedure TExplore.treeviewChange(Sender: TObject; Node: TTreeNode);
  var t : TTreeNode;
      l : TListItem;
      myNode : TMyNode;
begin
  inherited;
  // not last child
  setWait;
  listview.Items.BeginUpdate;
  listview.Items.Clear;
  listview.Columns.Clear;
  if Node.HasChildren then
  begin
    showtype := 1;
    listview.ViewStyle := vsIcon;
    t := Node.getFirstChild;
    while t <> nil do
    begin
      l := listview.Items.Add;
      l.Caption := t.Text;
      l.SubItems.Add(inttostr(t.Index+1));
      l.ImageIndex := 0;
      l.StateIndex := 0;
      t := t.getNextSibling;
    end;
  end
  else
  begin
    myNode := TMyNode(Node);
    if (myNode = AllCourses) and (myNode.ClassName = COURSE_CLASS) then FShowAllCourses
    else if myNode.ClassName = COURSE_CLASS then FShowCourse(Node)
    else if myNode.ClassName = SUBJECT_CLASS then FShowSubject(Node)
    else if myNode.ClassName = STUDENT_CLASS then FShowStudent(Node)
    else if myNode.ClassName = TEACHER_CLASS then FShowTeacher(Node)
  end; // else node
  listview.Items.EndUpdate;
  MyHeader.Sections[1].Text :=
       'เนื้อหาของ '+ treeview.Selected.Text
      +' ( '+inttostr(listview.Items.Count)+ ' รายการ)';
  setDefault;
end;


procedure TExplore.viewDblClick(Sender: TObject);
var view : TListView;
    t : TTreeNode;
begin
  inherited;
  view := TListView(Sender);
  if ((view.ViewStyle = vsIcon) and (view.Selected <> nil) )then
  begin
    t := treeview.Selected;
    t.Expand(false);
    t := t.getFirstChild;
    while( (t <> nil) and (t.Text <> view.Selected.Caption) )do
      t := t.getNextSibling;
    if t <> nil then
      t.Selected := true;
  end
  else if((view.ViewStyle = vsReport) and (view.Selected <> nil) )then
  begin

  end;
end;

procedure TExplore.viewKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if Key = #13 then
//    nEditStudent.Click;
end;

{ TLoading }



procedure TExplore.treeviewContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var selItem : TTreeNode;
begin
  inherited;
  selItem := treeview.GetNodeAt(MousePos.X,MousePos.Y);
end;

procedure TExplore.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin

    Key := #0;
  end
end;

procedure TExplore.treeviewDblClick(Sender: TObject);
begin

end;

procedure TExplore.studentPopUpPopup(Sender: TObject);
begin
end;




procedure TExplore.MDISendCommand(cmd: cmdCustomCommand);
begin
  inherited;
  case cmd of
    cmdAdd : if mnuAdd.Enabled then mnuAdd.Click;
    cmdOPEN : if mnuEdit.Enabled then mnuEdit.Click;
    cmdDelete : if mnuDelete.Enabled then mnuDelete.Click;
  end;
end;


procedure TExplore.GetContext(cmd: cmdCustomCommand; menu: TPopupMenu);
begin
  inherited;
  mdiSendCommand(cmd);
end;

constructor TExplore.Create(AOwner: TComponent);
var
    dummy : TMyNode;
    ndFac,ndDep : TTreeNode;
    rsFac,rsDep,rsCourse,rsSubj : ResultSet;
begin
  inherited;
//  Mainform.Status.Visible := false;
//  Mainform.StatusGauge.Visible := true;
    try
      treeview.Items.Clear;
      treeview.ShowRoot := false;
      dummy := TMyNode.Create(treeview.Items);
      dummy.Text := 'สถาบันของฉัน';
      schoolnode := treeview.Items.AddNode(dummy,nil,dummy.Text,nil,naAddChild);
      rsFac := Cache.Query( FACULTY_CLASS, QUERY_DETAILS);
      with rsFac do
      try
        Execute('','','','','','','','','','','','','','','','');

        while Next do
        begin
          dummy := TMyNode.Create(treeview.Items);
          dummy.Text := GetData(2);
          dummy.ClassName := FACULTY_CLASS;
          dummy.ObjectRef := GetData(1);
          ndFac := treeview.Items.AddNode(dummy,schoolnode,dummy.Text,nil,naAddChild);

          rsDep := Cache.Query( DEPARTMENT_CLASS, QUERY_IS_OF);
          rsDep.Execute(GetData(1) // parent department's ObjectID.
                  ,'','','','','','','','','','','','','','','');
          while rsDep.Next do
          begin
            dummy := TMyNode.Create(treeview.Items);
            dummy.Text := rsDep.GetData(2);
            dummy.ClassName := DEPARTMENT_CLASS;
            dummy.ObjectRef := rsDep.GetData(1);
            ndDep := treeview.Items.AddNode(dummy,ndFac,dummy.Text,nil,naAddChild);

              dummy := TMyNode.Create(treeview.Items);
              dummy.Text := 'หลักสูตร';
              dummy.ClassName := COURSE_CLASS;
              dummy.ObjectRef := rsDep.GetData(1);
              treeview.Items.AddNode(dummy,ndDep,dummy.Text,nil,naAddChild);

              dummy := TMyNode.Create(treeview.Items);
              dummy.Text := 'รายวิชา';
              dummy.ClassName := SUBJECT_CLASS;
              dummy.ObjectRef := rsDep.GetData(1);
              treeview.Items.AddNode(dummy,ndDep,dummy.Text,nil,naAddChild);

              dummy := TMyNode.Create(treeview.Items);
              dummy.Text := 'คณาจารย์';
              dummy.ClassName := TEACHER_CLASS;
              dummy.ObjectRef := rsDep.GetData(1);
              treeview.Items.AddNode(dummy,ndDep,dummy.Text,nil,naAddChild);

              dummy := TMyNode.Create(treeview.Items);
              dummy.Text := 'นักศึกษา';
              dummy.ClassName := STUDENT_CLASS;
              dummy.ObjectRef := rsDep.GetData(1);
              treeview.Items.AddNode(dummy,ndDep,dummy.Text,nil,naAddChild);
          end;
          rsDep.Close;
    		end;
        rsFac.Close;
        AllCourses := TMyNode.Create(treeview.Items);
        AllCourses.ImageIndex := 0;
        AllCourses.Text := 'หลักสูตรทั้งหมด';
        AllCourses.ClassName := COURSE_CLASS;
        treeview.Items.AddNode(AllCourses,schoolnode,AllCourses.Text,nil,naAddChild);
      except

      end;

        treeview.Refresh;
    except
      on E : Exception do
      begin
        ThaiDlg(e.Message,mtError,[mbCancel],0);
        setdefault;
      end
    end;
    schoolnode.ImageIndex := 2;
    schoolnode.SelectedIndex := 2;
    schoolnode.Expand(false);
    schoolnode.Selected := true;
    AssignDispatch;
    treeviewchange(treeview,treeview.Selected);
end;

procedure TExplore.viewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SelectedItem := TListView(Sender).GetItemAt(X,Y);
end;

procedure TExplore.FAddCourse;
var
  obj : Variant;
begin
  obj := TProgramDialog.NewProgram(_parent);
  if not VarIsNull(obj) then
  begin
    treeviewchange(treeview,treeview.Selected);
  end;
end;

function TExplore.SelectView: TListView;
begin
  Result := listview;
end;

procedure TExplore.ViewInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: String);
begin
  inherited;
end;

procedure TExplore.FShowCourse(Node : TTreeNode);
var
  lst : TListItem;
  hc: TListColumn;
  rs : ResultSet;
  myNode : TMyNode;
begin
  listview.ViewStyle := vsReport;
  listview.Items.Clear;
  listview.Columns.Clear;
  showtype := 2;
  hc := listview.Columns.Add;
  hc.Width := 300;
  hc.Caption := 'ชื่อหลักสูตร';
  hc := listview.Columns.Add;
  hc.Width := 150;
  hc.Caption := 'ระดับหลักสูตร';
  myNode := TMyNode(Node);
  rs := Cache.Query( myNode.ClassName, QUERY_IS_OF);

  with rs do
  try
    Execute(myNode.ObjectRef,'','','','','','','','','','','','','','','');

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
end;



procedure TExplore.FShowSubject(Node: TTreeNode);
var
  lst : TListItem;
  hc: TListColumn;
  rs : ResultSet;
  myNode : TMyNode;
begin
  listview.ViewStyle := vsReport;
  hc := listview.Columns.Add;//1
  hc.Width := 90;
  hc.Caption := 'รหัสวิชา';
  hc := listview.Columns.Add;//1
  hc.Width := 260;
  hc.Caption := 'ระดับ';
  hc := listview.Columns.Add;//1
  hc.Width := 100;
  hc.Caption := 'ระดับ';
  myNode := TMyNode(Node);
  rs := Cache.Query( myNode.ClassName, QUERY_IS_OF);

  with rs do
  try
    Execute(myNode.ObjectRef,'','','','','','','','','','','','','','','');

    while Next do
    begin
      lst := listview.Items.Add;
      lst.Caption := GetData(2);
      lst.SubItems.Add(GetData(3));
      case StrToInt(GetData(5)) of
      1:lst.SubItems.Add('บัณฑิต');
      2:lst.SubItems.Add('มหาบัณฑิต');
      3:lst.SubItems.Add('เดุษฎีบัณฑิต');
      end;
      lst.SubItems.Add(GetData(1));
    end;
    Close;
  except
    Close;
  end;
end;

procedure TExplore.FShowClass(Node: TTreeNode);
begin

end;

procedure TExplore.nDeleteProgClick(Sender: TObject);
var oid : Variant;
    obj : Variant;
    _class : string;
begin
  inherited;
  case treeview.Selected.Index of
  0 : _class := 'User.CourseBachelor';
  1 : _class := 'User.CourseMaster';
  2 : _class := 'User.CourseDoctor';
  end;
  //_class := 'User.Course';
  if selectedItem <> nil then
  begin
    obj := Cache.OpenObject(_class,listview.Selected.SubItems[1]);
    oid := WideString( obj.Sys_Oid );
    obj.Sys_DeleteID(oid);
    selectedItem.Delete;
  end;
end;

procedure TExplore.mnuAddClick(Sender: TObject);
var Node : TMyNode;
    item : TListItem;
begin
  inherited;
  Node := TMyNode(treeview.Selected);
  item := listview.Selected;
  if (Node.ClassName = COURSE_CLASS)
  or (item <> nil)and(item.Caption = 'หลักสูตร')
  then FAddCourse(node.ObjectRef)
  else if (node.ClassName = SUBJECT_CLASS)
  or (item <> nil)and(item.Caption = 'รายวิชา')
  then FAddSubject(node.ObjectRef)
  else if (node.ClassName = STUDENT_CLASS)
  or (item <> nil)and(item.Caption = 'นักศึกษา')
  then FAddStudent(node.ObjectRef)  
  else if (node.ClassName = TEACHER_CLASS)
  or (item <> nil)and(item.Caption = 'คณาจารย์')
  then  FAddTeacher(node.ObjectRef)

  else if (Node.ClassName = FACULTY_CLASS) then FAddDepartment(Node.ObjectRef)
  else if (Node = schoolnode) then FAddFaculty

end;

procedure TExplore.mnuEditClick(Sender: TObject);
var myNode : TMyNode;
begin
  inherited;
  myNode := TMyNode(treeview.Selected);
  if myNode.ClassName = COURSE_CLASS then FEditCourse(selectedItem.SubItems[selectedItem.SubItems.Count-1])
  else if myNode.ClassName = FACULTY_CLASS then FEditDepartment('')
  else if myNode.ClassName = SUBJECT_CLASS then FEditSubject(selectedItem.SubItems[selectedItem.SubItems.Count-1])
  else if myNode.ClassName = STUDENT_CLASS then FEditStudent(selectedItem.SubItems[selectedItem.SubItems.Count-1])
  else if myNode.ClassName = TEACHER_CLASS then FEditTeacher(selectedItem.SubItems[selectedItem.SubItems.Count-1])
end;

procedure TExplore.FAddFaculty;
var obj : Variant;
    lst : TListItem;
    id : string;
    dummy : TMyNode;
begin
  obj := TFacultyDialog.NewFaculty;
  if not VarIsNull(obj) then
  begin
    lst := listview.Items.Add;
    lst.Caption := obj.ThaiName;
    dummy := TMyNode.Create(treeview.Items);
    dummy.Text := obj.ThaiName;
    dummy.ClassName := FACULTY_CLASS;
    dummy.ObjectRef := obj.Sys_Oid;
    treeview.Items.AddNode(dummy,schoolnode,dummy.Text,nil,naAddChild);

    obj.Sys_Close;
  end;
end;

procedure TExplore.FAddDepartment(_parent: string);
var obj : Department;
    dummy,node : TMyNode;

begin
  obj := TDepartmentDialog.NewDepartment(_parent);
  if not VarIsNull(obj) then
  begin
    //ShowMessage(String(obj.Sys_id));
    node := TMyNode.Create(treeview.Items);
    node.Text := obj.ThaiName;
    node.ClassName := DEPARTMENT_CLASS;
    node.ObjectRef := obj.Sys_id;

    treeview.Items.AddNode(node,treeview.Selected,node.Text,nil,naAddChild);

    dummy := TMyNode.Create(treeview.Items);
    dummy.Text := 'หลักสูตร';
    dummy.ClassName := COURSE_CLASS;
    dummy.ObjectRef := obj.Sys_id;
    treeview.Items.AddNode(dummy,node,dummy.Text,nil,naAddChild);

    dummy := TMyNode.Create(treeview.Items);
    dummy.Text := 'รายวิชา';
    dummy.ClassName := SUBJECT_CLASS;
    dummy.ObjectRef := obj.Sys_id;
    treeview.Items.AddNode(dummy,node,dummy.Text,nil,naAddChild);

    dummy := TMyNode.Create(treeview.Items);
    dummy.Text := 'คณาจารย์';
    dummy.ClassName := TEACHER_CLASS;
    dummy.ObjectRef := obj.Sys_id;
    treeview.Items.AddNode(dummy,node,dummy.Text,nil,naAddChild);

    dummy := TMyNode.Create(treeview.Items);
    dummy.Text := 'นักศึกษา';
    dummy.ClassName := STUDENT_CLASS;
    dummy.ObjectRef := obj.Sys_id;
    treeview.Items.AddNode(dummy,node,dummy.Text,nil,naAddChild);
  end;
end;

procedure TExplore.FEditDepartment;
var item : TTreeNode;
    obj : Variant;
begin
  item := treeview.Selected.getFirstChild;
  while item.Text <> listview.Selected.Caption do
    item := item.getNextSibling;
  if TDepartmentDialog.Edit(TMyNode(item).ObjectRef) then
  begin
    obj := Cache.OpenObject(DEPARTMENT_CLASS,TMyNode(item).ObjectRef);
    item.Text := obj.ThaiName;
    obj.Sys_Close;
    treeviewchange(treeview,treeview.Selected);
  end;
end;

procedure TExplore.FShowAllCourses;
var
  ls : TListItem;
  hc: TListColumn;
  rs : ResultSet;
  myNode : TMyNode;
begin
  listview.ViewStyle := vsReport;
  listview.Items.Clear;
  listview.Columns.Clear;
  showtype := 2;
  hc := listview.Columns.Add;
  hc.Width := 300;
  hc.Caption := 'ชื่อหลักสูตร';
  hc := listview.Columns.Add;
  hc.Width := 150;
  hc.Caption := 'ภาควิชา';
  myNode := AllCourses;
  //rs := ResultSet( xdmu.myFactory.ResultSet( DEPARTMENT_CLASS, 'CourseCount'));
  //rs.Execute(myNode.ObjectRef,'','','','','','','','','','','','','','','');
  //ShowMessage(InttoStr(rs.GetData(2)) + ':' + myNode.ObjectRef);
  //rs.Close;
  rs := Cache.Query( myNode.ClassName, QUERY_DETAILS);

  with rs do
  try
    Execute('','','','','','','','','','','','','','','','');
    while Next do
    begin
      ls := listview.Items.Add;
      ls.Caption := GetData(2);
      case StrToInt(GetData(4)) of
      1:ls.SubItems.Add('ปริญญาบัณฑิต');
      2:ls.SubItems.Add('ปริญญามหาบัณฑิต');
      3:ls.SubItems.Add('ปริญญาเดุษฎีบัณฑิต');
      end;
      ls.SubItems.Add(GetData (1));
      ls.ImageIndex := 15;
		end;
    Close;
  except
    Close;
  end;
end;

procedure TExplore.PopupMenuPopup(Sender: TObject);
var node : TMyNode;
    item : TListItem;
begin
  inherited;
  node := TMyNode(treeview.Selected);
  item := listview.Selected;
  if node = schoolnode then
  begin // faculty
    mnuAdd.Caption := 'สร้า้งคณะ...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขคณะ...';
  end
  else if node.ClassName = FACULTY_CLASS then
  begin // department
    mnuAdd.Caption := 'สร้า้งภาควิชา...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขภาควิชา...';
  end
  else if (node.ClassName = COURSE_CLASS)
  or (item <> nil)and(item.Caption = 'หลักสูตร')
  then
  begin // course
    mnuAdd.Caption := 'สร้า้งหลักสูตร...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขหลักสูตร...';
  end
  else if (node.ClassName = SUBJECT_CLASS)
  or (item <> nil)and(item.Caption = 'รายวิชา')
  then
  begin // subject
    mnuAdd.Caption := 'สร้า้งรายวิชา...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขรายวิชา...';
  end
  else if (node.ClassName = STUDENT_CLASS)
  or (item <> nil)and(item.Caption = 'นักศึกษา')
  then
  begin // student
    mnuAdd.Caption := 'สร้า้งนักศึกษา...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขนักศึกษา...';
  end
  else if (node.ClassName = TEACHER_CLASS)
  or (item <> nil)and(item.Caption = 'คณาจารย์')
  then
  begin // teacher
    mnuAdd.Caption := 'สร้า้งคณาจารย์...';
    mnuDelete.Caption := 'ลบ...';
    mnuEdit.Caption := 'แก้ไขคณาจารย์...';
  end;
  mnuDelete.Enabled := listview.SelCount > 0;
  mnuEdit.Enabled := (listview.SelCount > 0)and(node.ClassName <> DEPARTMENT_CLASS);
end;

procedure TExplore.FAddSubject(_parent: string);
var
  obj : variant;
begin
  obj := TSubjectDialog.NewSubject(_parent);
  if not VarIsNull(obj) then
  begin
    treeviewchange(treeview,treeview.Selected);
  end;
end;

procedure TExplore.FEditSubject;
begin
   if TSubjectDialog.Edit(oid) then treeviewchange(treeview,treeview.Selected);
end;

procedure TExplore.mnuDeleteClick(Sender: TObject);
var obj : Variant;
begin
  inherited;
  obj := Cache.OpenObject('User.Dummy',selectedItem.SubItems[selectedItem.SubItems.Count -1]);
  if MessageDlg(String(obj.QueryDelete),mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    obj.SYS_DeleteID(selectedItem.SubItems[selectedItem.SubItems.Count -1],0);
    selectedItem.Delete;
  end
  else obj.SYS_Close;

end;

procedure TExplore.FAddTeacher(_parent: string);
var
  obj : Teacher;
begin
  obj := TTeacherDialog.NewTeacher(_parent);
  if not VarIsNull(obj) then
  begin
    treeviewchange(treeview,treeview.Selected);
  end;
end;

procedure TExplore.FAddStudent(_parent: string);
var
  obj : Variant;
begin
  obj := TStudentDialog.NewStudent(_parent);
  if not VarIsNull(obj) then
  begin
    treeviewchange(treeview,treeview.Selected);
  end;
end;

procedure TExplore.FShowTeacher(Node: TTreeNode);
var
  lst : TListItem;
  hc: TListColumn;
  rs : ResultSet;
  myNode : TMyNode;
begin
  listview.ViewStyle := vsReport;
  hc := listview.Columns.Add;//1
  hc.Width := 150;
  hc.Caption := 'ชื่อ';
  hc := listview.Columns.Add;//1
  hc.Width := 150;
  hc.Caption := 'สกุล';
  hc := listview.Columns.Add;//1
  hc.Width := 60;
  hc.Caption := 'ตำแหน่ง';
  myNode := TMyNode(Node);
  rs := Cache.Query( myNode.ClassName, QUERY_IS_OF);

  with rs do
  try
    Execute(myNode.ObjectRef,'','','','','','','','','','','','','','','');

    while Next do
    begin
      lst := listview.Items.Add;
      lst.Caption := GetData(2);
      lst.SubItems.Add(GetData(3));
      lst.SubItems.Add(GetData(4));
      lst.SubItems.Add(GetData(1));
    end;
    Close;
  except
    Close;
  end;
end;

procedure TExplore.FShowStudent(Node: TTreeNode);
var
  lst : TListItem;
  hc: TListColumn;
  rs : ResultSet;
  myNode : TMyNode;
begin
  listview.ViewStyle := vsReport;
  hc := listview.Columns.Add;//1
  hc.Width := 100;
  hc.Caption := 'รหัส';
  hc := listview.Columns.Add;//1
  hc.Width := 100;
  hc.Caption := 'ชื่อ';
  hc := listview.Columns.Add;//1
  hc.Width := 120;
  hc.Caption := 'สกุล';
  myNode := TMyNode(Node);
  rs := Cache.Query( myNode.ClassName, QUERY_IS_OF);

  with rs do
  try
    Execute(myNode.ObjectRef,'','','','','','','','','','','','','','','');

    while Next do
    begin
      lst := listview.Items.Add;
      lst.Caption := GetData(2);
      lst.SubItems.Add(GetData(3));
      lst.SubItems.Add(GetData(4));
      lst.SubItems.Add(GetData(1));
    end;
    Close;
  except
    Close;
  end;
end;

procedure TExplore.FEditFaculty(oid: string);
begin

end;

procedure TExplore.FEditStudent(oid: string);
begin
   if TStudentDialog.Edit(oid) then treeviewchange(treeview,treeview.Selected);
end;

procedure TExplore.FEditTeacher(oid: string);
begin
   if TTeacherDialog.Edit(oid) then treeviewchange(treeview,treeview.Selected);
end;

end.
