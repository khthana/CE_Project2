unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, VaClasses, VaComm, DB, DBTables, ExtCtrls;

type
  TForm3 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    all_data: TTable;
    VaComm1: TVaComm;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Ttrack_id: TEdit;
    Tdriver: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Tcar_id: TEdit;
    report1: TTable;
    Troute: TEdit;
    Label5: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form3: TForm3;
  from_serial,bin : ansistring;
  code,count,i : Integer;
  ProgressBar: TProgressBar;
  first,serial,start_load,load_error : boolean;
implementation

uses car_tracking, Unit5;

{$R *.DFM}

function ChartoBin ( hex : char): string;
begin
   case hex of
   '0' : ChartoBin := '0000';
   '1' : ChartoBin := '0001';
   '2' : ChartoBin := '0010';
   '3' : ChartoBin := '0011';
   '4' : ChartoBin := '0100';
   '5' : ChartoBin := '0101';
   '6' : ChartoBin := '0110';
   '7' : ChartoBin := '0111';
   '8' : ChartoBin := '1000';
   '9' : ChartoBin := '1001';
   'A' : ChartoBin := '1010';
   'B' : ChartoBin := '1011';
   'C' : ChartoBin := '1100';
   'D' : ChartoBin := '1101';
   'E' : ChartoBin := '1110';
   'F' : ChartoBin := '1111';
   end;
end;

function BintoChar (value : string ): char;
begin
   if value = '0000' then
      BintoChar := '0'
   else if value = '0001' then
      BintoChar := '1'
   else if value = '0010' then
      BintoChar := '2'
   else if value = '0011' then
      BintoChar := '3'
   else if value = '0100' then
      BintoChar := '4'
   else if value = '0101' then
      BintoChar := '5'
   else if value = '0110' then
      BintoChar := '6'
   else if value = '0111' then
      BintoChar := '7'
   else if value = '1000' then
      BintoChar := '8'
   else if value = '1001' then
      BintoChar := '9'
   else if value = '1111' then
      BintoChar := '0'
   else
   begin
     BintoChar := '0';
     load_error := true;
   end;;
end;

procedure InserttoDB();
begin
  if not load_error then
  begin
  code := code+1;
  form3.all_data.Append;
  form3.all_data.FieldByName('code').AsInteger := code;
  form3.all_data.FieldByName('latitude').Asstring := form1.lat;
  form3.all_data.FieldByName('direction_n').AsString := form1.direction_n;
  form3.all_data.FieldByName('longitude').AsString := form1.long;
  form3.all_data.FieldByName('direction_e').AsString := form1.direction_e;
  form3.all_data.FieldByName('speed').AsString:= form1.speed;
  form3.all_data.FieldByName('time').AsString := form1.time;
  form3.all_data.FieldByName('track_id').AsInteger := form1.track_id;
  form3.all_data.post;
  form3.all_data.CommitUpdates;
  end;
  load_error := false;
end;
procedure checkzero();
var tmp_bin : ansistring;
    k,l,m : integer;
begin
  for k := 1 to 11 do
  begin
    tmp_bin := '';
    for l := 8*(k-1)+1 to 8*k do
    begin
     tmp_bin:=tmp_bin+bin[l];
     if tmp_bin='11111111' then
     begin
       for m :=8*(k-1)+1 to 8*k do
         bin[m]:='0';
     end;
    end;
  end;
end;
procedure decode();
var h1,h2,m1,m2,m3,m4,m5,m6,k1,k2,k3,s1,s2,tmp_hr : String;
    tmp_h1,tmp_h2,tmp_int : Integer;
begin

//########## Decode time ############
   h1 := bintochar('0'+bin[2]+bin[3]+bin[4]);
   h2 := bintochar(bin[5]+bin[6]+bin[7]+bin[8]);
   m1 := bintochar('0'+bin[9]+bin[10]+bin[11]);
   m2 := bintochar(bin[12]+bin[13]+bin[14]+bin[15]);
   s1 := bintochar('0'+bin[16]+bin[17]+bin[18]);
   s2 := bintochar(bin[19]+bin[20]+bin[21]+bin[22]);
   if h1='' then
     tmp_h1:=0
   else
     tmp_h1:=strtoint(h1);
   if h2='' then
     tmp_h2:=0
   else
     tmp_h2:=strtoint(h2);
   if  (tmp_h1*10)+tmp_h2+7 > 24 then
   begin
     tmp_int := (tmp_h1*10)+tmp_h2+7-24;
     tmp_hr := inttostr(tmp_int);
   end
   else
   begin
     tmp_int := (tmp_h1*10)+tmp_h2+7;
     tmp_hr := inttostr(tmp_int);
   end;
   form1.time := tmp_hr+'.'+m1+m2+'.'+s1+s2;
//   form1.time := h1+h2+'.'+m1+m2+'.'+s1+s2;
   form1.Ltime.caption := form1.time;
//######## Decode latitude ##########
   m1 := bintochar(bin[23]+bin[24]+bin[25]+bin[26]);
   m2 := bintochar(bin[27]+bin[28]+bin[29]+bin[30]);
   m3 := bintochar(bin[31]+bin[32]+bin[33]+bin[34]);
   m4 := bintochar(bin[35]+bin[36]+bin[37]+bin[38]);
   m5 := bintochar(bin[39]+bin[40]+bin[41]+bin[42]);
   m6 := bintochar(bin[43]+bin[44]+bin[45]+bin[46]);
   form1.lat := m1+m2+'.'+m3+m4+m5+m6;
   form1.Llat.caption := form1.lat;
//######## Decode direction N/S ########
   if bin[47]='1' then
      form1.direction_n := 'N'
   else
      form1.direction_n := 'S';
   form1.Ln.caption := form1.direction_n;
//########## Decode longitude ############
   m1 := bintochar(bin[48]+bin[49]+bin[50]+bin[51]);
   m2 := bintochar(bin[52]+bin[53]+bin[54]+bin[55]);
   m3 := bintochar(bin[56]+bin[57]+bin[58]+bin[59]);
   m4 := bintochar(bin[60]+bin[61]+bin[62]+bin[63]);
   m5 := bintochar(bin[64]+bin[65]+bin[66]+bin[67]);
   m6 := bintochar(bin[68]+bin[69]+bin[70]+bin[71]);
   form1.long := m1+m2+'.'+m3+m4+m5+m6;
   form1.Llong.caption := form1.long;
//######## Decode direction E/W ##########
   if bin[72]='1' then
      form1.direction_e := 'E'
   else
      form1.direction_e := 'W';
   form1.Le.caption := form1.direction_e;
//########## Decode speed ############
   k1 := bintochar('0'+'0'+'0'+bin[73]);
   k2 := bintochar(bin[74]+bin[75]+bin[76]+bin[77]);
   k3 := bintochar(bin[78]+bin[79]+bin[80]+bin[81]);
   m1 := bintochar(bin[82]+bin[83]+bin[84]+bin[85]);
   m2 := bintochar(bin[86]+bin[87]+bin[88]+'0');
   if k1='1' then
     form1.speed := k1+k2+k3+'.'+m1+m2
   else
     form1.speed := k2+k3+'.'+m1+m2;
   form1.Lspeed.caption := form1.speed;
end;

procedure uncompress(from_serial : ansistring);
var str_hex : ansistring;
    l,k,m,o,p,c,asci,index,tmp : integer;
    founds,endsentence,endinput : boolean;
begin
  k:=1;
  while from_serial[k]<>'$' do
  begin
    k :=k+1;
  end;
  k:=k+1;// skip first $
  while from_serial[((k-1)*12)+1]<>#254 do
  begin
     while from_serial[k]<>'$' do
     begin
       l:=1;
       //########## convert string to ascii #########
       asci := Ord(from_serial[k]);

       //########## convert ascii to hex ############
       str_hex := IntToHex(asci,2)+#254;

       while str_hex[l] <> #254 do
       begin
         //########## convert hex to binary ###########
         bin := bin + chartobin(str_hex[l]);
         l :=l+1;
       end;
       k:=k+1;
     end;
     checkzero();
     decode();
     inserttodb();
     bin:='';
     k:=k+1;
  end;
end;

//######check error whether the car stop for long time #######
function checkstop (lat,long : string) : string;
begin
    if (old_lat=lat) and (old_long=long) then
    i:= i+1
    else i := 0;
    old_lat:=lat;
    old_long:=long;
    if i=form1.stop_rate/60 then//assume that record data every second
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

    if round(btmp1-btmp3)>form1.brake_rate then
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

    if (round(stmp3-stmp1)>form1.start_rate)and (stmp1=0) then
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

procedure TForm3.FormCreate(Sender: TObject);
begin
//########## generate tracking ID ###########
  start_load := false;
  report1.last;
  if not report1.bof then
  begin
    form1.track_id  := report1.fieldValues['r_id']+1;
  end
  else
  begin
    form1.track_id :=1;
  end;
  Ttrack_id.text := inttostr(form1.track_id);

  form1.gps.SQL.Text := 'select * from gps order by "code" asc';
  form1.gps.open;
  form1.gps.Last;
//####### generate code for first data ########
  if not form1.gps.bof then
  begin
    code := form1.gps.FieldValues['code'];
  end
  else
  begin
    code := 0;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
var s : string;
    ok : boolean;
begin
  //start_load:= true;
//######## Insert tracking Info to DB #########
  report1.Append;
  report1.FieldByName('r_id').AsInteger := form1.track_id;
  report1.FieldByName('driver').Asstring := Tdriver.text;
  report1.FieldByName('carid').AsString := Tcar_id.text;
  report1.FieldByName('route').AsString := Troute.text;
  report1.FieldByName('startdate').AsString := '11/12/45';//temp data
  report1.FieldByName('starttime').AsString := '11.12.12';
  report1.FieldByName('enddate').AsString := '11/12/45';
  report1.FieldByName('endtime').AsString := '11.12.12';
  report1.post;
  report1.CommitUpdates;
  all_data.Last;

//########## Initial com port ###########
  if not((VaComm1.Portnum=1)or(VaComm1.Portnum=2))then
    VaComm1.Portnum:=1;
  VaComm1.Open;
  S := #64#64;//73/49/115
  Ok := VaComm1.WriteText(S);
  if not Ok then
    form1.Lnotice1.Caption:='Please Initial Com Port';
  i :=0;
  j :=1;
  first := false;
  from_serial:='';
  uncompress(from_serial+#254);
end;

procedure TForm3.VaComm1RxChar(Sender: TObject; Count: Integer);
begin
  start_load:= true;
  count:=0;
//####### Read data from serial port ########
  from_serial := from_serial+ VaComm1.ReadText;
{
//##### Update start/end date to Report Table ######
  all_data.filter   := 'track_id ='+track_id;
  all_data.filtered := true;
  all_data.first;
  report1.edit;
  report1.FieldByName('startdate').AsString := all_data.fieldValues['that_date'];
  report1.FieldByName('starttime').AsString := all_data.fieldValues['time'];
  all_data.last;
  report1.FieldByName('enddate').AsString := all_data.fieldValues['that_date'];
  report1.FieldByName('endtime').AsString := all_data.fieldValues['time'];
  report1.Post;
  report1.CommitUpdates;
}
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  form1.Lnotice1.caption :='';
  start_load := false;
  Vacomm1.close;
  form3.close;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if start_load then
  begin
    count:= count+1;

    progressbar1.StepBy(30);
//########## load data terminated ###########
    if count>=3 then
    begin
//####### compress and insert to DB #########
      uncompress(from_serial+#254);
//############## check error ################
      checkerror();
      count:=0;
      start_load :=false;
      Vacomm1.close;
      form3.close;
    end;
  end;
end;

end.
