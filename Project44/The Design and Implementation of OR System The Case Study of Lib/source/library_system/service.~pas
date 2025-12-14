unit service;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TabNotBk, Grids, DBGrids, DateUtils, IdTrivialFTPBase;

type
  Tserviceform = class(TForm)
    Button1: TButton;
    TabbedNotebook1: TTabbedNotebook;
    TabbedNotebook2: TTabbedNotebook;
    Label15: TLabel;
    EditBorrowStdId: TEdit;
    Label16: TLabel;
    EditBorrowStdName: TEdit;
    Label17: TLabel;
    EditBorrowStdBid: TEdit;
    Label18: TLabel;
    EditBorrowStdBname: TEdit;
    ButtonBorrowStdCancel: TButton;
    ButtonBorrowStdOK: TButton;
    DBGridStdBBorrow: TDBGrid;
    Label1: TLabel;
    EditBorrowStaMemid: TEdit;
    Label2: TLabel;
    EditBorrowStaSerial: TEdit;
    Label3: TLabel;
    EditBorrowStaMemName: TEdit;
    Label4: TLabel;
    EditBorrowStaBname: TEdit;
    DBGridStaBBorrow: TDBGrid;
    ButtonBorrowStaCancel: TButton;
    ButtonBorrowStaOK: TButton;
    TabbedNotebook3: TTabbedNotebook;
    Label5: TLabel;
    EditRetStuSerial: TEdit;
    Label19: TLabel;
    EditRetStuBname: TEdit;
    Label20: TLabel;
    EditRetStuMemid: TEdit;
    Label21: TLabel;
    EditRetStuName: TEdit;
    DBGridStuBRet: TDBGrid;
    EditRetStuFee: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ButtonRetStuCancel: TButton;
    ButtonRetStuOK: TButton;
    Label8: TLabel;
    EditRetStaSerial: TEdit;
    Label9: TLabel;
    EditRetStaBname: TEdit;
    Label10: TLabel;
    EditRetStaMemid: TEdit;
    Label11: TLabel;
    EditRetStaName: TEdit;
    Label22: TLabel;
    EditRetStaFee: TEdit;
    Label23: TLabel;
    ButtonRetStaCancel: TButton;
    ButtonRetStaOK: TButton;
    DBGridStaBRet: TDBGrid;
    TabbedNotebook4: TTabbedNotebook;
    Label24: TLabel;
    EditResStaSerial: TEdit;
    Label25: TLabel;
    EditResStaBname: TEdit;
    Label26: TLabel;
    EditResStaMemid: TEdit;
    Label27: TLabel;
    EditResStaName: TEdit;
    ButtonResStaCancel: TButton;
    ButtonResStaOK: TButton;
    DBGridStaResBorrow: TDBGrid;
    Label12: TLabel;
    EditResStuSerial: TEdit;
    Label13: TLabel;
    EditResStuBname: TEdit;
    Label14: TLabel;
    EditResStuMemid: TEdit;
    Label28: TLabel;
    EditResStuName: TEdit;
    ButtonResStuCancel: TButton;
    ButtonResStuOK: TButton;
    DBGridStuResBorrow: TDBGrid;
    DBGridStdMBorrow: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGridStaMBorrow: TDBGrid;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBGridStuMRet: TDBGrid;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBGridStaMRet: TDBGrid;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    DBGridStuRes: TDBGrid;
    GroupBox12: TGroupBox;
    DBGridStaRes: TDBGrid;
    Editcancelresbid: TEdit;
    Editcancelresbname: TEdit;
    Editcancelresmemid: TEdit;
    Editcancelresmemname: TEdit;
    GroupBox13: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    cancelres: TButton;
    okcancelres: TButton;
    Label31: TLabel;
    Label32: TLabel;
    DBGridcancelres: TDBGrid;
    viewcancelres: TButton;
    procedure Button1Click(Sender: TObject);
    procedure EditBorrowStdIdKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditBorrowStdBidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonBorrowStdOKClick(Sender: TObject);
    procedure ButtonBorrowStdCancelClick(Sender: TObject);
    procedure EditBorrowStaMemidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditBorrowStaSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonBorrowStaOKClick(Sender: TObject);
    procedure EditRetStuSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonRetStuCancelClick(Sender: TObject);
    procedure ButtonBorrowStaCancelClick(Sender: TObject);
    procedure ButtonRetStuOKClick(Sender: TObject);
    procedure EditRetStaSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonRetStaCancelClick(Sender: TObject);
    procedure ButtonRetStaOKClick(Sender: TObject);
    procedure EditResStuMemidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditResStuSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonResStuCancelClick(Sender: TObject);
    procedure ButtonResStuOKClick(Sender: TObject);
    procedure EditResStaMemidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditResStaSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonResStaCancelClick(Sender: TObject);
    procedure ButtonResStaOKClick(Sender: TObject);
    procedure viewcancelresClick(Sender: TObject);
    procedure cancelresClick(Sender: TObject);
    procedure EditcancelresbidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okcancelresClick(Sender: TObject);
  private
    { Private declarations }

    procedure showdbgridstdborrow(idmem : string);
    procedure showdbgridstaborrow(idmem : string);
    procedure showdbgridsturet(idmem : string);
    procedure showdbgridstaret(idmem : string);
    procedure showdbgridstures(idmem : string);
    procedure showdbgridstares(idmem : string);
    procedure showdbgridcancelres();
  public
    { Public declarations }
  end;

var
  	serviceform: Tserviceform;
//------- Borrow variable --------------
 	memid,flagmem : string;
   numbook,nummag : integer;

   sid,flag_lib,cn : string;
   borm : integer;
//--------------------------------------

//------ Return variable --------------
	retStuSerial,retBookcn,retBookflaglib : string;
   retMagcn,retMagflaglib,retidmemhold : string;
   retStuid,duedate : string;
   Retborm,retNumB,retNumM : integer;

   retStaSerial,retStaid : string;
//-------------------------------------

//----- Reserve variable --------------
  	resStuid,resStuSerial : string;
   rescn,resflaglib : string;
   resNumB : integer;

   resStaid,resStaSerial : string;
//-------------------------------------


//-------Overreserve----------------------
	resSerial,residmem,resflagcir,residmemhold : string;
   std_sta : integer;
//----------------------------------

implementation

uses mainmenu, module;

{$R *.dfm}

procedure Tserviceform.Button1Click(Sender: TObject);
begin
	menuform.Show;
   serviceform.Hide;
end;

procedure TserviceForm.showdbgridstdborrow(idmem : string);
begin
	with Databasemd.Query3 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;
       DbGridStdBBorrow.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStdBBorrow.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStdBBorrow.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStdBBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStdBBorrow.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStdBBorrow.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query2 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select m.serialno,m.call_no,mt.name,borrow_date,due_date from circulation c,magazine m,magazine_title mt where c.id_mem = "'+idmem+'" and c.serialno = m.serialno and m.call_no = mt.call_no');
       Open;
   end;

   	 DbGridStdMBorrow.Columns[0].Title.Caption := 'เลขทะเบียนวารสาร';
       DbGridStdMBorrow.Columns[1].Title.Caption := 'เลขหมู่วารสาร';
       DbGridStdMBorrow.Columns[2].Title.Caption := 'ชื่อวารสาร';
       DbGridStdMBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStdMBorrow.Columns[4].Title.Caption := 'วันที่คืน';
end;

procedure TserviceForm.showdbgridstaborrow(idmem : string);
begin
	with Databasemd.Query4 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;
       DbGridStaBBorrow.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStaBBorrow.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStaBBorrow.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStaBBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaBBorrow.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStaBBorrow.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query5 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select m.serialno,m.call_no,mt.name,borrow_date,due_date from circulation c,magazine m,magazine_title mt where c.id_mem = "'+idmem+'" and c.serialno = m.serialno and m.call_no = mt.call_no');
       Open;
   end;

   	 DbGridStaMBorrow.Columns[0].Title.Caption := 'เลขทะเบียนวารสาร';
       DbGridStaMBorrow.Columns[1].Title.Caption := 'เลขหมู่วารสาร';
       DbGridStaMBorrow.Columns[2].Title.Caption := 'ชื่อวารสาร';
       DbGridStaMBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaMBorrow.Columns[4].Title.Caption := 'วันที่คืน';
end;

procedure TserviceForm.showdbgridsturet(idmem : string);
begin
	with Databasemd.Query6 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no and c.flag_cir = "0"');
       Open;
   end;
       DbGridStuBRet.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStuBRet.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStuBRet.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStuBRet.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStuBRet.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStuBRet.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query7 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select m.serialno,m.call_no,mt.name,borrow_date,due_date from circulation c,magazine m,magazine_title mt where c.id_mem = "'+idmem+'" and c.serialno = m.serialno and m.call_no = mt.call_no and c.flag_cir = "0"');
       Open;
   end;

   	 DbGridStuMRet.Columns[0].Title.Caption := 'เลขทะเบียนวารสาร';
       DbGridStuMRet.Columns[1].Title.Caption := 'เลขหมู่วารสาร';
       DbGridStuMRet.Columns[2].Title.Caption := 'ชื่อวารสาร';
       DbGridStuMRet.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStuMRet.Columns[4].Title.Caption := 'วันที่คืน';
end;

procedure TserviceForm.showdbgridstaret(idmem : string);
begin
	with Databasemd.Query8 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;
       DbGridStaBRet.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStaBRet.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStaBRet.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStaBRet.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaBRet.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStaBRet.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query9 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select m.serialno,m.call_no,mt.name,borrow_date,due_date from circulation c,magazine m,magazine_title mt where c.id_mem = "'+idmem+'" and c.serialno = m.serialno and m.call_no = mt.call_no');
       Open;
   end;

   	 DbGridStaMRet.Columns[0].Title.Caption := 'เลขทะเบียนวารสาร';
       DbGridStaMRet.Columns[1].Title.Caption := 'เลขหมู่วารสาร';
       DbGridStaMRet.Columns[2].Title.Caption := 'ชื่อวารสาร';
       DbGridStaMRet.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaMRet.Columns[4].Title.Caption := 'วันที่คืน';
end;

procedure TserviceForm.showdbgridstures(idmem : string);
begin
	with Databasemd.Query10 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;
       DbGridStuResBorrow.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStuResBorrow.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStuResBorrow.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStuResBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStuResBorrow.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStuResBorrow.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query11 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno,b.call_no,bt.name,borrow_date,due_date,c.id_mem from circulation c,book b,book_title bt where c.id_mem_hold = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;

   	 DbGridStuRes.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStuRes.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStuRes.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStuRes.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStuRes.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStuRes.Columns[5].Title.Caption := 'รหัสผู้ยืม';
end;

procedure TserviceForm.showdbgridstares(idmem : string);
begin
	with Databasemd.Query12 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno ,b.call_no,bt.name,borrow_date,due_date,id_mem_hold from circulation c,book b,book_title bt where c.id_mem = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;
       DbGridStaResBorrow.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStaResBorrow.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStaResBorrow.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStaResBorrow.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaResBorrow.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStaResBorrow.Columns[5].Title.Caption := 'รหัสผู้จอง';

   with Databasemd.Query13 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.serialno,b.call_no,bt.name,borrow_date,due_date,c.id_mem from circulation c,book b,book_title bt where c.id_mem_hold = "'+idmem+'" and c.serialno = b.serialno and b.call_no = bt.call_no');
       Open;
   end;

   	 DbGridStaRes.Columns[0].Title.Caption := 'เลขทะเบียนหนังสือ';
       DbGridStaRes.Columns[1].Title.Caption := 'เลขหมู่หนังสือ';
       DbGridStaRes.Columns[2].Title.Caption := 'ชื่อหนังสือ';
       DbGridStaRes.Columns[3].Title.Caption := 'วันที่ยืม';
       DbGridStaRes.Columns[4].Title.Caption := 'วันที่คืน';
       DbGridStaRes.Columns[5].Title.Caption := 'รหัสผู้ยืม';
end;

procedure TserviceForm.showdbgridcancelres();
begin
	with Databasemd.Query14 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from overreserve');
       Open;
   end;

   	 DBGridcancelres.Columns[0].Title.Caption := 'รหัสผู้จอง';
       DBGridcancelres.Columns[1].Title.Caption := 'รหัสหนังสือ';
       DBGridcancelres.Columns[2].Title.Caption := 'วันที่จอง';
       DBGridcancelres.Columns[3].Title.Caption := 'วันหมดอายุการจอง';

end;

procedure Tserviceform.EditBorrowStdIdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  	memid := EditBorrowStdId.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from student where id_mem = "'+memid+'"');
       Open;
   end;

  	with Databasemd.DataSource1.DataSet do
   begin
   		EditBorrowStdName.Text := FieldByname('name').AsString +'   '+ FieldByname('lastname').AsString;
         flagmem := FieldByname('flag_mem').AsString;
         numbook := FieldByname('num_book').AsInteger;
         nummag := FieldByname('num_mag').AsInteger;
   end;

  	if flagmem = '0' then
   begin
      	showmessage('ยังไม่ได้ต่ออายุสมาชิก');
         read;
         exit;
   end;

   showdbgridstdborrow(memid);
end;

procedure Tserviceform.EditBorrowStdBidKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	sid := EditBorrowStdBid.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+sid+'"');
       Open;
   end;

   if Databasemd.DataSource1.DataSet.IsEmpty then
   begin
   	with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from magazine where serialno = "'+sid+'"');
       Open;
   	end;

      // found in magazine
      borm := 2;
      with Databasemd.DataSource1.DataSet do
      begin
      	cn := FieldByname('call_no').AsString;
         flag_lib := FieldByname('flag_lib').AsString;
      end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select name from magazine_title where call_no = "'+cn+'"');
       Open;
   	end;

      EditBorrowStdBname.Text := Databasemd.DataSource1.DataSet.FieldByname('name').AsString;

   end
   else
   begin
      //found in book
      borm := 1;
      with Databasemd.DataSource1.DataSet do
      begin
      	cn := FieldByname('call_no').AsString;
         flag_lib := FieldByname('flag_lib').AsString;
      end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select name from book_title where call_no = "'+cn+'"');
       Open;
   	end;

      EditBorrowStdBname.Text := Databasemd.DataSource1.DataSet.FieldByname('name').AsString;
   end;

end;

procedure Tserviceform.ButtonBorrowStdOKClick(Sender: TObject);
var stubnumday,stumnumday,stubnum,stumnum : integer;
	 due_date,idmemhold : string;
begin
	if (memid = '') or (sid = '') then
   	showmessage('กรุณาใส่รหัสสมาชิกและรหัสสิ่งพิมพ์')
   else if flag_lib = '1' then
		showmessage('ไม่สามารถยืมได้ ถูกยืมอยู่')
   else
   begin
		if borm = 1 then	//borrow book
  		begin
   		with Databasemd.Query1 do
   		begin
      		Close;
      		SQL.Clear;
      		SQL.Add('Select * from rule where name = "StuBook_NoBorrow"');
      		Open;
   		end;
   		stubnum := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

   		with Databasemd.Query1 do
   		begin
      		Close;
      		SQL.Clear;
      		SQL.Add('Select * from rule where name = "StuBook_NoBorrowDay"');
      		Open;
   		end;
   		stubnumday := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

      	with Databasemd.Query1 do
   		begin
      		Close;
      		SQL.Clear;
      		SQL.Add('Select id_mem_hold from circulation where id_mem_hold = "'+memid+'" and serialno = "'+sid+'"');
      		Open;
   		end;
   		idmemhold := Databasemd.DataSource1.DataSet.FieldByname('id_mem_hold').Asstring;

      	due_date := datetostr(Date+stubnumday);

      	if idmemhold <> '' then
      	begin
         	if idmemhold = memid then
         	begin
         		with Databasemd.Query1 do
    				begin
       				Close;
       				SQL.Clear;
       				SQL.Add('execute procedure std_borrow_resbook(');
       				SQL.Add(''+chr(39)+idmemhold+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+')');
       				ExecSQL;
         		end;
         	end
         	else showmessage('ไม่สามารถยืมได้ เพราะมีคนจองแล้ว');
      	end
			else if numbook >= stubnum then
      		showmessage('ไม่สามารถยืมได้ ยืมเกินจำนวน')
      	else
      	begin
      		//can borrow
         	numbook := numbook+1;
         	with Databasemd.Query1 do
    			begin
       			Close;
       			SQL.Clear;
       			SQL.Add('execute procedure std_borrow_book(');
       			SQL.Add(''+chr(39)+memid+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+','+
                   inttostr(numbook)+')');
       			ExecSQL;
         	end;
      	end;
   	end
   	else if borm = 2 then //borrow mag
   	begin
   		with Databasemd.Query1 do
         begin
      		Close;
      		SQL.Clear;
      		SQL.Add('Select * from rule where name = "StuMag_NoBorrow"');
      		Open;
   		end;
   		stumnum := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

   		with Databasemd.Query1 do
   		begin
      		Close;
      		SQL.Clear;
      		SQL.Add('Select * from rule where name = "StuMag_NoBorrowDay"');
      		Open;
   		end;
   		stumnumday := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

      	if nummag >= stumnum then
      		showmessage('ไม่สามารถยืมวารสารได้ ยืมเกินจำนวน')
      	else
      	begin
      	//can borrow
         	due_date := datetostr(Date+stubnumday);
         	nummag := nummag+1;
         	with Databasemd.Query1 do
    			begin
       			Close;
       			SQL.Clear;
       			SQL.Add('execute procedure std_borrow_mag(');
       			SQL.Add(''+chr(39)+memid+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+','+
                   inttostr(nummag)+')');
       			ExecSQL;
         	end;
      	end;
   	end;
   	showdbgridstdborrow(memid);
      EditBorrowStdBid.Text := '';
      EditBorrowStdBname.Text := '';
   end;
end;

procedure Tserviceform.ButtonBorrowStdCancelClick(Sender: TObject);
begin
	EditBorrowStdId.Clear;
   EditBorrowStdName.Clear;
   EditBorrowStdBid.Clear;
   EditBorrowStdBname.Clear;
   databasemd.Query3.Close;
	databasemd.Query2.Close;
end;

procedure Tserviceform.EditBorrowStaMemidKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  	memid := EditBorrowStaMemid.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from staff where id_mem = "'+memid+'"');
       Open;
   end;

  	with Databasemd.DataSource1.DataSet do
   begin
   		EditBorrowStaMemName.Text := FieldByname('name').AsString +'   '+ FieldByname('lastname').AsString;
         flagmem := FieldByname('flag_mem').AsString;
         numbook := FieldByname('num_book').AsInteger;
         nummag := FieldByname('num_mag').AsInteger;
   end;

  	if flagmem = '0' then
   begin
      	showmessage('ยังไม่ได้ต่ออายุสมาชิก');
         read;
         exit;
   end;

   showdbgridstaborrow(memid);
end;

procedure Tserviceform.EditBorrowStaSerialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

	sid := EditBorrowStaSerial.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+sid+'"');
       Open;
   end;

   if Databasemd.DataSource1.DataSet.IsEmpty then
   begin
   	with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from magazine where serialno = "'+sid+'"');
       Open;
   	end;

      // found in magazine
      borm := 2;
      with Databasemd.DataSource1.DataSet do
      begin
      	cn := FieldByname('call_no').AsString;
         flag_lib := FieldByname('flag_lib').AsString;
      end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select name from magazine_title where call_no = "'+cn+'"');
       Open;
   	end;

      EditBorrowStaBname.Text := Databasemd.DataSource1.DataSet.FieldByname('name').AsString;

   end
   else
   begin
      //found in book
      borm := 1;
      with Databasemd.DataSource1.DataSet do
      begin
      	cn := FieldByname('call_no').AsString;
         flag_lib := FieldByname('flag_lib').AsString;
      end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select name from book_title where call_no = "'+cn+'"');
       Open;
   	end;

      EditBorrowStaBname.Text := Databasemd.DataSource1.DataSet.FieldByname('name').AsString;
   end;
end;

procedure Tserviceform.ButtonBorrowStaOKClick(Sender: TObject);
var stabnumday,stamnumday,stabnum,stamnum : integer;
	 due_date,idmemhold : string;
begin
	if (memid = '') or (sid = '') then
   	showmessage('กรุณาใส่รหัสสมาชิกและรหัสสิ่งพิมพ์')
   else if flag_lib = '1' then
		showmessage('ไม่สามารถยืมได้ ถูกยืมอยู่')
   else
   begin
	if borm = 1 then	//borrow book
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaBook_NoBorrow"');
      	Open;
   	end;
   	stabnum := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaBook_NoBorrowDay"');
      	Open;
   	end;
   	stabnumday := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select id_mem_hold from circulation where serialno = "'+sid+'"');
      	Open;
   	end;
   	idmemhold := Databasemd.DataSource1.DataSet.FieldByname('id_mem_hold').Asstring;

      due_date := datetostr(Date+stabnumday);

      if idmemhold <> null then
      begin
         if idmemhold = memid then
         begin
         	with Databasemd.Query1 do
    			begin
       			Close;
       			SQL.Clear;
       			SQL.Add('execute procedure sta_borrow_resbook(');
       			SQL.Add(''+chr(39)+idmemhold+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+')');
       			ExecSQL;
         	end;
         end
         else showmessage('ไม่สามารถยืมได้ เพราะมีคนจองแล้ว');
      end
		else if numbook >= stabnum then
      	showmessage('ไม่สามารถยืมได้ ยืมเกินจำนวน')
      else
      begin
      	//can borrow
         numbook := numbook+1;
         with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure sta_borrow_book(');
       		SQL.Add(''+chr(39)+memid+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+','+
                   inttostr(numbook)+')');
       		ExecSQL;
         end;
      end;
   end
   else if borm = 2 then //borrow mag
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaMag_NoBorrow"');
      	Open;
   	end;
   	stamnum := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaMag_NoBorrowDay"');
      	Open;
   	end;
   	stamnumday := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

      if nummag >= stamnum then
      	showmessage('ไม่สามารถยืมวารสารได้ ยืมเกินจำนวน')
      else
      begin
      	//can borrow
         due_date := datetostr(Date+stabnumday);
         nummag := nummag+1;
         with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure sta_borrow_mag(');
       		SQL.Add(''+chr(39)+memid+chr(39)+','+
       			    chr(39)+sid+chr(39)+','+
                   chr(39)+datetostr(Date)+chr(39)+','+
                   chr(39)+due_date+chr(39)+','+
                   inttostr(nummag)+')');
       		ExecSQL;
         end;
      end;
   end;
   showdbgridstaborrow(memid);
	EditBorrowStaSerial.text := '';
   EditBorrowStaBname.text := '';
   end;
end;

//------------------------- RETURN --------------------------------

procedure Tserviceform.EditRetStuSerialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
	retStuSerial := EditRetStuSerial.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+retStuSerial+'"');
       Open;
   end;
   if Databasemd.DataSource1.DataSet.IsEmpty then
   begin
   	with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from magazine where serialno = "'+retStuSerial+'"');
       Open;
   	end;

      if Databasemd.DataSource1.DataSet.IsEmpty then retStuid := '';

      // found in magazine
      Retborm := 2;
      with Databasemd.DataSource1.DataSet do
   	begin
         retMagcn := FieldByname('call_no').AsString;
         retMagflaglib := FieldByname('flag_lib').AsString;
   	end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select c.due_date,stu.num_mag,mt.name,stu.id_mem,stu.name as stname,stu.lastname from student stu,circulation c,magazine_title mt where mt.call_no = "'+retMagcn+'" and c.id_mem = stu.id_mem and c.serialno = "'+retStuSerial+'"');
       Open;
   	end;
      with Databasemd.DataSource1.DataSet do
   	begin
      	duedate := FieldByname('due_date').AsString;
      	retNumM := FieldByname('num_mag').Asinteger;
         EditRetStuBname.Text := FieldByname('name').AsString;
         retStuid := FieldByname('id_mem').AsString;
         EditRetStuName.text := FieldByname('stname').asString +'   '+FieldByname('lastname').asString;
   	end;
      EditRetStuMemid.Text := retStuid;
   end
   else
   begin
   	// found in book
      Retborm := 1;
      with Databasemd.DataSource1.DataSet do
   	begin
         retBookcn := FieldByname('call_no').AsString;
         retBookflaglib := FieldByname('flag_lib').AsString;
   	end;
      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select stu.num_book,c.due_date,c.id_mem_hold,bt.name,stu.id_mem,stu.name as stname,stu.lastname from student stu,circulation c,book_title bt where bt.call_no = "'+retBookcn+'" and c.id_mem = stu.id_mem and c.serialno = "'+retStuSerial+'"');
       Open;
   	end;
      with Databasemd.DataSource1.DataSet do
   	begin
      	retNumB := FieldByname('num_book').Asinteger;
      	duedate := FieldByname('due_date').AsString;
      	retidmemhold := FieldByname('id_mem_hold').AsString;
         EditRetStuBname.Text := FieldByname('name').AsString;
         retStuid := FieldByname('id_mem').AsString;
         EditRetStuName.text := FieldByname('stname').asString +'   '+FieldByname('lastname').asString;
   	end;
      EditRetStuMemid.Text := retStuid;
   end;
   showdbgridsturet(retStuid);

end;

procedure Tserviceform.ButtonRetStuCancelClick(Sender: TObject);
begin
	EditRetStuSerial.Clear;
   EditRetStuBname.Clear;
   EditRetStuMemid.Clear;
   EditRetStuName.Clear;
   databasemd.Query6.Close;
	databasemd.Query7.Close;
end;

procedure Tserviceform.ButtonBorrowStaCancelClick(Sender: TObject);
begin
	EditBorrowStaMemid.Clear;
   EditBorrowStaMemName.Clear;
   EditBorrowStaSerial.Clear;
   EditBorrowStaBname.Clear;
   databasemd.Query4.Close;
	databasemd.Query5.Close;
end;

procedure Tserviceform.ButtonRetStuOKClick(Sender: TObject);
var stubfee,stumfee,n : integer;
	 d,m,y : string;
    Year1, Month1, Day1,
    Year2, Month2, Day2,
	 YearResult, MonthResult, DayResult: Word;
    TDay1, TDay2,DateDiff: TDateTime;

begin
 
	if (retStuSerial = '') then
   	showmessage('กรุณาใส่เลขทะเบียนสิ่งพิมพ์')
   else
   begin
	if Retborm = 1 then	//return book
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StuBook_Fee"');
      	Open;
   	end;
   	stubfee := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      //cal fee

      day1 := dayof(date); month1 := monthof(date); year1 := yearof(date);
		day2 := dayof(strtodate(duedate)); month2 := monthof(strtodate(duedate)); year2 := yearof(strtodate(duedate));
		TDay1 := EncodeDate(Year1, Month1, Day1);
    	TDay2 := EncodeDate(Year2, Month2, Day2);
      DateDiff := TDay1 - TDay2;
      DecodeDate(DateDiff, YearResult, MonthResult, DayResult);


      if date > strtodate(duedate) then
      begin
         EditRetStuFee.Text := inttostr(stubfee * (DayResult+1+(MonthResult-1)*30+(YearResult-1900)*365));
      end
      else EditRetStuFee.Text := '0';

      retNumB := retNumB-1;
      if retBookflaglib = '2' then  // Borrow + Reserve
      begin
         with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure stu_ret_book(');
       		SQL.Add(''+chr(39)+'2'+chr(39)+','+
       			    chr(39)+retStuid+chr(39)+','+
                   chr(39)+retStuSerial+chr(39)+','+
                   inttostr(retNumB)+')');
       		ExecSQL;
         end;
      end
      else
      begin
        	with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure stu_ret_book(');
       		SQL.Add(''+chr(39)+'1'+chr(39)+','+
       			    chr(39)+retStuid+chr(39)+','+
                   chr(39)+retStuSerial+chr(39)+','+
                   inttostr(retNumB)+')');
       		ExecSQL;
         end;
      end;
   end
   else if Retborm = 2 then //return mag
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StuMag_Fee"');
      	Open;
   	end;
   	stumfee := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      //cal fee

      day1 := dayof(date); month1 := monthof(date); year1 := yearof(date);
		day2 := dayof(strtodate(duedate)); month2 := monthof(strtodate(duedate)); year2 := yearof(strtodate(duedate));
		TDay1 := EncodeDate(Year1, Month1, Day1);
    	TDay2 := EncodeDate(Year2, Month2, Day2);
      DateDiff := TDay1 - TDay2;
      DecodeDate(DateDiff, YearResult, MonthResult, DayResult);


      if date > strtodate(duedate) then
      begin
         EditRetStuFee.Text := inttostr(stumfee * (DayResult+1+(MonthResult-1)*30+(YearResult-1900)*365));
      end
      else EditRetStuFee.Text := '0';

      retNumM := retNumM-1;
      with Databasemd.Query1 do
      begin
      	Close;
         SQL.Clear;
         SQL.Add('execute procedure stu_ret_mag(');
         SQL.Add(''+chr(39)+retStuid+chr(39)+','+
            chr(39)+retStuSerial+chr(39)+','+
            inttostr(retNumM)+')');
         ExecSQL;
      end;
   end;
   showdbgridsturet(retStuid);
   end;

end;

procedure Tserviceform.EditRetStaSerialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	retStaSerial := EditRetStaSerial.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+retStaSerial+'"');
       Open;
   end;
   if Databasemd.DataSource1.DataSet.IsEmpty then
   begin
   	with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from magazine where serialno = "'+retStaSerial+'"');
       Open;
   	end;

      if Databasemd.DataSource1.DataSet.IsEmpty then retStaid := '';

      // found in magazine
      Retborm := 2;
      with Databasemd.DataSource1.DataSet do
   	begin
         retMagcn := FieldByname('call_no').AsString;
         retMagflaglib := FieldByname('flag_lib').AsString;
   	end;

      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select c.due_date,sta.num_mag,mt.name,sta.id_mem,sta.name as stname,sta.lastname from staff sta,circulation c,magazine_title mt where mt.call_no = "'+retMagcn+'" and c.id_mem = sta.id_mem and c.serialno = "'+retStaSerial+'"');
       Open;
   	end;
      with Databasemd.DataSource1.DataSet do
   	begin
      	duedate := FieldByname('due_date').AsString;
      	retNumM := FieldByname('num_mag').Asinteger;
         EditRetStaBname.Text := FieldByname('name').AsString;
         retStaid := FieldByname('id_mem').AsString;
         EditRetStaName.text := FieldByname('stname').asString +'   '+FieldByname('lastname').asString;
   	end;
      EditRetStaMemid.Text := retStaid;
   end
   else
   begin
   	// found in book
      Retborm := 1;
      with Databasemd.DataSource1.DataSet do
   	begin
         retBookcn := FieldByname('call_no').AsString;
         retBookflaglib := FieldByname('flag_lib').AsString;
   	end;
      with Databasemd.Query1 do
   	begin
       Close;
       SQL.Clear;
       SQL.Add('Select sta.num_book,c.due_date,c.id_mem_hold,bt.name,sta.id_mem,sta.name as stname,sta.lastname from staff sta,circulation c,book_title bt where bt.call_no = "'+retBookcn+'" and c.id_mem = sta.id_mem and c.serialno = "'+retStaSerial+'"');
       Open;
   	end;
      with Databasemd.DataSource1.DataSet do
   	begin
      	retNumB := FieldByname('num_book').Asinteger;
      	duedate := FieldByname('due_date').AsString;
      	retidmemhold := FieldByname('id_mem_hold').AsString;
         EditRetStaBname.Text := FieldByname('name').AsString;
         retStaid := FieldByname('id_mem').AsString;
         EditRetStaName.text := FieldByname('stname').asString +'   '+FieldByname('lastname').asString;
   	end;
      EditRetStaMemid.Text := retStaid;
   end;
   showdbgridstaret(retStaid);
end;

procedure Tserviceform.ButtonRetStaCancelClick(Sender: TObject);
begin
	EditRetStaSerial.Clear;
   EditRetStaBname.Clear;
   EditRetStaMemid.Clear;
   EditRetStaName.Clear;
   databasemd.Query8.Close;
	databasemd.Query9.Close;
end;

procedure Tserviceform.ButtonRetStaOKClick(Sender: TObject);
var stabfee,stamfee,n : integer;
	 d,m,y : string;
    Year1, Month1, Day1,
    Year2, Month2, Day2,
	 YearResult, MonthResult, DayResult: Word;
    TDay1, TDay2,DateDiff: TDateTime;

begin
   YearResult := 0;
   MonthResult := 0;
   DayResult := 0;

	if (retStaSerial = '') then
   	showmessage('กรุณาใส่เลขทะเบียนสิ่งพิมพ์')
   else
   begin
	if Retborm = 1 then	//return book
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaBook_Fee"');
      	Open;
   	end;
   	stabfee := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      //cal fee

      day1 := dayof(date); month1 := monthof(date); year1 := yearof(date);
		day2 := dayof(strtodate(duedate)); month2 := monthof(strtodate(duedate)); year2 := yearof(strtodate(duedate));
		TDay1 := EncodeDate(Year1, Month1, Day1);
    	TDay2 := EncodeDate(Year2, Month2, Day2);
      DateDiff := TDay1 - TDay2;
      DecodeDate(DateDiff, YearResult, MonthResult, DayResult);


      if date > strtodate(duedate) then
      begin
         EditRetStaFee.Text := inttostr(stabfee * (DayResult+1+(MonthResult-1)*30+(YearResult-1900)*365));
      end
      else EditRetStaFee.Text := '0';

      retNumB := retNumB-1;
      if retBookflaglib = '2' then  // Borrow + Reserve
      begin
         with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure sta_ret_book(');
       		SQL.Add(''+chr(39)+'2'+chr(39)+','+
       			    chr(39)+retStaid+chr(39)+','+
                   chr(39)+retStaSerial+chr(39)+','+
                   inttostr(retNumB)+')');
       		ExecSQL;
         end;
      end
      else
      begin
        	with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure sta_ret_book(');
       		SQL.Add(''+chr(39)+'1'+chr(39)+','+
       			    chr(39)+retStaid+chr(39)+','+
                   chr(39)+retStaSerial+chr(39)+','+
                   inttostr(retNumB)+')');
       		ExecSQL;
         end;
      end;
   end
   else if Retborm = 2 then //return mag
   begin
   	with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaMag_Fee"');
      	Open;
   	end;
   	stamfee := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      //cal fee

      day1 := dayof(date); month1 := monthof(date); year1 := yearof(date);
		day2 := dayof(strtodate(duedate)); month2 := monthof(strtodate(duedate)); year2 := yearof(strtodate(duedate));
		TDay1 := EncodeDate(Year1, Month1, Day1);
    	TDay2 := EncodeDate(Year2, Month2, Day2);
      DateDiff := TDay1 - TDay2;
      DecodeDate(DateDiff, YearResult, MonthResult, DayResult);


      if date > strtodate(duedate) then
      begin
         EditRetStaFee.Text := inttostr(stamfee * (DayResult+1+(MonthResult-1)*30+(YearResult-1900)*365));
      end
      else EditRetStaFee.Text := '0';

      retNumM := retNumM-1;
      with Databasemd.Query1 do
      begin
      	Close;
         SQL.Clear;
         SQL.Add('execute procedure sta_ret_mag(');
         SQL.Add(''+chr(39)+retStaid+chr(39)+','+
            chr(39)+retStaSerial+chr(39)+','+
            inttostr(retNumM)+')');
         ExecSQL;
      end;
   end;
   showdbgridstaret(retStaid);
   end;
end;

procedure Tserviceform.EditResStuMemidKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  	resStuid := EditResStuMemid.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from student where id_mem = "'+resStuid+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
   		EditResStuName.Text := FieldByname('name').AsString +'   '+ FieldByname('lastname').AsString;
         flagmem := FieldByname('flag_mem').AsString;
         resNumB := FieldByname('num_book').AsInteger;
   end;
  	if flagmem = '0' then
   begin
      	showmessage('ยังไม่ได้ต่ออายุสมาชิก');
         read;
         exit;
   end;
   showdbgridstures(resStuid);
end;

procedure Tserviceform.EditResStuSerialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	resStuSerial := EditResStuSerial.Text;
   resflaglib := '';
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+resStuSerial+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
       rescn := FieldByname('call_no').asString;
       resflaglib := FieldByname('flag_lib').asString;
   end;
   if resflaglib = '0' then
   begin
   	showmessage('หนังสือเล่มนี้ไม่ได้ถูกยืม');
   end
   else if (resflaglib = '2') and (resflaglib = '3') then
   begin
   	showmessage('หนังสือเล่มนี้ถูกจองแล้ว');
   end
   else if resflaglib = '1' then
   begin
   end;

   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select bt.name from book b,book_title bt,circulation c where c.serialno = "'+resStuSerial+'" and b.flag_lib = "1" and c.serialno=b.serialno and b.call_no=bt.call_no and c.id_mem <>"'+resStuid+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
 		EditResStuBname.Text := FieldByname('name').AsString;
   end;
end;

procedure Tserviceform.ButtonResStuCancelClick(Sender: TObject);
begin
	EditResStuMemid.Clear;
   EditResStuName.Clear;
   EditResStuSerial.Clear;
   EditResStuBname.Clear;
   databasemd.Query10.Close;
	databasemd.Query11.Close;
end;

procedure Tserviceform.ButtonResStuOKClick(Sender: TObject);
var stuNumB : integer;
	Bid,Sid : string;
begin
	if (resStuid='') and (resStuSerial='') then
   	showmessage('กรุณาใส่รหัสสมาชิกและ เลขทะเบียนหนังสือ')
   else
   begin
		with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StuBook_NoBorrow"');
      	Open;
   	end;
   	stuNumB := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      if stuNumB > resNumB then
      begin
      	with Databasemd.Query1 do
   		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('Select c.serialno,c.id_mem from book b,book_title bt,circulation c where c.serialno = "'+resStuSerial+'" and b.flag_lib = "1" and c.serialno=b.serialno and b.call_no=bt.call_no and c.id_mem <>"'+resStuid+'"');
       		Open;
   		end;
  			with Databasemd.DataSource1.DataSet do
   		begin
 				Sid := FieldByname('serialno').AsString;
            Bid := FieldByname('id_mem').AsString;
   		end;
         resNumB := resNumB + 1;
         with Databasemd.Query1 do
         begin
      		Close;
         	SQL.Clear;
         	SQL.Add('execute procedure stu_res_book(');
         	SQL.Add(''+chr(39)+resStuid+chr(39)+','+
            	chr(39)+Sid+chr(39)+','+
               chr(39)+Bid+chr(39)+','+
            	inttostr(resNumB)+')');
         	ExecSQL;
      	end;
      end
      else showmessage('ไม่สามารถจองหนังสือได้อีก');
   end;
   showdbgridstures(resStuid);
   EditResStuSerial.text:='';
   EditResStuBname.text:='';
end;

procedure Tserviceform.EditResStaMemidKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  	resStaid := EditResStaMemid.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from staff where id_mem = "'+resStaid+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
   		EditResStaName.Text := FieldByname('name').AsString +'   '+ FieldByname('lastname').AsString;
         flagmem := FieldByname('flag_mem').AsString;
         resNumB := FieldByname('num_book').AsInteger;
   end;
  	if flagmem = '0' then
   begin
      	showmessage('ยังไม่ได้ต่ออายุสมาชิก');
         read;
         exit;
   end;
   showdbgridstares(resStaid);
end;

procedure Tserviceform.EditResStaSerialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	resStaSerial := EditResStaSerial.Text;
   resflaglib := '';
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from book where serialno = "'+resStaSerial+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
       rescn := FieldByname('call_no').asString;
       resflaglib := FieldByname('flag_lib').asString;
   end;
   if resflaglib = '0' then
   begin
   	showmessage('หนังสือเล่มนี้ไม่ได้ถูกยืม');
   end
   else if (resflaglib = '2') and (resflaglib = '3') then
   begin
   	showmessage('หนังสือเล่มนี้ถูกจองแล้ว');
   end
   else if resflaglib = '1' then
   begin
   end;

   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select bt.name from book b,book_title bt,circulation c where c.serialno = "'+resStaSerial+'" and b.flag_lib = "1" and c.serialno=b.serialno and b.call_no=bt.call_no and c.id_mem <>"'+resStaid+'"');
       Open;
   end;
  	with Databasemd.DataSource1.DataSet do
   begin
 		EditResStaBname.Text := FieldByname('name').AsString;
   end;

end;

procedure Tserviceform.ButtonResStaCancelClick(Sender: TObject);
begin
	EditResStaMemid.Clear;
   EditResStaName.Clear;
   EditResStaSerial.Clear;
   EditResStaBname.Clear;
   databasemd.Query12.Close;
	databasemd.Query13.Close;
end;

procedure Tserviceform.ButtonResStaOKClick(Sender: TObject);
var staNumB : integer;
	Bid,Sid : string;
begin
	if (resStaid='') and (resStaSerial='') then
   	showmessage('กรุณาใส่รหัสสมาชิกและ เลขทะเบียนหนังสือ')
   else
   begin
		with Databasemd.Query1 do
   	begin
      	Close;
      	SQL.Clear;
      	SQL.Add('Select * from rule where name = "StaBook_NoBorrow"');
      	Open;
   	end;
   	staNumB := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;
      if staNumB > resNumB then
      begin
      	with Databasemd.Query1 do
   		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('Select c.serialno,c.id_mem from book b,book_title bt,circulation c where c.serialno = "'+resStaSerial+'" and b.flag_lib = "1" and c.serialno=b.serialno and b.call_no=bt.call_no and c.id_mem <>"'+resStaid+'"');
       		Open;
   		end;
  			with Databasemd.DataSource1.DataSet do
   		begin
 				Sid := FieldByname('serialno').AsString;
            Bid := FieldByname('id_mem').AsString;
   		end;
         resNumB := resNumB + 1;
         with Databasemd.Query1 do
         begin
      		Close;
         	SQL.Clear;
         	SQL.Add('execute procedure sta_res_book(');
         	SQL.Add(''+chr(39)+resStaid+chr(39)+','+
            	chr(39)+Sid+chr(39)+','+
               chr(39)+Bid+chr(39)+','+
            	inttostr(resNumB)+')');
         	ExecSQL;
      	end;
      end
      else showmessage('ไม่สามารถจองหนังสือได้อีก');
   end;
   showdbgridstares(resStaid);
   EditResStaSerial.text := '';
	EditResStaBname.Text := '';
end;

procedure Tserviceform.viewcancelresClick(Sender: TObject);
var stdbnrd,stabnrd,conmem,rc : integer;
  	 memid,sid,resdate,duedate : string;
    canceldate : Tdate;
begin
	with Databasemd.Query1 do
   begin
   	Close;
     	SQL.Clear;
     	SQL.Add('delete from overreserve');
     	ExecSQL;
   end;

	with Databasemd.Query1 do
   begin
   	Close;
     	SQL.Clear;
     	SQL.Add('select * from rule where name = "StuBook_NoReserveDay"');
     	Open;
   end;
	stdbnrd := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

	with Databasemd.Query1 do
   begin
   	Close;
     	SQL.Clear;
     	SQL.Add('select * from rule where name = "StaBook_NoReserveDay"');
     	Open;
   end;
	stabnrd := Databasemd.DataSource1.DataSet.FieldByname('detail').AsInteger;

   with Databasemd.Query1 do
   begin
   	Close;
     	SQL.Clear;
     	SQL.Add('select * from circulation where id_mem_hold is not null');
     	Open;
   end;

   if not Databasemd.Query1.Eof then
   begin
   	while not Databasemd.Query1.Eof do
      begin
      	duedate := Databasemd.DataSource1.DataSet.FieldByname('due_date').Asstring;
         memid := Databasemd.DataSource1.DataSet.FieldByname('id_mem_hold').Asstring;
         sid := Databasemd.DataSource1.DataSet.FieldByname('serialno').Asstring;
         rc := Databasemd.Query1.RecordCount;
         with Databasemd.Query15 do
   		begin
   			Close;
     			SQL.Clear;
     			SQL.Add('select * from student where id_mem = "'+memid+'"');
     			Open;
   		end;
         if not Databasemd.Query15.Eof then conmem := 1 //found in student
         else conmem := 2;  // found in staff

         if conmem = 1 then
         begin
         	//student
            canceldate := strtodate(duedate)+stdbnrd;
            if canceldate < date then
            begin
            	//overreserve
               with Databasemd.Query15 do
   				begin
   					Close;
     					SQL.Clear;
     					SQL.Add('execute procedure over_reserve("'+memid+'","'+sid+'","'+duedate+'","'+datetostr(canceldate)+'")');
     					ExecSQL;
   				end;

            end;
         end
         else
			begin
         	//staff
            canceldate := strtodate(duedate)+stabnrd;
            if canceldate < date then
            begin
            	//overreserve
               with Databasemd.Query15 do
   				begin
   					Close;
     					SQL.Clear;
     					SQL.Add('execute procedure over_reserve("'+memid+'","'+sid+'","'+duedate+'","'+datetostr(canceldate)+'")');
     					ExecSQL;
   				end;
            end;
         end;
         Databasemd.Query1.Next;
      end;
   end;
	showdbgridcancelres();
end;

procedure Tserviceform.cancelresClick(Sender: TObject);
begin
	databasemd.Query14.Close;
   Editcancelresbid.Clear;
   Editcancelresbname.Clear;
   Editcancelresmemid.Clear;
   Editcancelresmemname.Clear;
end;

procedure Tserviceform.EditcancelresbidKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var rescallno,resbname,resmemname : string;
begin
	resSerial := Editcancelresbid.Text;
   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select bt.name as bname,c.id_mem,b.call_no,flag_cir,c.id_mem_hold from circulation c ,book_title bt,book b where c.serialno = "'+resSerial+'" and b.serialno = c.serialno and b.call_no = bt.call_no');
       Open;
   end;

	with Databasemd.DataSource1.DataSet do
   begin
      resbname := FieldByname('bname').Asstring;
      rescallno := FieldByname('call_no').Asstring;
		residmem := FieldByname('id_mem').Asstring;
      resflagcir := FieldByname('flag_cir').Asstring;
      residmemhold := FieldByname('id_mem_hold').Asstring;
   end;

   with Databasemd.Query1 do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select name,lastname from student where id_mem = "'+residmemhold+'"');
       Open;
   end;
   if Databasemd.DataSource1.DataSet.IsEmpty then
   begin
   	//staff
   	std_sta := 2;
      with Databasemd.Query1 do
   	begin
       	Close;
       	SQL.Clear;
       	SQL.Add('Select name,lastname from staff where id_mem = "'+residmemhold+'"');
       	Open;
   	end;
      resmemname := Databasemd.DataSource1.DataSet.fieldByname('name').AsString+'  '+Databasemd.DataSource1.DataSet.fieldByname('lastname').AsString;
   end
   else
   begin
     	//student
      std_sta := 1;
      resmemname := Databasemd.DataSource1.DataSet.fieldByname('name').AsString+'  '+Databasemd.DataSource1.DataSet.fieldByname('lastname').AsString;

   end;
   Editcancelresbname.Text := resbname;
   Editcancelresmemid.Text := residmemhold;
   Editcancelresmemname.Text := resmemname;



end;

procedure Tserviceform.okcancelresClick(Sender: TObject);
begin
	if resSerial = '' then
   	showmessage('กรุณาใส่รหัสหนังสือ')
   else
   begin
   	if std_sta = 1 then
      begin
          //student
          if resflagcir = '0' then
          begin
          	//overreserve not return yet
            with Databasemd.Query1 do
   			begin
   				Close;
     				SQL.Clear;
     				SQL.Add('execute procedure std_overres1("'+residmemhold+'","'+resserial+'","'+residmem+'")');
     				ExecSQL;
   			end;
          end
          else
          begin
				//overreserve return already
            with Databasemd.Query1 do
   			begin
   				Close;
     				SQL.Clear;
     				SQL.Add('execute procedure std_overres2("'+residmemhold+'","'+resserial+'","'+residmem+'")');
     				ExecSQL;
   			end;
          end;
      end
      else
      begin
      	//staff
         if resflagcir = '0' then
          begin
          	//overreserve not return yet
            with Databasemd.Query1 do
   			begin
   				Close;
     				SQL.Clear;
     				SQL.Add('execute procedure sta_overres1("'+residmemhold+'","'+resserial+'","'+residmem+'")');
     				ExecSQL;
   			end;
          end
          else
          begin
				//overreserve return already
            with Databasemd.Query1 do
   			begin
   				Close;
     				SQL.Clear;
     				SQL.Add('execute procedure sta_overres2("'+residmemhold+'","'+resserial+'","'+residmem+'")');
     				ExecSQL;
   			end;
          end;

      end;
   showdbgridcancelres();
   end;
end;

end.


