unit TypeUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFr_Type = class(TForm)
    GroupBox1: TGroupBox;
    Ed_Type_Name: TEdit;
    Label1: TLabel;
    Cb_Category: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     Update_Flag : Boolean;
     Type_ID : Integer;
     Change_Type_Name : Boolean;
    { Public declarations }
  end;

var
  Fr_Type: TFr_Type;

implementation

uses DataModule, Main_Durable;

{$R *.DFM}

procedure TFr_Type.BitBtn1Click(Sender: TObject);
begin
     if Trim(Ed_Type_Name.Text) ='' then
     begin
          showmessage('กรุณาใส่ชนิด');
          exit;
     end;
     if Trim(Cb_Category.Text) = '' then
     begin
          showmessage('กรุณาเลือกชนิด');
          exit;
     end;
     if Update_Flag then
     begin
          if Change_Type_Name then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Type_ID From Room');
                    SQL.Add('Where Type_Name = ' +char(39) +Trim(Ed_Type_Name.text) +char(39));
                    Open;
                    if (FieldValues['Typr_ID'] <> null) and (FieldValues['Room_ID']<>Type_ID) then
                    begin
                         showmessage('มีชนิดนี้ในฐานข้อมูลแล้ว');
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
                    SQL.Add('Update Type');
                    SQL.Add('Set Type_Name = :Name');
                    SQL.Add(', Category = :Category');
                    SQL.Add('Where Type_ID = :Type_ID');
                    ParamByName('Name').AsString := Trim(Ed_Type_Name.Text);
                    ParamByName('Category').AsString := Trim(Cb_Category.Text);
                    ParamByName('Type_ID').AsInteger := Type_ID;
                    execSQL;
               end;
               DataModule1.Database1.Commit;
               Change_Type_Name := False;
               showmessage('แก้ไขชนิดเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DataModule1.Database1.Rollback;
          raise;
          end;
          DataModule1.Qr_Type.Close;
          DataModule1.Qr_Type.Open;
          Close;
          exit;
     end;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Type_ID From Type');
          SQL.Add('Where Type_Name = ' +char(39) +Trim(Ed_Type_Name.text) +char(39));
          Open;
          if FieldValues['Type_ID'] <> null then
          begin
               showmessage('มีชนิดนี้ในฐานข้อมูลแล้ว');
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
               SQL.Add('insert into Type');
               SQL.Add('(Type_Name,Category)');
               SQL.Add('values (:Name,:Category)');
               ParamByName('Name').AsString := Trim(Ed_Type_Name.Text);
               ParamByName('Category').AsString := Trim(Cb_Category.Text);
               execSQL;
          end;
          DataModule1.Database1.Commit;
          showmessage('เพิ่มชนิดเรียบร้อย');
          Fr_Durable.New_Temp := Trim(Ed_Type_Name.Text);
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     DataModule1.Qr_Type.Close;
     DataModule1.Qr_Type.Open;
     Close;
end;

end.
