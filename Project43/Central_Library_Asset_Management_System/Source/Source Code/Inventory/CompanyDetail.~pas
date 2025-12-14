unit CompanyDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFr_Company = class(TForm)
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Ed_Fax: TEdit;
    Ed_Company_Name: TEdit;
    Mm_Address: TMemo;
    Ed_Phone1: TEdit;
    Ed_Phone2: TEdit;
    Ed_Phone3: TEdit;
    Bt_OK: TBitBtn;
    Bt_Cancel: TBitBtn;
    procedure Bt_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
     Update_Flag : Boolean;
     Company_ID : Integer;
     Change_Company_Name : Boolean;
    { Public declarations }
  end;

var
  Fr_Company: TFr_Company;

implementation

uses Main, DataModule;

{$R *.DFM}

procedure TFr_Company.Bt_OKClick(Sender: TObject);
begin
     if Ed_Company_Name.Text ='' then
     begin
          showmessage('กรุณาใส่ชื่อบริษัท');
          exit;
     end;
     if Update_Flag then
     begin
          if Change_Company_Name then
          begin
               with DM.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Company_ID From Company');
                    SQL.Add('Where Company_Name = ' +char(39) +Ed_Company_Name.text +char(39));
                    Open;
                    if (FieldValues['Company_ID'] <> null) and (FieldValues['Company_ID']<>Company_ID) then
                    begin
                         showmessage('มีบริษัทนี้ในฐานข้อมูลแล้ว');
                         exit;
                    end;
               end;
          end;
          DM.Database1.StartTransaction;
          try
               with DM.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Company_ID From Company');
                    SQL.Add('Where Company_Name = ' +char(39) +Ed_Company_Name.text +char(39));
                    Open;
                    if (FieldValues['Company_ID'] <> null) and (FieldValues['Company_ID']<>Company_ID) then
                    begin
                         showmessage('มีบริษัทนี้ในฐานข้อมูลแล้ว');
                         DM.Database1.Rollback;
                         exit;
                    end;
               end;
               with DM.Qr_Transaction do
               begin
                    close;
                    Params.Clear;
                    SQL.Clear;
                    SQL.Add('Update Company');
                    SQL.Add('Set Company_Name = :Name');
                    SQL.Add(', Phone1 = :Phone1');
                    SQL.Add(', Phone2 = :Phone2');
                    SQL.Add(', Phone3 = :Phone3');
                    SQL.Add(', Fax = :Fax');
                    SQL.Add(', Address = :Address');
                    SQL.Add('Where Company_ID = :ID');
                    ParamByName('Name').AsString := Ed_Company_Name.Text;
                    ParamByName('Phone1').AsString := Ed_Phone1.Text;
                    ParamByName('Phone2').AsString := Ed_Phone2.Text;
                    ParamByName('Phone3').AsString := Ed_Phone3.Text;
                    ParamByName('Fax').AsString := Ed_Fax.Text;
                    ParamByName('Address').AsString := Mm_Address.Text;
                    ParamByName('ID').AsInteger := Company_ID;
                    execSQL;
               end;
               DM.Database1.Commit;
               Change_Company_Name := False;
               showmessage('แก้ไขบริษัทเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DM.Database1.Rollback;
          raise;
          end;
          DM.Qr_Company.Close;
          DM.Qr_Company.Open;
          Close;
          exit;
     end;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Company_ID From Company');
          SQL.Add('Where Company_Name = ' +char(39) +Ed_Company_Name.text +char(39));
          Open;
          if FieldValues['Company_ID'] <> null then
          begin
               showmessage('มีบริษัทนี้ในฐานข้อมูลแล้ว');
               exit;
          end;
     end;
     DM.Database1.StartTransaction;
     try
          with DM.Qr_Transaction do
          begin
               close;
               Params.Clear;
               SQL.Clear;
               SQL.Add('insert into Company');
               SQL.Add('(Company_Name,Phone1,Phone2,Phone3,Fax,Address)');
               SQL.Add('values (:Name,:Phone1,:Phone2,:Phone3,:Fax,:Address)');
               ParamByName('Name').AsString := Ed_Company_Name.Text;
               ParamByName('Phone1').AsString := Ed_Phone1.Text;
               ParamByName('Phone2').AsString := Ed_Phone2.Text;
               ParamByName('Phone3').AsString := Ed_Phone3.Text;
               ParamByName('Fax').AsString := Ed_Fax.Text;
               ParamByName('Address').AsString := Mm_Address.Text;
               execSQL;
          end;
          DM.Database1.Commit;
          showmessage('เพิ่มบริษัทเรียบร้อย');
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
     raise;
     end;
     DM.Qr_Company.Close;
     DM.Qr_Company.Open;
     Close;
     Fr_Main.LB_CompanyN.KeyValue := 0;
     Fr_Main.CP_Addr.Clear;
     Fr_Main.CP_Tel1.Clear;
     Fr_Main.CP_Tel2.Clear;
     Fr_Main.CP_Tel3.Clear;
     Fr_Main.CP_Fax.Clear;
end;

end.
