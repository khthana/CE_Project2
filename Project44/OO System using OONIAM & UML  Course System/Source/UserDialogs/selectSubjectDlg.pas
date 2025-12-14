unit selectSubjectDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TSelectSubjectDialog = class(TEditDialog)
    lstSubject: TListView;
    cmb: TComboBoxEx;
    procedure cmbClick(Sender: TObject);
    procedure lstSubjectDblClick(Sender: TObject);
    procedure lstSubjectSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    RefClass : string;
    procedure LoadSubject(_parent : string);
  public
    class function Select(_class : string) : string;
  end;

var
  SelectSubjectDialog: TSelectSubjectDialog;

implementation

uses Cache,CacheObject_TLB, constant, ListActns;

{$R *.dfm}
type TMyItem = class(TComboExItem)
  public
    ObjectID : string;
    ClassRef : string;
  end;

{ TSelectSubjectDialog }

class function TSelectSubjectDialog.Select(_class : string) : string;
var fac,dep : ResultSet;
    item : TMyItem;
begin
  if not assigned(SelectSubjectDialog) then SelectSubjectDialog := TSelectSubjectDialog.Create(Application);
  with SelectSubjectDialog do
  try
    RefClass := _class;
    cmb.Clear;
    item := TMyItem.Create(cmb.ItemsEx);
    item.Caption := 'ʶҺѹ�ͧ�ѹ';
    item.Indent := 0;
    item.ImageIndex := 2;
    fac := Cache.Query( FACULTY_CLASS, QUERY_DETAILS);
    fac.Execute('','','','','','','','','','','','','','','','');
    while fac.Next do
    begin
      item := TMyItem.Create(cmb.ItemsEx);
      item.Caption := fac.GetData(2);
      item.ObjectID := fac.GetData(1);
      item.Indent := 1;
      item.ImageIndex := 1;
      dep := Cache.Query( DEPARTMENT_CLASS, QUERY_IS_OF);
      dep.Execute(fac.GetData(1),'','','','','','','','','','','','','','','');
      while dep.Next do
      begin
        item := TMyItem.Create(cmb.ItemsEx);
        item.Caption := dep.GetData(2);
        item.ObjectID := dep.GetData(1);
        item.Indent := 2;
        item.ImageIndex := 1;
      end;
      dep.Close;
    end;
    fac.Close;
    OKBtn.Enabled := false;
    if ShowModal = mrOK then
    begin
      if (lstSubject.ViewStyle = vsReport)and(lstSubject.SelCount > 0) then
        Result := lstSubject.Selected.SubItems[lstSubject.Selected.SubItems.Count-1];
    end
    else Result := '';
  except

  end;
end;

procedure TSelectSubjectDialog.cmbClick(Sender: TObject);
var item : TMyItem;
    lst : TListItem;
    i : smallint;
begin
  inherited;
  item := TMyItem(cmb.ItemsEx.ComboItems[cmb.ItemIndex]);
  lstSubject.Items.Clear;
  if item.Indent in [0,1] then
  begin
    lstSubject.ViewStyle := vsIcon;
    i := cmb.ItemIndex + 1;
    while (i < cmb.ItemsEx.Count)and(cmb.ItemsEx.ComboItems[i].Indent = 1) do
    begin
      lst := lstSubject.Items.Add;
      lst.Caption := cmb.ItemsEx.ComboItems[i].Caption;
      lst.SubItems.Add(TMyItem(cmb.ItemsEx.ComboItems[i]).ObjectID);
      inc(i);
    end;
  end
  else
    LoadSubject(item.ObjectID);
  OKBtn.Enabled := (lstSubject.ViewStyle = vsReport) and (lstSubject.SelCount > 0);
end;

procedure TSelectSubjectDialog.LoadSubject(_parent: string);
var subj : ResultSet;
    lst : TListItem;
begin
    subj := Cache.Query( SUBJECT_CLASS, QUERY_IS_OF);
    subj.Execute(_parent,'','','','','','','','','','','','','','','');
    lstSubject.ViewStyle := vsReport;
    while subj.Next do
    begin
      lst := lstSubject.Items.Add;
      lst.Caption := subj.GetData(2);
      lst.SubItems.Add(subj.GetData(3));
      lst.SubItems.Add(subj.GetData(6));
      lst.SubItems.Add(subj.GetData(1));
    end;
    subj.Close;
end;

procedure TSelectSubjectDialog.lstSubjectDblClick(Sender: TObject);
begin
  inherited;
  if lstSubject.SelCount > 0 then
  begin
    cmb.ItemIndex := cmb.Items.IndexOf(lstSubject.Selected.Caption);
    cmbClick(cmb);
  end;
end;

procedure TSelectSubjectDialog.lstSubjectSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
  OKBtn.Enabled := (lstSubject.ViewStyle = vsReport) and (lstSubject.SelCount > 0);
end;

end.
