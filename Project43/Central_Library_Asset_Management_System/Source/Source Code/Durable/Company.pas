unit Company;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

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
    procedure Ed_Company_NameChange(Sender: TObject);
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

uses Main_Durable, DataModule;

{$R *.DFM}



procedure TFr_Company.Bt_OKClick(Sender: TObject);
begin
     if Trim(Ed_Company_Name.Text) ='' then
     begin
          showmessage('กรุณาใส่ชื่อบริษัท');
          exit;
     end;
     if Update_Flag then
     begin
          if Change_Company_Name then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Select Company_ID From Company');
                    SQL.Add('Where Company_Name = ' +char(39) +Trim(Ed_Company_Name.text) +char(39));
                    Open;
                    if (FieldValues['Company_ID'] <> null) and (FieldValues['Company_ID']<>Company_ID) then
                    begin
                         showmessage('มีบริษัทนี้ในฐานข้อมูลแล้ว');
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
                    SQL.Add('Update Company');
                    SQL.Add('Set Company_Name = :Name');
                    SQL.Add(', Phone1 = :Phone1');
                    SQL.Add(', Phone2 = :Phone2');
                    SQL.Add(', Phone3 = :Phone3');
                    SQL.Add(', Fax = :Fax');
                    SQL.Add(', Address = :Address');
                    SQL.Add('Where Company_ID = :ID');
                    ParamByName('Name').AsString := Trim(Ed_Company_Name.Text);
                    ParamByName('Phone1').AsString := Trim(Ed_Phone1.Text);
                    ParamByName('Phone2').AsString := Trim(Ed_Phone2.Text);
                    ParamByName('Phone3').AsString := Trim(Ed_Phone3.Text);
                    ParamByName('Fax').AsString := Trim(Ed_Fax.Text);
                    ParamByName('Address').AsString := Trim(Mm_Address.Text);
                    ParamByName('ID').AsInteger := Company_ID;
                    execSQL;
               end;
               DataModule1.Database1.Commit;
               Change_Company_Name := False;
               showmessage('แก้ไขบริษัทเรียบร้อย');
          except
               showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DataModule1.Database1.Rollback;
          raise;
          end;
          DataModule1.Qr_Company_Detail.Close;
          DataModule1.Qr_Company_Detail.Open;
          Close;
          exit;
     end;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Company_ID From Company');
          SQL.Add('Where Company_Name = ' +char(39) +Trim(Ed_Company_Name.text) +char(39));
          Open;
          if FieldValues['Company_ID'] <> null then
          begin
               showmessage('มีบริษัทนี้ในฐานข้อมูลแล้ว');
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
               SQL.Add('insert into Company');
               SQL.Add('(Company_Name,Phone1,Phone2,Phone3,Fax,Address)');
               SQL.Add('values (:Name,:Phone1,:Phone2,:Phone3,:Fax,:Address)');
               ParamByName('Name').AsString := Trim(Ed_Company_Name.Text);
               ParamByName('Phone1').AsString := Trim(Ed_Phone1.Text);
               ParamByName('Phone2').AsString := Trim(Ed_Phone2.Text);
               ParamByName('Phone3').AsString := Trim(Ed_Phone3.Text);
               ParamByName('Fax').AsString := Trim(Ed_Fax.Text);
               ParamByName('Address').AsString := Trim(Mm_Address.Text);
               execSQL;
          end;
          DataModule1.Database1.Commit;
          showmessage('เพิ่มบริษัทเรียบร้อย');
          Fr_Durable.New_Temp := Trim(Ed_Company_Name.Text);
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     DataModule1.Qr_Company_Detail.Close;
     DataModule1.Qr_Company_Detail.Open;
     Close;
end;

procedure TFr_Company.Ed_Company_NameChange(Sender: TObject);
begin
     Fr_Company.Change_Company_Name := True;
end;

end.
