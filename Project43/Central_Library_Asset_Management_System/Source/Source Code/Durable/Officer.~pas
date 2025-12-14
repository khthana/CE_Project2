unit Officer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons;

type
  TFr_Officer = class(TForm)
    Bt_Officer_OK: TBitBtn;
    Bt_Officer_Cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Ed_Officer_Name: TEdit;
    Label2: TLabel;
    Cb_Department_Name: TDBLookupComboBox;
    procedure Bt_Officer_OKClick(Sender: TObject);
    procedure Ed_Officer_NameChange(Sender: TObject);
  private
    { Private declarations }
  public
     Update_Flag : Boolean;
     Officer_ID : Integer;
     Change_Officer_Name : Boolean;
    { Public declarations }
  end;

var
  Fr_Officer: TFr_Officer;

implementation

uses DataModule, Main_Durable;

{$R *.DFM}

procedure TFr_Officer.Bt_Officer_OKClick(Sender: TObject);
var Other_Depart,Temp : String;
    Add_Depart : Boolean;
begin
     if Trim(Ed_Officer_Name.Text) ='' then
     begin
          showmessage('กรุณาใส่ชื่อเจ้าหน้าที่');
          exit;
     end;
     if Trim(Cb_Department_Name.Text) = '' then
     begin
          showmessage('กรุณาเลือกฝ่าย');
          exit;
     end;
     if Update_Flag then
     begin
          if Change_Officer_Name then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Officer_ID From Officer');
                    SQL.Add('Where Officer_Name = ' +char(39) +Trim(Ed_Officer_Name.text) +char(39));
                    Open;
                    if (FieldValues['Officer_ID'] <> null) and (FieldValues['Officer_ID']<>Officer_ID) then
                    begin
                         showmessage('มีเจ้าหน้าที่คนนี้ในฐานข้อมูลแล้ว');
                         exit;
                    end;
               end;
          end;
          DataModule1.Database1.StartTransaction;
          try
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Department_ID,Department_Name From Department');
                    SQL.Add('Where Chief_ID = ' +IntToStr(Officer_ID));
                    Open;
                    if (FieldValues['Department_ID'] <> Null) and (FieldValues['Department_ID']<>Cb_Department_Name.KeyValue) then
                    begin
                         Other_Depart := FieldValues['Department_Name'];
                         Temp := 'เจ้าหน้าที่คนนี้เป็นหัวหน้าฝ่าย'+Other_Depart+'คุณต้องการย้ายหรือไม่' ;
                         if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then
                              Add_Depart := False
                         else
                         begin
                              close;
                              Params.Clear;
                              SQL.Add('Update Department');
                              SQL.Add('Set Chief_ID = Null');
                              SQL.Add('Where Department_Name = '+char(39)+Other_Depart+char(39));
                              execSQL;
                              Add_Depart := True;
                         end;
                    end
                    else Add_Depart := True;
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Officer');
                    SQL.Add('Set Officer_Name = :Name');
                    if Add_Depart then SQL.Add(', Department_ID = :Department_ID');
                    SQL.Add('Where Officer_ID = :Officer_ID');
                    ParamByName('Name').AsString := Trim(Ed_Officer_Name.Text);
                    if Add_Depart then ParamByName('Department_ID').AsInteger := Cb_Department_Name.KeyValue;
                    ParamByName('Officer_ID').AsInteger := Officer_ID;
                    execSQL;
               end;
               DataModule1.Database1.Commit;
               Change_Officer_Name := False;
               showmessage('แก้ไขเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DataModule1.Database1.Rollback;
          raise;
          end;
          DataModule1.Qr_Officer_Detail.Close;
          DataModule1.Qr_Officer_Detail.Open;
          DataModule1.Tb_Department_Detail.Close;
          DataModule1.Tb_Department_Detail.Open;
          Close;
          exit;
     end;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Officer_ID From Officer');
          SQL.Add('Where Officer_Name = ' +char(39) +Trim(Ed_Officer_Name.text) +char(39));
          Open;
          if FieldValues['Officer_ID'] <> null then
          begin
               showmessage('มีเจ้าหน้าที่คนนี้ในฐานข้อมูลแล้ว');
               exit;
          end;
     end;
     DataModule1.Database1.StartTransaction;
     try
          with DataModule1.Qr_Transaction do
          begin
               close;
               Params.Clear;
               SQL.Clear;
               SQL.Add('insert into Officer');
               SQL.Add('(Officer_Name,Department_ID)');
               SQL.Add('values (:Name,:Department_ID)');
               ParamByName('Name').AsString := Trim(Ed_Officer_Name.Text);
               ParamByName('Department_ID').AsInteger := Cb_Department_Name.KeyValue;
               execSQL;
          end;
          DataModule1.Database1.Commit;
          showmessage('เพิ่มเจ้าหน้าที่เรียบร้อย');
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     DataModule1.Qr_Officer_Detail.Close;
     DataModule1.Qr_Officer_Detail.Open;
     DataModule1.Tb_Department_Detail.Close;
     DataModule1.Tb_Department_Detail.Open;
     Close;
end;

procedure TFr_Officer.Ed_Officer_NameChange(Sender: TObject);
begin
     Fr_Officer.Change_Officer_Name:=True;
end;

end.
