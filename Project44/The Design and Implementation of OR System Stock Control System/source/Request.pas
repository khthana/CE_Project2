unit Request;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, ComCtrls, DB,
  DBTables;

type
  TFrmrequest = class(TForm)
    Button1: TButton;
    initquery: TQuery;
    DataSource1: TDataSource;
    Database1: TDatabase;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    StaticText1: TStaticText;
    edtstockid: TMaskEdit;
    edtamureq: TMaskEdit;
    edtstkreq: TMaskEdit;
    edtdate: TEdit;
    edtexpdate: TEdit;
    edtstkunt: TMaskEdit;
    edtstockname: TMaskEdit;
    edtsection: TEdit;
    edtofficername: TEdit;
    edtstocktype: TEdit;
    edtofficerid: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    StringGrid1: TStringGrid;
    Label12: TLabel;
    edtbud: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure edtofficeridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtstockidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MakeRequest2:integer;//for section_with_budget
  end;

var
  Frmrequest: TFrmrequest;
  sectionid:string;
  officerexist:boolean;
  sectiontype:integer;
  stocktypeid:string;
  currentnumber:integer;
  budgetyear:string;
  stkreqid:string;
  stockid:string;
  stockname:string;
  amureq:integer;
  temp:string;

  arrayid:array[1..255]of string;//mirror request_detail
  arraycount:array[1..255]of integer;//mirror request_detail
  arraynumber:array[1..255]of integer;//mirror request_detail
  arc:integer;//detail counter
  //use arc


  stkunt:array[1..255]of string;//unit
  crow:array[1..255]of integer;//num of row of detail of each stock
  sbudget:array[1..255]of integer;//total for each stock
  cnt:integer;//main counter
  //use cnt

  stockexist:boolean;
  nolimit:boolean;
  notenoughbud:boolean;

  curbudget:longint;
  budgetuse:longint;//total from all stock

implementation

uses Menu, Module;

{$R *.dfm}

procedure TFrmrequest.BitBtn1Click(Sender: TObject);
var i:integer;
    temp2:integer;
begin
      with Datamodule1.orderquery.SQL do
      begin
         clear;
         Add('insert into stock_request values(');
         Add(#39+budgetyear+#39);
         Add(','+#39+edtstkreq.Text+#39);
         Add(','+#39+sectionid+#39);
         Add(','+#39+'0'+#39);
         Add(','+#39+Datetostr(Date)+#39);
         Add(','+#39+edtexpdate.Text+#39);
         if sectiontype=2 then
            Add(','+inttostr(budgetuse))
         else
            Add(',NULL');
         Add(')');
      end;
      Datamodule1.orderquery.ExecSQL;
      for i:=1 to cnt do
      begin
         with Datamodule1.orderquery.SQL do
         begin
            clear;
            Add('update stock set current_number');
            Add('=current_number-');
            Add(Stringgrid1.Cells[3,i]);
            Add(' where stock_id=');
            Add(#39+Stringgrid1.Cells[1,i]+#39);
         end;
         Datamodule1.orderquery.ExecSQL;
      end;
      for i:=1 to arc do
      begin
         with Datamodule1.orderquery.SQL do
         begin
            clear;
            Add('insert into request_detail values(');
            Add(#39+budgetyear+#39);
            Add(','+#39+edtstkreq.Text+#39);
            Add(','+#39+Datetostr(Date)+#39);
            Add(','+#39+arrayid[i]+#39);
            Add(','+inttostr(arraycount[i]));
            Add(','+inttostr(arraynumber[i]));
            Add(')');
         end;
         Datamodule1.orderquery.ExecSQL;
         with Datamodule1.orderquery.SQL do
         begin
            clear;
            Add('update stock_count set current_number');
            Add('=current_number-');
            Add(inttostr(arraynumber[i]));
            Add(' where stock_id=');
            Add(#39+arrayid[i]+#39);
            Add(' and stock_counter=');
            Add(inttostr(arraycount[i]));
         end;
         Datamodule1.orderquery.ExecSQL;
      end;
      if sectiontype = 1 then
      begin
         for i:=1 to cnt do
         begin
            with Datamodule1.orderquery.SQL do
            begin
               clear;
               Add('update request_limit set limit');
               Add('=limit-');
               Add(Stringgrid1.Cells[3,i]);
               Add(' where stock_id=');
               Add(#39+Stringgrid1.Cells[1,i]+#39);
               Add(' and section_id=');
               Add(#39+sectionid+#39);
            end;
            Datamodule1.orderquery.ExecSQL;
         end;
      end;
      if sectiontype = 2 then
      begin
         with Datamodule1.orderquery.SQL do
         begin
            clear;
            Add('update section_with_budget set budget');
            Add('=budget-');
            Add(inttostr(budgetuse));
            Add(' where section_id=');
            Add(#39+sectionid+#39);
         end;
         Datamodule1.orderquery.ExecSQL;
      end;
      arc:=0;
      cnt:=0;
      nolimit:=false;
      notenoughbud:=false;
      budgetuse:=0;
      curbudget:=0;
      for i:=1 to 255 do
      begin
         crow[i]:=0;
         sbudget[i]:=0;
      end;
      with stringgrid1 do
      begin
         Rowcount := 2;
         Fixedrows := 1;
         Cells[0,1]:='';
         Cells[1,1]:='';
         Cells[2,1]:='';
         Cells[3,1]:='';
         Cells[4,1]:='';
         Cells[5,1]:='';
      end;
      edtofficerid.Text := '';
      edtofficername.Text := '';
      edtsection.Text:='';
      edtstockid.Text := '';
      edtstocktype.Text := '';
      edtstockname.Text := '';
      edtstkreq.Text:='';
      edtbud.Text:='';
      edtamureq.Text := '';
      edtstkunt.Text := '';
        with initquery.SQL do
        begin
           clear;
           Add('select max(stock_request_id) from stock_request where');
           Add(' stock_request_date = '+#39+Datetostr(Date)+#39);
        end;
        initquery.Open;
        if initquery.Fields.Fields[0].Asstring<>'' then
        begin
           temp:=initquery.Fields.Fields[0].Asstring;
           temp2:=strtoint(temp);
           temp2:=temp2+1;
           stkreqid:=inttostr(temp2);
           while length(stkreqid)<4 do
              stkreqid:='0'+stkreqid;
           edtstkreq.Text:=stkreqid;
        end
        else
        begin
           edtstkreq.Text:='0001';
        end;
end;



procedure TFrmrequest.Button1Click(Sender: TObject);
var i:integer;
begin
        edtofficerid.Text:='';
        edtofficername.Text:='';
        edtstockid.Text := '';
        edtstocktype.Text := '';
        edtstockname.Text := '';
        edtbud.Text := '';
        edtamureq.Text := '';
        edtstkunt.Text := '';
        edtsection.Text := '';
        edtstkreq.Text := '';

        cnt:=0;
        arc:=0;
        nolimit:=false;
        notenoughbud:=false;
        budgetuse:=0;
        curbudget:=0;
        for i:=1 to 255 do
        begin
           crow[i]:=0;
           sbudget[i]:=0;
        end;

        with stringgrid1 do
              begin
               cnt := 0;
               arc:=0;
               Rowcount := 2;
               Fixedrows := 1;
                Cells[0,1]:='';
                Cells[1,1]:='';
                Cells[2,1]:='';
                Cells[3,1]:='';
                Cells[4,1]:='';
                Cells[5,1]:='';
              end;
        Frmmenu.show;
        Frmrequest.hide;
end;

procedure TFrmrequest.FormCreate(Sender: TObject);
vaR temp2:integer;
    i:integer;
begin
        arc:=0;
        cnt:=0;
        nolimit:=false;
        notenoughbud:=false;
        budgetuse:=0;
        curbudget:=0;
        for i:=1 to 255 do
        begin
           crow[i]:=0;
           sbudget[i]:=0;
        end;
        edtdate.Text := DatetoStr(Date);
        budgetyear:='2002';
        edtexpdate.Text := DatetoStr(Date+7);
        with stringgrid1 do
        begin
          Cells[0,0] := 'ลำดับที่';
          Cells[1,0] := 'รหัสวัสดุ';
          Cells[2,0] := 'รายการ';
          Cells[3,0] := 'จำนวน';
          Cells[4,0] := 'หน่วย';
          Cells[5,0] := 'งบประมาณ';
        end;
        with initquery.SQL do
        begin
           clear;
           Add('select max(stock_request_id) from stock_request where');
           Add(' stock_request_date = '+#39+Datetostr(Date)+#39);
        end;
        initquery.Open;
        if initquery.Fields.Fields[0].Asstring<>'' then
        begin
           temp:=initquery.Fields.Fields[0].Asstring;
           temp2:=strtoint(temp);
           temp2:=temp2+1;
           stkreqid:=inttostr(temp2);
           while length(stkreqid)<4 do
              stkreqid:='0'+stkreqid;
           edtstkreq.Text:=stkreqid;
        end
        else
        begin
           edtstkreq.Text:='0001';
        end;
end;

procedure TFrmrequest.PageControl1Change(Sender: TObject);
begin
        edtdate.Text := Datetostr(Date);
end;

procedure TFrmrequest.edtofficeridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
          officerexist:=false;
          sectiontype:=0;//with nothing as default
          with datamodule1.orderquery.SQL do
          begin
            clear;
            Add('select * from officer where');
            Add(' officer_id = '+#39+edtofficerid.text+#39);
          end;
          datamodule1.orderquery.Open;
          if not datamodule1.orderquery.Eof then
           begin
              officerexist:=true;
              with datamodule1.orderquery.Fields do
              begin
                 edtofficername.Text := Fieldbyname('officer_name').Asstring;
                 sectionid := Fieldbyname('section_id').Asstring;
              end;
              with datamodule1.orderquery.SQL do
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
                    curbudget:=datamodule1.orderquery.Fields.Fieldbyname('budget').AsInteger;
                    edtbud.Text:=inttostr(curbudget);
                 end;
              end;
          end
          else
          begin
              officerexist:=false;
              with datamodule1.orderquery.Fields do
              begin
                 edtsection.Text := '';
                 edtofficername.Text := '';
              end;
          end;
end;

procedure TFrmrequest.edtstockidKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
          stockexist:=false;
          with datamodule1.regisquery.SQL do
          begin
            clear;
            Add('select t1.stock_id,t1.stock_type_id,t1.stock_name,t1.stock_unit,t1.current_number,');
            Add('t2.stock_type_name');
            Add(' from stock t1,stock_type t2');
            Add(' where');
            Add(' stock_id = '+#39+edtstockid.text+#39);
            Add(' and t1.stock_type_id = t2.stock_type_id');
          end;
          datamodule1.regisquery.Open;
          if not datamodule1.regisquery.Eof then
           begin
              stockexist:=true;
              with datamodule1.regisquery.Fields do
              begin
                 stocktypeid := Fieldbyname('stock_type_id').Asstring;
                 edtstkunt.Text := Fieldbyname('stock_unit').Asstring;
                 edtstockname.Text := Fieldbyname('stock_name').Asstring;
                 edtstocktype.Text := Fieldbyname('stock_type_name').Asstring;
                 currentnumber:=Fieldbyname('current_number').AsInteger;
              end;
          end
          else
          begin
              stockexist:=false;
              with datamodule1.regisquery.Fields do
              begin
                 edtstkunt.Text := '';
                 edtstockname.Text := '';
                 edtstocktype.Text := '';
              end;
          end;

end;

function MakeRequest0:integer;//for section
var t1:integer;
    t2:integer;
    sum:integer;
    exceed:boolean;
begin
   sum:=0;
   exceed:=false;
   crow[cnt]:=0;
   with Datamodule1.orderquery.SQL do
   begin
      clear;
      Add('select * from stock_count where stock_id=');
      Add(#39+stockid+#39);
   end;
   Datamodule1.orderquery.Open;
{  arrayid:array[1..255]of string;
  arraycount:array[1..255]of integer;
  arraynumber:array[1.255]of integer;
  arrayppu:array[1.255]of integer;}
   while amureq>0 do
   begin
      if not Datamodule1.orderquery.Eof then
      begin
         t1:=Datamodule1.orderquery.Fields.Fieldbyname('stock_counter').AsInteger;
         t2:=Datamodule1.orderquery.Fields.Fieldbyname('current_number').AsInteger;
         if amureq<=t2 then
         begin
//            t2:=t2-amureq;
            arc:=arc+1;
            crow[cnt]:=crow[cnt]+1;
            arrayid[arc]:=stockid;
            sum:=sum+amureq;
            arraynumber[arc]:=amureq;
            amureq:=0;
            arraycount[arc]:=t1;
            exceed:=false;
         end
         else
         if amureq>t2 then
         begin
            if t2>0 then
            begin
              arc:=arc+1;
              crow[cnt]:=crow[cnt]+1;
              arrayid[arc]:=stockid;
              amureq:=amureq-t2;
              sum:=sum+t2;
              arraynumber[arc]:=t2;
//            t2:=0;
              arraycount[arc]:=t1;
              exceed:=true;
           end;
         end;
         Datamodule1.orderquery.Next;
      end
      else
      begin
          amureq:=0;
      end;
   end;
   if exceed=true then
      showmessage('There are only '+inttostr(sum)+' available');
   MakeRequest0:=sum;
end;

function MakeRequest1:integer;//for section_with_limit
var t1:integer;
    t2:integer;
    sum:integer;
    exceed:boolean;
    fail:boolean;
    templimit:integer;
begin
   sum:=0;
   exceed:=false;
   fail:=false;
   crow[cnt]:=0;
   with Datamodule1.orderquery.SQL do
   begin
      clear;
      Add('select limit from request_limit where stock_id=');
      Add(#39+stockid+#39);
      Add(' and section_id=');
      Add(#39+sectionid+#39);
   end;
   Datamodule1.orderquery.Open;
   if Datamodule1.orderquery.Eof then//if no limit defined
   begin
      showmessage('Your section cannot request this stock');
      fail:=true;
   end
   else
   begin
      fail:=false;
      templimit:=Datamodule1.orderquery.Fields.Fieldbyname('limit').AsInteger;
      if amureq>templimit then
      begin
         Showmessage('This section can request only '+inttostr(templimit));
         amureq:=templimit;
      end;
   end;
   if fail=false then
   begin
      with Datamodule1.orderquery.SQL do
      begin
         clear;
         Add('select * from stock_count where stock_id=');
         Add(#39+stockid+#39);
      end;
      Datamodule1.orderquery.Open;
      while amureq>0 do
      begin
         if not Datamodule1.orderquery.Eof then
         begin
            t1:=Datamodule1.orderquery.Fields.Fieldbyname('stock_counter').AsInteger;
            t2:=Datamodule1.orderquery.Fields.Fieldbyname('current_number').AsInteger;
            if amureq<=t2 then
            begin
//             t2:=t2-amureq;
               arc:=arc+1;
               crow[cnt]:=crow[cnt]+1;
               arrayid[arc]:=stockid;
               sum:=sum+amureq;
               arraynumber[arc]:=amureq;
               amureq:=0;
               arraycount[arc]:=t1;
               exceed:=false;
            end
            else
            if amureq>t2 then
            begin
               if t2>0 then
               begin
                  arc:=arc+1;
                  crow[cnt]:=crow[cnt]+1;
                  arrayid[arc]:=stockid;
                  amureq:=amureq-t2;
                  sum:=sum+t2;
                  arraynumber[arc]:=t2;
//                t2:=0;
                  arraycount[arc]:=t1;
                  exceed:=true;
               end;
            end;
            Datamodule1.orderquery.Next;
         end
         else
         begin
            amureq:=0;
         end;
      end;
      if exceed=true then
      showmessage('There are only '+inttostr(sum)+' available');
      MakeRequest1:=sum;
   end
   else
   begin
      nolimit:=true;
      MakeRequest1:=0;
   end;
end;

function TFrmrequest.MakeRequest2:integer;//for section_with_budget
var t1:integer;
    t2:integer;
    t3:longint;
    sum:integer;//sum number
    sumbudget:longint;//sum budget
    exceed:boolean;
    fail:boolean;
//    tempbudget:longint;
begin
   sum:=0;
   sumbudget:=0;
   exceed:=false;
   fail:=false;
   crow[cnt]:=0;
   notenoughbud:=false;
{   with Datamodule1.orderquery.SQL do
   begin
      clear;
      Add('select budget from section_with_budget where section_id=');
      Add(#39+sectionid+#39);
   end;
   Datamodule1.orderquery.Open;
   tempbudget:=Datamodule1.orderquery.Fields.Fieldbyname('budget').AsInteger;
   edtbud.Text := inttostr(tempbudget);}

      with Datamodule1.orderquery.SQL do
      begin
         clear;
         Add('select * from stock_count where stock_id=');
         Add(#39+stockid+#39);
      end;
      Datamodule1.orderquery.Open;
      while amureq>0 do
      begin
         if not Datamodule1.orderquery.Eof then
         begin
            t1:=Datamodule1.orderquery.Fields.Fieldbyname('stock_counter').AsInteger;
            t2:=Datamodule1.orderquery.Fields.Fieldbyname('current_number').AsInteger;
            t3:=Datamodule1.orderquery.Fields.Fieldbyname('price_per_unit').AsInteger;
            if amureq<=t2 then
            begin
//             t2:=t2-amureq;
               arc:=arc+1;
               crow[cnt]:=crow[cnt]+1;
               arrayid[arc]:=stockid;
               sum:=sum+amureq;
               sumbudget:=sumbudget+(amureq*t3);
               arraynumber[arc]:=amureq;
               amureq:=0;
               arraycount[arc]:=t1;
               exceed:=false;
            end
            else
            if amureq>t2 then
            begin
               if t2>0 then
               begin
                  arc:=arc+1;
                  crow[cnt]:=crow[cnt]+1;
                  arrayid[arc]:=stockid;
                  amureq:=amureq-t2;
                  sum:=sum+t2;
                  sumbudget:=sumbudget+(t2*t3);
                  arraynumber[arc]:=t2;
//                t2:=0;
                  arraycount[arc]:=t1;
                  exceed:=true;
               end;
            end;
            Datamodule1.orderquery.Next;
         end
         else
         begin
            amureq:=0;
         end;
      end;
      if exceed=true then
      begin
         showmessage('There are only '+inttostr(sum)+' available');
      end;
      if sumbudget > curbudget then
      begin
         showmessage('Not enough budget');
         notenoughbud:=true;
         MakeRequest2:=0;
      end;
      if sumbudget <= curbudget then
      begin
         notenoughbud:=false;
         MakeRequest2:=sum;
         sbudget[cnt]:=sumbudget;
         curbudget:=curbudget-sumbudget;
         budgetuse:=budgetuse+sumbudget;
      end;
end;


procedure TFrmrequest.BitBtn2Click(Sender: TObject);
var i : integer;
     flag : boolean;
     total:integer;
     err:boolean;
begin
     flag:= false;
     err:=false;
     total:=0;
     nolimit:=false;
     stockid:=edtstockid.Text;
     stocktypeid:=edtstocktype.Text;
   for i:=1 to cnt do
   begin
      if stockid = stringgrid1.Cells[1,i] then flag := true;
   end;
   if flag = true then
      Showmessage(' รายการนี้ได้ถูกเพิ่มไปแล้ว ')//already add
   else
   begin
     if strtoint(edtamureq.Text) <= 0 then
      begin
       showmessage('กรุณาใส่จำนวนใหม่');//reqno must > 0
       err:=true;
      end
     else amureq:=strtoint(edtamureq.Text);
     stockname:=edtstockname.Text;
     stkunt[cnt+1]:=edtstkunt.Text;
     if ((stockexist=false) or (err=true)) then
       showmessage('This stock id is not in Database.')
     else
     begin
        cnt:=cnt+1;
        if sectiontype = 0 then
           total:=MakeRequest0;
        if sectiontype = 1 then
           total:=MakeRequest1;
        if sectiontype = 2 then
           total:=MakeRequest2;
        if ((sectiontype=0) or (sectiontype=1)) then
        begin
           if (nolimit = false) then
           begin
              if (total>0) then
              begin
                 with stringgrid1 do
                 begin
                    RowCount := cnt+1;
                    Fixedrows := 1;
                    Cells[0,cnt] := inttostr(cnt);
                    Cells[1,cnt] := stockid;
                    Cells[2,cnt] := stockname;
                    Cells[3,cnt] := inttostr(total);
                    Cells[4,cnt] := stkunt[cnt];
                 end;
              end
              else
              begin
                 arc:=arc-crow[cnt];
                 cnt:=cnt-1;
              end;
           end
           else
           begin
              cnt:=cnt-1;
           end;
        end
        else
        if (sectiontype=2) then
        begin
           if notenoughbud = false then
           begin
              if total > 0  then
              begin
                 with stringgrid1 do
                 begin
                    RowCount := cnt+1;
                    Fixedrows := 1;
                    Cells[0,cnt] := inttostr(cnt);
                    Cells[1,cnt] := stockid;
                    Cells[2,cnt] := stockname;
                    Cells[3,cnt] := inttostr(total);
                    Cells[4,cnt] := stkunt[cnt];
                    Cells[5,cnt] := inttostr(sbudget[cnt]);
                 end;
                 edtbud.Text:=inttostr(curbudget);
              end
              else
              begin
                 arc:=arc-crow[cnt];
                 cnt:=cnt-1;
              end;
           end
           else
           begin
              arc:=arc-crow[cnt];
              cnt:=cnt-1;
           end;
        end;
     end;
   end;
end;

procedure TFrmrequest.BitBtn4Click(Sender: TObject);
begin
{  arrayid:array[1..255]of string;
  arraycount:array[1..255]of integer;
  arraynumber:array[1.255]of integer;
  arrayppu:array[1.255]of integer;}
   arc:=arc-crow[cnt];
   if sectiontype = 2 then
   begin
      curbudget:=curbudget+sbudget[cnt];
      budgetuse:=budgetuse-sbudget[cnt];
      edtbud.Text:=inttostr(curbudget);
   end;
   cnt := cnt-1;
   with stringgrid1 do
   begin
      Cells[5,1]:='';
      if Rowcount > 2 then
         Rowcount := Rowcount-1
      else
      begin
         Cells[0,1]:='';
         Cells[1,1]:='';
         Cells[2,1]:='';
         Cells[3,1]:='';
         Cells[4,1]:='';
         Cells[5,1]:='';
      end;
      Fixedrows := 1;
   end;
end;

procedure TFrmrequest.FormShow(Sender: TObject);
var i:integer;
    temp2:integer;
begin
        arc:=0;
        cnt:=0;
        nolimit:=false;
        notenoughbud:=false;
        budgetuse:=0;
        curbudget:=0;
        for i:=1 to 255 do
        begin
           crow[i]:=0;
           sbudget[i]:=0;
        end;
        edtdate.Text := DatetoStr(Date);
        budgetyear:='2002';
        edtexpdate.Text := DatetoStr(Date+7);
        with initquery.SQL do
        begin
           clear;
           Add('select max(stock_request_id) from stock_request where');
           Add(' stock_request_date = '+#39+Datetostr(Date)+#39);
        end;
        initquery.Open;
        if initquery.Fields.Fields[0].Asstring<>'' then
        begin
           temp:=initquery.Fields.Fields[0].Asstring;
           temp2:=strtoint(temp);
           temp2:=temp2+1;
           stkreqid:=inttostr(temp2);
           while length(stkreqid)<4 do
              stkreqid:='0'+stkreqid;
           edtstkreq.Text:=stkreqid;
        end
        else
        begin
           edtstkreq.Text:='0001';
        end;
end;

end.
