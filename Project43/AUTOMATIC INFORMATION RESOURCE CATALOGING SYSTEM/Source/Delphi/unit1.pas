unit unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, ADODB, Buttons, Mask, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    ADOTable1: TADOTable;
    ADOQuery2: TADOQuery;
    ADOQuery2BookCode: TWideStringField;
    ADOQuery2AuthorName: TWideStringField;
    ADOQuery2title: TWideStringField;
    ADOQuery2BookNo: TWideStringField;
    ADOQuery2Date: TWideStringField;
    ADOQuery2No: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ADOQuery2CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tmp : string;

implementation
    uses unit2;
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);

begin
   adoquery1.Close;
   adoquery1.sql.clear;
   adoquery1.sql.text := 'delete from tmp ';
   try
   adoquery1.Open;
   except
      on  EdatabaseError do
                  ;
   end;

   adoquery1.Close;
   adoquery1.sql.clear;

   adoquery1.sql.text := 'select t008_7,t090_1,t090_2,t090_3,t099_1,t099_2,t099_3,t100_1,t110_1,t111_1,t130_1,t245_1,t210_1,t240_1,t242_1,book_no from tagdata1';
   adoquery1.sql.text := adoquery1.sql.text + 'where t008_7 between ' + '"'+ maskedit1.Text+'"' + ' and ' + '"'+ maskedit2.Text + '"' ;

   adoquery1.Open;
   adotable1.open;

   repeat
   adotable1.Append;

   if adoquery1.FieldByName('t090_1').asstring <> ' ' then
   adotable1.FieldByName('BookCode').value := adoquery1.FieldByName('t090_1').asstring + ' ' + adoquery1.FieldByName('t090_2').asstring + ' ' + adoquery1.FieldByName('t090_3').asstring
   else
   adotable1.fieldbyname('BookCode').value := adoquery1.fieldbyname('t099_1').asstring + ' ' + adoquery1.FieldByName('t099_2').asstring + ' ' + adoquery1.FieldByName('t099_3').asstring;

   if adoquery1.fieldbyname('t130_1').asstring <> ' ' then
   adotable1.fieldbyname('AuthorName').value := adoquery1.fieldbyname('t130_1').asstring
   else
      if adoquery1.fieldbyname('t111_1').asstring <> ' ' then
         adotable1.fieldbyname('AuthorName').value := adoquery1.fieldbyname('t111_1').asstring
          else
            if adoquery1.fieldbyname('t110_1').asstring <> ' ' then
               adotable1.fieldbyname('AuthorName').value := adoquery1.fieldbyname('t110_1').asstring
               else
               adotable1.fieldbyname('AuthorName').value := adoquery1.fieldbyname('t100_1').asstring;

   if adoquery1.fieldbyname('t245_1').asstring <> ' ' then
   begin
   tmp := adoquery1.fieldbyname('t245_1').asstring;
   if length(tmp) > 47 then
      begin
         tmp[45] := ' ';
         tmp[46] := '.';
         tmp[47] := ' ';
         tmp[48] := '.';
         tmp[49] := ' ';
         tmp[50] := '.';      end;
   adotable1.fieldbyname('title').value := tmp;
   end
   else
      if adoquery1.fieldbyname('t240_1').asstring <> ' '  then
         begin
         tmp := adoquery1.fieldbyname('t240_1').asstring;
         if length(tmp) > 47 then
            begin
               tmp[45] := ' ';
               tmp[46] := '.';
               tmp[47] := ' ';
               tmp[48] := '.';
               tmp[49] := ' ';
               tmp[50] := '.';
            end;
        adotable1.fieldbyname('title').value := tmp;
        end
          else
            if adoquery1.fieldbyname('t210_1').asstring <> ' '  then
               begin
               tmp := adoquery1.fieldbyname('t210_1').asstring;
               if length(tmp) > 47 then
                   begin
                      tmp[45] := ' ';
                      tmp[46] := '.';
                      tmp[47] := ' ';
                      tmp[48] := '.';
                      tmp[49] := ' ';
                      tmp[50] := '.';
                  end;
               adotable1.fieldbyname('title').value := tmp;
               end
               else
               begin
                  tmp := adoquery1.fieldbyname('t242_1').asstring;
                  if length(tmp) > 47 then
                     begin
                      tmp[45] := ' ';
                      tmp[46] := '.';
                      tmp[47] := ' ';
                      tmp[48] := '.';
                      tmp[49] := ' ';
                      tmp[50] := '.';
                    end;
                   adotable1.fieldbyname('title').value := tmp;
              end;


   adotable1.fieldbyname('BookNo').value := adoquery1.fieldbyname('book_no').asstring;
   adotable1.fieldbyname('date').value := adoquery1.fieldbyname('t008_7').asstring;

   adotable1.Post;
   adoquery1.Next;
   until adoquery1.Eof;

   adotable1.Close;
   adoquery1.Close;
   adoquery1.sql.clear;

   adoquery2.Close;
   adoquery2.sql.clear;

   adoquery2.sql.text := 'select BookCode,AuthorName,title,BookNo,date from tmp';

   if radiogroup1.ItemIndex = 0 then
      adoquery2.sql.add('order by 1,2,3')
   else
      adoquery2.sql.add('order by date,1,2,3');

   adoquery2.Open;


   form2.QuickRep1.Preview;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   maskedit1.SetFocus;
   radiogroup1.ItemIndex := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   release;
   close;
end;



procedure TForm1.ADOQuery2CalcFields(DataSet: TDataSet);
begin
   with dataset do
     begin
        FieldByname('no').Asinteger := RecNo;
     end;
end;

end.
