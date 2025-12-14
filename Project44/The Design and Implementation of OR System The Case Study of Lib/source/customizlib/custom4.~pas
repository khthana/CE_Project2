unit custom4;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QDialogs;

type
  TCustomStep3 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ch1: TCheckBox;
    GroupBox1: TGroupBox;
    ch2: TCheckBox;
    ch3: TCheckBox;
    GroupBox2: TGroupBox;
    ch4: TCheckBox;
    ch5: TCheckBox;
    ch6: TCheckBox;
    ch7: TCheckBox;
    ch8: TCheckBox;
    ch10: TCheckBox;
    ch12: TCheckBox;
    ch14: TCheckBox;
    ch9: TCheckBox;
    ch11: TCheckBox;
    ch13: TCheckBox;
    stdbookfee: TEdit;
    stdmagfee: TEdit;
    stdbookday: TEdit;
    stdbooknum: TEdit;
    stdresday: TEdit;
    stdmagday: TEdit;
    stdmagnum: TEdit;
    stabookfee: TEdit;
    stabookday: TEdit;
    stabooknum: TEdit;
    staresday: TEdit;
    stamagfee: TEdit;
    stamagday: TEdit;
    stamagnum: TEdit;
    procedure ch1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ch3Click(Sender: TObject);
    procedure ch2Click(Sender: TObject);
    procedure ch4Click(Sender: TObject);
    procedure ch5Click(Sender: TObject);
    procedure ch6Click(Sender: TObject);
    procedure ch7Click(Sender: TObject);
    procedure ch8Click(Sender: TObject);
    procedure ch9Click(Sender: TObject);
    procedure ch10Click(Sender: TObject);
    procedure ch11Click(Sender: TObject);
    procedure ch12Click(Sender: TObject);
    procedure ch13Click(Sender: TObject);
    procedure ch14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  CustomStep3: TCustomStep3;

implementation

uses customdbmodule, custom1;

{$R *.DFM}

procedure TCustomStep3.ch1Click(Sender: TObject);
begin
    if ch1.Checked = true then
        stdbookfee.Enabled := true
    else
    begin
        stdbookfee.enabled := false;
        stdbookfee.Text := '5';
    end;
end;

procedure TCustomStep3.FormCreate(Sender: TObject);
begin
    stdbookfee.Enabled := false;
    stdmagfee.Enabled := false;
    stdbookday.Enabled := false;
    stdmagday.Enabled := false;
    stdbooknum.Enabled := false;
    stdmagnum.Enabled := false;
    stdresday.Enabled := false;

    stabookfee.Enabled := false;
    stamagfee.Enabled := false;
    stabookday.Enabled := false;
    stamagday.Enabled := false;
    stabooknum.Enabled := false;
    stamagnum.Enabled := false;
    staresday.Enabled := false;
end;

procedure TCustomStep3.ch2Click(Sender: TObject);
begin
    if ch2.Checked = true then
        stdmagfee.Enabled := true
    else
    begin
        stdmagfee.enabled := false;
        stdmagfee.Text := '5';
    end;
end;

procedure TCustomStep3.ch3Click(Sender: TObject);
begin
    if ch3.Checked = true then
        stdbookday.Enabled := true
    else
    begin
        stdbookday.enabled := false;
        stdbookday.Text := '5'; 
    end;
end;

procedure TCustomStep3.ch4Click(Sender: TObject);
begin
    if ch4.Checked = true then
        stdmagday.Enabled := true
    else
    begin
        stdmagday.enabled := false;
        stdmagday.Text := '5';
    end;
end;

procedure TCustomStep3.ch5Click(Sender: TObject);
begin
    if ch5.Checked = true then
        stdbooknum.Enabled := true
    else
    begin
        stdbooknum.enabled := false;
        stdbooknum.Text := '3';
    end;
end;

procedure TCustomStep3.ch6Click(Sender: TObject);
begin
    if ch6.Checked = true then
        stdmagnum.Enabled := true
    else
    begin
        stdmagnum.enabled := false;
        stdmagnum.Text := '3';
    end;
end;

procedure TCustomStep3.ch7Click(Sender: TObject);
begin
    if ch7.Checked = true then
        stdresday.Enabled := true
    else
    begin
        stdresday.enabled := false;
        stdresday.Text := '5';
    end;
end;

procedure TCustomStep3.ch8Click(Sender: TObject);
begin
    if ch8.Checked = true then
        stabookfee.Enabled := true
    else
    begin
        stabookfee.enabled := false;
        stabookfee.Text := '5';
    end;
end;

procedure TCustomStep3.ch9Click(Sender: TObject);
begin
    if ch9.Checked = true then
        stamagfee.Enabled := true
    else
    begin
        stamagfee.enabled := false;
        stamagfee.Text := '5';
    end;
end;


procedure TCustomStep3.ch10Click(Sender: TObject);
begin
    if ch10.Checked = true then
        stabookday.Enabled := true
    else
    begin
        stabookday.enabled := false;
        stabookday.Text := '7';
    end;
end;

procedure TCustomStep3.ch11Click(Sender: TObject);
begin
    if ch11.Checked = true then
        stamagday.Enabled := true
    else
    begin
        stamagday.enabled := false;
        stamagday.Text := '7';
    end;
end;

procedure TCustomStep3.ch12Click(Sender: TObject);
begin
    if ch12.Checked = true then
        stabooknum.Enabled := true
    else
    begin
        stabooknum.enabled := false;
        stabooknum.Text := '5';
    end;
end;

procedure TCustomStep3.ch13Click(Sender: TObject);
begin
    if ch13.Checked = true then
        stamagnum.Enabled := true
    else
    begin
        stamagnum.enabled := false;
        stamagnum.Text := '5';
    end;
end;

procedure TCustomStep3.ch14Click(Sender: TObject);
begin
    if ch14.Checked = true then
        staresday.Enabled := true
    else
    begin
        staresday.enabled := false;
        staresday.Text := '5';
    end;
end;

procedure TCustomStep3.Button1Click(Sender: TObject);
begin
    if MessageDlg('คุณแน่ใจสนการ customize กฎข้อบังคับข้างต้นใช่หรือไม่', mtConfirmation, [mbYes, mbNo], 0) = 3 then
    begin
        with datamodule1.query1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdbookfee.text+'" where name = "StuBook_Fee"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdmagfee.text+'" where name = "StuMag_Fee"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdbookday.text+'" where name = "StuBook_NoBorrowDay"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdmagday.text+'" where name = "StuMag_NoBorrowDay"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdbooknum.text+'" where name = "StuBook_NoBorrow"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdmagnum.text+'" where name = "StuMag_NoBorrow"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stdresday.text+'" where name = "StuBook_NoReserveDay"');
            Execsql;

            //staff
            SQL.Clear;
            SQL.Add('update rule set detail = "'+stabookfee.text+'" where name = "StaBook_Fee"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stamagfee.text+'" where name = "StaMag_Fee"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stabookday.text+'" where name = "StaBook_NoBorrowDay"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stamagday.text+'" where name = "StaMag_NoBorrowDay"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stabooknum.text+'" where name = "StaBook_NoBorrow"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+stamagnum.text+'" where name = "StaMag_NoBorrow"');
            Execsql;

            SQL.Clear;
            SQL.Add('update rule set detail = "'+staresday.text+'" where name = "StaBook_NoReserveDay"');
            Execsql;
        end;
        showmessage('ทำการเปลี่ยนแปลงเรียบร้อยแล้ว กด ok เพื่ออกจากโปรแกรม');
        CustomForm1.Close;

    end;
end;

end.
