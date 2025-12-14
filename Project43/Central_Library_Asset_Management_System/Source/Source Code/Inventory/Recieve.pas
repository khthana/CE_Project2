unit Recieve;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ComCtrls, Buttons;

type
  TFr_Recieve = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Taker_Name: TEdit;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    Date_Take: TDateTimePicker;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid3: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Voucher_ID : String;
    { Public declarations }
  end;

var
  Fr_Recieve: TFr_Recieve;

implementation

uses DataModule, Main;

{$R *.DFM}

procedure TFr_Recieve.FormShow(Sender: TObject);
Var i,j : Integer;
begin
        Edit1.Text := Voucher_ID;
        with DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select Taker_Name From Voucher Where Voucher_ID = '+#39+Edit1.Text+#39;
             open;
             If FieldValues['Taker_Name'] <> Null then Taker_Name.Text := FieldValues['Taker_Name']
             else
             begin
                  Close;
                  SQL.Text := 'Select * From Officer';
                  open;
                  Taker_Name.Text := FieldValues['InvenSec'];
             end;
        end;
        Date_Take.Date := Date;
        i := 1;
        while i < 16 do
        begin
             j := 1;
             while j < 8 do
             begin
                  StringGrid1.Cells[j,i] := '';
                  j:=j+1;
             end;
             i := i+1;
        end;
        i:=1;
        while i < 16 do
        begin
             j := 0;
             while j < 4 do
             begin
                  StringGrid2.Cells[j,i] := '';
                  j:=j+1;
             end;
             i := i+1;
        end;
        Fr_Recieve.StringGrid1.Cells[0,0] := '   ลำดับ';
        Fr_Recieve.StringGrid1.Cells[1,0] := ' จำนวน';
        Fr_Recieve.StringGrid1.Cells[2,0] := '                            รายการและขนาด';
        Fr_Recieve.StringGrid1.Cells[3,0] := ' ราคาต่อหน่วย';
        Fr_Recieve.StringGrid1.Cells[4,0] := ' VAT(%)';
        Fr_Recieve.StringGrid1.Cells[5,0] := '   ราคาซื้อ';
        Fr_Recieve.StringGrid2.Cells[0,0] := ' จำนวนจริง';
        Fr_Recieve.StringGrid2.Cells[1,0] := ' ราคาต่อหน่วยจริง';
        Fr_Recieve.StringGrid2.Cells[2,0] := ' ใบเสร็จรับเงิน';
        Fr_Recieve.StringGrid1.Cells[0,1] := '      1';
        Fr_Recieve.StringGrid1.Cells[0,2] := '      2';
        Fr_Recieve.StringGrid1.Cells[0,3] := '      3';
        Fr_Recieve.StringGrid1.Cells[0,4] := '      4';
        Fr_Recieve.StringGrid1.Cells[0,5] := '      5';
        Fr_Recieve.StringGrid1.Cells[0,6] := '      6';
        Fr_Recieve.StringGrid1.Cells[0,7] := '      7';
        Fr_Recieve.StringGrid1.Cells[0,8] := '      8';
        Fr_Recieve.StringGrid1.Cells[0,9] := '      9';
        Fr_Recieve.StringGrid1.Cells[0,10] := '     10';
        Fr_Recieve.StringGrid1.Cells[0,11] := '     11';
        Fr_Recieve.StringGrid1.Cells[0,12] := '     12';
        Fr_Recieve.StringGrid1.Cells[0,13] := '     13';
        Fr_Recieve.StringGrid1.Cells[0,14] := '     14';
        Fr_Recieve.StringGrid1.Cells[0,15] := '     15';
        With DM.Qr_Transaction do
        Begin
             Close;
             SQL.Clear;
             SQL.add('Select * From Buy_Detail B,Inventory I Where (B.Inventory_ID = i.inventory_ID) and (Voucher_ID ='+char(39)+ Voucher_ID + char(39) + ') Order by Inventory_Name') ;
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
             i := 1;
             while StringGrid1.Cells[2,i] <> '' do
             begin
                    Close;
                    SQL.Clear;
                    SQL.Text := 'select * from transaction_ T,Inventory I where voice_ID = '+#39+Edit1.Text+#39+' and I.Inventory_name = '+#39+StringGrid1.Cells[2,i]+#39+' and T.Inventory_ID=I.Inventory_ID';
                    Open;
                    if FieldValues['Transaction_ID'] <> null then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Select sum(Recieve_NO)[RNO],voice_ID');
                         SQL.Add('From Inventory I, Transaction_ T,Buy_Detail B');
                         SQL.Add('where B.Voucher_ID = '+#39+Edit1.Text+#39+' and B.Inventory_ID=I.Inventory_ID and T.Voice_ID = B.Voucher_ID and T.Inventory_ID=I.Inventory_ID and I.Inventory_Name ='+#39+StringGrid1.Cells[2,i]+#39);
                         SQL.Add('Group by I.Inventory_NAme,Buy_No,PPE_Buy,VAT,TotalBuy,PPE,voice_ID,B.Voucher_ID');
                         Open;
                         with StringGrid2  do
                         begin
                              Cells[0,i] := IntToStr(FieldValues['RNO']);
                              Cells[1,i] := StringGrid1.Cells[3,i];
                              Cells[2,i] := Fieldvalues['voice_ID'];
                         end;
                         with StringGrid3  do
                         begin
                              Cells[0,i] := IntToStr(FieldValues['RNO']);
                              Cells[1,i] := StringGrid1.Cells[3,i];
                              Cells[2,i] := Fieldvalues['voice_ID'];
                         end;
                    end
                    else
                    begin
                         with StringGrid2  do
                         begin
                              Cells[0,i] := '0';
                              Cells[1,i] := StringGrid1.Cells[3,i];
                         end;
                         with StringGrid3  do
                         begin
                              Cells[0,i] := '0';
                              Cells[1,i] := StringGrid1.Cells[3,i];
                         end;
                    end;
                    i := i+1;
             end;
        end;

end;

procedure TFr_Recieve.BitBtn1Click(Sender: TObject);
var  i,New_Have,I_ID,Trans_ID,RN,LNew : integer;
     Temp,C_Name : String;
     Complete_Flag : Boolean;
begin
     Complete_Flag := False;
     If Taker_Name.Text = '' then
     begin
          ShowMessage ('กรุณาใส่ชื่อผู้รับ');
          Taker_Name.SetFocus;
          exit;
     end;
     DM.Database1.StartTransaction;
     Try
          With DM.Qr_Transaction do
          Begin
               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add('Update Voucher');
               SQL.Add('Set Taker_Name = :TN');
               SQL.Add('Where Voucher_ID = :VID');
               ParamByName('TN').AsString := Taker_Name.Text;
               ParamByName('VID').AsString := Edit1.Text;
               execSQL;
               DM.Database1.Commit;
          End;{with-Try}
     Except
          Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
          raise;
          Close;
     end; {Except}
     i:=1;
     while (StringGrid1.Cells[2,i] <> '') and (i < 16) do
     begin
          if StrToInt(StringGrid2.Cells[0,i]) < StrToInt(StringGrid3.Cells[0,i]) then
          Begin
          ShowMessage('มีการรับ '+StringGrid1.Cells[2,i]+' ไปแล้วมากกว่าจำนวนที่ใส่มา');
          StringGrid2.Cells[0,i] := StringGrid3.Cells[0,i];
          Exit;
          end;
          i := i+1;
     end;
     i:=1;
     while (StringGrid1.Cells[2,i] <> '') and (i < 16) do
     begin
          if StrToInt(StringGrid2.Cells[0,i]) > StrToInt(StringGrid1.Cells[1,i]) then
          Begin
          ShowMessage('ไม่สามารถรับ '+StringGrid1.Cells[2,i]+' เกินจำนวนที่สั่งซื้อได้');
          StringGrid2.Cells[0,i] := StringGrid3.Cells[0,i];
          Exit;
          end;
          i := i+1;
     end;
     i:=1;
     while (StringGrid1.Cells[2,i] <> '') and (i < 16) do
     begin
          if StrToInt(StringGrid2.Cells[0,i]) > StrToInt(StringGrid3.Cells[0,i]) then
             If (StringGrid2.Cells[1,i] = '') or (StringGrid2.Cells[2,i] = '') then
             Begin
                    ShowMessage('กรุณาใส่รายละเอียดการรับ '+StringGrid1.Cells[2,i]+' ให้ครบ');
                    Exit;
             End;
          i := i+1;
     end;
     i:=1;
     DM.Database1.StartTransaction;
     try
     With DM.Qr_Transaction do
     while (StringGrid1.Cells[2,i] <> '') and (i < 16) do
     Begin
          If StrToInt(StringGrid2.Cells[0,i]) > StrToInt(StringGrid3.Cells[0,i]) then
          Begin
               Close;
               SQL.Clear;
               SQL.Text := 'select Max(Transaction_ID)[Max] from transaction_ T,Inventory I where T.Inventory_ID=I.Inventory_ID and I.Inventory_name = '+#39+StringGrid1.Cells[2,i]+#39;
               Open;
               Trans_ID :=  FieldValues['MAX']+1;

               Close;
               SQL.Clear;
               SQL.Text := 'Select Company_Name From Voucher V,Company C where V.Company_ID = C.Company_ID and V.Voucher_ID = '+#39+Edit1.Text+#39;
               Open;
               C_Name := FieldValues['Company_Name'];

               Close;
               SQL.Clear;
               SQL.Text := 'Select Inventory_ID From Inventory where Inventory_name = '+#39+StringGrid1.Cells[2,i]+#39;
               Open;
               I_ID := FieldValues['Inventory_ID'];

               Close;
               SQL.Clear;
               SQL.Text := 'select Sum(Have_No)[Have_No] From Lot L,Inventory I where L.Inventory_ID = I.Inventory_ID and Inventory_name = '+#39+StringGrid1.Cells[2,i]+#39;
               Open;
               RN := StrToInt(StringGrid2.Cells[0,i]) - StrToInt(StringGrid3.Cells[0,i]);
               New_Have := FieldValues['Have_No']+RN;

               Close;
               SQL.Clear;
               SQL.Text := 'select Max(Lot_ID)[LMax] From Lot L,Inventory I where  L.Inventory_ID=I.Inventory_ID and I.Inventory_name = '+#39+StringGrid1.Cells[2,i]+#39;
               Open;
               LNew := FieldValues['LMax']+1;

               {Close;
               SQL.Clear;
               Params.Clear;
               SQL.Text := 'Update Buy_Detail Set Invoice_ID = '+#39+StringGrid2.Cells[2,i]+#39+'where inventory_ID = '+IntToStr(I_ID);
               ExecSQL;  }

               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add('Insert into Transaction_');
               SQL.Add('(Transaction_ID,Inventory_ID,Voice_ID,PassTo,PPE,Recieve_NO,Have_No,Department_ID,Date_)');
               SQL.Add('Values(:T_ID,:I_ID,:V_ID,:PT,:PPE,:RN,:HN,:DP,:Date_)');
               ParamByName('T_ID').AsInteger := Trans_ID;
               ParamByName('I_ID').AsInteger := I_ID;
               ParamByName('V_ID').AsString  := Edit1.Text;
               ParamByName('PT').AsString    := C_Name;
               ParamByName('PPE').AsFloat  := StrToFloat(StringGrid2.Cells[1,i]);
               ParamByName('RN').AsInteger   := RN;
               ParamByName('HN').AsInteger   := New_Have;
               ParamByName('DP').AsInteger    := 0;
               ParamByName('Date_').AsDateTime := Date_Take.DateTime;
               ExecSQL;

               Close;
               SQL.Clear;
               Params.Clear;
               SQL.Add('Insert into Lot');
               SQL.Add('(Lot_ID,Inventory_ID,Have_No,PPE)');
               SQL.Add('Values(:L_ID,:I_ID,:HN,:PPE)');
               ParamByName('L_ID').AsInteger := LNew;
               ParamByName('I_ID').AsInteger := I_ID;
               ParamByName('HN').AsInteger  := RN;
               ParamByName('PPE').AsFloat  := StrToFloat(StringGrid2.Cells[1,i]);
               ExecSQL;

          End;
          i:=i+1;
     end; {while}
     Temp := 'คุณแน่ใจหรือไม่ที่จะทำรายการรับนี้';
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then
     begin
          DM.Database1.Rollback;
          exit;
     end;
     i:=1;
     while (StringGrid1.Cells[2,i] <> '') and (i < 16) do
     begin
          if StrToInt(StringGrid2.Cells[0,i]) = StrToInt(StringGrid1.Cells[1,i]) then
          Begin
               Complete_Flag := True;
          end
          Else
          Begin
               Complete_Flag := False;
               i:=15;
          end;
          i := i+1;
     end;
     if Complete_Flag then
     With DM.Qr_Transaction do
     Begin
          Close;
          SQL.Clear;
          SQL.Text := 'Update Voucher Set Complete = '+#39+'True'+#39 +'Where Voucher_ID = '+#39+Edit1.Text+#39;
          ExecSQL;
     End;
     DM.Database1.Commit;
     Showmessage ('บันทึกรายงานการรับเรียบร้อยแล้ว');
     if Complete_Flag Then ShowMessage ('รายงานขอซื้อ '+Edit1.Text+' สมบูรณ์แล้ว');
     DM.Qr_Inventory_Detail.Close;
     DM.Qr_Inventory_Detail.open;
     Refresh_LV_Voucher_Detail;
     Close
     Except
          Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
          raise;
          Close;
     end;

end;

end.

