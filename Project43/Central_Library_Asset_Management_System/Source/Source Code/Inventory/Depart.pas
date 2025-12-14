unit Depart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFr_Depart = class(TForm)
    Label1: TLabel;
    Ed_Add_Depart: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
     Old_Name : String;
    { Public declarations }
  end;

var
  Fr_Depart: TFr_Depart;

implementation

uses Main, DataModule;

{$R *.DFM}

procedure TFr_Depart.BitBtn1Click(Sender: TObject);
Var Depart_ID : Integer;
begin
       if Ed_Add_Depart.Text = ''
       then begin
            Showmessage ('กรุณาใส่ชื่อฝ่ายที่ต้องการเพิ่ม');
            exit;
            end;
       DM.Database1.StartTransaction;
       try
       with DM.Qr_Transaction do
           if not(Fr_Main.Update_Depart)
           Then
               begin
               Close;
               SQL.Text := 'select * from Department where Department_Name = ' +char(39) +Ed_Add_Depart.Text +char(39);
               Open;
               if FieldValues['Department_Name'] <> null
               then begin
                    Showmessage ('มีชื่อฝ่ายในฐานข้อมูลแล้ว');
                    Exit;
                    end
               else With DM.Qr_Transaction do
                    Begin
                         Close;
                         Params.Clear;
                         SQL.Clear;
                         SQL.Add('Insert into Department');
                         SQL.Add('(Department_Name)');
                         SQL.Add('Values (:DN)');
                         ParamByName('DN').AsString := ED_Add_Depart.Text;
                         execSQL;
                    end;
                    DM.Database1.Commit;
                    Showmessage ('บันทึกฝ่ายเรียบร้อยแล้ว');
                    Fr_Depart.Close;
                    end {with}
               Else begin
                    Close;
                    SQL.Text := 'select * from Department where Department_Name = ' +char(39) +Old_Name +char(39);
                    Open;
                    if FieldValues['Department_ID'] = null then showmessage ('ss');
                    Depart_ID := FieldValues['Department_ID'];
                         With DM.Qr_Transaction do
                         Begin
                              Close;
                              Params.Clear;
                              SQL.Clear;
                              SQL.Add('Update Department');
                              SQL.Add('Set Department_Name = :Name');
                              SQL.Add('Where Department_ID = :ID');
                              ParamByName('ID').AsInteger := Depart_ID;
                              ParamByName('Name').AsString := Ed_Add_Depart.Text;
                              execSQL;
                         end;
                         DM.Database1.Commit;
                         Showmessage ('แก้ไขฝ่ายเรียบร้อยแล้ว');
                         Fr_Depart.Close;
                         end;{with}

               Except
                    Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
                    DM.Database1.Rollback;
               Raise;
               Close;
               end;
           DM.Qr_Depart.Close;
           DM.Qr_Depart.Open;

end;

procedure TFr_Depart.FormCreate(Sender: TObject);
begin
     Old_Name := Ed_Add_Depart.Text;
end;

end.
