unit TypeAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFr_Type = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Ed_Type_Name: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBL_Cat: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Type: TFr_Type;

implementation

uses Main, DataModule;

{$R *.DFM}

procedure TFr_Type.BitBtn1Click(Sender: TObject);
begin
      if Ed_Type_Name.Text = ''
       then begin
            Showmessage ('กรุณาใส่ชนิดที่ต้องการเพิ่ม');
            exit;
            end;
       if DBL_Cat.Text = ''
       then begin
            Showmessage ('กรุณาใส่หรือเลือกประเภท') ;
            Exit;
            end;
       if Fr_Main.Insert2 = False then
       DM.Database1.Close;
       DM.Database1.StartTransaction;
       try
       with DM.Qr_Transaction do
            if not(Fr_Main.Update) then
            begin
                Close;
                SQL.Text := 'select * from Type where Type_Name = ' +char(39) +Ed_Type_Name.Text +char(39);
                Open;
                if FieldValues['Type_Name'] <> null
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
                         SQL.Add('Insert into Type');
                         SQL.Add('(Type_Name,Category)');
                         SQL.Add('Values (:TN,:Cat)');
                         ParamByName('TN').AsString := ED_Type_Name.Text;
                         ParamByName('Cat').AsString := DBL_Cat.Text;
                         execSQL;
                     end;
                     DM.Database1.Commit;
                     Fr_Main.Insert2 := False;
                     Showmessage ('เพิ่มชนิดเรียบร้อยแล้ว');
                     close;
               end
              else begin
                    with DM.Qr_Transaction do
                    begin
                         close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Update Type');
                         SQL.Add('Set Type_Name = :Name');
                         SQL.Add(', Category = :Cat');
                         SQL.Add('Where Type_Name = :Name');
                         ParamByName('Name').AsString := Ed_Type_Name.Text;
                         ParamByName('Cat').AsString := DBL_Cat.Text;
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
        //   DM.Qr_Type_Detail.close;
          // DM.Qr_Type_Detail.Open;
           exit;
end;

end.
