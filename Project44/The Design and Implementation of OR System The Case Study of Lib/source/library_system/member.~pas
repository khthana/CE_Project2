unit member;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QDialogs, ComCtrls, StdCtrls, TabNotBk, IdGlobal,classmodule,CustomizeDlg;

type
  Tmemberform = class(TForm)
    Button1: TButton;
    TabbedNotebook1: TTabbedNotebook;
    Label1: TLabel;
    EditStuID_mem: TEdit;
    Label2: TLabel;
    EditStuName: TEdit;
    Label3: TLabel;
    EditStuLastname: TEdit;
    Label4: TLabel;
    EditStuStatus: TEdit;
    Label5: TLabel;
    EditStuClass: TEdit;
    Label6: TLabel;
    EditStuOrg: TEdit;
    Label7: TLabel;
    EditStuMajor: TEdit;
    Label8: TLabel;
    EditStuDivision: TEdit;
    Label9: TLabel;
    EditStuPhone: TEdit;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    EditStuHouseID: TEdit;
    Label11: TLabel;
    EditStuRoad: TEdit;
    Label12: TLabel;
    EditStuTumbon: TEdit;
    Label13: TLabel;
    EditStuAmphor: TEdit;
    Label14: TLabel;
    EditStuProvince: TEdit;
    Label15: TLabel;
    EditStuZipcode: TEdit;
    ButtonStuCancel: TButton;
    ButtonStuDelete: TButton;
    ButtonStuSave: TButton;
    Label16: TLabel;
    EditStaID_mem: TEdit;
    Label17: TLabel;
    EditStaName: TEdit;
    Label18: TLabel;
    EditStaLastname: TEdit;
    Label19: TLabel;
    EditStaStatus: TEdit;
    Label20: TLabel;
    EditStaOrg: TEdit;
    Label21: TLabel;
    EditStaDivision: TEdit;
    Label22: TLabel;
    EditStaPhone: TEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    EditStaHouseID: TEdit;
    Label24: TLabel;
    EditStaRoad: TEdit;
    Label25: TLabel;
    EditStaTumbon: TEdit;
    Label26: TLabel;
    EditStaAmphor: TEdit;
    Label27: TLabel;
    EditStaProvince: TEdit;
    Label28: TLabel;
    EditStaZipcode: TEdit;
    ButtonStaCancel: TButton;
    ButtonStaDelete: TButton;
    ButtonStaSave: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonStuCancelClick(Sender: TObject);
    procedure ButtonStaCancelClick(Sender: TObject);
    procedure FormCloseQurey(Sender: TObject; var CanClose: Boolean);
    procedure ButtonStuSaveClick(Sender: TObject);
    function isdigit(val : string):Boolean;
    procedure ButtonStuDeleteClick(Sender: TObject);
    procedure ButtonStaSaveClick(Sender: TObject);
    procedure ButtonStaDeleteClick(Sender: TObject);
    procedure EditStaID_memKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditStuID_memKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  memberform: Tmemberform;

implementation

uses mainmenu, module;

{$R *.dfm}

function Tmemberform.isdigit(val : string):Boolean;
var i : integer;
	 b : boolean;
begin
   b := True;
	for i := 1 to Length(val) do
   	if not(IsNumeric(val[i])) then b := false;
   Result := b;
end;

procedure Tmemberform.Button1Click(Sender: TObject);
begin
	menuform.Show;
   memberform.Hide;
end;

procedure Tmemberform.FormCloseQurey(Sender: TObject;
  var CanClose: Boolean);
begin
	CanClose := true;
end;

procedure Tmemberform.ButtonStuCancelClick(Sender: TObject);
begin
	 EditStuID_mem.Clear;
    EditStuName.Clear;
    EditStuLastname.Clear;
    EditStuStatus.Clear;
    EditStuClass.Clear;
    EditStuOrg.Clear;
    EditStuMajor.Clear;
    EditStuDivision.Clear;
    EditStuPhone.Clear;
    EditStuHouseID.Clear;
    EditStuRoad.Clear;
    EditStuTumbon.Clear;
    EditStuAmphor.Clear;
    EditStuProvince.Clear;
    EditStuZipcode.Clear;
end;

procedure Tmemberform.ButtonStaCancelClick(Sender: TObject);
begin
    EditStaID_mem.Clear;
    EditStaName.Clear;
    EditStaLastname.Clear;
    EditStaStatus.Clear;
    EditStaOrg.Clear;
    EditStaDivision.Clear;
    EditStaPhone.Clear;
    EditStaHouseID.Clear;
    EditStaRoad.Clear;
    EditStaTumbon.Clear;
    EditStaAmphor.Clear;
    EditStaProvince.Clear;
    EditStaZipcode.Clear;
end;

procedure Tmemberform.ButtonStuSaveClick(Sender: TObject);
var id,nam,las,sta,cla,org,maj,divi,ph,hid,rd,tum,amp,pro,zip,app,expi : string;
	 student1 : Tstudent;
begin
    id :=  EditStuID_mem.Text;
    nam := EditStuName.Text;
    las := EditStuLastname.Text;
    sta := EditStuStatus.Text;
    cla := EditStuClass.Text;
    org := EditStuOrg.Text;
    maj := EditStuMajor.Text;
    divi := EditStuDivision.Text;
    ph :=  EditStuPhone.Text;
  	 hid := EditStuHouseID.Text;
    rd :=  EditStuRoad.Text;
    tum := EditStuTumbon.Text;
    amp := EditStuAmphor.Text;
    pro := EditStuProvince.Text;
    zip := EditStuZipcode.Text;
    app := DateToStr(Date);
    expi := DateToStr(Date);
    if (id = '') or (nam = '') or (las = '') or (sta = '')
    or (cla = '') or (org = '') or (maj = '') or (divi = '') then
		ShowMessage('กรุณากรอกรายละเอียดให้ครบถ้วน')
    else
    begin
	 	with Databasemd.Query1 do
    	begin
       Close;
       SQL.Clear;
       SQL.Add('Select id_mem from student where id_mem = "'+id+'"');
       Open;
    	end;
      if (Databasemd.DataSource1.DataSet.IsEmpty) then
      begin
          //insert new record
          student1 := Tstudent.Create;
          try
          	student1.apply_member(id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,expi,cla);
			 finally
          	student1.Destroy;
          end;
      end
      else
      begin
      	//update record
         student1 := Tstudent.Create;
         try
         	student1.edit_member(id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,cla);
         finally
         	student1.Destroy;
         end;
      end;
    end;
end;

procedure Tmemberform.ButtonStuDeleteClick(Sender: TObject);
var id : string;
    delresult : integer;
    student1 : Tstudent;
begin
	 id :=  EditStuID_mem.Text;
    if id = '' then
   	ShowMessage('กรุณาใส่รหัสสมาชิก')
    else
    begin
    	with Databasemd.Query1 do
    	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select id_mem from student where id_mem = "'+id+'"');
      	Open;
    	end;
      if (Databasemd.DataSource1.DataSet.IsEmpty) then
      	ShowMessage('ไม่พบข้อมูลของสมาชิกรหัส '+id)
      else
         //found record
         delresult := MessageDlg('ต้องการลบข้อมูลสมาชิกรหัส '+id+' หรือไม่',mtConfirmation,[mbYes,mbNo],0);
         if delresult = 3 then
         begin
         	//delete record
         	student1 := Tstudent.Create;
         	try
         		student1.delete_member(id);
         	finally
         		student1.Destroy;
         	end;
            EditStuID_mem.Clear;
    			EditStuName.Clear;
    			EditStuLastname.Clear;
    			EditStuStatus.Clear;
    			EditStuClass.Clear;
    			EditStuOrg.Clear;
    			EditStuMajor.Clear;
    			EditStuDivision.Clear;
    			EditStuPhone.Clear;
    			EditStuHouseID.Clear;
    			EditStuRoad.Clear;
    			EditStuTumbon.Clear;
    			EditStuAmphor.Clear;
    			EditStuProvince.Clear;
    			EditStuZipcode.Clear;
      	end;
    end;
end;

procedure Tmemberform.ButtonStaSaveClick(Sender: TObject);
var id,nam,las,sta,org,divi,ph,hid,rd,tum,amp,pro,zip,app : string;
	 staff1 : Tstaff;
begin
    id :=  EditStaID_mem.Text;
    nam := EditStaName.Text;
    las := EditStaLastname.Text;
    sta := EditStaStatus.Text;
    org := EditStaOrg.Text;
    divi := EditStaDivision.Text;
    ph :=  EditStaPhone.Text;
  	 hid := EditStaHouseID.Text;
    rd :=  EditStaRoad.Text;
    tum := EditStaTumbon.Text;
    amp := EditStaAmphor.Text;
    pro := EditStaProvince.Text;
    zip := EditStaZipcode.Text;
    app := DateToStr(Date);
    if (id = '') or (nam = '') or (las = '') or (sta = '')
    or (org = '') or (divi = '') then
		ShowMessage('กรุณากรอกรายละเอียดให้ครบถ้วน')
    else
    begin
	 	with Databasemd.Query1 do
    	begin
       Close;
       SQL.Clear;
       SQL.Add('Select id_mem from staff where id_mem = "'+id+'"');
       Open;
    	end;
      if (Databasemd.DataSource1.DataSet.IsEmpty) then
      begin
          //insert new record
          staff1 := Tstaff.Create;
          try
          	staff1.apply_member(id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph);
			 finally
          	staff1.Destroy;
          end;
      end
      else
      begin
      	//update record
         staff1 := Tstaff.Create;
         try
         	staff1.edit_member(id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph);
         finally
         	staff1.Destroy;
         end;
      end;
    end;
end;

procedure Tmemberform.ButtonStaDeleteClick(Sender: TObject);
var id : string;
    delresult : integer;
    staff1 : Tstaff;
begin
	 id :=  EditStaID_mem.Text;
    if id = '' then
   	ShowMessage('กรุณาใส่รหัสสมาชิก')
    else
    begin
    	with Databasemd.Query1 do
    	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select id_mem from staff where id_mem = "'+id+'"');
      	Open;
    	end;
      if (Databasemd.DataSource1.DataSet.IsEmpty) then
      	ShowMessage('ไม่พบข้อมูลของสมาชิกรหัส '+id)
      else
         //found record
         delresult := MessageDlg('ต้องการลบข้อมูลสมาชิกรหัส '+id+' หรือไม่',mtConfirmation,[mbYes,mbNo],0);
         if delresult = 3 then
         begin
         	//delete record
         	staff1 := Tstaff.Create;
         	try
         		staff1.delete_member(id);
         	finally
         		staff1.Destroy;
         	end;
            EditStaID_mem.Clear;
    			EditStaName.Clear;
            EditStaLastname.Clear;
    			EditStaStatus.Clear;
            EditStaOrg.Clear;
    			EditStaDivision.Clear;
    			EditStaPhone.Clear;
    			EditStaHouseID.Clear;
    			EditStaRoad.Clear;
    			EditStaTumbon.Clear;
    			EditStaAmphor.Clear;
            EditStaProvince.Clear;
            EditStaZipcode.Clear;
      	end;
    end;
end;

procedure Tmemberform.EditStaID_memKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var staffid : string;
	 staff1 : Tstaff;
begin
	staffid := EditStaID_mem.Text;
   staff1 := Tstaff.Create;
   staff1.retrivedb(staffid);
	with Databasemd.DataSource1.DataSet do
   begin
   	EditStaName.Text := FieldByname('name').AsString;
   	EditStaLastname.Text := FieldByname('lastname').AsString;
   	EditStaStatus.Text := FieldByname('status').AsString;
   	EditStaOrg.Text := FieldByname('organize').AsString;
   	EditStaDivision.Text := FieldByname('division').AsString;
   end;

   staff1.retriveaddr(staffid);
   with Databasemd.DataSource1.DataSet do
   begin
     	EditStaPhone.Text := FieldByname('phone').AsString;
   	EditStahouseID.Text := FieldByname('hid').AsString;
   	EditStaRoad.Text := FieldByname('street').AsString;
   	EditStaTumbon.Text := FieldByname('tumbon').AsString;
   	EditStaAmphor.Text := FieldByname('amphor').AsString;
   	EditStaProvince.Text := FieldByname('province').AsString;
   	EditStaZipcode.Text := FieldByname('box').AsString;
   end;

   staff1.Destroy;

end;

procedure Tmemberform.EditStuID_memKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var stdid : string;
	 student1 : Tstudent;
begin
	stdid := EditStuID_mem.Text;
  	student1 := Tstudent.Create;
   student1.retrivedb(stdid);
   with Databasemd.DataSource1.DataSet do
   begin
 		EditStuName.Text := FieldByname('name').AsString;
		EditStuLastname.Text := FieldByname('lastname').AsString;
		EditStuStatus.Text := FieldByname('status').AsString;
		EditStuClass.Text := FieldByname('class').AsString;
		EditStuOrg.Text := FieldByname('organize').AsString;
      EditStuMajor.Text := FieldByname('major').AsString;
      EditStuDivision.Text := FieldByname('division').AsString;
   end;

   student1.retriveaddr(stdid);
   with Databasemd.DataSource1.DataSet do
   begin
   	EditStuPhone.Text := FieldByname('phone').AsString;
      EditStuHouseID.Text := FieldByname('hid').AsString;
      EditStuRoad.Text := FieldByname('street').AsString;
      EditStuTumbon.Text := FieldByname('tumbon').AsString;
      EditStuAmphor.Text := FieldByname('amphor').AsString;
      EditStuProvince.Text := FieldByname('province').AsString;
      EditStuZipcode.Text := FieldByname('box').AsString;
   end;

   student1.Destroy;
end;

end.
