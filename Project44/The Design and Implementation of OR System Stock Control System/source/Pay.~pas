unit Pay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Mask, ExtCtrls, DB, DBTables;

type
  Tfrmpay = class(TForm)
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    StaticText2: TStaticText;
    edtstkreq: TMaskEdit;
    edtstkpay: TMaskEdit;
    edtdate: TEdit;
    Panel4: TPanel;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button4: TButton;
    Database1: TDatabase;
    initquery: TQuery;
    DataSource1: TDataSource;
    edtreqdate: TEdit;
    Label1: TLabel;
    edtexpdate: TEdit;
    Label2: TLabel;
    edtsection: TEdit;
    Label3: TLabel;
    edtbudget: TEdit;
    Label4: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtstkreqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpay: Tfrmpay;
  stkpayid:string;
  temp:string;
  reqdate:string;
  sectionid:string;
  tempbud:string;
  budgetuse:longint;
  expdate:string;
  sectiontype:integer=0;
  state:integer=0;

  stkid:array[1..255]of string;
  stknumber:array[1..255]of integer;
  stkunt:array[1..255]of string;
  stkname:array[1..255]of string;
  //use cnt
  cnt:integer;


  arrayid:array[1..255]of string;
  arraycount:array[1..255]of integer;
  arraynumber:array[1..255]of integer;
  //use arc
  arc:integer;
implementation

uses Menu, Module;

{$R *.dfm}

procedure Tfrmpay.Button1Click(Sender: TObject);
var i:integer;
begin
        edtdate.Text := DatetoStr(Date);
        edtreqdate.Text:=DatetoStr(Date-7);
        edtsection.Text:='';
        edtbudget.Text:='';
        edtexpdate.Text:='';
        cnt:=0;
        arc:=0;
        budgetuse:=0;
        for i:=1 to 255 do
        begin
           stknumber[i]:=0;
        end;
        Frmmenu.show;
        Frmpay.hide;
end;

procedure Tfrmpay.FormCreate(Sender: TObject);
var temp2:integer;
    i:integer;
begin
        edtdate.Text := DatetoStr(Date);
        edtreqdate.Text:=DatetoStr(Date-7);
        edtsection.Text:='';
        edtbudget.Text:='';
        edtexpdate.Text:='';
        cnt:=0;
        arc:=0;
        budgetuse:=0;
        for i:=1 to 255 do
        begin
           stknumber[i]:=0;
        end;
        with stringgrid2 do
        begin
          Cells[0,0] := 'ลำดับที่';
          Cells[1,0] := 'รหัสวัสดุ';
          Cells[2,0] := 'รายการ';
          Cells[3,0] := 'จำนวน';
          Cells[4,0] := 'หน่วย';
        end;
        with initquery.SQL do
        begin
           clear;
           Add('select max(stock_pay_id) from stock_pay where');
           Add(' stock_pay_date = '+#39+Datetostr(Date)+#39);
        end;
        initquery.Open;
        if initquery.Fields.Fields[0].Asstring<>'' then
        begin
           temp:=initquery.Fields.Fields[0].Asstring;
           temp2:=strtoint(temp);
           temp2:=temp2+1;
           stkpayid:=inttostr(temp2);
           while length(stkpayid)<4 do
              stkpayid:='0'+stkpayid;
           edtstkpay.Text := stkpayid;
        end
        else
        begin
           edtstkpay.Text:='0001';
        end;
end;

procedure Tfrmpay.edtstkreqKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i:integer;
begin
   cnt:=0;
   arc:=0;
   edtsection.Text:='';
   edtbudget.Text:='';
   edtexpdate.Text:='';
   if Length(edtstkreq.Text) = 4 then//check only if id length=4
   begin
      with Datamodule1.orderquery.SQL do//get request list
      begin
         clear;
         Add('select stock_id,sum(amount_request) sum from request_detail');
         Add(' where stock_request_id=');
         Add(#39+edtstkreq.Text+#39);
         Add(' and stock_request_date=');
         Add(#39+edtreqdate.Text+#39);
         Add(' group by stock_id');
         Add(' order by stock_id asc');
      end;
      Datamodule1.orderquery.Open;
      if not Datamodule1.orderquery.Eof then
      begin
         while not Datamodule1.orderquery.Eof do
         begin
            cnt:=cnt+1;
            stkid[cnt]:=Datamodule1.orderquery.Fields.Fieldbyname('stock_id').Asstring;
            stknumber[cnt]:=Datamodule1.orderquery.Fields.Fieldbyname('sum').AsInteger;
            Datamodule1.orderquery.Next;
         end;
         for i:=1 to cnt do
         begin
            with Datamodule1.orderquery.SQL do//get stock name and unit
            begin
               clear;
               Add('select stock_name,stock_unit from stock where stock_id=');
               Add(#39+stkid[i]+#39);
            end;
            Datamodule1.orderquery.Open;
            stkunt[i]:=Datamodule1.orderquery.Fields.Fieldbyname('stock_unit').Asstring;
            stkname[i]:=Datamodule1.orderquery.Fields.Fieldbyname('stock_name').Asstring;
         end;
         for i:=1 to cnt do
         begin
            with Stringgrid2 do
            begin
               RowCount := cnt+1;
               Fixedrows := 1;
               Cells[0,i] := inttostr(i);
               Cells[1,i] := stkid[i];
               Cells[2,i] := stkname[i];
               Cells[3,i] := inttostr(stknumber[i]);
               Cells[4,i] := stkunt[i];
            end;
         end;
         with Datamodule1.orderquery.SQL do//get section, expire date, value
         begin
            clear;
            Add('select * from stock_request');
            Add(' where stock_request_id=');
            Add(#39+edtstkreq.Text+#39);
            Add(' and stock_request_date=');
            Add(#39+edtreqdate.Text+#39);
         end;
         Datamodule1.orderquery.Open;
         sectionid:=Datamodule1.orderquery.Fields.Fieldbyname('section_id').Asstring;
         expdate:=Datamodule1.orderquery.Fields.Fieldbyname('request_expire_date').Asstring;
         state:=Datamodule1.orderquery.Fields.Fieldbyname('request_state').AsInteger;
         tempbud:=Datamodule1.orderquery.Fields.Fieldbyname('request_value').Asstring;
         edtexpdate.Text:=expdate;
         if tempbud<>'' then
         begin
            budgetuse:=strtoint(tempbud);
            edtbudget.Text:=inttostr(budgetuse);
         end
         else
         begin
            budgetuse:=0;
            edtbudget.Text:='';
         end;
         with datamodule1.orderquery.SQL do//check section
         begin
            clear;
            Add('select * from section where section_id=');
            Add(#39+sectionid+#39);
         end;
         datamodule1.orderquery.Open;
         if not datamodule1.orderquery.Eof then
         begin
            sectiontype:=0;
            edtsection.Text:=datamodule1.orderquery.Fields.Fieldbyname('section_name').AsString;
         end
         else
         begin
            with datamodule1.orderquery.SQL do
            begin
               clear;
               Add('select * from section_with_limit where section_id=');
               Add(#39+sectionid+#39);
            end;
            datamodule1.orderquery.Open;
            if not datamodule1.orderquery.Eof then
            begin
               sectiontype:=1;//with limit
               edtsection.Text:=datamodule1.orderquery.Fields.Fieldbyname('section_name').AsString;
            end
            else
            begin
               with datamodule1.orderquery.SQL do
               begin
                  clear;
                  Add('select * from section_with_budget where section_id=');
                  Add(#39+sectionid+#39);
               end;
               datamodule1.orderquery.Open;
               sectiontype:=2;//with budget
               edtsection.Text:=datamodule1.orderquery.Fields.Fieldbyname('section_name').AsString;
            end;
         end;
         with datamodule1.orderquery.SQL do//get request detail
         begin
            clear;
            Add('select * from request_detail');
            Add(' where stock_request_id=');
            Add(#39+edtstkreq.Text+#39);
            Add(' and stock_request_date=');
            Add(#39+edtreqdate.Text+#39);
         end;
         datamodule1.orderquery.Open;
         while not datamodule1.orderquery.Eof do
         begin
            arc:=arc+1;
            arrayid[arc]:=datamodule1.orderquery.Fields.Fieldbyname('stock_id').AsString;
            arraycount[arc]:=datamodule1.orderquery.Fields.Fieldbyname('stock_counter').AsInteger;
            arraynumber[arc]:=datamodule1.orderquery.Fields.Fieldbyname('amount_request').AsInteger;
            datamodule1.orderquery.Next;
         end;
      end
      else//request does not exist
      begin
         Showmessage('This request does not exist');
         with Stringgrid2 do
         begin
            RowCount := 2;
            Fixedrows := 1;
            Cells[0,1] := '';
            Cells[1,1] := '';
            Cells[2,1] := '';
            Cells[3,1] := '';
            Cells[4,1] := '';
         end;
      end;
   end;//if length=4
end;

procedure Tfrmpay.FormShow(Sender: TObject);
var temp2:integer;
    i:integer;
begin
        edtdate.Text := DatetoStr(Date);
        edtreqdate.Text:=DatetoStr(Date-7);
        edtstkreq.Text:='';
        edtsection.Text:='';
        edtbudget.Text:='';
        edtexpdate.Text:='';
        cnt:=0;
        arc:=0;
        budgetuse:=0;
        for i:=1 to 255 do
        begin
           stknumber[i]:=0;
        end;
        with Stringgrid2 do
        begin
           RowCount := 2;
           Fixedrows := 1;
           Cells[0,1] := '';
           Cells[1,1] := '';
           Cells[2,1] := '';
           Cells[3,1] := '';
           Cells[4,1] := '';
        end;
        with initquery.SQL do
        begin
           clear;
           Add('select max(stock_pay_id) from stock_pay where');
           Add(' stock_pay_date = '+#39+Datetostr(Date)+#39);
        end;
        initquery.Open;
        if initquery.Fields.Fields[0].Asstring<>'' then
        begin
           temp:=initquery.Fields.Fields[0].Asstring;
           temp2:=strtoint(temp);
           temp2:=temp2+1;
           stkpayid:=inttostr(temp2);
           while length(stkpayid)<4 do
              stkpayid:='0'+stkpayid;
           edtstkpay.Text := stkpayid;
        end
        else
        begin
           edtstkpay.Text:='0001';
        end;
end;



procedure Tfrmpay.Button4Click(Sender: TObject);
var i:integer;
    temp2:integer;
begin
   if state=0 then
   begin
      if (Strtodate(edtdate.Text) <= Strtodate(expdate)) then
      begin
         with datamodule1.orderquery.SQL do//update request state
         begin
            clear;
            Add('update stock_request set request_state=');
            Add(#39+'1'+#39);
            Add(' where stock_request_id=');
            Add(#39+edtstkreq.Text+#39);
            Add(' and stock_request_date=');
            Add(#39+edtreqdate.Text+#39);
         end;
         datamodule1.orderquery.ExecSQL;
         with datamodule1.orderquery.SQL do//update request state
         begin
            clear;
            Add('insert into stock_pay values(');
            Add(#39+'2002'+#39);
            Add(','+#39+edtstkpay.Text+#39);
            Add(','+#39+edtstkreq.Text+#39);
            Add(','+#39+sectionid+#39);
            Add(','+#39+Datetostr(Date)+#39);
            Add(')');
         end;
         datamodule1.orderquery.ExecSQL;
         state:=1;
         with initquery.SQL do
         begin
            clear;
            Add('select max(stock_pay_id) from stock_pay where');
            Add(' stock_pay_date = '+#39+Datetostr(Date)+#39);
         end;
         initquery.Open;
         if initquery.Fields.Fields[0].Asstring<>'' then
         begin
            temp:=initquery.Fields.Fields[0].Asstring;
            temp2:=strtoint(temp);
            temp2:=temp2+1;
            stkpayid:=inttostr(temp2);
            while length(stkpayid)<4 do
               stkpayid:='0'+stkpayid;
            edtstkpay.Text := stkpayid;
         end
         else
         begin
            edtstkpay.Text:='0001';
         end;
      end//not expired
      else
      begin//expired
         Showmessage('This request has expired');
         for i:=1 to cnt do//restore stock_number
         begin
            with datamodule1.orderquery.SQL do
            begin
               clear;
               Add('update stock set current_number');
               Add('=current_number+');
               Add(inttostr(stknumber[i]));
               Add(' where stock_id=');
               Add(#39+stkid[i]+#39);
            end;
            datamodule1.orderquery.ExecSQL;
         end;
         for i:=1 to arc do//restore stock_count
         begin
            with datamodule1.orderquery.SQL do
            begin
               clear;
               Add('update stock_count set current_number');
               Add('=current_number+');
               Add(inttostr(arraynumber[i]));
               Add(' where stock_id=');
               Add(#39+arrayid[i]+#39);
               Add(' and stock_counter=');
               Add(inttostr(arraycount[i]));
            end;
            datamodule1.orderquery.ExecSQL;
         end;
         with datamodule1.orderquery.SQL do//delete stock_request
         begin
            clear;
            Add('delete from stock_request');
            Add(' where stock_request_id=');
            Add(#39+edtstkreq.Text+#39);
            Add(' and stock_request_date=');
            Add(#39+edtreqdate.Text+#39);
         end;
         datamodule1.orderquery.ExecSQL;
         with datamodule1.orderquery.SQL do//delete request_detail
         begin
            clear;
            Add('delete from request_detail');
            Add(' where stock_request_id=');
            Add(#39+edtstkreq.Text+#39);
            Add(' and stock_request_date=');
            Add(#39+edtreqdate.Text+#39);
         end;
         datamodule1.orderquery.ExecSQL;
         if sectiontype = 1 then //restore limit
         begin
            for i:=1 to cnt do//restore stock_number
            begin
               with datamodule1.orderquery.SQL do
               begin
                  clear;
                  Add('update request_limit set limit');
                  Add('=limit+');
                  Add(inttostr(stknumber[i]));
                  Add(' where stock_id=');
                  Add(#39+stkid[i]+#39);
                  Add(' and section_id=');
                  Add(#39+sectionid+#39);
               end;
               datamodule1.orderquery.ExecSQL;
            end;
         end;
         if sectiontype = 2 then //restore budget
         begin
            with datamodule1.orderquery.SQL do
            begin
               clear;
               Add('update section_with_budget set budget');
               Add('=budget+');
               Add(inttostr(budgetuse));
               Add(' where section_id=');
               Add(#39+sectionid+#39);
            end;
            datamodule1.orderquery.ExecSQL;
         end;
      end;//end expired
   end
   else
   begin
      Showmessage('This request have already been paid');
   end;
end;

procedure Tfrmpay.Button2Click(Sender: TObject);
var i:integer;
begin
        edtdate.Text := DatetoStr(Date);
        edtreqdate.Text:=DatetoStr(Date-7);
        edtsection.Text:='';
        edtbudget.Text:='';
        edtexpdate.Text:='';
        edtstkreq.Text:='';
        cnt:=0;
        arc:=0;
        budgetuse:=0;
        for i:=1 to 255 do
        begin
           stknumber[i]:=0;
        end;
        with Stringgrid2 do
        begin
           RowCount := 2;
           Fixedrows := 1;
           Cells[0,1] := '';
           Cells[1,1] := '';
           Cells[2,1] := '';
           Cells[3,1] := '';
           Cells[4,1] := '';
        end;
end;

end.
