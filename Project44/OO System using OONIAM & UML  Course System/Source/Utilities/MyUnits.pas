unit MyUnits;

interface
uses Dialogs,graphics,Classes;
{$DEFINE __WINXP}
const
    ssRunning = 1;
    ssGraduate = 2;
    ssRetired = 3;
    ssNewEntry = 4;

    DISABLEIMAGE = 17;
    //-- Enumerate
    type cmdCustomCommand = (
      cmdNone,cmdOPEN,cmdSAVE,cmdPRINT,cmdCOPY,cmdEXPORT,
      cmdADD,cmdDELETE,cmdADDSET,cmdCLEARALL,cmdPAGEUP,
      cmdPAGEDOWN,cmdRUN,cmdSHOWLOG,
      cmdUSER1,cmdUSER2,cmdUSER3,cmdUSER4
                        );
var
      _FONTNAME : string;
      _FONTSIZE : smallint;
      _PRINTERNAME : string;

    //-- Overloading function
    //   return with any input by result of boolean
	  function IIF(exp : boolean;true_val ,false_val :integer ) :integer; overload;
    function IIF(exp : boolean;true_val ,false_val :string  ) :string ; overload;
    function IIF(exp : boolean;true_val ,false_val :char    ) :char   ; overload;
    function IIF(exp : boolean;true_val ,false_val :boolean ) :boolean; overload;
    function IIF(exp : boolean;true_val ,false_val :single ) :single; overload;
    //-- Copy string from right with l letters.
    function StrRight(s : string;l : integer) : string;
    //-- Copy string from left with l letters.
    function StrLeft(s : string;l : integer) : string;
    //-- Trim white space from front & trail of string.
    function LTrim(s : string) : string;
    function RTrim(s : string) : string;
    function AllTrim(s : string) : string;
    function GetTextLastGrad(s : smallint) : string;
    function GetTextTerm(s : SmallInt) : string;
    function GetSerialYear(s : string) : smallInt;
    function StrVal(st : string) : Integer;
    function ShortThaiDay(i : integer) : string;
    function ThaiMonth(i : integer) : string;
    function ThaiDlg(const Msg: string;
                DlgType: TMsgDlgType;
                Buttons: TMsgDlgButtons;
                HelpCtx: Longint): Word;
    function ThaiInput(const ACaption, APrompt: string;
                var Value: string): Boolean;
    function StrGrade(g : smallint;r : smallint) : string;
    function intGrade(d : string) : smallint;
    function GrWeight(g : string) : smallint;
    function FillDigit(i : integer) : string;overload;
    function FillDigit(f : double) : string;overload;

    procedure DecodeMyDate(_date : TDateTime;var year,month,day : Word);
    function EncodeMyDate(year,month,day : Word): TDateTime;
    function GetPrefix(birth : TDateTime;sex : Smallint) : string;overload;
    function GetPrefix(bday,bmonth,byear : smallint;sex : Smallint) : string;overload;
    function GetPrefix(specDate,birth : TDateTime;sex : Smallint) : string;overload;

    procedure setDefault;
    procedure setSQLwait;
    procedure setWait;
    function Colon2Comma(s: string): string;
    function Colon2Space(s: string): string;
    function ExtractThaiDate(d: TDateTime): string;

implementation

uses SysUtils,Windows,Messages,Forms,extCtrls,Controls,StdCtrls,Buttons;

type TMySpeedButton = class(TSpeedButton)
  public
  ModalResult : TModalResult;
  Default : boolean;
  Cancel : boolean;
  constructor Create(AOwner : TComponent); override;
end;

type ThDlg = class(TComponent)
  f1 : TForm;
  p1 : TPanel;
  l1 : TLabel;
  p2 : TPanel;
  t1 : TEdit;
  btn : TButton;
  image : TImage;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    procedure SetButton(Buttons: TMsgDlgButtons);overload;
    procedure SetButton(Buttons : TMsgDlgButtons;dummy : smallint);overload;
    procedure SetIcon(DlgType: TMsgDlgType);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure MyOnClick(Sender : TObject);
end;

var thDlg1 : ThDlg;

procedure setDefault;
begin
  screen.Cursor := crDefault;
end;

procedure setSQLwait;
begin
  screen.Cursor := crSQLWait;
end;

procedure setWait;
begin
  screen.Cursor := crHourGlass;
end;

function IIF(exp : boolean;true_val ,false_val :integer ) :integer;overload;
begin
	if exp then IIF := true_val else IIF := false_val;
end;

function IIF(exp : boolean;true_val ,false_val :string  ) :string ;overload;
begin
	if exp then IIF := true_val else IIF := false_val;
end;

function IIF(exp : boolean;true_val ,false_val :char ) :char;overload;
begin
	if exp then IIF := true_val else IIF := false_val;
end;

function IIF(exp : boolean;true_val ,false_val :boolean ) :boolean; overload;
begin
	if exp then IIF := true_val else IIF := false_val;
end;

function IIF(exp : boolean;true_val ,false_val :single ) :single; overload;
begin
	if exp then IIF := true_val else IIF := false_val;
end;

function StrRight(s : string;l : integer) : string;
begin
    if length(s) > l then
        StrRight := Copy(s,Length(s)-l+1,l)
    else StrRight := s;
end;

function StrLeft(s : string;l : integer) : string;
begin
    if length(s) > l then
        StrLeft := Copy(s,1,l)
    else StrLeft := s;
end;

function LTrim(s : string) : string;
begin
    while (s[1] = ' ') and (length(s) > 0) do delete(s,1,1);
    LTrim := s;
end;

function RTrim(s : string) : string;
begin
    while (s[length(s)] = ' ') and (length(s) > 0) do delete(s,length(s),1);
    RTrim := s;
end;

function AllTrim(s : string) : string;
begin
    AllTrim := RTrim(LTrim(s));
end;

function GetTextLastGrad(s : smallint) : string;
var res : string;
begin
  case s of
   1 : res := 'ป.6';
   2 : res := 'ม.1';
   3 : res := 'ม.2';
   4 : res := 'ม.3';
   5 : res := 'ม.4';
   6 : res := 'ม.5';
   7 : res := 'ม.6';
  end;
  GetTextLastGrad := res;
end;

function GetTextTerm(s : SmallInt) : string;
begin
  if s mod 2 = 0
  then GetTextTerm := inttostr(38+((s-1) div 2))+'/2'
  else GetTextTerm := inttostr(38+((s-1) div 2))+'/1'
end;

function StrVal(st : string) : Integer;
var i : SmallInt;
    f : boolean;
begin
  f := true;
  st := trim(st);
  if length(st) > 0 then
    for i := 1 to length(st) do
    begin
      if not (st[i] in ['.','0'..'9']) then f := false
    end
  else
    f := false;
  try
    if f then
      StrVal := StrtoInt(Trim(st))
    else
      StrVal := 0;
  except
    StrVal := 0;
  end;
end;

function ShortThaiDay(i : integer) : string;
begin
  case i of
    1 : result := 'อา';
    2 : result := 'จ';
    3 : result := 'อ';
    4 : result := 'พ';
    5 : result := 'พฤ';
    6 : result := 'ศ';
    7 : result := 'ส';
  end;
end;


function StrGrade(g : smallint;r : smallint) : string;
var s : string;
begin
  case g of
    0 : s := IIF(r =2,'มผ','0');
    1 : s := IIF(r =2,'ผ','1');
    2 : s := '2';
    3 : s := '3';
    4 : s := '4';
    6 : s := 'ร';
    7 : s := 'มส';
    8 : s := IIF(r = 2,'ผ','X');
    9 : s := IIF(r = 2,'มผ','X');

  end;
  StrGrade := s;
end;

function intGrade(d : string) : smallint;
var s : smallint;
begin
  s := 0;
  if d = '0' then s := 0
  else if d = '1' then s := 1
  else if d = '2' then s := 2
  else if d = '3' then s := 3
  else if d = '4' then s := 4
  else if d = 'ร' then s := 6
  else if d = 'มส' then s := 7
  else if d = 'ผ' then s := 1
  else if d = 'มผ' then s := 0;
  intGrade := s;
end;

function GrWeight(g : string) : smallint;
var s : smallint;
begin
  s := 0;
  g := trim(g);
  if g = '0' then s := 0
  else if g = '1' then s := 1
  else if g = '2' then s := 2
  else if g = '3' then s := 3
  else if g = '4' then s := 4
  else if g = 'ร' then s := 0
  else if g = 'มส' then s := 0
  else if g = 'ผ' then s := 1
  else if g = 'มผ' then s := 0;
  GrWeight := s;
end;

function FillDigit(i : integer) : string;overload;
begin
  FillDigit := inttostr(i)+'.0';
end;

function FillDigit(f : double) : string;overload;
var s : string;
begin
  s := Floattostr(f);
  if Pos('.',s) = 0 then s := s + '.0';
  FillDigit := s;
end;

function GetSerialYear(s : string) : smallInt;
begin
  GetSerialYear := 2*(strtoint(s)-2538)+1
end;
function ThaiDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;
begin
    if not Assigned(thDlg1) then thDlg1 := ThDlg.Create(Application);
    with thDlg1 do
    begin
      t1.Visible := false;
      SetButton(Buttons);
      SetIcon(DlgType);
      l1.Caption := Msg;
    end;
    ThaiDlg := thDlg1.f1.ShowModal;
end;

function ThaiInput(const ACaption, APrompt: string;
                var Value: string): Boolean;
begin
    if not Assigned(thDlg1) then thDlg1 := ThDlg.Create(Application);
    with thDlg1 do
    begin
      t1.Visible := true;
      t1.Text := Value;
      SetButton([mbOK,mbCancel]);
      SetIcon(mtConfirmation);
      l1.Caption := APrompt;
      f1.Caption := ACaption;
    end;
    ThaiInput := thDlg1.f1.ShowModal = mrOK;
    Value := thDlg1.t1.Text;
end;

function ThaiMonth(i : integer) : string;
var th : string;
begin
  case i of
  1 : th := 'มกราคม';
  2 : th := 'กุมภาพันธ์';
  3 : th := 'มีนาคม';
  4 : th := 'เมษายน';
  5 : th := 'พฤษภาคม';
  6 : th := 'มิถุนายน';
  7 : th := 'กรกฎาคม';
  8 : th := 'สิงหาคม';
  9 : th := 'กันยายน';
  10 : th := 'ตุลาคม';
  11 : th := 'พฤศจิกายน';
  12 : th := 'ธันวาคม';
  end;
  ThaiMonth := th;
end;

function GetPrefix(birth : TDateTime;sex : Smallint): string;
var d,m,y : word;
begin
  DecodeMyDate(birth,y,m,d);
  Result := GetPrefix(d,m,y,sex);
end;

function GetPrefix(bday,bmonth,byear : smallint;sex : Smallint) : string;
var res : boolean;
    cday,cmonth,cyear : word;
begin
    res := false;
    DecodeDate(Date,cyear,cmonth,cday);
    if (cyear - byear > 15) then res := true
    else if((cyear - byear = 15)
        and(cmonth - bmonth > 0))then res := true
    else if((cyear - byear = 15)
        and(cmonth - bmonth = 0)
        and(cday - bday >= 0))then res := true;
    case sex of
    1 : Result := IIF(res,'นาย','เด็กชาย');
    2 : Result := IIF(res,'นางสาว','เด็กหญิง');
    end;
end;

function GetPrefix(specDate,birth : TDateTime;sex : Smallint) : string;overload;
var res : boolean;
    cday,cmonth,cyear : word;
    bday,bmonth,byear : word;
begin
    res := false;
    DecodeDate(specDate,cyear,cmonth,cday);
    DecodeDate(birth,byear,bmonth,bday);
    if (cyear - byear > 15) then res := true
    else if((cyear - byear = 15)
        and(cmonth - bmonth > 0))then res := true
    else if((cyear - byear = 15)
        and(cmonth - bmonth = 0)
        and(cday - bday >= 0))then res := true;
    case sex of
    1 : Result := IIF(res,'นาย','เด็กชาย');
    2 : Result := IIF(res,'นางสาว','เด็กหญิง');
    end;
end;
{ ThDlg }

constructor ThDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  f1 := TForm.CreateNew(Self);
  f1.Font.Name := 'Microsoft Sans Serif';
  f1.Font.Charset := THAI_CHARSET;
  f1.Font.Size := 10;
  f1.ParentFont := true;
  f1.Position := poDesktopCenter;
  f1.BorderStyle := bsDialog;
  f1.setBounds(0,0,300,220);
  f1.Caption := Application.Title;
  p1 := TPanel.Create(Self);
  p1.BevelInner := bvRaised;
  p1.BevelOuter := bvLowered;
  p1.Parent := f1;
  p1.Visible := true;
  p1.SetBounds(10,10,f1.Width-40,130);
  p2 := TPanel.Create(Self);
  p2.BevelInner := bvNone;
  p2.BevelOuter := bvNone;
  p2.Parent := f1;
  p2.Visible := true;
  p2.SetBounds(20,140,f1.Width-40,55);
  l1 := TLabel.Create(Self);
  l1.SetBounds(70,10,p1.width-20,p1.height-20);
  l1.AutoSize := false;
  l1.WordWrap := true;
  l1.parent := p1;
  l1.Visible := true;
  t1 := TEdit.Create(p1);
  t1.Parent := p1;
  t1.SetBounds(70,p1.height-34,p1.width-90,26);
  t1.BevelKind := bkSoft;
  t1.BorderStyle := bsNone;
  f1.BorderIcons := [biSystemMenu];
  f1.Visible := false;
  image := TImage.Create(p1);
  with image do
  begin
    top := 10;
    width := 50;
    left := 10;
    Height := 50;
    Parent := p1;
  end;
  btn := TButton.Create(self);
  btn.Parent := f1;
  btn.Visible := false;
  f1.OnKeyPress := MyKeypress;
  f1.KeyPreview := true;
{$IFDEF __WINXP}
  f1.Color := clSkyBlue;
  p1.Color := clSkyBlue;
  p2.Color := clSkyBlue;
{$ENDIF}
end;

destructor ThDlg.Destroy;
begin

  inherited Destroy;
end;

procedure ThDlg.SetButton(Buttons: TMsgDlgButtons);
var wd : integer;
begin
  p2.DestroyComponents;
  wd := 10;
  if mbOK in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ตกลง';
      ModalResult := mrOK;
      Default := true;
      Parent := p2;
      SetBounds(wd,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbYes in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ใช่';
      ModalResult := mrYes;
      Default := true;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbNo in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ไม่ใช่';
      ModalResult := mrNo;
      Cancel := true;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbCancel in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ยกเลิก';
      ModalResult := mrCancel;
      Cancel := true;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbIgnore in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ไม่สนใจ';
      ModalResult := mrIgnore;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbRetry in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ลองใหม่';
      ModalResult := mrRetry;
      Default := true;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbAbort in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ล้มเหลว';
      ModalResult := mrAbort;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbAll in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ทั้งหมด';
      ModalResult := mrAll;
      Default := true;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbYesToAll in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ใช่ทั้งหมด';
      ModalResult := mrYesToAll;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  if mbNoToAll in Buttons then
    with TMySpeedButton.Create(p2) do
    begin
      Caption := 'ไม่ใช่ทั้งหมด';
      ModalResult := mrNoToAll;
      Parent := p2;
      SetBounds(wd+10,15,75,26);
      wd := wd + 85;
      OnClick := MyOnClick;
    end;
  p2.Width := wd+10;
  if p2.width > p1.Width then
  begin
    p2.Left := 0;
    f1.Width := p2.Width;
    p1.Width := f1.width - 2*p1.Left-5;
  end
  else begin
    // set default
    f1.width := 350;
    p1.width := f1.width - 2*p1.Left-5;
    p2.Left := (f1.Width - p2.Width) div 2;
  end;
  f1.Position := poDesktopCenter;
end;

procedure ThDlg.MyOnClick(Sender: TObject);
begin
  btn.ModalResult := TMySpeedButton(Sender).ModalResult;
  btn.Click;
end;

procedure ThDlg.SetButton(Buttons: TMsgDlgButtons; dummy: smallint);
begin

end;

procedure ThDlg.SetIcon(DlgType: TMsgDlgType);
begin
  if DlgType = mtWarning then
    image.Picture.Icon.Handle := loadicon(0,IDI_EXCLAMATION)
  else if DlgType = mtError	 then
    image.Picture.Icon.Handle := loadicon(0,IDI_HAND)
  else if DlgType = mtInformation then
    image.Picture.Icon.Handle := loadicon(0,IDI_ASTERISK)
  else if DlgType = mtConfirmation then
    image.Picture.Icon.Handle := loadicon(0,IDI_QUESTION);

  f1.Caption := Application.Title + ' : ';
  if DlgType = mtWarning then f1.Caption := f1.Caption + 'คำเตือน.'
  else if DlgType = mtError then f1.Caption := f1.Caption + 'แจ้งข้อผิดพลาด.'
  else if DlgType = mtInformation then f1.Caption := f1.Caption + 'บอกต่อ.'
  else if DlgType = mtConfirmation then f1.Caption := f1.Caption + 'ยืนยัน.';
end;

procedure ThDlg.MyKeyPress(Sender: TObject; var Key: Char);
var i : smallint;
begin
  for i := 0 to p2.ComponentCount -1 do
  if p2.Components[i] is TMySpeedButton then
  begin
    if (Key = #27) and (TMySpeedButton(p2.Components[i]).ModalResult in [mrNo,mrCancel]) then
    begin
      Btn.ModalResult := TMySpeedButton(p2.Components[i]).ModalResult;
      Key := #0;
    end
    else if (Key = #13) and (TMySpeedButton(p2.Components[i]).ModalResult in [mrOK,mrYes]) then
    begin
      Btn.ModalResult := TMySpeedButton(p2.Components[i]).ModalResult;
      Key := #0;
    end
  end;
  if Key = #0 then Btn.Click;
end;


function Colon2Comma(s: string): string;
var i : smallint;
begin
  for i := 1 to length(s) do
  if s[i] = ':' then s[i] := ',';
  Colon2Comma := s;
end;

function Colon2Space(s: string): string;
var i : smallint;
begin
  for i := 1 to length(s) do
  if s[i] = ':' then s[i] := ' ';
  Colon2Space := s;
end;

procedure DecodeMyDate(_date : TDateTime;var year,month,day : Word);
begin
  DecodeDate(_date,year,month,day);
  if year < 2500 then
  year := year + 543;
end;

function EncodeMyDate(year,month,day : Word): TDateTime;
begin
  if year > 2500 then year := year - 543;
  Result := EncodeDate(year,month,day);
end;

function ExtractThaiDate(d: TDateTime): string;
var dd,mm,yy : word;
begin
  decodeDate(d,yy,mm,dd);
  Result := inttostr(dd) +' '+ ThaiMonth(mm) + ' ' + inttostr(yy+543);
end;

{ TMySpeedButton }

constructor TMySpeedButton.Create(AOwner: TComponent);
begin
  inherited;
  Flat := true;
end;

end.




