unit Register;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, Buttons, DBCtrls,
  ComCtrls, DB, DBTables;

type
  TFrmregis = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    cmbstocktypeid: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    clobtn: TBitBtn;
    edtppu: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtstockid: TMaskEdit;
    edtamurcv: TMaskEdit;
    edtinvid: TMaskEdit;
    StringGrid1: TStringGrid;
    cmbcompany: TComboBox;
    edtstkunt: TEdit;
    edtstockname: TEdit;
    edtdate: TEdit;
    procedure clobtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject); 
    procedure FormCreate(Sender: TObject);
    procedure edtstockidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmregis: TFrmregis;
  stkid,amurcv,ppu : integer;
  cnt:integer=0;
  stocktypeid:array[1..255]of integer;
  stkunt:array[1..255]of string;
  invid,stockid,stockname:string;
  company:integer;


implementation

uses Menu, Delete, Module;

{$R *.dfm}

procedure TFrmregis.clobtnClick(Sender: TObject);
begin
        edtinvid.Text := '';
        edtstockid.Text := '';
        cmbstocktypeid.ItemIndex := -1;
        cmbcompany.ItemIndex := -1;
        edtstockname.Text := '';
        edtamurcv.Text := '';
        edtstkunt.Text := '';
        edtppu.Text := '';
        with stringgrid1 do
              begin
               cnt := 0;
               Rowcount := 2;
               Fixedrows := 1;
                Cells[0,1]:='';
                Cells[1,1]:='';
                Cells[2,1]:='';
                Cells[3,1]:='';
                Cells[4,1]:='';
              end;
      if (Frmmenu = nil) then
      Application.CreateForm(TFrmmenu,Frmmenu);
      Frmregis.hide; Frmmenu.show;
end;

procedure TFrmregis.BitBtn1Click(Sender: TObject);
var c,i:integer;
    exist:boolean;
    sc:integer;
begin
         exist:=false;
         invid:=edtinvid.Text;
         company:=cmbcompany.ItemIndex;
         with datamodule1.regisquery.SQL do
          begin
            clear;
            Add('select * from stock_receive t1, company t2');
            Add(' where');
            Add(' t1.invoice_id ='+#39+edtinvid.text+#39);
            Add(' and t2.company_name='+#39+cmbcompany.text+#39);
            Add(' and t1.company_id=t2.company_id');
          end;
          datamodule1.regisquery.Open;
          if not datamodule1.regisquery.Eof then
            showmessage('Error: Already Exists')
          else
            begin
               for i:=1 to cnt do
               begin
                  with datamodule1.regisquery.SQL do
                  begin
                     clear;
                     Add('select * from stock where ');
                     Add('stock_id ='+#39+Stringgrid1.Cells[1,i]+#39);
                  end;
                  datamodule1.regisquery.Open;
                  if datamodule1.regisquery.eof then//new stock
                  begin
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('insert into stock values(');
                        Add(#39+Stringgrid1.Cells[1,i]+#39);
                        Add(','+#39+'0'+inttostr(stocktypeid[i]+1)+#39);
                        Add(','+#39+Stringgrid1.Cells[2,i]+#39);
                        Add(','+#39+stkunt[i]+#39);
                        Add(','+Stringgrid1.Cells[3,i]);
                        Add(')');
                     end;
                     datamodule1.regisquery.ExecSQL;
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('insert into stock_count values(');
                        Add('1,'+#39+Stringgrid1.Cells[1,i]+#39);
                        Add(','+Stringgrid1.Cells[3,i]);
                        Add(','+Stringgrid1.Cells[4,i]);
                        Add(')');
                     end;
                     datamodule1.regisquery.ExecSQL;
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('insert into receive_detail values(');
                        Add(#39+invid+#39);
                        Add(','+#39+inttostr(company)+#39);
                        Add(','+#39+Stringgrid1.Cells[1,i]+#39);
                        Add(',1');
                        Add(','+Stringgrid1.Cells[3,i]);
                        Add(','+Stringgrid1.Cells[4,i]);
                        Add(')');
                     end;
                     datamodule1.regisquery.ExecSQL;
                  end
                  else
                  begin
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('update stock set current_number');
                        Add('=current_number+'+Stringgrid1.Cells[3,i]);
                        Add(' where stock_id='+#39+Stringgrid1.Cells[1,i]+#39);
                     end;
                     datamodule1.regisquery.ExecSQL;
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('select max(stock_counter) from stock_count ');
                        Add('where stock_id = '+#39+Stringgrid1.Cells[1,i]+#39);
                     end;
                     datamodule1.regisquery.Open;
                     sc:=datamodule1.regisquery.Fields.Fields[0].AsInteger;
                     sc:=sc+1;
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('insert into stock_count values(');
                        Add(inttostr(sc)+','+#39+Stringgrid1.Cells[1,i]+#39);
                        Add(','+Stringgrid1.Cells[3,i]);
                        Add(','+Stringgrid1.Cells[4,i]);
                        Add(')');
                     end;
                     datamodule1.regisquery.ExecSQL;
                     with datamodule1.regisquery.SQL do
                     begin
                        clear;
                        Add('insert into receive_detail values(');
                        Add(#39+invid+#39);
                        Add(','+#39+inttostr(company)+#39);
                        Add(','+#39+Stringgrid1.Cells[1,i]+#39);
                        Add(','+inttostr(sc));
                        Add(','+Stringgrid1.Cells[3,i]);
                        Add(','+Stringgrid1.Cells[4,i]);
                        Add(')');
                     end;
                     datamodule1.regisquery.ExecSQL;
                  end;
               end;
               with datamodule1.regisquery.SQL do
               begin
                  clear;
                  Add('insert into stock_receive values(');
                  Add(#39+invid+#39);
                  Add(','+#39+inttostr(company)+#39);
                  Add(','+#39+Datetostr(Date)+#39);
                  Add(')');
               end;
               datamodule1.regisquery.ExecSQL;
             //
             with stringgrid1 do
              begin
               cnt := 0;
               Rowcount := 2;
               Fixedrows := 1;
                Cells[0,1]:='';
                Cells[1,1]:='';
                Cells[2,1]:='';
                Cells[3,1]:='';
                Cells[4,1]:='';
              end;
               edtinvid.Text := '';
               edtstockid.Text := '';
               cmbstocktypeid.ItemIndex := -1;
               cmbcompany.ItemIndex := -1;
               edtstockname.Text := '';
               edtamurcv.Text := '';
               edtstkunt.Text := '';
               edtppu.Text := '';
            end;
end;

procedure TFrmregis.BitBtn2Click(Sender: TObject);
var i : integer;
     flag : boolean;
     err:boolean;
begin
     flag:= false;
     err:=false;
     stockid:=edtstockid.Text;
     stocktypeid[cnt+1]:=cmbstocktypeid.ItemIndex;
     if strtoint(edtamurcv.Text) <= 0 then
      begin
       showmessage('กรุณาใส่จำนวนใหม่');
       err := true;
      end
     else amurcv:=strtoint(edtamurcv.Text);
     stockname:=edtstockname.Text;
     stkunt[cnt+1]:=edtstkunt.Text;
     if strtoint(edtppu.text)<=0 then
       begin
         Showmessage('กรุณาใส่ราคาใหม่');
         err := true;
       end
     else  ppu:=strtoint(edtppu.Text);
     for i:=1 to cnt do
     begin
        if stockid = stringgrid1.Cells[1,i] then flag := true;
     end;
     if flag = true then
     Showmessage(' รายการนี้ได้ถูกเพิ่มไปแล้ว ')
     else
     begin
     if err = false then
      begin
       with stringgrid1 do
         begin
          cnt := cnt+1;
          RowCount := cnt+1;
          Fixedrows := 1;
          Cells[0,cnt] := inttostr(cnt);
          Cells[1,cnt] := stockid;
          Cells[2,cnt] := stockname;
          Cells[3,cnt] := inttostr(amurcv);
          Cells[4,cnt] := inttostr(ppu);
          end;
      end;
     end;

end;

procedure TFrmregis.BitBtn3Click(Sender: TObject);
var i:integer;
begin

            with stringgrid1 do
              begin
               cnt := cnt-1;
               if Rowcount > 2 then
                  Rowcount := Rowcount-1
               else
               begin
                  Cells[0,1]:='';
                  Cells[1,1]:='';
                  Cells[2,1]:='';
                  Cells[3,1]:='';
                  Cells[4,1]:='';
               end;
               Fixedrows := 1;
              end;
end;

procedure TFrmregis.FormCreate(Sender: TObject);
var c : integer;
begin
        edtdate.Text := DatetoStr(Date);
        c := 0;
        with stringgrid1 do
        begin
          Cells[0,0] := 'ลำดับที่';
          cells[1,0] := 'รหัสวัสดุ';
          //Cells[1,0] := 'test';
          Cells[2,0] := 'ชื่อวัสดุ';
          Cells[3,0] := 'จำนวน';
          Cells[4,0] := 'ราคาต่อหน่วย';
          //for c:=1 to 10 do
          //begin
          //Stringgrid1.RowCount := c;
          //end;
         end;
end;

procedure TFrmregis.edtstockidKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    //stkunt: string;
begin
          with datamodule1.regisquery.SQL do
          begin
            clear;
            Add('select * from stock t1 ');
            Add('where ');
            Add('stock_id = '+#39+edtstockid.text+#39);
          end;
          datamodule1.regisquery.Open;
          if not datamodule1.regisquery.Eof then
           begin
              with datamodule1.regisquery.Fields do
              begin
                 stkid := Fieldbyname('stock_type_id').Asinteger;
                 edtstkunt.Text := Fieldbyname('stock_unit').Asstring;
                 edtstockname.Text := Fieldbyname('stock_name').Asstring;
                 stkid := stkid-1;
                 cmbstocktypeid.ItemIndex := stkid;
              end;
          end
          else
          begin
              with datamodule1.regisquery.Fields do
              begin
                 edtstkunt.Text := '';
                 edtstockname.Text := '';
                 cmbstocktypeid.ItemIndex := -1;
              end;
          end;
end;

end.
procedure TFrmregis.Panel2Click(Sender: TObject);
begin

end;


