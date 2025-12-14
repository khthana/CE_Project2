unit Room;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls;

type
  TFr_Room = class(TForm)
    GroupBox1: TGroupBox;
    Ed_Room_Name: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Cb_Department_Name: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Ed_Room_NameChange(Sender: TObject);
  private
    { Private declarations }
  public
     Update_Flag: Boolean;
     Room_ID : Integer;
     Change_Room_Name : Boolean;
    { Public declarations }
  end;

var
  Fr_Room: TFr_Room;

implementation

uses DataModule, Main_Durable;

{$R *.DFM}

procedure TFr_Room.BitBtn1Click(Sender: TObject);
begin
     if Trim(Ed_Room_Name.Text) ='' then
     begin
          showmessage('กรุณาใส่ชื่อห้อง');
          exit;
     end;
     if Trim(Cb_Department_Name.Text) ='' then
     begin
          showmessage('กรุณาเลือกฝ่าย');
          exit;
     end;
     if Update_Flag then
     begin
          if Change_Room_Name then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Room_ID From Room');
                    SQL.Add('Where Room_Name = ' +char(39) +Trim(Ed_Room_Name.text) +char(39));
                    Open;
                    if (FieldValues['Room_ID'] <> null) and (FieldValues['Room_ID']<>Room_ID) then
                    begin
                         showmessage('มีห้องนี้ในฐานข้อมูลแล้ว');
                         exit;
                    end;
               end;
          end;
          DataModule1.Database1.StartTransaction;
          try
               with DataModule1.Qr_Transaction do
               begin
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Room');
                    SQL.Add('Set Room_Name = :Name');
                    SQL.Add(', Department_ID = :Department_ID');
                    SQL.Add('Where Room_ID = :Room_ID');
                    ParamByName('Name').AsString := Trim(Ed_Room_Name.Text);
                    ParamByName('Department_ID').AsInteger := Cb_Department_Name.KeyValue;
                    ParamByName('Room_ID').AsInteger := Room_ID;
                    execSQL;
               end;
               DataModule1.Database1.Commit;
               Change_Room_Name := False;
               showmessage('แก้ไขห้องเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DataModule1.Database1.Rollback;
          raise;
          end;
          DataModule1.Tb_Department_Detail.Close;
          DataModule1.Tb_Department_Detail.Open;
          DataModule1.Qr_Room_Detail.Close;
          DataModule1.Qr_Room_Detail.Open;
          Close;
          exit;
     end;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Room_ID From Room');
          SQL.Add('Where Room_Name = ' +char(39) +Trim(Ed_Room_Name.text) +char(39));
          Open;
          if FieldValues['Room_ID'] <> null then
          begin
               showmessage('มีห้องนี้ในฐานข้อมูลแล้ว');
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
               if Trim(Cb_Department_Name.Text) ='' then
               begin
                    SQL.Add('insert into Room');
                    SQL.Add('(Room_Name)');
                    SQL.Add('values (:Name)');
                    ParamByName('Name').AsString := Trim(Ed_Room_Name.Text);
               end
               else
               begin
                    SQL.Add('insert into Room');
                    SQL.Add('(Room_Name,Department_ID)');
                    SQL.Add('values (:Name,:Department_ID)');
                    ParamByName('Name').AsString := Trim(Ed_Room_Name.Text);
                    ParamByName('Department_ID').AsInteger := Cb_Department_Name.KeyValue;
               end;
               execSQL;
          end;
          DataModule1.Database1.Commit;
          showmessage('เพิ่มห้องเรียบร้อย');
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     DataModule1.Tb_Department_Detail.Close;
     DataModule1.Tb_Department_Detail.Open;
     DataModule1.Qr_Room_Detail.Close;
     DataModule1.Qr_Room_Detail.Open;
     Close;
end;

procedure TFr_Room.Ed_Room_NameChange(Sender: TObject);
begin
     Fr_Room.Change_Room_Name:=True;
end;

end.
