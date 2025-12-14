unit Receive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls;

type
  TFr_Receive = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Rb_Fix: TRadioButton;
    Rb_NoFix: TRadioButton;
    Mm_Detail: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Cb_Officer_Name: TDBLookupComboBox;
    Label1: TLabel;
    Ed_Repair_Price: TEdit;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Lv_History: TListView;
    TabSheet3: TTabSheet;
    GroupBox10: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Ed_Date_Take2: TEdit;
    Ed_Date_Repair: TEdit;
    Mm_Condition: TMemo;
    Mm_Attach_Item: TMemo;
    Ed_Officer_Name: TEdit;
    GroupBox9: TGroupBox;
    Label32: TLabel;
    Label34: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Ed_Contact_Name2: TEdit;
    Ed_Company_Name: TEdit;
    Mm_Company_Address: TMemo;
    Ed_Company_Phone1: TEdit;
    Ed_Company_Phone2: TEdit;
    Ed_Company_Phone3: TEdit;
    Ed_Company_Fax: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Ed_Date_Take: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure Ed_Date_Take50Exit(Sender: TObject);
  private
    { Private declarations }
  public
     Durable_ID,Date_Repair,Company_Name,Condition : String;
    { Public declarations }
  end;

var
  Fr_Receive: TFr_Receive;

implementation

uses DataModule, Main_Durable, Durable;

{$R *.DFM}

procedure TFr_Receive.BitBtn1Click(Sender: TObject);
var Company_ID : Integer;
begin
     if Trim(Cb_Officer_Name.Text) = '' then
     begin
          showmessage('กรุณาเลือกผู้รับคืน');
          exit;
     end;
     DataModule1.Database1.StartTransaction;
     try
          with DataModule1.Qr_Transaction do
          begin
               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Text := 'Select Company_ID From Company Where Company_Name = '+char(39)+ Company_Name+char(39);
               Open;
               Company_ID := FieldValues['Company_ID'];
               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add(' Insert Into Repair_History (Durable_ID,Date_Repair,Date_Take,Repair_Price,Company_ID,Condition,Repair_Result,Detail,Officer_ID)');
               SQL.Add(' values(:Durable_ID,:Date_Repair,:Date_Take,:Repair_Price,:Company_ID,:Condition,:Repair_Result,:Detail,:Officer_ID)');
               Parambyname('Durable_ID').AsString := Durable_ID;
               Parambyname('Date_Repair').Value := StrToDate(Date_Repair);
               Parambyname('Date_Take').AsDateTime := Ed_Date_Take.Date;
               Parambyname('Repair_Price').AsInteger := StrToIntDef(Ed_Repair_Price.Text,0);
               Parambyname('Company_ID').AsInteger := Company_ID;
               Parambyname('Condition').AsString := Condition;
               if Rb_Fix.Checked then Parambyname('Repair_Result').AsString := Rb_Fix.Caption
               else ParamByName('Repair_Result').AsString := Rb_NoFix.Caption;
               Parambyname('Detail').AsString := Trim(Mm_Detail.Text);
               Parambyname('Officer_ID').AsInteger := Cb_Officer_Name.KeyValue;
               execSQL;
               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add(' Update Durable Set Status = :Status ,Date_Change = :Date_Change where Durable_ID = '+char(39)+ Durable_ID+char(39));
               if Rb_Fix.Checked then ParamByName('Status').AsString := 'ดี'
               else ParamByName('Status').AsString := 'เสีย';
               ParamByName('Date_Change').AsDateTime := Ed_Date_Take.Date;
               ExecSQL;
               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add('Delete From Repair Where Durable_ID = '+char(39)+Durable_ID+char(39));
               ExecSQL;
          end;
          DataModule1.Database1.Commit;
          showmessage('รับคืนครุภัณฑ์เรียบร้อย');
          Fr_Durable.Durable_Update := True;
     except
          showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DataModule1.Database1.Rollback;
     raise;
     end;
     Fr_Durable_Detail.TabSheet3.TabVisible := False;
     Refresh_Lv_Repair;
     Refresh_Lv_Durable_Detail;
     Close;
end;



procedure TFr_Receive.Ed_Date_Take50Exit(Sender: TObject);
begin
{     if Ed_Date_Take.Text = '' then exit;
     try
          StrToDate(Ed_Date_Take.Text);
     except
          showmessage('ระบุวันที่ในรูปแบบ วว/ดด/25ปป');
          Ed_Date_Take.Text := '';
     end;}
end;

end.
