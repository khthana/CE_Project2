unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask;

type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;
    com2: TRadioButton;
    com1: TRadioButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    Edit3: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  i : integer;

implementation

uses car_tracking, Unit3;

{$R *.DFM}

//######check error whether the car stop for long time #######
function checkstop (lat_in,long_in : string) : string;
begin
    if (old_lat=lat_in) and (old_long=long_in) then
    i:= i+1
    else i := 0;
    old_lat:=lat_in;
    old_long:=long_in;
    if i>=form1.stop_rate/60 then//assume that record data every second
      checkstop := 'จอดรถนานผิดปกติ'
    else
      checkstop :='a';
end;

//######check error whether the car have an emergency brake #######
function checkbrake (speed :string) : string;
begin
    btmp1 := btmp2;
    btmp2 := btmp3;
    btmp3 := round(strtofloat(speed));

    if (round(btmp1-btmp3)>= form1.brake_rate) then
      checkbrake := 'เบรคกระทันหัน'
    else
      checkbrake :='a';
end;

//######check error whether the car have a hastily start #######
function checkstart (speed :string) : string;
begin
    stmp1 := stmp2;
    stmp2 := stmp3;
    stmp3 := round(strtofloat(speed));

    if (round(stmp3-stmp1)>=form1.start_rate)and (stmp1=0) then
      checkstart := 'ออกตัวกระชาก'
    else
      checkstart :='a';
end;

procedure checkerror ();
var notice1,notice2,notice3 : string;
begin
  form3.all_data.Filter := 'track_id='+ inttostr(form1.track_id);
  form3.all_data.filtered := true;
  old_lat := '0';
  old_long := '0';
  stmp1:=0;
  stmp2:=0;
  stmp3:=0;
  btmp1:=0;
  btmp2:=0;
  btmp3:=0;

  while not form3.all_data.eof do
  begin
    form1.lat  :=form3.all_data.fieldvalues['latitude'];
    form1.long :=form3.all_data.fieldvalues['longitude'];
    form1.speed :=form3.all_data.fieldvalues['speed'];
    form3.all_data.edit;
    form3.all_data.FieldByName('notice1').AsString := checkstart(form1.speed);
    form3.all_data.FieldByName('notice2').AsString := checkbrake(form1.speed);
    form3.all_data.FieldByName('notice3').AsString := checkstop(form1.lat,form1.long);
    form3.all_data.Post;
    form3.all_data.CommitUpdates;
    form3.all_data.next;
  end;
end;
procedure TForm2.Button1Click(Sender: TObject);
begin
  form3.Vacomm1.close;
  if com1.checked then
    form3.VaComm1.Portnum:=1
  else
    form3.VaComm1.Portnum:=2;
  if checkbox1.checked then
    begin
    form1.start_rate := StrtoInt(edit1.text);
    form1.start1 := true;
    end
  else
    form1.start1 := false;
  if checkbox2.Checked then
    begin
    form1.brake_rate := StrtoInt(edit2.text);
    form1.brake1 := true;
    end
  else
    form1.brake1 := false;
  if checkbox3.checked then
    begin
    form1.stop_rate := StrtoInt(edit3.text);
    form1.stop1 := true;
    end
  else
    form1.stop1 := false;
  checkerror();
  if checkbox4.checked then
    form1.reco := true
  else
    form1.reco := false;
  Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  edit1.Text := inttostr(form1.start_rate);
  edit2.Text := inttostr(form1.brake_rate);
  edit3.Text := inttostr(form1.stop_rate);
  if form1.start1 then
    checkbox1.Checked := true
  else
    checkbox1.Checked := false;
  if form1.brake1 then
    checkbox2.Checked := true
  else
    checkbox2.Checked := false;
  if form1.stop1 then
    checkbox3.Checked := true
  else
    checkbox3.Checked := false;
  if form1.reco then
    checkbox4.Checked := true
  else
    checkbox4.Checked := false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  edit1.Text := inttostr(form1.start_rate);
  edit2.Text := inttostr(form1.brake_rate);
  edit3.Text := inttostr(form1.stop_rate);
  if form1.start1 then
    checkbox1.Checked := true
  else
    checkbox1.Checked := false;
  if form1.brake1 then
    checkbox2.Checked := true
  else
    checkbox2.Checked := false;
  if form1.stop1 then
    checkbox3.Checked := true
  else
    checkbox3.Checked := false;
  if form1.reco then
    checkbox4.Checked := true
  else
    checkbox4.Checked := false;
end;

end.
