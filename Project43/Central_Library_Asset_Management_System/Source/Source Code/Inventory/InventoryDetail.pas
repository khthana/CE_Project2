unit InventoryDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons;

type
  TFr_Inventory = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Ed_No: TEdit;
    Ed_Enum: TEdit;
    Ed_MinNo: TEdit;
    Ed_Ppe: TEdit;
    Label1: TLabel;
    Ed_Type_Name: TEdit;
    Label2: TLabel;
    DBL_Cat: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SiZe: TEdit;
    Place: TEdit;
    Code: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Inventory: TFr_Inventory;

implementation

uses Main, DataModule, EditVoucher ;

{$R *.DFM}

procedure TFr_Inventory.Button12Click(Sender: TObject);
begin
       if Ed_Type_Name.Text = ''
       then begin
            Showmessage ('กรุณาใส่ชื่อวัสดุที่ต้องการเพิ่ม');
            exit;
            end;
       if DBL_Cat.Text = ''
       then begin
            Showmessage ('กรุณาใส่หรือเลือกประเภทวัสดุที่ต้องการเพิ่ม');
            exit;
            end;
       if Ed_No.Text = ''
       then begin
            Showmessage ('กรุณาใส่จำนวนของวัสดุภัณฑ์');
            exit;
            end;
       if Ed_Enum.Text = ''
       then begin
            Showmessage ('กรุณาใส่หน่วยของวัสดุ');
            exit;
            end;
       if Ed_MinNo.Text = ''
       then begin
            Showmessage ('กรุณาใส่ชื่อวัสดุที่ต้องการเพิ่ม');
            exit;
            end;
       if Fr_Main.Insert2 = False then
       DM.Database1.StartTransaction;
       try
       with DM.Qr_Transaction do
            if not(Fr_Main.Update) then
            begin
                Close;
                SQL.Text := 'select * from Inventory where Inventory_Name = ' +char(39) +Ed_Type_Name.Text +char(39);
                Open;
                if FieldValues['Inventory_Name'] <> null
                then begin
                     Showmessage ('มีชนิดนี้ในฐานข้อมูลแล้ว');
                     DM.Qr_Transaction.Close;
                     Fr_Main.Insert2 := True;
                     Exit;
                     end
                else With DM.Qr_Transaction do
                     Begin
                         Close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Insert into inventory');
                         SQL.Add('(Inventory_Name,Category,Have_No,Numerative,Min_Have,PPE)');
                         SQL.Add('Values (:IN,:Cat,:HN,:NMR,:MH,:IP)');
                         ParamByName('IN').AsString := ED_Type_Name.Text;
                         ParamByName('Cat').AsString := DBL_Cat.Text;
                         ParamByName('HN').AsInteger := StrToInt(Ed_No.text);
                         ParamByName('NMR').AsString := Ed_Enum.text;
                         ParamByName('MH').AsInteger := StrToInt(Ed_MinNo.text);
                         if Ed_Ppe.Text <> '' then
                              ParamByName('IP').AsFloat := StrToFloat(Ed_Ppe.text)
                            else ParamByName('IP').AsFloat := 0;
                         execSQL;
                     end;
                     DM.Database1.Commit;
                     Fr_Main.Insert2 := False;
                     Showmessage ('เพิ่มวัสดุเรียบร้อยแล้ว');
                     close;
               end
              else begin
                    with DM.Qr_Transaction do
                    begin
                         close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Update Inventory');
                         SQL.Add('Set Inventory_Name = :IN');
                         SQL.Add(', Category = :Cat');
                         SQL.Add(', Have_No = :HN');
                         SQL.Add(', Numerative = :NMR');
                         SQL.Add(', Min_Have = :MH');
                         SQL.Add(', PPE = :IP');
                         SQL.Add('Where Inventory_Name = :IN');
                         ParamByName('IN').AsString := ED_Type_Name.Text;
                         ParamByName('Cat').AsString := DBL_Cat.Text;
                         ParamByName('HN').AsInteger := StrToInt(Ed_No.text);
                         ParamByName('NMR').AsString := Ed_Enum.text;
                         ParamByName('MH').AsInteger := StrToInt(Ed_MinNo.text);
                         if Ed_Ppe.Text <> ''
                         then
                              ParamByName('IP').AsFloat := StrToFloat(Ed_Ppe.text)
                         else
                              ParamByName('IP').AsFloat := 0;
                         execSQL;
                    end;
                    DM.Database1.Commit;
                    showmessage('แก้ไขชนิดเรียบร้อย');
                    Fr_Main.Update := False;
                    end;
               Except
                 Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
                 DM.Database1.Rollback;
               Raise;
           //DM.Qr_Department.Close;
           //DM.Qr_Department.Open;
           Close;
           end;
           close;
           DM.Qr_Inventory_Detail.close;
           DM.Qr_Inventory_Detail.Open;
           exit;
end;

procedure TFr_Inventory.BitBtn1Click(Sender: TObject);
begin
       if Ed_Type_Name.Text = ''
       then begin
            Showmessage ('กรุณาใส่ชื่อวัสดุที่ต้องการเพิ่ม');
            exit;
            end;
       if DBL_Cat.Text = ''
       then begin
            Showmessage ('กรุณาใส่หรือเลือกประเภทวัสดุที่ต้องการเพิ่ม');
            exit;
            end;
       if Ed_No.Text = ''
       then begin
            Ed_No.Text := '0';
            end;
       if Ed_Enum.Text = ''
       then begin
            Showmessage ('กรุณาใส่หน่วยของวัสดุ');
            exit;
            end;
              if Ed_No.Text = ''
       then begin
            Ed_MinNo.Text := '0';
            end;
       if Ed_No.Text = ''
       then begin
            Ed_Ppe.Text := '0';
            end;
       if Fr_Main.Insert2 = False then
       DM.Database1.StartTransaction;
       try
       with DM.Qr_Transaction do
            if not(Fr_Main.Update) then
            begin
                Close;
                SQL.Text := 'select * from Inventory where Inventory_Name = ' +char(39) +Ed_Type_Name.Text +char(39);
                Open;
                if FieldValues['Inventory_Name'] <> null
                then begin
                     Showmessage ('มีชนิดนี้ในฐานข้อมูลแล้ว');
                     DM.Qr_Transaction.Close;
                     Fr_Main.Insert2 := True;
                     Exit;
                     end
                else With DM.Qr_Transaction do
                     Begin
                         Close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Insert into inventory');
                         SQL.Add('(Inventory_Name,Category,Numerative,Min_Have,Size_,Place,Code)');
                         SQL.Add('Values (:IN,:Cat,:NMR,:MH,:SZ,:PLC,:Code)');
                         ParamByName('IN').AsString := ED_Type_Name.Text;
                         ParamByName('Cat').AsString := DBL_Cat.Text;
                         ParamByName('NMR').AsString := Ed_Enum.text;
                         ParamByName('MH').AsInteger := StrToInt(Ed_MinNo.text);
                         ParamByName('SZ').AsString := SiZe.Text;
                         ParamByName('PLC').AsString := Place.Text;
                         ParamByName('Code').AsString := Code.Text;
                         ExecSQL;

                         Close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Declare @I_ID int');
                         SQL.Add('Set @I_ID = (Select Inventory_ID From Inventory Where Inventory_Name ='+#39+ED_Type_Name.Text+#39+')');
                         SQL.Add('Insert into Lot');
                         SQL.Add('(Lot_ID,Inventory_ID,Have_No,PPE)');
                         SQL.Add('Values (1,@I_ID,:HN,:PPE)');
                         ParamByName('HN').AsInteger := StrToInt(Ed_No.Text);
                         ParamByName('PPE').AsFloat := StrToFloat(Ed_Ppe.text);
                         ExecSQL;

                         Close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Declare @I_ID int');
                         SQL.Add('Set @I_ID = (Select Inventory_ID From Inventory Where Inventory_Name ='+#39+ED_Type_Name.Text+#39+')');
                         SQL.Add('Insert into Transaction_');
                         SQL.Add('(Transaction_ID,Inventory_ID,PassTo,Have_No,PPE,Department_ID,Date_)');
                         SQL.Add('Values (1,@I_ID,:PT,:HN,:PPE,:DP,:Date_)');
                         ParamByName('PT').AsString   := 'ยอดยกมา';
                         ParamByName('HN').AsInteger  := StrToInt(Ed_No.Text);
                         ParamByName('PPE').AsFloat := StrToFloat(Ed_Ppe.text);
                         ParamByName('DP').AsString   := '';
                         ParamByName('Date_').AsDateTime := Date;
                         ExecSQL;
                     end;
                DM.Database1.Commit;
                Fr_Main.Insert2 := False;
                Showmessage ('เพิ่มวัสดุเรียบร้อยแล้ว');
                close;
            end; {if}
     Except
           Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
           DM.Database1.Rollback;
           Raise;
           Close;
     end;
     close;
     DM.Qr_Inventory_Detail.close;
     DM.Qr_Inventory_Detail.Open;
     Fr_Main.Inven_Change := True;
     Fr_Main.TabSheet14.OnShow(Sender);
     Fr_EditVoucher.Inven_Change := True;
     Fr_EditVoucher.TabSheet14.OnShow(Sender);
     Fr_Main.Inven_Change := True;
     Fr_Main.Inven_Change2 := True;
     Fr_Main.Inven_Change3 := True;
end;

end.
