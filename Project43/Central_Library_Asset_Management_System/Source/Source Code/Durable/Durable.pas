unit Durable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, StdCtrls, Mask, DBCtrls , AutoTools, ComObj;

type
  TFr_Durable_Detail = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Ed_Durable_ID: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Cb_Status: TComboBox;
    Label4: TLabel;
    Ed_Price: TEdit;
    Label14: TLabel;
    Ed_Length_Maintain: TEdit;
    Cb_TypeMaintain: TComboBox;
    Label9: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Ed_Date_Buy: TEdit;
    Label7: TLabel;
    Ed_Date_Expire1: TEdit;
    Label8: TLabel;
    Ed_Date_Expire2: TEdit;
    Label13: TLabel;
    Mm_Detail: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    Ed_Contact_Name: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    Ed_CPU: TEdit;
    Label10: TLabel;
    Ed_Monitor: TEdit;
    Label17: TLabel;
    Ed_Harddisk: TEdit;
    Ed_Ram: TEdit;
    Label18: TLabel;
    Ed_Keyboard: TEdit;
    Label19: TLabel;
    Ed_Mouse: TEdit;
    Label20: TLabel;
    Ed_Lancard: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Ed_CDROM: TEdit;
    Ed_Soundcard: TEdit;
    Ed_Speaker: TEdit;
    Ed_Type: TEdit;
    Ed_Category: TEdit;
    Button1: TButton;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Lv_History: TListView;
    GroupBox10: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Ed_Date_Take: TEdit;
    Ed_Date_Repair: TEdit;
    Mm_Condition: TMemo;
    Mm_Attach_Item: TMemo;
    GroupBox9: TGroupBox;
    Label32: TLabel;
    Label34: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Ed_Contact_Name2: TEdit;
    Ed_Officer_Name: TEdit;
    Ed_Company_Name: TEdit;
    Mm_Company_Address: TMemo;
    Ed_Company_Phone1: TEdit;
    Ed_Company_Phone2: TEdit;
    Ed_Company_Phone3: TEdit;
    Ed_Company_Fax: TEdit;
    Button2: TButton;
    GroupBox12: TGroupBox;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Ed_Date_Over: TEdit;
    Ed_Document_ID: TEdit;
    Ed_Name1: TEdit;
    Ed_Name2: TEdit;
    Ed_Name3: TEdit;
    Mm_Reason: TMemo;
    GroupBox14: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Ed_Date_Give: TEdit;
    Ed_Give_Document: TEdit;
    Mm_Receiver: TMemo;
    Mm_Give_Reason: TMemo;
    Cb_Type: TComboBox;
    Cb_Respond_Name: TComboBox;
    Ed_Respond_Name2: TEdit;
    Cb_Room: TComboBox;
    Ed_Room: TEdit;
    Cb_Select_Company: TComboBox;
    Ed_Select_Company: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Cb_StatusChange(Sender: TObject);
    procedure Ed_PriceChange(Sender: TObject);
    procedure Ed_Length_MaintainChange(Sender: TObject);
    procedure Cb_TypeMaintainChange(Sender: TObject);
    procedure Cb_Respond_NameCloseUp(Sender: TObject);
    procedure Cb_RoomCloseUp(Sender: TObject);
    procedure Ed_Date_BuyChange(Sender: TObject);
    procedure Ed_Date_Expire1Change(Sender: TObject);
    procedure Ed_Date_Expire2Change(Sender: TObject);
    procedure Mm_DetailChange(Sender: TObject);
    procedure Cb_Select_CompanyCloseUp(Sender: TObject);
    procedure Ed_Contact_NameChange(Sender: TObject);
    procedure Ed_CPUChange(Sender: TObject);
    procedure Ed_KeyboardChange(Sender: TObject);
    procedure Ed_MonitorChange(Sender: TObject);
    procedure Ed_LancardChange(Sender: TObject);
    procedure Ed_HarddiskChange(Sender: TObject);
    procedure Ed_CDROMChange(Sender: TObject);
    procedure Ed_RamChange(Sender: TObject);
    procedure Ed_SoundcardChange(Sender: TObject);
    procedure Ed_MouseChange(Sender: TObject);
    procedure Ed_SpeakerChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Ed_Date_BuyExit(Sender: TObject);
    procedure Ed_Date_Expire1Exit(Sender: TObject);
    procedure Ed_Date_Expire2Exit(Sender: TObject);
    procedure Ed_Length_MaintainExit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Cb_TypeChange(Sender: TObject);
    procedure Ed_TypeExit(Sender: TObject);
    procedure Ed_TypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_TypeChange(Sender: TObject);
    procedure Ed_Durable_IDChange(Sender: TObject);
    procedure Cb_Respond_NameChange(Sender: TObject);
    procedure Cb_RoomChange(Sender: TObject);
    procedure Cb_Select_CompanyChange(Sender: TObject);
    procedure Ed_CategoryChange(Sender: TObject);
    procedure Ed_Respond_Name2Change(Sender: TObject);
    procedure Ed_RoomChange(Sender: TObject);
    procedure Ed_Select_CompanyChange(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { Private declarations }
    AutoComplete2 : IAutoComplete2;
    Strs : IUnknown;

  public
     Change : Boolean;
     Change2 : Boolean;
     Maintain : Boolean;
     Old_Status : String;
     Durable_ID : String;
     Category : String;

    { Public declarations }
  end;

var
  Fr_Durable_Detail: TFr_Durable_Detail;
  //procedure Refresh_Lv_Durable_Detail ();


implementation

uses Com_Detail, DataModule, Main_Durable, TypeUnit, Receive;

{$R *.DFM}



procedure TFr_Durable_Detail.Button1Click(Sender: TObject);
var Durable_ID,Temp : String;
begin
     Durable_ID := Ed_Durable_ID.Text;
     Temp := 'คุณแน่ใจหรือไม่ที่จะลบครุภัณฑ์เลขที่ ' + Durable_ID;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
     DataModule1.Database1.StartTransaction;
     try
         with DataModule1.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Durable');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Computer_Detail');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Repair');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Repair_History');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Over1');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Give');
              SQL.Add('Where Durable_ID = '+char(39)+Durable_ID+char(39));
              execSQL;
         end;
         DataModule1.Database1.Commit;
         showmessage('ลบครุภัณฑ์เรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DataModule1.Database1.Rollback;
     raise;
     end;
     Refresh_Lv_Durable_Detail;
end;

procedure TFr_Durable_Detail.BitBtn1Click(Sender: TObject);
var Length_Maintain,Company_ID,Type_ID,Officer_ID,Room_ID : Integer;
    Year1,Month1,Day1 : Word;
begin
     if not(Change or Change2) then
     begin
          Close;
          exit;
     end;
     if Trim(Ed_Durable_ID.Text) = '' then
     begin
        showmessage('กรุณาใส่เลขครุภัณฑ์');
        Ed_Durable_ID.Text := Durable_ID;
        exit;
     end;
     if Ed_Durable_ID.Text <> Durable_ID then
     begin
          with DataModule1.Qr_Transaction do
          begin
               Close;
              SQL.Text := 'select Durable_ID from durable where Durable_ID = ' +char(39) +Trim(Ed_Durable_ID.Text) +char(39);
               Open;
               if FieldValues['Durable_ID'] <> null then
               begin
                    showmessage('มีเลขครุภัณฑ์นี้ในฐานข้อมูลแล้ว');
                    Ed_Durable_ID.Text := Durable_ID;
                    exit;
               end;
          end;
     end;
     if Trim(Ed_Type.Text) = '' then
     begin
        showmessage('กรุณาเลือกชนิดครุภัณฑ์');
        exit;
     end;
     if Trim(Cb_Status.Text) = '' then
     begin
        showmessage('กรุณาเลือกสถานะของครุภัณฑ์');
        exit;
     end;
     if Trim(Ed_Room.Text) = '' then
     begin
        showmessage('กรุณาเลือกห้องที่เก็บครุภัณฑ์');
        exit;
     end;
     if Trim(Cb_TypeMaintain.Text) = 'ปี' then
          Length_Maintain := StrToIntDef(Ed_Length_Maintain.Text,0) * 12
     else Length_Maintain := StrToIntDef(Ed_Length_Maintain.Text,0);
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Type_ID from Type where Type_Name = ' +char(39) +Trim(Ed_Type.Text) +char(39);
          Open;
          if FieldValues['Type_ID'] = null then
          begin
               showmessage('กรุณาเลือกชนิดจากรายการ');
               exit;
          end
          else
                Type_ID := FieldValues['Type_ID'];
          if Trim(Ed_Respond_Name2.Text) <> '' then
          begin
               Close;
               SQL.Text := 'select Officer_ID from Officer where Officer_Name = ' +char(39) +Trim(Ed_Respond_Name2.Text) +char(39);
               Open;
               if FieldValues['Officer_ID'] = null then
               begin
                    showmessage('กรุณาเลือกชื่อเจ้าหน้าที่จากรายการ');
                    exit;
               end
               else
                    Officer_ID := FieldValues['Officer_ID'];
          end
          else Officer_ID := -1;
          Close;
          SQL.Text := 'select Room_ID from Room where Room_Name = ' +char(39) +Trim(Ed_Room.Text) +char(39);
          Open;
          if FieldValues['Room_ID'] = null then
          begin
               showmessage('กรุณาเลือกห้องจากรายการ');
               exit;
          end
          else
                Room_ID := FieldValues['Room_ID'];
          if Trim(Ed_Select_Company.Text) <> '' then
          begin
               Close;
               SQL.Text := 'select Company_ID from Company where Company_Name = ' +char(39) +Trim(Ed_Select_Company.Text) +char(39);
               Open;
               if FieldValues['Company_ID'] = null then
               begin
                    showmessage('กรุณาเลือกบริษัทจากรายการ');
                    exit;
               end
               else
                     Company_ID := FieldValues['Company_ID'];
          end
          else Company_ID := -1;
     end;
     DataModule1.Database1.StartTransaction;
     try
     begin
          if Change then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.Add('Update Durable');
                    SQL.Add('Set Durable_ID = :Durable_ID ,Type_ID = :Type_ID ,Price = :Price, Respond_ID = :Respond_ID, Room_ID = :Room_ID');
                    SQL.Add(', Status = :Status, Length_Maintain = :Length_Maintain, Company_ID = :Company_ID');
                    SQL.Add(', Contact_Name = :Contact_Name,Detail = :Detail');
                    if Trim(Ed_Date_Buy.Text) <> '' then
                    begin
                         SQL.Add(',Date_Buy = :Date_Buy');
                         DecodeDate(StrToDate(Ed_Date_Buy.Text),Year1,Month1,Day1);
                         Parambyname('Date_Buy').AsDateTime := EncodeDate(Year1-543,Month1,Day1);
                    end
                    else SQL.Add(',Date_Buy = Null');
                    if Trim(Ed_Date_Expire1.Text) <> '' then
                    begin
                         SQL.Add(', Date_Expire1 = :Date_Expire1');
                         DecodeDate(StrToDate(Ed_Date_Expire1.Text),Year1,Month1,Day1);
                         Parambyname('Date_Expire1').AsDateTime := EncodeDate(Year1-543,Month1,Day1);
                    end
                    else SQL.Add(',Date_Expire1 = Null');
                    if Trim(Ed_Date_Expire2.Text) <> '' then
                    begin
                         SQL.Add(', Date_Expire2 = :Date_Expire2');
                         DecodeDate(StrToDate(Ed_Date_Expire2.Text),Year1,Month1,Day1);
                         Parambyname('Date_Expire2').AsDateTime := EncodeDate(Year1-543,Month1,Day1);
                    end
                    else SQL.Add(',Date_Expire2 = Null');
                    SQL.Add(', Date_Change = :Date_Change');
                    SQL.Add('Where Durable_ID = :Old_Durable_ID');
                    Parambyname('Old_Durable_ID').AsString := Durable_ID;
                    Parambyname('Type_ID').AsInteger := Type_ID;
                    Parambyname('Durable_ID').AsString := Trim(Ed_Durable_ID.Text );
                    Parambyname('Price').AsInteger := StrToIntDef(Ed_Price.Text,0);
                    Parambyname('Respond_ID').AsInteger := Officer_ID;
                    Parambyname('Room_ID').AsInteger := Room_ID;
                    Parambyname('Status').AsString := Trim(Cb_Status.Text);
                    Parambyname('Length_Maintain').AsInteger := Length_Maintain;
                    Parambyname('Company_ID').AsInteger := Company_ID;
                    Parambyname('Contact_Name').AsString := Trim(Ed_Contact_Name.Text);
                    Parambyname('Detail').AsString := Trim(Mm_Detail.Text);
                    Parambyname('Date_Change').AsDateTime := Date;
                    execSQL;
                    if (Category = 'คอมพิวเตอร์') and (Ed_Category.Text <> 'คอมพิวเตอร์') then
                    begin
                         //Delete Computer Detail
                         Close;
                         SQL.Clear;
                         Params.Clear;
                         SQL.Add('Delete From Computer_Detail Where Durable_ID = ' + Char(39)+Durable_ID+Char(39));
                         ExecSQL;
                    end
                    else if (Category <> 'คอมพิวเตอร์') and (Ed_Category.Text = 'คอมพิวเตอร์') then
                    begin
                         //Create Computer Detail
                         Close;
                         SQL.Clear;
                         Params.Clear;
                         SQL.Add(' Insert Into Computer_Detail (Durable_ID,CPU,Monitor,Harddisk,Ram,Mouse,Keyboard,LanCard,CD_ROM,SoundCard,Speaker)');
                         SQL.Add(' values(:Durable_ID,:CPU,:Monitor,:Harddisk,:Ram,:Mouse,:Keyboard,:LanCard,:CD_ROM,:SoundCard,:Speaker)');
                         Parambyname('Durable_ID').AsString := Trim(Ed_Durable_ID.Text);
                         Parambyname('CPU').AsString := Trim(Fr_Com_Detail.Ed_CPU.Text);
                         Parambyname('Monitor').AsString := Trim(Fr_Com_Detail.Ed_Monitor.Text);
                         Parambyname('Harddisk').AsString := Trim(Fr_Com_Detail.Ed_Harddisk.Text);
                         Parambyname('Ram').AsString := Trim(Fr_Com_Detail.Ed_RAM.Text);
                         Parambyname('Mouse').AsString := Trim(Fr_Com_Detail.Ed_Mouse.Text);
                         Parambyname('Keyboard').AsString := Trim(Fr_Com_Detail.Ed_Keyboard.Text);
                         Parambyname('LanCard').AsString := Trim(Fr_Com_Detail.Ed_Lancard.Text);
                         Parambyname('CD_ROM').AsString := Trim(Fr_Com_Detail.Ed_CDROM.Text);
                         Parambyname('SoundCard').AsString := Trim(Fr_Com_Detail.Ed_Soundcard.Text);
                         Parambyname('Speaker').AsString := Trim(Fr_Com_Detail.Ed_Speaker.Text);
                         execSQL;
                    end
                    else if (Category = 'คอมพิวเตอร์') and (Durable_ID <> Ed_Durable_ID.Text) then
                    begin
                         //Update Computer Detail
                         Close;
                         SQL.Clear;
                         Params.Clear;
                         SQL.Add(' Update Computer_Detail ');
                         SQL.Add(' Set Durable_ID = :Durable_ID,CPU = :CPU,Monitor = :Monitor,HardDisk = :Harddisk');
                         SQL.Add(',Ram = :Ram,Mouse = :Mouse,KeyBoard = :Keyboard,LanCard = :LanCard,CD_ROM = :CD_ROM');
                         SQL.Add(',SoundCard = :SoundCard,Speaker = :Speaker');
                         SQL.Add('Where Durable_ID = :Old_Durable_ID');
                         Parambyname('Old_Durable_ID').AsString := Durable_ID;
                         Parambyname('Durable_ID').AsString := Ed_Durable_ID.Text;
                         Parambyname('CPU').AsString := Trim(Fr_Com_Detail.Ed_CPU.Text);
                         Parambyname('Monitor').AsString := Trim(Fr_Com_Detail.Ed_Monitor.Text);
                         Parambyname('Harddisk').AsString := Trim(Fr_Com_Detail.Ed_Harddisk.Text);
                         Parambyname('Ram').AsString := Trim(Fr_Com_Detail.Ed_RAM.Text);
                         Parambyname('Mouse').AsString := Trim(Fr_Com_Detail.Ed_Mouse.Text);
                         Parambyname('Keyboard').AsString := Trim(Fr_Com_Detail.Ed_Keyboard.Text);
                         Parambyname('LanCard').AsString := Trim(Fr_Com_Detail.Ed_Lancard.Text);
                         Parambyname('CD_ROM').AsString := Trim(Fr_Com_Detail.Ed_CDROM.Text);
                         Parambyname('SoundCard').AsString := Trim(Fr_Com_Detail.Ed_Soundcard.Text);
                         Parambyname('Speaker').AsString := Trim(Fr_Com_Detail.Ed_Speaker.Text);
                         execSQL;
                    end;
               end;
          end;
          if Change2 then
          begin
               with DataModule1.Qr_Transaction do
               begin
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.Add('Update Computer_Detail');
                    SQL.Add('Set CPU = :CPU ,Monitor = :Monitor ,Harddisk = :Harddisk ,Ram = :Ram, Mouse = :Mouse');
                    SQL.Add(',Keyboard = :Keyboard ,LanCard = :LanCard ,CD_ROM = :CD_ROM ,SoundCard = :SoundCard ,Speaker = :Speaker');
                    SQL.Add('Where Durable_ID = :Durable_ID');
                    Parambyname('Durable_ID').AsString := Trim(Ed_Durable_ID.Text);
                    Parambyname('CPU').AsString := Trim(Ed_CPU.Text);
                    Parambyname('Monitor').AsString := Trim(Ed_Monitor.Text);
                    Parambyname('Harddisk').AsString := Trim(Ed_Harddisk.Text);
                    Parambyname('Ram').AsString := Trim(Ed_RAM.Text);
                    Parambyname('Mouse').AsString := Trim(Ed_Mouse.Text);
                    Parambyname('Keyboard').AsString := Trim(Ed_Keyboard.Text);
                    Parambyname('LanCard').AsString := Trim(Ed_Lancard.Text);
                    Parambyname('CD_ROM').AsString := Trim(Ed_CDROM.Text);
                    Parambyname('SoundCard').AsString := Trim(Ed_Soundcard.Text);
                    Parambyname('Speaker').AsString := Trim(Ed_Speaker.Text);
                    execSQL;
               end;
          end;
          DataModule1.Database1.Commit;
          showmessage('แก้ไขครุภัณฑ์เรียบร้อย');
     end;
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
          raise;
     end;
     Refresh_Lv_Durable_Detail;
     Refresh_Lv_Maintain;
     Close;
end;

procedure TFr_Durable_Detail.Cb_StatusChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_PriceChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Length_MaintainChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Cb_TypeMaintainChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Cb_Respond_NameCloseUp(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Cb_RoomCloseUp(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Date_BuyChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Date_Expire1Change(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;



procedure TFr_Durable_Detail.Ed_Date_Expire2Change(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Mm_DetailChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Cb_Select_CompanyCloseUp(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Contact_NameChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_CPUChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_KeyboardChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_MonitorChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_LancardChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_HarddiskChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_CDROMChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_RamChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_SoundcardChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_MouseChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_SpeakerChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change2 := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

{procedure Refresh_Lv_Durable_Detail ();
var Type_ID,Room_ID,Department_ID :Integer;
     Temp_Type,Temp_Room,Temp_Depart : String;
begin
     with Fr_Durable do
     begin
          if Cb_Type2.Text = '' then Temp_Type := ''
          else Temp_Type := IntToStr(Cb_Type2.KeyValue);
          if Cb_Department_Name2.Text = '' then Temp_Depart := ''
          else Temp_Depart := IntToStr(Cb_Department_Name2.KeyValue);
          if Cb_Room2.Text = '' then Temp_Room := ''
          else Temp_Room := IntToStr(Cb_Room2.KeyValue);
          Lv_Durable_Detail.Items.Clear;
     end;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select Durable_ID,Type_Name,Category,Room_Name,Department_Name,Status ');
          SQL.Add('From Durable A,Type B,Department C,Room D');
          SQL.Add('Where (A.Type_ID = B.Type_ID) and (D.Department_ID = C.Department_ID)');
          SQL.Add('and (Durable_ID Like :Durable_ID + ''%'') ');
          SQL.Add('and (A.Room_ID = D.Room_ID)');
          SQL.Add('and (A.Type_ID Like :Type_ID + ''%'')');
          SQL.Add('and (Category Like :Category + ''%'')');
          SQL.Add('and (D.Department_ID Like :Department_ID + ''%'')');
          SQL.Add('and (A.Room_ID Like :Room_ID + ''%'')');
          SQL.Add('and (Status Like :Status + ''%'')');
          SQL.Add('and (Length_Maintain <> 0 )');
          SQL.Add('Order By Durable_ID');
          ParamByName('Durable_ID').AsString := Fr_Durable.Ed_Durable_ID2.Text;
          ParamByName('Type_ID').AsString := Temp_Type;
          ParamByName('Category').AsString := Fr_Durable.Cb_Category.Text;
          ParamByName('Department_ID').AsString := Temp_Depart;
          ParamByName('Room_ID').AsString := Temp_Room;
          ParamByName('Status').AsString := Fr_Durable.Cb_Status2.Text;
          ExecSQL;
          Open;
          First;
     end;
     while not DataModule1.Qr_Transaction.Eof do
     begin
          with Fr_Durable.Lv_Durable_Detail.Items.Add  do
          begin
               Caption := DataModule1.Qr_Transaction.FieldValues['Durable_ID'];
               SubItems.Add(DataModule1.Qr_Transaction.FieldValues['Type_Name']);
               SubItems.Add(DataModule1.Qr_Transaction.FieldValues['Category']);
               SubItems.Add(DataModule1.Qr_Transaction.FieldValues['Room_Name']);
               SubItems.Add(DataModule1.Qr_Transaction.FieldValues['Department_Name']);
               SubItems.add(DataModule1.Qr_Transaction.FieldValues['Status']);
               DataModule1.Qr_Transaction.Next;
          end;
     end;
end;}

procedure TFr_Durable_Detail.Button2Click(Sender: TObject);
var Year1,Month1,Day1 : Word;
begin
     Fr_Receive.Durable_ID := Ed_Durable_ID.Text;
     Fr_Receive.Date_Repair := Ed_Date_Repair.Text;
     Fr_Receive.Company_Name := Ed_Company_Name.Text;
     Fr_Receive.Condition := Mm_Condition.Text;
     Fr_Receive.Ed_Date_Take.Date := Date;
     Fr_Receive.Cb_Officer_Name.KeyValue := 0;
     Fr_Receive.Rb_Fix.Checked := True;
     Fr_Receive.Ed_Repair_Price.Text := '';
     Fr_Receive.Mm_Detail.Text := '';
     With DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select * From Repair A, Company B,Officer C ');
          SQL.Add('Where (A.Company_ID = B.Company_ID) and ( A.Officer_ID = C.Officer_ID)');
          SQl.Add('and (Durable_ID = '''+Fr_Receive.Durable_ID+''')');;
          Open;
          With Fr_Receive do
          begin
               DecodeDate(FieldValues['Date_Repair'],Year1,Month1,Day1);
               Ed_Date_Repair.Text := DateToStr(EncodeDate(Year1+543,Month1,Day1));
               DecodeDate(FieldValues['Date_Take'],Year1,Month1,Day1);
               Ed_Date_Take2.Text := DateToStr(EncodeDate(Year1+543,Month1,Day1));
               Ed_Contact_Name2.Text := FieldValues['Contact_Name'];
               Ed_Officer_Name.Text := FieldValues['Officer_Name'];
               Mm_Condition.Text := FieldValues['Condition'];
               Mm_Attach_Item.Text := FieldValues['Attach_Item'];
               Ed_Company_Name.Text := FieldValues['Company_Name'];
               Ed_Company_Phone1.Text := FieldValues['Phone1'];
               Ed_Company_Phone2.Text := FieldValues['Phone2'];
               Ed_Company_Phone3.Text := FieldValues['Phone3'];
               Mm_Company_Address.Text := FieldValues['Address'];
               Ed_Company_Fax.Text := FieldValues['Fax'];
          end;
     end;
     Refresh_Lv_History_ReFr(Durable_ID);
     Fr_Receive.PageControl1.ActivePageIndex := 0;
     Fr_Receive.ShowModal;
end;

procedure TFr_Durable_Detail.Ed_Date_BuyExit(Sender: TObject);
begin
     if Ed_Date_Buy.Text = '' then exit;
     try
          StrToDate(Ed_Date_Buy.Text);
     except
          showmessage('ระบุวันที่ในรูปแบบ วว/ดด/25ปป');
          Ed_Date_Buy.Text := '';
     end;
end;

procedure TFr_Durable_Detail.Ed_Date_Expire1Exit(Sender: TObject);
var  Year1,Month1,Day1 : Word;
begin
     if Ed_Date_Expire1.Text = '' then exit;
     try
          StrToDate(Ed_Date_Expire1.Text);
     except
          showmessage('ระบุวันที่ในรูปแบบ วว/ดด/25ปป');
          Ed_Date_Expire1.Text := '';
     end;
     if Ed_Date_Buy.Text = '' then exit;
     DecodeDate(StrToDate(Ed_Date_Expire1.Text),Year1,Month1,Day1);
     if StrToDate(Ed_Date_Buy.Text) > (EncodeDate(Year1-543,Month1,Day1)) then
     begin
          showmessage('วันหมดประกันต้องไม่ก่อนวันซื้อ');
          Ed_Date_Expire1.Text := '';
     end;
end;

procedure TFr_Durable_Detail.Ed_Date_Expire2Exit(Sender: TObject);
var  Year1,Month1,Day1 : Word;
begin
     if Ed_Date_Expire2.Text = '' then exit;
     try
          StrToDate(Ed_Date_Expire2.Text);
     except
          showmessage('ระบุวันที่ในรูปแบบ วว/ดด/25ปป');
          Ed_Date_Expire2.Text := '';
     end;
     if Ed_Date_Buy.Text = '' then exit;
     DecodeDate(StrToDate(Ed_Date_Expire2.Text),Year1,Month1,Day1);
     if StrToDate(Ed_Date_Buy.Text) > (EncodeDate(Year1-543,Month1,Day1)) then
     begin
          showmessage('วันหมดประกันต้องไม่ก่อนวันซื้อ');
          Ed_Date_Expire2.Text := '';
     end;
end;

procedure TFr_Durable_Detail.Ed_Length_MaintainExit(Sender: TObject);
begin
     if Ed_Length_Maintain.Text = '' then exit;
     try
          StrToInt(Ed_Length_Maintain.Text);
     except
          Showmessage('กรุณาใส่ระยะเวลาซ่อมบำรุงเป็นตัวเลช');
          Ed_Length_Maintain.Text := '';
     end;    
end;

procedure TFr_Durable_Detail.TabSheet1Show(Sender: TObject);
begin
     //Type AutoComplete
     if DataModule1.Qr_Type.FieldCount >0 then
     Begin
          Cb_Type.Items.Clear;
          DataModule1.Qr_Type.First;
          while not(DataModule1.Qr_Type.Eof) do
          begin
               Cb_Type.Items.Add(DataModule1.Qr_Type.FieldByName('Type_Name').AsString);
               DataModule1.Qr_Type.Next;
          end;
          Try
               Strs := TEnumString.Create(Cb_Type.Items) as IUnknown;
               AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
               OleCheck(AutoComplete2.SetOptions(ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
               OleCheck(AutoComplete2.Init(Ed_Type.Handle,Strs,nil,nil));
          Except
          End;
     end;
     //Officer Name AutoComplete
     if DataModule1.Qr_Officer_Detail.FieldCount >0 then
     Begin
          Cb_Respond_Name.Items.Clear;
          DataModule1.Qr_Officer_Detail.First;
          while not(DataModule1.Qr_Officer_Detail.Eof) do
          begin
               Cb_Respond_Name.Items.Add(DataModule1.Qr_Officer_Detail.FieldByName('Officer_Name').AsString);
               DataModule1.Qr_Officer_Detail.Next;
          end;
          Try
               Strs := TEnumString.Create(Cb_Respond_Name.Items) as IUnknown;
               AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
               OleCheck(AutoComplete2.SetOptions(ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
               OleCheck(AutoComplete2.Init(Ed_Respond_Name2.Handle,Strs,nil,nil));
          Except
          End;
     end;
     //Room AutoComplete
     if DataModule1.Qr_Room_Detail.FieldCount >0 then
     Begin
          Cb_Room.Items.Clear;
          DataModule1.Qr_Room_Detail.First;
          while not(DataModule1.Qr_Room_Detail.Eof) do
          begin
               Cb_Room.Items.Add(DataModule1.Qr_Room_Detail.FieldByName('Room_Name').AsString);
               DataModule1.Qr_Room_Detail.Next;
          end;
          Try
               Strs := TEnumString.Create(Cb_Room.Items) as IUnknown;
               AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
               OleCheck(AutoComplete2.SetOptions(ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
               OleCheck(AutoComplete2.Init(Ed_Room.Handle,Strs,nil,nil));
          Except
          End;
     end;
     //Company AutoComplete
     if DataModule1.Qr_Company_Detail.FieldCount > 0 then
     Begin
          Cb_Select_Company.Items.Clear;
          DataModule1.Qr_Company_Detail.First;
          while not(DataModule1.Qr_Company_Detail.Eof) do
          begin
               Cb_Select_Company.Items.Add(DataModule1.Qr_Company_Detail.FieldByName('Company_Name').AsString);
               DataModule1.Qr_Company_Detail.Next;
          end;
          Try
               Strs := TEnumString.Create(Cb_Select_Company.Items) as IUnknown;
               AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
               OleCheck(AutoComplete2.SetOptions(ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
               OleCheck(AutoComplete2.Init(Ed_Select_Company.Handle,Strs,nil,nil));
          Except
          End;
     end;
end;

procedure TFr_Durable_Detail.Cb_TypeChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
     Ed_Type.Text := Cb_Type.Text;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Type_ID,Category from Type where Type_Name = ' +char(39) +Trim(Ed_Type.Text) +char(39);
          Open;
          if FieldValues['Type_ID'] = null then
          begin
               showmessage('กรุณาเลือกชนิดจากรายการ');
               exit;
          end
          else
                Ed_Category.Text := FieldValues['Category'];
     end;
end;

procedure TFr_Durable_Detail.Ed_TypeExit(Sender: TObject);
begin
     if Trim(Ed_Type.Text) = '' Then Exit;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Type_ID,Category from Type where Type_Name = ' +char(39) +Trim(Ed_Type.Text) +char(39);
          Open;
          if FieldValues['Type_ID'] = null then
          begin
               showmessage('กรุณาเลือกชนิดจากรายการ');
               exit;
          end
          else
                Ed_Category.Text := FieldValues['Category'];
     end;
end;

procedure TFr_Durable_Detail.Ed_TypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key <> 13 then exit;
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Type_ID,Category from Type where Type_Name = ' +char(39) +Trim(Ed_Type.Text) +char(39);
          Open;
          if FieldValues['Type_ID'] = null then
          begin
               showmessage('กรุณาเลือกชนิดจากรายการ');
               exit;
          end
          else
                Ed_Category.Text := FieldValues['Category'];
     end;
end;

procedure TFr_Durable_Detail.Ed_TypeChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Durable_IDChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Cb_Respond_NameChange(Sender: TObject);
begin
        Ed_Respond_Name2.Text := Cb_Respond_Name.Text;
end;

procedure TFr_Durable_Detail.Cb_RoomChange(Sender: TObject);
begin
        Ed_Room.Text := Cb_Room.Text;
end;

procedure TFr_Durable_Detail.Cb_Select_CompanyChange(Sender: TObject);
begin
     Ed_Select_Company.Text := Cb_Select_Company.Text;
end;

procedure TFr_Durable_Detail.Ed_CategoryChange(Sender: TObject);
begin
     if Ed_Category.Text = 'คอมพิวเตอร์' then
          Fr_Durable_Detail.TabSheet2.TabVisible := True
     else Fr_Durable_Detail.TabSheet2.TabVisible := False;
end;

procedure TFr_Durable_Detail.Ed_Respond_Name2Change(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_RoomChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.Ed_Select_CompanyChange(Sender: TObject);
begin
     Fr_Durable_Detail.Change := True;
     Fr_Durable_Detail.BitBtn1.Caption := 'แก้ไข';
end;

procedure TFr_Durable_Detail.TabSheet2Show(Sender: TObject);
begin
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Distinct CPU from Computer_Detail';
          Open;
          if FieldValues['CPU'] <> Null then
          Begin
               ComboBox1.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('CPU').AsString <> '' then
                    ComboBox1.Items.Add(FieldByName('CPU').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox1.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_CPU.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Monitor from Computer_Detail';
          Open;
          if FieldValues['Monitor'] <> Null then
          Begin
               ComboBox2.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Monitor').AsString <> '' then
                    ComboBox2.Items.Add(FieldByName('Monitor').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox2.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Monitor.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct HardDisk from Computer_Detail';
          Open;
          if FieldValues['HardDisk'] <> Null then
          Begin
               ComboBox3.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('HardDisk').AsString <> '' then
                    ComboBox3.Items.Add(FieldByName('HardDisk').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox3.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_HardDisk.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct RAM from Computer_Detail';
          Open;
          if FieldValues['RAM'] <> Null then
          Begin
               ComboBox4.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('RAM').AsString <> '' then
                    ComboBox4.Items.Add(FieldByName('RAM').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox4.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_RAM.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Mouse from Computer_Detail';
          Open;
          if FieldValues['Mouse'] <> Null then
          Begin
               ComboBox5.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Mouse').AsString <> '' then
                    ComboBox5.Items.Add(FieldByName('Mouse').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox5.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Mouse.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct KeyBoard from Computer_Detail';
          Open;
          if FieldValues['KeyBoard'] <> Null then
          Begin
               ComboBox6.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('KeyBoard').AsString <> '' then
                    ComboBox6.Items.Add(FieldByName('KeyBoard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox6.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_KeyBoard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct LanCard from Computer_Detail';
          Open;
          if FieldValues['LanCard'] <> Null then
          Begin
               ComboBox7.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('LanCard').AsString <> '' then
                    ComboBox7.Items.Add(FieldByName('LanCard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox7.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_LanCard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct CD_ROM from Computer_Detail';
          Open;
          if FieldValues['CD_ROM'] <> Null then
          Begin
               ComboBox8.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('CD_ROM').AsString <> '' then
                    ComboBox8.Items.Add(FieldByName('CD_ROM').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox8.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_CDROM.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct SoundCard from Computer_Detail';
          Open;
          if FieldValues['SoundCard'] <> Null then
          Begin
               ComboBox9.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('SoundCard').AsString <> '' then
                    ComboBox9.Items.Add(FieldByName('SoundCard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox9.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_SoundCard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Speaker from Computer_Detail';
          Open;
          if FieldValues['Speaker'] <> Null then
          Begin
               ComboBox10.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Speaker').AsString <> '' then
                    ComboBox10.Items.Add(FieldByName('Speaker').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox10.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Speaker.Handle,Strs,nil,nil));
               Except
               End;
          end;
     end;
end;

end.
