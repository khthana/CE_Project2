unit classmodule;

interface

uses
  SysUtils, Classes,Dialogs;
type
  Tclassmd = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Tmember = class
  public
  		procedure apply_member(const id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph : string); overload; virtual;
      procedure edit_member(const id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph : string); overload; virtual;
  end;

  Tstudent = class(Tmember)
  public
  		procedure retrivedb(const id : string); virtual;
      procedure retriveaddr(const id : string); virtual;
  		procedure apply_member(const id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,expi,cla : string); reintroduce; overload;
      procedure edit_member(const id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,cla : string); reintroduce; overload;
      procedure delete_member(const id : string); virtual;
  end;

  Tstaff = class(Tmember)
  public
  		procedure retrivedb(const id : string); virtual;
      procedure retriveaddr(const id : string); virtual;
      procedure delete_member(const id : string); virtual;
  end;

  Tlibrary_item = class
  public
  		procedure retrivedb(); overload; virtual; abstract;
      procedure apply_library(); overload; virtual; abstract;
      procedure edit_library(); overload; virtual; abstract;
		procedure delete_library(); overload; virtual; abstract;
  end;

  Tbook = class(Tlibrary_item)
  public
  		procedure retrivedb(const sid : string); reintroduce;
      procedure apply_library(const sid,call_no,isbn,name1,edition,publish,recieve_date,page_num,a1,a2,a3 : string); reintroduce;
      procedure edit_library(const callno,isbn1,nam,a1,a2,a3,edi,pub,rdate,pnum : string); reintroduce;
      procedure delete_library(const sid,callno : string); reintroduce;
  end;

  Tmag =  class(Tlibrary_item)
  public
 		procedure retrivedb(const sid : string); reintroduce;
      procedure apply_library(const sid,callno,issn1,nam,yrs,vol1,no1,pub,rdate,pnum : string); reintroduce;
		procedure edit_library(const callno,issn1,nam,yrs,vol1,no1,pub,rdate,pnum : string); reintroduce;
      procedure delete_library(const sid,callno : string); reintroduce;
  end;



var
  classmd: Tclassmd;

implementation

uses module;
{$R *.dfm}

//---------------------Class Member----------------------------------//

procedure Tstudent.retrivedb(const id : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from student where id_mem = "'+id+'"');
       Open;
    end;
end;

procedure Tstaff.retrivedb(const id : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('Select * from staff where id_mem = "'+id+'"');
       Open;
    end;
end;

procedure Tstudent.retriveaddr(const id : string);
begin
   with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('Delete from addrresult');
      ExecSQL;

      SQL.Clear;
      SQL.Add('execute procedure retrive_addr_std('+chr(39)+id+chr(39)+')');
   	ExecSQL;

      SQL.Clear;
      SQL.Add('Select * from addrresult');
      Open;
   end;
end;

procedure Tstaff.retriveaddr(const id : string);
begin
   with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('Delete from addrresult');
      ExecSQL;

      SQL.Clear;
      SQL.Add('execute procedure retrive_addr_staff('+chr(39)+id+chr(39)+')');
   	ExecSQL;

      SQL.Clear;
      SQL.Add('Select * from addrresult');
      Open;
   end;
end;

procedure Tmember.apply_member(const id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph : string);
begin
    with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure apply_member(');
       SQL.Add(''+chr(39)+id+chr(39)+','+
       			    chr(39)+nam+chr(39)+','+
                   chr(39)+las+chr(39)+','+
                   chr(39)+app+chr(39)+','+
                   chr(39)+sta+chr(39)+','+
                   chr(39)+org+chr(39)+','+
                   chr(39)+divi+chr(39)+','+
                   chr(39)+hid+chr(39)+','+
                   chr(39)+rd+chr(39)+','+
                   chr(39)+tum+chr(39)+','+
                   chr(39)+amp+chr(39)+','+
                   chr(39)+pro+chr(39)+','+
                   chr(39)+zip+chr(39)+','+
                   chr(39)+ph+chr(39)+')');
       ExecSQL;
       showmessage('บันทึกข้อมูลของสมาชิกรหัส '+id+' เรียบร้อย');
    end;
end;

procedure Tstudent.apply_member(const id,nam,las,app,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,expi,cla : string);
begin

	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure apply_member(');
       SQL.Add(''+chr(39)+id+chr(39)+','+
       			    chr(39)+nam+chr(39)+','+
                   chr(39)+las+chr(39)+','+
                   chr(39)+app+chr(39)+','+
                   chr(39)+sta+chr(39)+','+
                   chr(39)+org+chr(39)+','+
                   chr(39)+divi+chr(39)+','+
                   chr(39)+hid+chr(39)+','+
                   chr(39)+rd+chr(39)+','+
                   chr(39)+tum+chr(39)+','+
                   chr(39)+amp+chr(39)+','+
                   chr(39)+pro+chr(39)+','+
                   chr(39)+zip+chr(39)+','+
                   chr(39)+ph+chr(39)+','+
                   chr(39)+maj+chr(39)+','+
                   chr(39)+expi+chr(39)+','+
                   chr(39)+cla+chr(39)+')');
       ExecSQL;
       showmessage('บันทึกข้อมูลของสมาชิกรหัส '+id+' เรียบร้อย');
    end;
end;

procedure Tmember.edit_member(const id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure edit_member(');
       SQL.Add(''+chr(39)+id+chr(39)+','+
       			    chr(39)+nam+chr(39)+','+
                   chr(39)+las+chr(39)+','+
                   chr(39)+sta+chr(39)+','+
                   chr(39)+org+chr(39)+','+
                   chr(39)+divi+chr(39)+','+
                   chr(39)+hid+chr(39)+','+
                   chr(39)+rd+chr(39)+','+
                   chr(39)+tum+chr(39)+','+
                   chr(39)+amp+chr(39)+','+
                   chr(39)+pro+chr(39)+','+
                   chr(39)+zip+chr(39)+','+
                   chr(39)+ph+chr(39)+')');
       ExecSQL;
       showmessage('แก้ไขข้อมูลของสมาชิกรหัส '+id+' เรียบร้อย');
    end;
end;

procedure Tstudent.edit_member(const id,nam,las,sta,org,divi,hid,rd,tum,amp,pro,zip,ph,maj,cla : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure edit_member(');
       SQL.Add(''+chr(39)+id+chr(39)+','+
       			    chr(39)+nam+chr(39)+','+
                   chr(39)+las+chr(39)+','+
                   chr(39)+sta+chr(39)+','+
                   chr(39)+org+chr(39)+','+
                   chr(39)+divi+chr(39)+','+
                   chr(39)+hid+chr(39)+','+
                   chr(39)+rd+chr(39)+','+
                   chr(39)+tum+chr(39)+','+
                   chr(39)+amp+chr(39)+','+
                   chr(39)+pro+chr(39)+','+
                   chr(39)+zip+chr(39)+','+
                   chr(39)+ph+chr(39)+','+
                   chr(39)+maj+chr(39)+','+
                   chr(39)+cla+chr(39)+')');
       ExecSQL;
       showmessage('แก้ไขข้อมูลของสมาชิกรหัส '+id+' เรียบร้อย');
    end;
end;

procedure Tstudent.delete_member(const id : string);
begin
	with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('execute procedure delete_std('+chr(39)+id+chr(39)+')');
   	ExecSQL;
      Showmessage('ลบข้อมูลของสมาชิกรหัส '+id+' เรียบร้อยแล้ว');
   end;
end;

procedure Tstaff.delete_member(const id : string);
begin
	with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('execute procedure delete_staff('+chr(39)+id+chr(39)+')');
   	ExecSQL;
      Showmessage('ลบข้อมูลของสมาชิกรหัส '+id+' เรียบร้อยแล้ว');
   end;
end;



//-------------------Class Library_Item----------------------------------//

procedure Tbook.retrivedb(const sid : string);
begin
	with Databasemd.Query1 do
      begin
      	Close;
       	SQL.Clear;
       	SQL.Add('Select b2.call_no,isbn,name,author1,author2,author3,edition,publish,recieve_date,page_num from ');
         SQL.Add('book b1,book_title b2 where b1.call_no = b2.call_no and serialno = "'+sid+'"');
       	Open;
    	end;
end;

procedure Tmag.retrivedb(const sid : string);
begin
	with Databasemd.Query1 do
      begin
      	Close;
         SQL.Clear;
       	SQL.Add('Select m2.call_no,issn,name,years,vol,no,publish,recieve_date,page_num from ');
         SQL.Add('magazine m1,magazine_title m2 where m1.call_no = m2.call_no and serialno = "'+sid+'"');
       	Open;
      end;
end;

procedure Tbook.apply_library(const sid,call_no,isbn,name1,edition,publish,recieve_date,page_num,a1,a2,a3 : string);
var book1 : Tbook;
begin

	with Databasemd.Query1 do
      begin
      	Close;
         SQL.Clear;
       	SQL.Add('Select serialno from book where serialno = "'+sid+'"');
       	Open;
      end;
   if (Databasemd.DataSource1.DataSet.IsEmpty) then
  	begin
   // insert new record
   	with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure apply_booknotitle(');
       		SQL.Add(''+chr(39)+sid+chr(39)+','+chr(39)+call_no+chr(39)+')');
       		ExecSQL;
    		end;
		with Databasemd.Query1 do
      	begin
      		Close;
         	SQL.Clear;
       		SQL.Add('Select call_no from book_title where call_no = "'+call_no+'"');
       		Open;
      	end;
   	if (Databasemd.DataSource1.DataSet.IsEmpty) then
   		with Databasemd.Query1 do
    			begin
       			Close;
       			SQL.Clear;
       			SQL.Add('execute procedure apply_book(');
       			SQL.Add(''+chr(39)+call_no+chr(39)+','+
       			    		chr(39)+isbn+chr(39)+','+
                   		chr(39)+name1+chr(39)+','+
                   		chr(39)+a1+chr(39)+','+
                   		chr(39)+a2+chr(39)+','+
                   		chr(39)+a3+chr(39)+','+
                   		chr(39)+edition+chr(39)+','+
                   		chr(39)+publish+chr(39)+','+
                   		chr(39)+recieve_date+chr(39)+','+page_num+')');
       			ExecSQL;
       			showmessage('บันทึกข้มูลสิ่งพิมพ์ เรียบร้อย');
    			end
   	else
      	showmessage('บันทึกข้มูลสิ่งพิมพ์ เรียบร้อย')
   end
   else
   begin
   // update record
      book1 := Tbook.Create;
      book1.edit_library(call_no,isbn,name1,a1,a2,a3,edition,publish,recieve_date,page_num);
		book1.Destroy;
   end;
end;

procedure Tmag.apply_library(const sid,callno,issn1,nam,yrs,vol1,no1,pub,rdate,pnum : string);
var mag1 : Tmag;
begin

	with Databasemd.Query1 do
      begin
      	Close;
         SQL.Clear;
       	SQL.Add('Select serialno from magazine where serialno = "'+sid+'"');
       	Open;
      end;
   if (Databasemd.DataSource1.DataSet.IsEmpty) then
  	begin
   // insert new record
   	with Databasemd.Query1 do
    		begin
       		Close;
       		SQL.Clear;
       		SQL.Add('execute procedure apply_magnotitle(');
       		SQL.Add(''+chr(39)+sid+chr(39)+','+chr(39)+callno+chr(39)+')');
       		ExecSQL;
    		end;
		with Databasemd.Query1 do
      	begin
      		Close;
         	SQL.Clear;
       		SQL.Add('Select call_no from magazine_title where call_no = "'+callno+'"');
       		Open;
      	end;
   	if (Databasemd.DataSource1.DataSet.IsEmpty) then
   		with Databasemd.Query1 do
    			begin
       			Close;
       			SQL.Clear;
       			SQL.Add('execute procedure apply_mag(');
       			SQL.Add(''+chr(39)+callno+chr(39)+','+
       			    		chr(39)+issn1+chr(39)+','+
                   		chr(39)+nam+chr(39)+','+
                   		chr(39)+yrs+chr(39)+','+
                   		chr(39)+vol1+chr(39)+','+
                   		chr(39)+no1+chr(39)+','+
                   		chr(39)+pub+chr(39)+','+
                   		chr(39)+rdate+chr(39)+','+
                   		pnum+')');
       			ExecSQL;
       			showmessage('บันทึกข้มูลสิ่งพิมพ์ เรียบร้อย');
    			end
   	else
      	showmessage('บันทึกข้มูลสิ่งพิมพ์ เรียบร้อย')
   end
   else
   begin
   // update record
      mag1 := Tmag.Create;
      mag1.edit_library(callno,issn1,nam,yrs,vol1,no1,pub,rdate,pnum);
		mag1.Destroy;
   end;
end;

procedure Tbook.edit_library(const callno,isbn1,nam,a1,a2,a3,edi,pub,rdate,pnum : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure edit_book(');
       SQL.Add(''+chr(39)+callno+chr(39)+','+
       			    chr(39)+isbn1+chr(39)+','+
                   chr(39)+nam+chr(39)+','+
                   chr(39)+a1+chr(39)+','+
                   chr(39)+a2+chr(39)+','+
                   chr(39)+a3+chr(39)+','+
                   chr(39)+edi+chr(39)+','+
                   chr(39)+pub+chr(39)+','+
                   chr(39)+rdate+chr(39)+','+pnum+')');
       ExecSQL;
       showmessage('แก้ไขข้อมูลเรียบร้อยแล้ว');
    end;
end;

procedure Tmag.edit_library(const callno,issn1,nam,yrs,vol1,no1,pub,rdate,pnum : string);
begin
	 with Databasemd.Query1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('execute procedure edit_mag(');
       SQL.Add(''+chr(39)+callno+chr(39)+','+
       			    chr(39)+issn1+chr(39)+','+
                   chr(39)+nam+chr(39)+','+
                   chr(39)+yrs+chr(39)+','+
                   chr(39)+vol1+chr(39)+','+
                   chr(39)+no1+chr(39)+','+
                   chr(39)+pub+chr(39)+','+
                   chr(39)+rdate+chr(39)+','+pnum+')');
       ExecSQL;
       showmessage('แก้ไขข้อมูลเรียบร้อยแล้ว');
    end;
end;


procedure Tbook.delete_library(const sid,callno : string);
begin
	with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('execute procedure delete_book("'+sid+'","'+callno+'")');
   	ExecSQL;
      Showmessage('ลบข้อมูลหนังสือเรียบร้อย');
   end;
end;

procedure Tmag.delete_library(const sid,callno : string);
begin
	with Databasemd.Query1 do
   begin
   	Close;
      SQL.Clear;
      SQL.Add('execute procedure delete_mag("'+sid+'","'+callno+'")');
   	ExecSQL;
      Showmessage('ลบข้อมูลหนังสือเรียบร้อย');
   end;
end;


end.
