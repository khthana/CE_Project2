unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls, FileCtrl, Gauges, ExtCtrls,
  RefComboBox;

type
  TMainform = class(TForm)
    TabCustomize2: TPageControl;
    TabImport: TTabSheet;
    TabExport: TTabSheet;
    edTarget: TEdit;
    T: TLabel;
    btnExport: TButton;
    lstImportClass: TListView;
    btnConnect: TButton;
    edSource: TEdit;
    Label2: TLabel;
    btnImport: TButton;
    Button1: TButton;
    lstClasses: TListView;
    PanelProgress: TPanel;
    ProgressBar: TProgressBar;
    prg: TStaticText;
    TabCustomize1: TTabSheet;
    memCustomCourse: TMemo;
    cmbCanCustomCourse: TReferenceComboBox;
    Label1: TLabel;
    btnTestCourse: TButton;
    btnRegisterCourse: TButton;
    btnNewCourse: TButton;
    cmbMethodCourse: TComboBox;
    Label3: TLabel;
    TabDomain: TTabSheet;
    ListView: TListView;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    cmbType: TComboBox;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    cmbMethodSubject: TComboBox;
    cmbCanCustomSubject: TReferenceComboBox;
    memCustomSubject: TMemo;
    btnNewSubject: TButton;
    btnTestSubject: TButton;
    btnRegisterSubject: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoadCusClick(Sender: TObject);
    procedure cmbMethodCourseClick(Sender: TObject);
    procedure btnTestCourseClick(Sender: TObject);
    procedure cmbCanCustomCourseClick(Sender: TObject);
    procedure btnNewCourseClick(Sender: TObject);
    procedure btnRegisterCourseClick(Sender: TObject);
    procedure cmbTypeChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnNewSubjectClick(Sender: TObject);
    procedure cmbCanCustomSubjectClick(Sender: TObject);
    procedure cmbMethodSubjectClick(Sender: TObject);
    procedure btnTestSubjectClick(Sender: TObject);
    procedure btnRegisterSubjectClick(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
  private
    mtdStrt : integer;
    mtdEnd : integer;
    typeClass : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mainform: TMainform;

implementation

uses Cache, CacheObject_TLB, ArrayOfObjects_TLB, constant, newc;

{$R *.dfm}

procedure TMainform.btnConnectClick(Sender: TObject);
var rs : ResultSet;
    tmp : string;
    obj : Variant;
    i : smallint;
    key : widestring;
    lst : TListItem;
begin
  lstClasses.Items.Clear;
  if not Cache.MyFactory.IsConnected then exit;

  rs := Cache.Query('%Library.ClassDefinition','ClassInfo');
  rs.Execute('','','','','','','','','','','','','','','','');
  while rs.Next do
  begin
    tmp := rs.GetDataByName('Name');
    if (Pos('User.',tmp) > 0)or(Pos('Customize.',tmp) > 0) then
    begin
      lst := lstClasses.Items.Add;
      lst.Caption := tmp;
      lst.SubItems.Add(tmp + '.CDL');
      lst.SubItems.Add('load');
      lst.Checked := true;
    end;
  end;
  rs.Close;
end;

procedure TMainform.btnExportClick(Sender: TObject);
var obj : Variant;
    i : smallint;
    str : string;
begin
  obj := Cache.NewObject('%ClassDefinition');
  //if not Dir(edTarget.Text) then
  ForceDirectories(edTarget.Text);
  for i := 0 to lstClasses.Items.Count -1 do
  if lstClasses.Items[i].Checked then
  begin
    str := lstClasses.Items[i].Caption;
    if Pos('.',str) > 0 then
    str[Pos('.',str)] := '_';
    obj.ExportCDL(lstClasses.Items[i].Caption,edTarget.Text +'\'+ str + '.cdl');
    lstClasses.Items[i].SubItems[1] := 'done';
  end;
  obj.SYS_Close;
end;

procedure TMainform.btnLoadClick(Sender: TObject);
var
  sr: TSearchRec;
  FileAttrs: Integer;
  lst : TListItem;
  fp : TEXTFILE;
  str : string;
  posc : integer;
  dir : string;
begin
  dir := edSource.Text;
  if FileCtrl.SelectDirectory(dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0)
  then edSource.Text := dir
  else exit;
  lstImportClass.Items.Clear;
  FileAttrs := faAnyFile;
  if FindFirst(edSource.Text+'\*.cdl', FileAttrs, sr) = 0 then
  begin
    repeat
      if ((sr.Attr and FileAttrs) = sr.Attr)
      and (sr.Name <> '.')
      and (sr.Name <> '..')
      then
      begin
        assignfile(fp,edSource.Text + '\' + sr.Name);
        reset(fp);
        readln(fp,str);
        while (not EOF(fp))and(Pos('class',str) = 0) do readln(fp,str);

        posc :=  Pos('class',str);
        if posc > 0 then
        begin
          str := trim(Copy(str,posc+6,length(str)));
          lst := lstImportClass.Items.Add;
          lst.Caption := str;
          readln(fp,str);
          while (not EOF(fp))and(Pos('super',str) = 0) do readln(fp,str);
          posc :=  Pos('super',str);
          if posc > 0 then
          begin
            str := trim(Copy(str,posc+7,length(str)));
            lst.SubItems.Add(Copy(str,1,length(str)-1));
          end;
          lst.SubItems.Add(sr.Name);
          lst.SubItems.Add('verify..OK');
          lst.Checked := true;
        end;
        closefile(fp);
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TMainform.btnImportClick(Sender: TObject);
var cdl,test : Variant;
    i : smallint;
    status : variant;
begin
  PanelProgress.Visible := true;
  cdl := Cache.NewObject('%ClassDefinition');
  progressbar.Max := 3*lstImportClass.Items.Count;
  btnImport.Enabled := false;
  Application.ProcessMessages;
  for i := 0 to lstImportClass.Items.Count -1 do
  if lstImportClass.Items[i].Checked then
  begin
    progressbar.StepIt;
    prg.Caption := 'Loading...'+lstImportClass.Items[i].Caption;
    prg.Repaint;
    cdl.ImportCDL(edSource.Text +'\'+ lstImportClass.Items[i].SubItems[1],'');
    lstImportClass.Items[i].SubItems[2] := 'loaded';
    lstImportClass.Repaint;
  end;
  for i := 0 to lstImportClass.Items.Count -1 do
  if lstImportClass.Items[i].Checked then
  begin
    progressbar.StepIt;
    prg.Caption := 'Compiling...'+lstImportClass.Items[i].Caption;
    prg.Repaint;
    lstImportClass.Items[i].SubItems[2] := 'compiling...';
    lstImportClass.Repaint;
    status := cdl.CompileClasses(lstImportClass.Items[i].Caption,'');
    try
      test := null;
      test := Cache.MyFactory.Static(lstImportClass.Items[i].Caption);
      if not varIsNull(test) then
      begin
        lstImportClass.Items[i].SubItems[2] := 'done';
        lstImportClass.Items[i].Checked := false;
      end
      else lstImportClass.Items[i].SubItems[2] := '$$$'
    except
      lstImportClass.Items[i].SubItems[2] := '???';
    end;
    lstImportClass.Repaint;
  end;

  BtnImport.Enabled := true;
  cdl.SYS_CLose;
  Panelprogress.Visible := false;
end;

procedure TMainform.FormCreate(Sender: TObject);
var rs : IResultSet;
    obj : Variant;
begin
  Cache.InitCache;
  if not Cache.MyFactory.IsConnected then exit;
  obj := Cache.MyFactory.Static('User.Dummy');
  Application.Title := 'Customize:'+trim(string(obj.GetLuckyName));
  rs := Cache.Query('User.mCustomize',QUERY_DETAILS);
  rs.Execute('1','','','','','','','','','','','','','','','');
  while rs.Next do
  begin
    cmbCanCustomCourse.AddNew(String(rs.GetData(3)),String(rs.GetData(2)));
  end;
  rs.Close;

  rs.Execute('2','','','','','','','','','','','','','','','');
  while rs.Next do
  begin
    cmbCanCustomSubject.AddNew(String(rs.GetData(3)),String(rs.GetData(2)));
  end;
  rs.Close;
end;

procedure TMainform.btnLoadCusClick(Sender: TObject);
var obj : Variant;
    i : integer;
    tmpText : string;

    tmpStr : TStrings;
begin
  obj := Cache.NewObject('%ClassDefinition');
  obj.ExportCDL(cmbCanCustomCourse.Text,ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  obj.SYS_CLose;
  memCustomCourse.Lines.Clear;
  cmbMethodCourse.Items.Clear;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  i := 0;
  while i < tmpStr.Count do
  begin
    tmpText := tmpStr[i];
    if (Pos('method',tmpText) > 0)and(Pos('classmethod',tmpText)=0) then
    begin
      delete(tmpText,Pos('method',tmpText),6);
      cmbMethodCourse.Items.Add(trim(tmpText));
    end;
    inc(i);
  end;

  tmpStr.Free;
end;

procedure TMainform.cmbMethodCourseClick(Sender: TObject);
label complete;
var
    i : integer;
    tmpText,tmp : string;

    tmpStr : TStrings;
begin
  memCustomCourse.Lines.Clear;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  i := 0;
  while i < tmpStr.Count do
  begin
    tmpText := trim(tmpStr[i]);
    if Pos(cmbMethodCourse.Text,tmpText) > 0 then
    begin
      inc(i);
      while i < tmpStr.Count do
      begin
        tmp := tmpStr[i];
        tmpText := trim(tmp);
        if Pos('[',tmpText) > 0 then
        begin
          mtdStrt := i+1;
          inc(i);
          tmp := tmpStr[i];
          tmpText := trim(tmp);
          while (i < tmpStr.Count)and(tmpText <> ']') do
          begin
            memCustomCourse.Lines.Append(tmp);
            inc(i);
            tmp := tmpStr[i];
            tmpText := trim(tmp);
          end;
          mtdEnd := i;
          goto complete;
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
complete:
  tmpStr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  tmpStr.Free;
end;

procedure TMainform.btnTestCourseClick(Sender: TObject);
var i : integer;
    tmpStr : TStrings;
begin
//  Application.Cursur := ;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  for i := 1 to mtdEnd-mtdStrt do
  begin
    tmpStr.Delete(mtdStrt);
  end;
  for i := 0 to memCustomCourse.Lines.Count-1 do
  begin
    tmpStr.Insert(mtdStrt + i,#9 + #9 + #9 + trim(memCustomCourse.Lines[i]));
  end;

  tmpStr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  tmpStr.Free;
end;

procedure TMainform.cmbCanCustomCourseClick(Sender: TObject);
var obj : Variant;
    i : integer;
    tmpText : string;

    tmpStr : TStrings;
begin
  obj := Cache.NewObject('%ClassDefinition');
  obj.ExportCDL(cmbCanCustomCourse.Text,ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  obj.SYS_CLose;
  memCustomCourse.Lines.Clear;
  cmbMethodCourse.Items.Clear;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl');
  i := 0;
  while i < tmpStr.Count do
  begin
    tmpText := tmpStr[i];
    if (Pos('method',tmpText) > 0)and(Pos('classmethod',tmpText)=0) then
    begin
      delete(tmpText,Pos('method',tmpText),6);
      cmbMethodCourse.Items.Add(trim(tmpText));
    end;
    inc(i);
  end;

  tmpStr.Free;
end;

procedure TMainform.btnNewCourseClick(Sender: TObject);
var rs : ResultSet;
    obj : Variant;
    posc  : integer;
    str : string;
    tstr : TStrings;
    i : smallint;
begin
  if not assigned(NewClassDlg) then NewClassDlg := TNewClassDlg.Create(Application);
  with NewClassDlg do
  try
    // load template classes
      cmbClassRef.ClearItems;
      cmbClassRef.AddNew(COURSE_BACHELOR_CLASS,'หลักสูตรปริญญาตรี (มาตรฐาน)');
      cmbClassRef.AddNew(COURSE_MASTER_CLASS,'หลักสูตรปริญญาโท (มาตรฐาน)');
      cmbClassRef.AddNew(COURSE_DOCTOR_CLASS,'หลักสูตรปริญญาเอก (มาตรฐาน)');
      cmbClassRef.Enabled := true;
      rs := Cache.Query('User.mCustomize',QUERY_DETAILS);
      rs.Execute(1,'','','','','','','','','','','','','','','');
      while rs.Next do
      begin
        cmbClassRef.AddNew(String(rs.GetData(2)),String(rs.GetData(4)));
      end;
      rs.Close;
    //

    if ShowModal = mrOK then
    begin
      obj := Cache.NewObject('%ClassDefinition');
      obj.ExportCDL(cmbClassRef.strReference,ExtractFileDir(Application.ExeName) +'\tmpderive.cdl');

      tstr := TStringList.Create;
      tstr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmpderive.cdl');
      i := 0;
      str := tstr[i];
      while (i < tstr.Count)and(Pos('class',str) = 0) do
      begin
        inc(i);
        str := tstr[i];
      end;

      posc :=  Pos('class',str);

      if posc > 0 then
      begin
          str := 'class ' + edClassName.Text;
          tstr[i] := str;
      end;

      i := i + 1;
      str := tstr[i];
      while (i < tstr.Count)and(Pos('super',str) = 0) do
      begin
        inc(i);
        str := tstr[i];
      end;

      posc :=  Pos('super',str);

      if posc > 0 then
      begin
          str := #9 + 'super = ' + cmbClassRef.strReference + ';';
          tstr[i] := str;
      end;
      tstr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmpderive.cdl');

      obj.ImportCDL(ExtractFileDir(Application.ExeName) +'\tmpderive.cdl','');
      obj.CompileClasses(edClassName.Text,'');

      obj.SYS_Close;

      obj := Cache.NewObject('User.mCustomize');
      if not VarIsNull(obj) then
      begin
        obj.NameClass := edClassName.Text;
        obj.SuperClass := cmbClassRef.strReference;
        obj.TypeClass := 1;
        obj.Description := edDescription.Text;
        obj.SYS_Save(0);
        obj.SYS_Close;
        cmbCanCustomCourse.AddNew(edClassName.Text,edClassName.Text);
      end;
    end;
  except

  end;
end;

procedure TMainform.btnRegisterCourseClick(Sender: TObject);
var obj : Variant;
begin
      obj := Cache.NewObject('%ClassDefinition');
      obj.ImportCDL(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl','');
      obj.CompileClasses(cmbCanCustomCourse.strReference,'');
      obj.SYS_Close;
end;

procedure TMainform.cmbTypeChange(Sender: TObject);
var rs : ResultSet;
    hc: TListColumn;
    lst : TListItem;
begin
  listview.Items.Clear;
  listview.Columns.Clear;
  if cmbType.ItemIndex = 0 then
  begin
    typeClass := RESULTTYPE_CLASS;
    rs := Cache.Query(RESULTTYPE_CLASS,QUERY_DETAILS);
    hc := listview.Columns.Add;
    hc.Width := 100;
    hc.Caption := 'Display';
    hc := listview.Columns.Add;
    hc.Width := 50;
    hc.Caption := 'Weight';
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'Description';

    with rs do
    try
      Execute('','','','','','','','','','','','','','','','');

      while Next do
      begin
        lst := listview.Items.Add;
        lst.Caption := GetData(2);
        lst.SubItems.Add(GetData(4));
        lst.SubItems.Add(GetData(3));
        lst.SubItems.Add(GetData(1));
  		end;
      Close;
    except
      Close;
    end;
  end
  else if cmbType.ItemIndex = 3 then
  begin
    typeClass := PERIOD_CLASS;
    rs := Cache.Query(PERIOD_CLASS,QUERY_DETAILS);
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'Name';
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'Start';
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'Finish';

    with rs do
    try
      Execute('','','','','','','','','','','','','','','','');

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
  end
  else if cmbType.ItemIndex = 2 then
  begin
    typeClass := WORKDAY_CLASS;
    rs := Cache.Query(WORKDAY_CLASS,QUERY_DETAILS);
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'Thai';
    hc := listview.Columns.Add;
    hc.Width := 150;
    hc.Caption := 'English';

    with rs do
    try
      Execute('','','','','','','','','','','','','','','','');

      while Next do
      begin
        lst := listview.Items.Add;
        lst.Caption := GetData(2);
        lst.SubItems.Add(GetData(3));
        lst.SubItems.Add(GetData(1));
  		end;
      Close;
    except
      Close;
    end;
  end
  else if cmbType.ItemIndex = 4 then
  begin
    typeClass := POSEDU_CLASS;
    rs := Cache.Query(POSEDU_CLASS,QUERY_DETAILS);
    hc := listview.Columns.Add;
    hc.Width := 180;
    hc.Caption := 'Thai';
    hc := listview.Columns.Add;
    hc.Width := 180;
    hc.Caption := 'English';

    with rs do
    try
      Execute('','','','','','','','','','','','','','','','');

      while Next do
      begin
        lst := listview.Items.Add;
        lst.Caption := GetData(4);
        lst.SubItems.Add(GetData(6));
        lst.SubItems.Add(GetData(3));
  		end;
      Close;
    except
      Close;
    end;
  end
  else
  begin

  end;
end;

procedure TMainform.Button3Click(Sender: TObject);
var obj : Variant;
begin
  if listview.Selected <> nil then
  begin
    obj := Cache.OpenObject('User.Dummy',listview.Selected.SubItems[listview.Selected.SubItems.Count-1]);
    if MessageDlg(String(obj.QueryDelete),mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      obj.SYS_DeleteId(listview.Selected.SubItems[listview.Selected.SubItems.Count-1]);
      listview.Selected.Delete;
    end;
  end;
end;

procedure TMainform.btnNewSubjectClick(Sender: TObject);
var rs : ResultSet;
    obj : Variant;
    posc  : integer;
    str : string;
    tstr : TStrings;
    i : smallint;
begin
  if not assigned(NewClassDlg) then NewClassDlg := TNewClassDlg.Create(Application);
  with NewClassDlg do
  try
    // load template classes
      cmbClassRef.ClearItems;
      cmbClassRef.AddNew(SUBJECT_BACHELOR_CLASS,'รายวิชาปริญญาตรี (มาตรฐาน)');
      cmbClassRef.AddNew(SUBJECT_MASTER_CLASS,'รายวิชาปริญญาโท (มาตรฐาน)');
      cmbClassRef.AddNew(SUBJECT_DOCTOR_CLASS,'รายวิชาปริญญาเอก (มาตรฐาน)');
      cmbClassRef.Enabled := true;
      rs := Cache.Query('User.mCustomize',QUERY_DETAILS);
      rs.Execute(2,'','','','','','','','','','','','','','','');
      while rs.Next do
      begin
        cmbClassRef.AddNew(String(rs.GetData(2)),String(rs.GetData(4)));
      end;
      rs.Close;
    //

    if ShowModal = mrOK then
    begin
      obj := Cache.NewObject('%ClassDefinition');
      obj.ExportCDL(cmbClassRef.strReference,ExtractFileDir(Application.ExeName) +'\tmpderive2.cdl');

      tstr := TStringList.Create;
      tstr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmpderive2.cdl');
      i := 0;
      str := tstr[i];
      while (i < tstr.Count)and(Pos('class',str) = 0) do
      begin
        inc(i);
        str := tstr[i];
      end;

      posc :=  Pos('class',str);

      if posc > 0 then
      begin
          str := 'class ' + edClassName.Text;
          tstr[i] := str;
      end;

      i := i + 1;
      str := tstr[i];
      while (i < tstr.Count)and(Pos('super',str) = 0) do
      begin
        inc(i);
        str := tstr[i];
      end;

      posc :=  Pos('super',str);

      if posc > 0 then
      begin
          str := #9 + 'super = ' + cmbClassRef.strReference + ';';
          tstr[i] := str;
      end;
      tstr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmpderive2.cdl');

      obj.ImportCDL(ExtractFileDir(Application.ExeName) +'\tmpderive2.cdl','');
      obj.CompileClasses(edClassName.Text,'');

      obj.SYS_Close;

      obj := Cache.NewObject('User.mCustomize');
      if not VarIsNull(obj) then
      begin
        obj.NameClass := edClassName.Text;
        obj.SuperClass := cmbClassRef.strReference;
        obj.TypeClass := 2;
        obj.Description := edDescription.Text;
        obj.SYS_Save(0);
        obj.SYS_Close;
        cmbCanCustomSubject.AddNew(edClassName.Text,edClassName.Text);
      end;
    end;
  except

  end;
end;

procedure TMainform.cmbCanCustomSubjectClick(Sender: TObject);
var obj : Variant;
    i : integer;
    tmpText : string;

    tmpStr : TStrings;
begin
  obj := Cache.NewObject('%ClassDefinition');
  obj.ExportCDL(cmbCanCustomSubject.Text,ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  obj.SYS_Close;
  memCustomSubject.Lines.Clear;
  cmbMethodSubject.Items.Clear;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  i := 0;
  while i < tmpStr.Count do
  begin
    tmpText := tmpStr[i];
    if (Pos('method',tmpText) > 0)and(Pos('classmethod',tmpText)=0) then
    begin
      delete(tmpText,Pos('method',tmpText),6);
      cmbMethodSubject.Items.Add(trim(tmpText));
    end;
    inc(i);
  end;

  tmpStr.Free;
end;

procedure TMainform.cmbMethodSubjectClick(Sender: TObject);
label complete;
var
    i : integer;
    tmpText : string;

    tmpStr : TStrings;
begin
  memCustomSubject.Lines.Clear;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  i := 0;
  while i < tmpStr.Count do
  begin
    tmpText := trim(tmpStr[i]);
    if Pos(cmbMethodSubject.Text,tmpText) > 0 then
    begin
      inc(i);
      while i < tmpStr.Count do
      begin
        tmpText := trim(tmpStr[i]);
        if Pos('[',tmpText) > 0 then
        begin
          mtdStrt := i+1;
          inc(i);
          tmpText := trim(tmpStr[i]);
          while (i < tmpStr.Count)and(tmpText <> ']') do
          begin
            memCustomSubject.Lines.Append(tmpText);
            inc(i);
            tmpText := trim(tmpStr[i]);
          end;
          mtdEnd := i;
          goto complete;
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
complete:
  tmpStr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  tmpStr.Free;
end;

procedure TMainform.btnTestSubjectClick(Sender: TObject);
var i : integer;
    tmpStr : TStrings;
begin
//  Application.Cursur := ;
  tmpStr := TStringList.Create;
  tmpStr.LoadFromFile(ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  for i := 1 to mtdEnd-mtdStrt do
  begin
    tmpStr.Delete(mtdStrt);
  end;
  for i := 0 to memCustomSubject.Lines.Count-1 do
  begin
    tmpStr.Insert(mtdStrt + i,#9 + #9 + #9 + trim(memCustomSubject.Lines[i]));
  end;

  tmpStr.SaveToFile(ExtractFileDir(Application.ExeName) +'\tmp_customize2.cdl');
  tmpStr.Free;
end;

procedure TMainform.btnRegisterSubjectClick(Sender: TObject);
var obj : Variant;
begin
      obj := Cache.NewObject('%ClassDefinition');
      obj.ImportCDL(ExtractFileDir(Application.ExeName) +'\tmp_customize.cdl','');
      obj.CompileClasses(cmbCanCustomSubject.strReference,'');
      obj.SYS_Close;
end;

procedure TMainform.ListViewDblClick(Sender: TObject);
var str : TStrings;
    i : integer;
    tmp : string;
    obj : Variant;
begin
  if listview.Selected <> nil then
  begin
    str := TStringList.Create;
    tmp := listview.Selected.Caption+',';
    for i := 1 to listview.Selected.SubItems.Count -1 do
      tmp := tmp + listview.Selected.SubItems[i-1]+',';
    if InputQuery('Edit...','Edit...',tmp) then
    begin
      str.CommaText := tmp + ',,,,,,';
      listview.Selected.Caption := str[0];
      for i := 1 to listview.Selected.SubItems.Count-1 do
        listview.Selected.SubItems[i-1] :=str[i];
    end;
    obj := Cache.OpenObject(typeClass,listview.Selected.SubItems[listview.Selected.SubItems.Count-1]);
    with listview do
    if typeclass = RESULTTYPE_CLASS then
    begin
      obj.Display := Selected.Caption;
      obj.Weight := Selected.SubItems[0];
      obj.Description := Selected.SubItems[1];
    end
    else if typeclass = WORKDAY_CLASS then
    begin
      obj.Thai := Selected.Caption;
      obj.English := Selected.SubItems[0];
    end
    else if typeclass = PERIOD_CLASS then
    begin
      obj.Name := Selected.Caption;
      obj.Start := Selected.SubItems[0];
      obj.Stop := Selected.SubItems[1];
    end;
    obj.SYS_Save(0);
    obj.SYS_Close;
  end;
end;

end.
