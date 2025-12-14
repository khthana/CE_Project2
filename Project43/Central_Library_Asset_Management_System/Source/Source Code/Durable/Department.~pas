unit Department;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, AutoTools, ComObj;

type
  TFr_Department = class(TForm)
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Room1: TEdit;
    Room2: TEdit;
    Room3: TEdit;
    Room4: TEdit;
    Room5: TEdit;
    Room6: TEdit;
    Room7: TEdit;
    Room8: TEdit;
    Ed_Department_Name: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Room9: TEdit;
    Room11: TEdit;
    Room12: TEdit;
    Room13: TEdit;
    Room14: TEdit;
    Room15: TEdit;
    Room16: TEdit;
    Room17: TEdit;
    Room18: TEdit;
    Room19: TEdit;
    Room20: TEdit;
    Room21: TEdit;
    Room22: TEdit;
    Room23: TEdit;
    Room24: TEdit;
    Room25: TEdit;
    Room26: TEdit;
    Room27: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Bt_OK: TBitBtn;
    Bt_Cancel: TBitBtn;
    Label30: TLabel;
    Room10: TEdit;
    Ed_Officer_Name: TEdit;
    Cb_Officer_Name: TComboBox;
    procedure Bt_OKClick(Sender: TObject);
    procedure Ed_Department_NameChange(Sender: TObject);
    procedure Cb_Officer_Name1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cb_Officer_NameChange(Sender: TObject);
  private
        AutoComplete2 : IAutoComplete2;
        Strs : IUnknown;
    { Private declarations }
  public
     Update_Flag : Boolean;
     Department_ID : Integer;
     Change_Department_Name : Boolean;
    { Public declarations }
  end;

var
  Fr_Department: TFr_Department;
  Update1,Update2,Update3,Update4,Update5 : Boolean;
  Update6,Update7,Update8,Update9,Update10 : Boolean;
  Update11,Update12,Update13,Update14,Update15 : Boolean;
  Update16,Update17,Update18,Update19,Update20 : Boolean;
  Update21,Update22,Update23,Update24,Update25 : Boolean;
  Update26,Update27 : Boolean;
  procedure Insert_Room (Room_Name:string; ID:Integer);


implementation

uses Main_Durable, DataModule;

{$R *.DFM}

procedure Insert_Room(Room_Name:String;ID:Integer);
var  Temp,Department_Name:String;
     Room_ID,Department_ID:Integer;
begin
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Room_ID,Department_ID From Room');
          SQL.Add('Where Room_Name = ' +char(39) +Room_Name +char(39));
          Open;
          if (FieldValues['Room_ID'] <> null) then
          begin
               {Already Fact}
               if (FieldValues['Department_ID'] = ID) then exit;
               {Rooom In Other Department}
               if (FieldValues['Department_ID'] <> null) then
               begin
                    Department_ID := FieldValues['Department_ID'];
                    Room_ID := FieldValues['Room_ID'];
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Department_Name From Department');
                    SQL.Add('Where Department_ID = ' +IntToStr(Department_ID));
                    Open;
                    Department_Name := FieldValues['Department_Name'];
                    Temp := 'ห้อง' +Room_Name+'อยู่ในฝ่าย'+Department_Name+' คุณต้องการย้ายหรือไม่';
                    if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then
                         exit
                    else
                    begin
                         close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Update Room');
                         SQL.Add('Set Department_ID = :Department_ID');
                         SQL.Add('Where Room_ID = :Room_ID');
                         ParamByName('Department_ID').AsInteger := ID;
                         ParamByName('Room_ID').AsInteger := Room_ID;
                         execSQL;
                    end;
                    exit;
               end;
               {There are room but not in any department}
               if (FieldValues['Department_ID'] = null) then
               begin
                    Room_ID := FieldValues['Room_ID'];
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Room');
                    SQL.Add('Set Department_ID = :Department_ID');
                    SQL.Add('Where Room_ID = :Room_ID');
                    ParamByName('Department_ID').AsInteger := ID;
                    ParamByName('Room_ID').AsInteger := Room_ID;
                    execSQL;
                    exit;
               end;
          end
          { there is not this room in database}
          else
          begin
               close;
               Params.Clear;
               SQL.Clear;
               SQL.Add('insert into Room');
               SQL.Add('(Room_Name,Department_ID)');
               SQL.Add('values (:Name,:Department_ID)');
               ParamByName('Name').AsString := Room_Name;
               ParamByName('Department_ID').AsInteger := ID;
               execSQL;
          end;
     end;
end;

procedure Update_Room(ID:Integer);
begin
     with Fr_Department do
     begin
     if trim(Room1.Text) <> '' then Insert_Room(trim(Room1.Text),ID);
     if trim(Room2.Text) <> '' then Insert_Room(trim(Room2.Text),ID);
     if trim(Room3.Text) <> '' then Insert_Room(trim(Room3.Text),ID);
     if trim(Room4.Text) <> '' then Insert_Room(trim(Room4.Text),ID);
     if trim(Room5.Text) <> '' then Insert_Room(trim(Room5.Text),ID);
     if trim(Room6.Text) <> '' then Insert_Room(trim(Room6.Text),ID);
     if trim(Room7.Text) <> '' then Insert_Room(trim(Room7.Text),ID);
     if trim(Room8.Text) <> '' then Insert_Room(trim(Room8.Text),ID);
     if trim(Room9.Text) <> '' then Insert_Room(trim(Room9.Text),ID);
     if trim(Room10.Text) <> '' then Insert_Room(trim(Room10.Text),ID);
     if trim(Room11.Text) <> '' then Insert_Room(trim(Room11.Text),ID);
     if trim(Room12.Text) <> '' then Insert_Room(trim(Room12.Text),ID);
     if trim(Room13.Text) <> '' then Insert_Room(trim(Room13.Text),ID);
     if trim(Room14.Text) <> '' then Insert_Room(trim(Room14.Text),ID);
     if trim(Room15.Text) <> '' then Insert_Room(trim(Room15.Text),ID);
     if trim(Room16.Text) <> '' then Insert_Room(trim(Room16.Text),ID);
     if trim(Room17.Text) <> '' then Insert_Room(trim(Room17.Text),ID);
     if trim(Room18.Text) <> '' then Insert_Room(trim(Room18.Text),ID);
     if trim(Room19.Text) <> '' then Insert_Room(trim(Room19.Text),ID);
     if trim(Room20.Text) <> '' then Insert_Room(trim(Room20.Text),ID);
     if trim(Room21.Text) <> '' then Insert_Room(trim(Room21.Text),ID);
     if trim(Room22.Text) <> '' then Insert_Room(trim(Room22.Text),ID);
     if trim(Room23.Text) <> '' then Insert_Room(trim(Room23.Text),ID);
     if trim(Room24.Text) <> '' then Insert_Room(trim(Room24.Text),ID);
     if trim(Room25.Text) <> '' then Insert_Room(trim(Room25.Text),ID);
     if trim(Room26.Text) <> '' then Insert_Room(trim(Room26.Text),ID);
     if trim(Room27.Text) <> '' then Insert_Room(trim(Room27.Text),ID);
     end;
end;

procedure TFr_Department.Bt_OKClick(Sender: TObject);
var ID:Integer;
    Officer_Name,Temp : String;
    Chief_ID : Integer;
    Add_Chief : Boolean;
    Other_Depart : String;
begin
     Chief_ID := 0;
     Add_Chief := False;
     // Check Department Name Exist ?
     if  trim(Ed_Department_Name.Text) = '' then
     begin
          showmessage('กรุณาใส่ชื่อฝ่าย');
          exit;
     end;
     // Save Officer Name
     Officer_Name := trim(Ed_Officer_Name.Text);
     // Process for update Department
     if Update_Flag then
     begin
          // Is This Department Already In DataBase?
          if Change_Department_Name then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Department_ID From Department');
                    SQL.Add('Where Department_Name = ' +char(39) +trim(Ed_Department_Name.text) +char(39));
                    Open;
                    if (FieldValues['Department_ID'] <> null) and (FieldValues['Department_ID']<>Department_ID) then
                    begin
                         showmessage('มีฝ่ายนี้ในฐานข้อมูลแล้ว');
                         exit;
                    end;
               end;
          end;
          //Start Transaction
          DataModule1.Database1.StartTransaction;
          try
               with DataModule1.Qr_Transaction do
               begin
                    // Is this Officer Already in Database? And Save Chief ID
                    if Officer_Name <> '' then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Select Officer_ID From Officer');
                         SQL.Add('Where Officer_Name = ' +char(39) +Officer_Name +char(39));
                         Open;
                         if FieldValues['Officer_ID'] = null then
                         begin
                              close;
                              Params.Clear;
                              SQL.Clear;
                              SQL.Add('insert into Officer');
                              SQL.Add('(Officer_Name)');
                              SQL.Add('values (:Name)');
                              ParamByName('Name').AsString := Officer_Name;
                              execSQL;
                              Close;
                              SQL.Clear;
                              SQL.Add('Select Officer_ID From Officer');
                              SQL.Add('Where Officer_Name = ' +char(39) +Officer_Name +char(39));
                              Open;
                              Chief_ID := FieldValues['Officer_ID'];
                              Add_Chief := True;
                         end
                         else
                         begin
                              Chief_ID := FieldValues['Officer_ID'];
                              // Is This Officer Is Chief Of Other Department?
                              Close;
                              SQL.Clear;
                              SQL.Add('Select Department_Name From Department');
                              SQL.Add('Where Chief_ID = ' +IntToStr(Chief_ID));
                              Open;
                              if FieldValues['Department_Name'] <> Null then
                              begin
                                   Other_Depart := FieldValues['Department_Name'];
                                   Temp := Officer_Name+'เป็นหัวหน้าฝ่าย'+Other_Depart+'คุณต้องการย้ายหรือไม่' ;
                                   if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then
                                        Add_Chief := False
                                   else
                                   begin
                                        close;
                                        Params.Clear;
                                        SQL.Add('Update Department');
                                        SQL.Add('Set Chief_ID = Null');
                                        SQL.Add('Where Department_Name = '+char(39)+Other_Depart+char(39));
                                        execSQL;
                                        Add_Chief := True;
                                   end;
                              end
                              else Add_Chief := True;
                         end;
                    end;
                    // Update Department
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Department');
                    SQL.Add('Set Department_Name = :Name');
                    if Add_Chief then
                         if Officer_Name <> '' then
                              SQL.Add(', Chief_ID = :Chief_ID')
                         else
                              SQL.Add(', Chief_ID = Null');
                    SQL.Add('Where Department_ID = :Department_ID');
                    ParamByName('Name').AsString := trim(Ed_Department_Name.Text);
                    if Add_Chief then
                         if Officer_Name <> '' then
                              ParamByName('Chief_ID').AsInteger := Chief_ID;
                    ParamByName('Department_ID').AsInteger := Department_ID;
                    execSQL;
                    // Update Officer
                    if (Add_Chief) and (Officer_Name <>'') then
                    begin
                         close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Update Officer');
                         SQL.Add('Set Department_ID = :Department_ID');
                         SQL.Add('Where Officer_ID = :Chief_ID');
                         ParamByName('Chief_ID').AsInteger := Chief_ID;
                         ParamByName('Department_ID').AsInteger := Department_ID;
                         execSQL;
                    end;
                    // Update Room
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Room');
                    SQL.Add('Set Department_ID = null');
                    SQL.Add('Where Department_ID = :ID');
                    ParamByName('ID').AsInteger := Department_ID;
                    execSQL;
                    Update_Room(Department_ID);
               end;
               DataModule1.Database1.Commit;
               showmessage('แก้ไขฝ่ายเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DataModule1.Database1.Rollback;
          raise;
          end;
          //Reflesh
          DataModule1.Tb_Department_Detail.Close;
          DataModule1.Tb_Department_Detail.Open;
          DataModule1.Qr_Room_Detail.Close;
          DataModule1.Qr_Room_Detail.Open;
          DataModule1.Qr_Officer_Detail.Close;
          DataModule1.Qr_Officer_Detail.Open;
          Close;
          exit;
     end;
     { Process for Insert New Department }
     // Is This Department Already In Database?
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Department_ID From Department');
          SQL.Add('Where Department_Name = ' +char(39) +trim(Ed_Department_Name.text) +char(39));
          Open;
          if FieldValues['Department_ID'] <> null then
          begin
               showmessage('มีฝ่ายนี้ในฐานข้อมูลแล้ว');
               exit;
          end;
     end;
     //Start Transaction
     DataModule1.Database1.StartTransaction;
     try
          with DataModule1.Qr_Transaction do
          begin
               // Is this Officer Already in Database? And Save Chief ID
               if Officer_Name <> '' then
               begin
                    Add_Chief := True;
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Officer_ID From Officer');
                    SQL.Add('Where Officer_Name = ' +char(39) +Officer_Name +char(39));
                    Open;
                    if FieldValues['Officer_ID'] = null then
                    begin
                         close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('insert into Officer');
                         SQL.Add('(Officer_Name)');
                         SQL.Add('values (:Name)');
                         ParamByName('Name').AsString := Officer_Name;
                         execSQL;
                         Close;
                         SQL.Clear;
                         SQL.Add('Select Officer_ID From Officer');
                         SQL.Add('Where Officer_Name = ' +char(39) +Officer_Name +char(39));
                         Open;
                         Chief_ID := FieldValues['Officer_ID'];
                    end
                    else
                    begin
                         Chief_ID := FieldValues['Officer_ID'];
                         // Is This Officer Is Chief Of Other Department?
                         Close;
                         SQL.Clear;
                         SQL.Add('Select Department_Name From Department');
                         SQL.Add('Where Chief_ID = ' +IntToStr(Chief_ID));
                         Open;
                         if FieldValues['Department_Name'] <> Null then
                         begin
                              Other_Depart := FieldValues['Department_Name'];
                              Temp := Officer_Name+'เป็นหัวหน้าฝ่าย'+Other_Depart+'คุณต้องการย้ายหรือไม่' ;
                              if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then
                                   Add_Chief := False
                              else
                              begin
                                   close;
                                   Params.Clear;
                                   SQL.Add('Update Department');
                                   SQL.Add('Set Chief_ID = Null');
                                   SQL.Add('Where Department_Name = '+char(39)+Other_Depart+char(39));
                                   execSQL;
                                   Add_Chief := True;
                              end;
                         end
                         else Add_Chief := True;
                    end;
               end
               else Add_Chief := False;
               // Insert Department
               close;
               Params.Clear;
               SQL.Clear;
               if Add_Chief then
               begin
                    SQL.Add('insert into Department');
                    SQL.Add('(Department_Name,Chief_ID)');
                    SQL.Add('values (:Name,:Chief_ID)');
                    ParamByName('Name').AsString := trim(Ed_Department_Name.Text);
                    ParamByName('Chief_ID').AsInteger := Chief_ID;
                    execSQL;
               end
               else
               begin
                    SQL.Add('insert into Department');
                    SQL.Add('(Department_Name)');
                    SQL.Add('values (:Name)');
                    ParamByName('Name').AsString := trim(Ed_Department_Name.Text);
                    execSQL;
               end;
               //Get Department ID
               Close;
               SQL.Clear;
               SQL.Add('Select Department_ID From Department');
               SQL.Add('Where Department_Name = ' +char(39) +trim(Ed_Department_Name.text) +char(39));
               Open;
               ID := FieldValues['Department_ID'];
               // Update Officer
               if Add_Chief then
               begin
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Officer');
                    SQL.Add('Set Department_ID = :Department_ID');
                    SQL.Add('Where Officer_ID = :Chief_ID');
                    ParamByName('Chief_ID').AsInteger := Chief_ID;
                    ParamByName('Department_ID').AsInteger := ID;
                    execSQL;
               end;
               // Update Room
               Update_Room(ID);
          end;
          DataModule1.Database1.Commit;
          showmessage('เพิ่มฝ่ายเรียบร้อย');
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     //Reflesh
     DataModule1.Tb_Department_Detail.Close;
     DataModule1.Tb_Department_Detail.Open;
     DataModule1.Qr_Room_Detail.Close;
     DataModule1.Qr_Room_Detail.Open;
     DataModule1.Qr_Officer_Detail.Close;
     DataModule1.Qr_Officer_Detail.Open;
     Close;
end;


procedure TFr_Department.Ed_Department_NameChange(Sender: TObject);
begin
     Change_Department_Name := True;
end;


procedure TFr_Department.Cb_Officer_Name1CloseUp(Sender: TObject);
begin
     Ed_Officer_Name.Text := Cb_Officer_Name.Text;
end;

procedure TFr_Department.FormShow(Sender: TObject);
begin
        if DataModule1.Qr_Officer_Detail.FieldCount <=0 then exit;
        Cb_Officer_Name.Items.Clear;
        DataModule1.Qr_Officer_Detail.First;
        while not(DataModule1.Qr_Officer_Detail.Eof) do
        begin
                Cb_Officer_Name.Items.Add(DataModule1.Qr_Officer_Detail.FieldByName('Officer_Name').AsString);
                DataModule1.Qr_Officer_Detail.Next;
        end;
        Try
                Strs := TEnumString.Create(Cb_Officer_Name.Items) as IUnknown;
                AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                OleCheck(AutoComplete2.SetOptions(ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                OleCheck(AutoComplete2.Init(Ed_Officer_Name.Handle,Strs,nil,nil));
        except
        end;

end;

procedure TFr_Department.Cb_Officer_NameChange(Sender: TObject);
begin
     Ed_Officer_Name.Text := Cb_Officer_Name.Text;
end;

end.
