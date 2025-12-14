unit EditVoucher;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBCtrls, ComCtrls;

type
  TFr_EditVoucher = class(TForm)
    PageControl4: TPageControl;
    TabSheet13: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Add_ID: TEdit;
    At: TEdit;
    Case_Buy: TEdit;
    Req_For: TEdit;
    Reason: TMemo;
    Day_Use: TEdit;
    MSource: TEdit;
    Referee1: TEdit;
    Referee3: TEdit;
    Referee2: TEdit;
    Date_Buy: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Add_CP1: TButton;
    Respond_name: TEdit;
    LC_Company_Name: TDBLookupComboBox;
    TabSheet14: TTabSheet;
    StringGrid1: TStringGrid;
    BitBtn10: TBitBtn;
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
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    BtnClear: TBitBtn;
    Button3: TBitBtn;
    BitBtn1: TBitBtn;
    procedure Add_IDChange(Sender: TObject);
    procedure AtChange(Sender: TObject);
    procedure Date_BuyChange(Sender: TObject);
    procedure Case_BuyChange(Sender: TObject);
    procedure Req_ForChange(Sender: TObject);
    procedure ReasonChange(Sender: TObject);
    procedure Day_UseChange(Sender: TObject);
    procedure MSourceChange(Sender: TObject);
    procedure Referee1Change(Sender: TObject);
    procedure Referee2Change(Sender: TObject);
    procedure Referee3Change(Sender: TObject);
    procedure Respond_nameChange(Sender: TObject);
    procedure LC_Company_NameMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet14Show(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure ComboBox15Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox5DropDown(Sender: TObject);
    procedure ComboBox6DropDown(Sender: TObject);
    procedure ComboBox7DropDown(Sender: TObject);
    procedure ComboBox8DropDown(Sender: TObject);
    procedure ComboBox9DropDown(Sender: TObject);
    procedure ComboBox10DropDown(Sender: TObject);
    procedure ComboBox11DropDown(Sender: TObject);
    procedure ComboBox12DropDown(Sender: TObject);
    procedure ComboBox13DropDown(Sender: TObject);
    procedure ComboBox14DropDown(Sender: TObject);
    procedure ComboBox15DropDown(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
  private
    Update : Boolean;
    { Private declarations }
  public
    Inven_Change : Boolean;
    Order_Num : Integer;
    { Public declarations }
  end;

var
  Fr_EditVoucher: TFr_EditVoucher;
  procedure Clear_voucher();
  Procedure  ShowVoucherDetail(Voucher_ID : String);
  Function CallStr(TB:integer):string;
  Function CalNum(Num,a:integer) : String;
implementation

uses Main, DataModule, Print_Voucher, Print_Voucher2;

{$R *.DFM}

Function CalNum(Num,a:integer) : String;
begin
     Case Num of
     1:begin
          if a = 1 then CalNum := 'เอ็ด'
          else if a = 10 then CalNum := ''
               else CalNum := 'หนึ่ง';
       end;
     2:begin
       if a = 10 then CalNum := 'ยี่'
               else CalNum := 'สอง';
       end;
     3:CalNum := 'สาม';
     4:CalNum := 'สี่';
     5:CalNum := 'ห้า';
     6:CalNum := 'หก';
     7:CalNum := 'เจ็ด';
     8:CalNum := 'แปด';
     9:CalNum := 'เก้า';
     0:calnum := '';
     End;
end;

Function CallStr(TB:integer):string;
Var  a,b: integer;
     StrBuy,wt : string;
begin
     if TB = 1 then
     Begin
     StrBuy := 'หนึ่งบาทถ้วน';
     ShowMessage (StrBuy);
     exit;
     End;
     StrBuy := '';
     a:=100000;
     while a>0 do
     begin
          b := TB div a;
          TB := TB Mod a;
          case a of
          100000: wt := 'แสน';
          10000 : wt := 'หมื่น';
          1000  : wt := 'พัน';
          100   : wt := 'ร้อย';
          10    : wt := 'สิบ';
          1     : wt := 'บาทถ้วน';
          end;
          if (b <> 0 )or (a =1) then strbuy := strbuy+CalNum(b,a)+wt;
          a:= a div 10;
     end;
     CallStr := StrBuy;
end;

Function CallMnt(Mb:integer):string;
Var  a,b: integer;
     StrBuy,wt : string;
begin
          case a of
          1   : CallMnt := 'มกราคม';
          2   : CallMnt := 'กุมภาพันธ์';
          3   : CallMnt := 'มีนาคม';
          4   : CallMnt := 'เมษายน';
          5   : CallMnt := 'พฤษภาคม';
          6   : CallMnt := 'มิถุนายน';
          7   : CallMnt := 'กรกฏาคม';
          8   : CallMnt := 'สิงหาคม';
          9   : CallMnt := 'กันยายน';
          10  : CallMnt := 'ตุลาคม';
          11  : CallMnt := 'พฤศจิกายน';
          12  : CallMnt := 'ธันวาคม';
          end;
end;


procedure TFr_EditVoucher.Add_IDChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.AtChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Date_BuyChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Case_BuyChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Req_ForChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ReasonChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Day_UseChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.MSourceChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Referee1Change(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Referee2Change(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.Referee3Change(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';

end;

procedure TFr_EditVoucher.Respond_nameChange(Sender: TObject);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.LC_Company_NameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
     LC_Company_Name.KeyValue := 0;
end;

procedure TFr_EditVoucher.Button3Click(Sender: TObject);
Var I,I_ID,j : Integer;
     TReason : String;
     TMsource : WideString;
begin
     if Button3.Caption = 'พิมพ์' then
     begin
          With DM.Qr_Voucher do
          Begin
          Close;
          SQL.Clear;
          SQL.Text := 'select *,Day(Date_Buy)[db],Month(Date_Buy)[mb],Year(Date_Buy)+543[yb] from Voucher V where Voucher_ID = '+char(39)+ Add_ID.Text +char(39);
          Open;
          TReason := 'เนื่องจากมีความจำเป็น '+Reason.Lines.Text+' ตามรายการต่อไปนี้';
          Fr_Print_Voucher.QRMemo1.Lines.Clear;
          Fr_Print_Voucher.QRMemo1.Lines.Add(TReason);
          TMsource := 'รวม .....................รายการ เป็นเง็นทั้งสิ้น..................................บาท (............................................................)';
          TMsource := TMsource+' กำหนดเวลาที่ต้องใช้................วัน       ตามรายละเอียดข้างบนนี้  จะดำเนินการจัดซื้อโดบวิธีตกลงราคาตามข้อ 19 แห่งระเบียบสำนักนายกรัฐมนตรีว่าด้วยการพัสดุ    2535';
          TMsource := TMsource+' โดยขอเบิกจ่ายจาก '+MSource.Text+' พร้อมทั้งขอแต่งตั้งกรรมการตรวจรับพัสดุ';
          Fr_PVoucher2.QRMemo2.Lines.Clear;
          Fr_PVoucher2.QRMemo2.Lines.Add(TMsource);
          Fr_Print_Voucher.Mnt.Caption := CallMnt(FieldValues['mb']);
          if FieldValues['Day_Use'] = 0 then Fr_PVoucher2.QRLabel1.Caption := ''
          else Fr_PVoucher2.QRLabel1.Caption := IntToStr(FieldValues['Day_Use']);
          end;
          With DM.Qr_Buy_Detail do
          Begin
          Close;
          SQL.Clear;
          SQL.Text := 'Select * From Buy_Detail B,Inventory I Where (B.Inventory_ID = i.inventory_ID) and (Voucher_ID ='+char(39)+ Add_ID.Text + char(39) + ') Order by Order_No' ;
          Open;
          end;
          With DM.Qr_Transaction do
          Begin
          Close;
          SQL.Clear;
          SQL.Text := 'Select Count(*)[C],Sum(TotalBuy)[T] From Buy_Detail B,Inventory I Where (B.Inventory_ID = i.inventory_ID) and (Voucher_ID ='+char(39)+ Add_ID.Text + char(39) + ')' ;
          Open;
          Order_Num := FieldValues['C'];
          Fr_PVoucher2.QROrder_N.Caption := IntToStr(Order_Num);
          Fr_Print_Voucher.VAT.Caption := IntToStr(Trunc(FieldValues['T']*7/100));
          Fr_Print_Voucher.TTB.Caption := IntToStr(trunc(FieldValues['T'])+(Trunc(FieldValues['T']*7/100)));
          Fr_PVoucher2.QRToTal_Money.Caption := IntToStr(trunc(FieldValues['T'])+(Trunc(FieldValues['T']*7/100)));
          Fr_PVoucher2.Str_Buy.Caption := CallStr(trunc(FieldValues['T'])+(Trunc(FieldValues['T']*7/100)));
          end;
          Fr_Print_Voucher.QuickRep1.Preview;
          Fr_PVoucher2.QuickRep1.Preview;
     exit;
     end;
     if not(update) then EXit;
     i:=1;
     with DM.Qr_Transaction do
          while {(StringGrid1.Cells[2,i] <> '') and} (i < 16) do
          begin
               if not((StringGrid1.Cells[1,i] = '') and (StringGrid1.Cells[2,i] = '') and (StringGrid1.Cells[3,i] = '') and (StringGrid1.Cells[4,i] = '')) then
               Begin
                    Close;
                    SQL.Text:='select Inventory_ID from Inventory where Inventory_Name ='+ char(39) +Trim(StringGrid1.Cells[2,i]) + Char(39);
                    Open;
                    if FieldValues['Inventory_ID'] = null then
                    begin
                    Close;
                    SQL.Clear;
                    Showmessage('ไม่พบวัสดุภัณฑ์ชื่อ '+Trim(StringGrid1.Cells[2,i])+' ในฐานข้อมูล');
                    StringGrid1.SetFocus;
                    exit;
                    end;
               end;
               i:=i+1;
          End;
     DM.Database1.StartTransaction;
     Try
          With DM.Qr_Transaction  do
          Begin
               Close;
               Params.Clear;
               SQL.Clear;
               SQL.Add('Update Voucher');
               SQL.Add('Set AT = :AT');
               SQL.Add(', Date_Buy = :DB');
               SQL.Add(', Case_Buy = :Case');
               SQL.Add(', Req_For = :Req');
               SQL.Add(', Reason = :Reason');
               SQL.Add(', Day_Use = :Day');
               SQL.Add(', Msource = :MS');
               SQL.Add(', Referee1 = :Ref1');
               SQL.Add(', Referee2 = :Ref2');
               SQL.Add(', Referee3 = :Ref3');
               SQL.Add(', Company_ID = :Com_ID');
               SQL.Add(', Respond_Name = :Respond');
               SQL.Add('Where Voucher_ID = :VNO');
               ParamByName('VNO').AsString := Add_ID.Text;
               ParamByName('DB').AsDateTime := Date_Buy.DateTime;
               ParamByName('AT').AsString := AT.Text;
               ParamByName('Case').AsString := Case_Buy.Text;
               ParamByName('Req').AsString := Req_For.Text;
               ParamByName('Reason').AsString := Reason.Text;
               ParamByName('Day').AsString := Day_Use.Text;
               ParamByName('MS').AsString := MSource.Text;
               ParamByName('Ref1').AsString := Referee1.Text;
               ParamByName('Ref2').AsString := Referee2.Text;
               ParamByName('Ref3').AsString := Referee3.Text;
               ParamByName('Com_ID').AsInteger := LC_Company_Name.KeyValue;
               ParamByName('Respond').AsString := Respond_Name.Text;
               execSQL;
               i:=1;
               I_ID:=-1;
               Close;
               SQL.Clear;
               SQL.Add('Delete From Buy_detail ');
               SQL.Add('Where Voucher_ID = '+ Char(39)+ADD_ID.Text+Char(39));
               ExecSQL;
               j:=1;
               while {(StringGrid1.Cells[2,i] <> '') and} (i < 16) do
               begin
                    if not((StringGrid1.Cells[1,i] = '') and (StringGrid1.Cells[2,i] = '') and (StringGrid1.Cells[3,i] = '') and (StringGrid1.Cells[4,i] = '')) then
                    begin
                         Close;
                         SQL.Text:='select Inventory_ID from Inventory where Inventory_Name ='+ char(39) +Trim(StringGrid1.Cells[2,i]) + Char(39);
                         Open;
                         I_ID := FieldValues['Inventory_ID'];
                         if (StringGrid1.Cells[1,i] = '') or (StringGrid1.Cells[3,i] = '') or (StringGrid1.Cells[4,i] = '')  then
                         begin
                              Showmessage('กรุณาใส่ข้อมูลของรายการ '+Trim(StringGrid1.Cells[2,i]));
                              Close;
                              DM.Database1.Rollback;
                              exit;
                         end;
                         Close;
                         SQL.Clear;
                         SQL.Add('Insert into Buy_detail');
                         SQL.Add('(Voucher_ID,Order_No,Buy_No,Inventory_ID,PPE_Buy,VAT,TotalBuy)');
                         SQL.Add('Values (:VNO,:ON,:BN,:IID,:PPE,:VAT,:TB)');
                         ParamByName('VNO').AsString := Add_ID.Text;
                         ParamByName('ON').AsInteger := j;
                         ParamByName('BN').AsInteger := StrToInt(StringGrid1.Cells[1,i]);
                         ParamByName('IID').AsInteger := I_ID;
                         ParamByName('PPE').AsFloat := StrToFloat(StringGrid1.Cells[3,i]);
                         ParamByName('VAT').AsInteger := StrToInt(StringGrid1.Cells[4,i]);
                         ParamByName('TB').AsFloat := Trunc(((StrToFloat(StringGrid1.Cells[1,i])*StrToInt(StringGrid1.Cells[3,i])  )));
                         execSQL;
                         j:=j+1;
                    end;
               i:=i+1;
               end;
          DM.Database1.Commit;
          Showmessage ('แก้ไขรายงานขอซื้อเรียบร้อยแล้ว');
          Fr_Main.TabSheet4.OnShow(Sender);
          Update := False;
          Close;
          end;
     Except
          Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
          Update := False;
          raise;
     end;
end;

procedure Clear_voucher();
var   i,j : integer;
begin
        with Fr_EditVoucher do
        begin
             //Set Text
             Add_ID.text := '';
             At.Text := '';
             Case_Buy.Text := '';
             Req_For.Text := '';
             Reason.Text := '';
             Day_Use.Text := '';
             Msource.Text := '';
             Referee1.Text := '';
             Referee2.Text := '';
             Referee3.Text := '';
             Respond_Name.Text := '';
             LC_Company_Name.KeyValue := 0;
             i := 1;
             while i < 16 do
             begin
                  j := 1;
                  while j < 6 do
                  begin
                       StringGrid1.Cells[j,i] := '';
                       j:=j+1;
                  end;
                  i := i+1;
             end;
             Fr_EditVoucher.StringGrid1.Cells[0,0] := '   ลำดับ';
             Fr_EditVoucher.StringGrid1.Cells[1,0] := '   จำนวน';
             Fr_EditVoucher.StringGrid1.Cells[2,0] := '                            รายการและขนาด';
             Fr_EditVoucher.StringGrid1.Cells[3,0] := ' ราคาต่อหน่วย';
             Fr_EditVoucher.StringGrid1.Cells[4,0] := '  VAT(%)';
             Fr_EditVoucher.StringGrid1.Cells[5,0] := '   ราคาซื้อ';
             Fr_EditVoucher.StringGrid1.Cells[0,1] := '      1';
             Fr_EditVoucher.StringGrid1.Cells[0,2] := '      2';
             Fr_EditVoucher.StringGrid1.Cells[0,3] := '      3';
             Fr_EditVoucher.StringGrid1.Cells[0,4] := '      4';
             Fr_EditVoucher.StringGrid1.Cells[0,5] := '      5';
             Fr_EditVoucher.StringGrid1.Cells[0,6] := '      6';
             Fr_EditVoucher.StringGrid1.Cells[0,7] := '      7';
             Fr_EditVoucher.StringGrid1.Cells[0,8] := '      8';
             Fr_EditVoucher.StringGrid1.Cells[0,9] := '      9';
             Fr_EditVoucher.StringGrid1.Cells[0,10] := '     10';
             Fr_EditVoucher.StringGrid1.Cells[0,11] := '     11';
             Fr_EditVoucher.StringGrid1.Cells[0,12] := '     12';
             Fr_EditVoucher.StringGrid1.Cells[0,13] := '     13';
             Fr_EditVoucher.StringGrid1.Cells[0,14] := '     14';
             Fr_EditVoucher.StringGrid1.Cells[0,15] := '     15';
             Fr_EditVoucher.ComboBox1.ItemIndex := -1;
             Fr_EditVoucher.ComboBox2.ItemIndex := -1;
             Fr_EditVoucher.ComboBox3.ItemIndex := -1;
             Fr_EditVoucher.ComboBox4.ItemIndex := -1;
             Fr_EditVoucher.ComboBox5.ItemIndex := -1;
             Fr_EditVoucher.ComboBox6.ItemIndex := -1;
             Fr_EditVoucher.ComboBox7.ItemIndex := -1;
             Fr_EditVoucher.ComboBox8.ItemIndex := -1;
             Fr_EditVoucher.ComboBox9.ItemIndex := -1;
             Fr_EditVoucher.ComboBox10.ItemIndex := -1;
             Fr_EditVoucher.ComboBox11.ItemIndex := -1;
             Fr_EditVoucher.ComboBox12.ItemIndex := -1;
             Fr_EditVoucher.ComboBox13.ItemIndex := -1;
             Fr_EditVoucher.ComboBox14.ItemIndex := -1;
             Fr_EditVoucher.ComboBox15.ItemIndex := -1;
             Fr_EditVoucher.PageControl4.ActivePageIndex := 0;
     end;
end;

Procedure  ShowVoucherDetail(Voucher_ID : String);
var i:integer;
Begin
     With Fr_EditVoucher do
     Begin
          with Dm.Qr_Transaction do
          begin
               close;
               SQL.Text := 'select * from Voucher V where Voucher_ID = '+char(39)+Voucher_ID+char(39);
               Open;
               Add_ID.Text := Voucher_ID;
               At.Text := FieldValues['At'];
               Date_Buy.DateTime := FieldValues['Date_Buy'];
               Case_Buy.Text := FieldValues['Case_Buy'];
               Req_For.Text := FieldValues['Req_For'];
               Reason.Text := FieldValues['Reason'];
               Day_Use.Text := FieldValues['Day_Use'];
               Msource.Text := FieldValues['Msource'];
               Referee1.Text := FieldValues['Referee1'];
               Referee2.Text := FieldValues['Referee2'];
               Referee3.Text := FieldValues['Referee3'];
               Respond_Name.Text := FieldValues['Respond_Name'];
               LC_Company_Name.KeyValue := FieldValues['Company_ID'];
               Close;
               SQL.Clear;
               SQL.Text := 'Select * From Buy_Detail B,Inventory I Where (B.Inventory_ID = i.inventory_ID) and (Voucher_ID ='+char(39)+ Voucher_ID + char(39) + ') Order by Order_No' ;
               Open;
               First;
               i := 1;
               while not DM.Qr_Transaction.Eof do
               begin
                    with StringGrid1  do
                    begin
                         Cells[1,i] := IntToStr(FieldValues['Buy_No']);
                         Cells[2,i] := Fieldvalues['Inventory_Name'];
                         Cells[3,i] := FloatToStr(Fieldvalues['PPE_Buy']);
                         Cells[4,i] := IntToStr(Fieldvalues['VAT']);
                         Cells[5,i] := FloatToStr(Fieldvalues['TotalBuy']);
                     end;
                    Next;
                    i := i+1;
              end;
              ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,1]);
              ComboBox2.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,2]);
              ComboBox3.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,3]);
              ComboBox4.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,4]);
              ComboBox5.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,5]);
              ComboBox6.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,6]);
              ComboBox7.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,7]);
              ComboBox8.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,8]);
              ComboBox9.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,9]);
              ComboBox10.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,10]);
              ComboBox11.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,11]);
              ComboBox12.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,12]);
              ComboBox13.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,13]);
              ComboBox14.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,14]);
              ComboBox15.ItemIndex := ComboBox1.Items.IndexOf(StringGrid1.Cells[2,15]);
          end;
     end;
     Fr_EditVoucher.Update := False;
end;



procedure TFr_EditVoucher.TabSheet14Show(Sender: TObject);
begin
     If not(Inven_Change) then exit;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox1.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox1.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox2.Items := ComboBox1.Items;
          ComboBox3.Items := ComboBox1.Items;
          ComboBox4.Items := ComboBox1.Items;
          ComboBox5.Items := ComboBox1.Items;
          ComboBox6.Items := ComboBox1.Items;
          ComboBox7.Items := ComboBox1.Items;
          ComboBox8.Items := ComboBox1.Items;
          ComboBox9.Items := ComboBox1.Items;
          ComboBox10.Items := ComboBox1.Items;
          ComboBox11.Items := ComboBox1.Items;
          ComboBox12.Items := ComboBox1.Items;
          ComboBox13.Items := ComboBox1.Items;
          ComboBox14.Items := ComboBox1.Items;
          ComboBox15.Items := ComboBox1.Items;
     end;
     Inven_Change := False;
end;

procedure TFr_EditVoucher.ComboBox1Change(Sender: TObject);
begin
     StringGrid1.Cells[2,1] := ComboBox1.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox2Change(Sender: TObject);
begin
     StringGrid1.Cells[2,2] := ComboBox2.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox3Change(Sender: TObject);
begin
     StringGrid1.Cells[2,3] := ComboBox3.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox4Change(Sender: TObject);
begin
     StringGrid1.Cells[2,4] := ComboBox4.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox5Change(Sender: TObject);
begin
     StringGrid1.Cells[2,5] := ComboBox5.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox6Change(Sender: TObject);
begin
     StringGrid1.Cells[2,6] := ComboBox6.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox7Change(Sender: TObject);
begin
     StringGrid1.Cells[2,7] := ComboBox7.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox8Change(Sender: TObject);
begin
     StringGrid1.Cells[2,8] := ComboBox8.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox9Change(Sender: TObject);
begin
     StringGrid1.Cells[2,9] := ComboBox9.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox10Change(Sender: TObject);
begin
     StringGrid1.Cells[2,10] := ComboBox10.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox11Change(Sender: TObject);
begin
     StringGrid1.Cells[2,11] := ComboBox11.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox12Change(Sender: TObject);
begin
     StringGrid1.Cells[2,12] := ComboBox12.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox13Change(Sender: TObject);
begin
     StringGrid1.Cells[2,13] := ComboBox13.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox14Change(Sender: TObject);
begin
     StringGrid1.Cells[2,14] := ComboBox14.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox15Change(Sender: TObject);
begin
     StringGrid1.Cells[2,15] := ComboBox15.Text;
     Update := True;
     Button3.Caption := 'แก้ไข';
end;





procedure TFr_EditVoucher.BitBtn10Click(Sender: TObject);
begin
          Fr_Main.BitBtn4.Click;
end;

procedure TFr_EditVoucher.FormCreate(Sender: TObject);
begin
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox1.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox1.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox2.Items := ComboBox1.Items;
          ComboBox3.Items := ComboBox1.Items;
          ComboBox4.Items := ComboBox1.Items;
          ComboBox5.Items := ComboBox1.Items;
          ComboBox6.Items := ComboBox1.Items;
          ComboBox7.Items := ComboBox1.Items;
          ComboBox8.Items := ComboBox1.Items;
          ComboBox9.Items := ComboBox1.Items;
          ComboBox10.Items := ComboBox1.Items;
          ComboBox11.Items := ComboBox1.Items;
          ComboBox12.Items := ComboBox1.Items;
          ComboBox13.Items := ComboBox1.Items;
          ComboBox14.Items := ComboBox1.Items;
          ComboBox15.Items := ComboBox1.Items;
     end;
     Inven_Change := False;
     Update := False;
end;

procedure TFr_EditVoucher.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox1DropDown(Sender: TObject);
begin
     ComboBox1.ItemIndex := -1;
     StringGrid1.Cells[2,1] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox2DropDown(Sender: TObject);
begin
     ComboBox2.ItemIndex := -1;
     StringGrid1.Cells[2,2] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox3DropDown(Sender: TObject);
begin
     ComboBox3.ItemIndex := -1;
     StringGrid1.Cells[2,3] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox4DropDown(Sender: TObject);
begin
     ComboBox4.ItemIndex := -1;
     StringGrid1.Cells[2,4] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox5DropDown(Sender: TObject);
begin
     ComboBox5.ItemIndex := -1;
     StringGrid1.Cells[2,5] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox6DropDown(Sender: TObject);
begin
     ComboBox6.ItemIndex := -1;
     StringGrid1.Cells[2,6] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox7DropDown(Sender: TObject);
begin
     ComboBox7.ItemIndex := -1;
     StringGrid1.Cells[2,7] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox8DropDown(Sender: TObject);
begin
     ComboBox8.ItemIndex := -1;
     StringGrid1.Cells[2,8] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox9DropDown(Sender: TObject);
begin
     ComboBox9.ItemIndex := -1;
     StringGrid1.Cells[2,9] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox10DropDown(Sender: TObject);
begin
     ComboBox10.ItemIndex := -1;
     StringGrid1.Cells[2,10] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox11DropDown(Sender: TObject);
begin
     ComboBox11.ItemIndex := -1;
     StringGrid1.Cells[2,11] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox12DropDown(Sender: TObject);
begin
     ComboBox12.ItemIndex := -1;
     StringGrid1.Cells[2,12] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox13DropDown(Sender: TObject);
begin
     ComboBox13.ItemIndex := -1;
     StringGrid1.Cells[2,13] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox14DropDown(Sender: TObject);
begin
     ComboBox14.ItemIndex := -1;
     StringGrid1.Cells[2,14] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.ComboBox15DropDown(Sender: TObject);
begin
     ComboBox15.ItemIndex := -1;
     StringGrid1.Cells[2,15] := '';
     Update := True;
     Button3.Caption := 'แก้ไข';
end;

procedure TFr_EditVoucher.BtnClearClick(Sender: TObject);
begin
     Update := False;
end;

end.
