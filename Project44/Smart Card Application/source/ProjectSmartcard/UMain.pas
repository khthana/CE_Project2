unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Registry, Menus, CoolTrayIcon,USCardInterface,
  ScktComp,TLHELP32;

type

  Prior = (Low,High);
  Configure = Record
           AdminName : String[20];
           AdminPwd : String[20];
           Priority : Prior;
           TCost : integer;
           end; //end config record
  ConfigFile = File of Configure;

  CardInfo = Record
             Serial : String[8];
             Name : String[20];
             Surname : String[20];
             Tel : string[9];
             Ext : string[4];
             Credit : Longint;
             DateExpire : String[8];
             Address:string[92];
             end;
  CardFile = File of CardInfo;

  TMainfrm = class(TForm)
    CreditTimer: TTimer;
    WriteReg: TTimer;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    Checkcredit1: TMenuItem;
    Configure1: TMenuItem;
    CloseProg: TMenuItem;
    ClientSocket1: TClientSocket;


    procedure DecCredit(Sender: TObject);
    procedure init(Sender: TObject);
    procedure WriteRegTimerTimer(Sender: TObject); //write registry for startup (1 sec)
    procedure CheckCredit(Sender: TObject);
    procedure Configure1Click(Sender: TObject);
    procedure CloseProgClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure TerminateProg();



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Date1:TDateTime;
  warned,posted,AdminLock:boolean;
  scard:TScard;
  CfgRec : Configure;
  Cfg : ConfigFile;
  Mainfrm: TMainfrm;
  CardRec : CardInfo;
  Smartcard : CardFile;
  //TCost,Credit : integer;
  procedure initial();
  //procedure enableSystemKey();
  function windir : string;
implementation
 uses ULockForm,UCreditDisplay, UCardInfo, PwdAdminDlg;
 function RegisterServiceProcess (dwProcessID, dwType: DWord) : DWord; stdcall; external 'KERNEL32.DLL';
 {$R *.dfm}

//Return Windows folder
function windir :string;
var SWindowsDir : string;
    PWindowsDir : array[0..255] of Char;
begin
  try
    getWindowsDirectory(PWindowsDir,255);
    SWindowsDir := strPas(PWindowsDir);
    Result := SWindowsDir;
  except end;
end;

procedure TMainfrm.TerminateProg();
VAR aSnapshotHandle : THandle;
    aProcessEntry32 : TProcessEntry32;
    i       : integer;
    bLoop   : BOOL;
    p,pa,appname:string;
    Ret : BOOL; 
    PrID : integer; //processidentifier
    Ph : THandle;  //processhandle
begin
  appname:=ExtractFileName(application.ExeName);
  aSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  aProcessEntry32.dwSize:=Sizeof(aProcessEntry32);
  bLoop:=Process32First(aSnapshotHandle,aProcessEntry32);
  while integer(bLoop) <>0 do
  begin
    p:=ExtractFileName(aProcessEntry32.szExeFile);
    pa:=ExtractFilePath(aProcessEntry32.szExeFile);
    if (pa<>'C:\WINDOWS\SYSTEM\') and (p<>'EXPLORER.EXE') and
        (p<>'TASKMON.EXE') and (p<>'LOADQM.EXE') and (p<>appname) and
        (p<>'ADMIN.EXE') then
    begin
      PrID:=StrToInt('$'+IntToHex(aProcessEntry32.th32ProcessID,4));
      Ph:=OpenProcess(1,BOOL(0),PrID);
      Ret:=TerminateProcess(Ph,0);

    end;
    bLoop:=Process32Next(aSnapshotHandle,aProcessEntry32);
  end; 
  CloseHandle(aSnapshotHandle); 

end;


Function RegRead (Mykey,MyField : String) : string;
Var 
  Reg : TRegistry; 
begin 
//Create the Object 
Reg := TRegistry.Create; 
with Reg do 
 begin 
  //Sets the destination for our requests 
  RootKey:=HKEY_LOCAL_MACHINE; 
  //Check if whe can open our key, if the key dosn't exist, we create it
  if OpenKey(MyKey,true) then 
   begin 
    //Is our field availbe 
    if ValueExists(MyField) then 
      //Read the value from the field
       result := ReadString(MyField)
    else
    begin
      ShowMessage(MyField+' does not exists under '+MyKey);
      result:='not exist';
    end;
   end 
   else
   //There is a big error if we get an errormessage by 
   //opening/creating the key 
   ShowMessage('Error opening/creating key : '+MyKey);
   CloseKey;
 end; 
end;


procedure Initial();
var tmp:string;
begin
   

  RegisterServiceProcess(GetCurrentProcessID,1);//hide application from (CTRL+ALT+DEL)

  cfgrec.AdminName:='s1014089';
  cfgrec.AdminPwd:='eton';
  scard:=tscard.Create;
  posted:=false;
  warned:=false;


end;

procedure TMainfrm.DecCredit(Sender: TObject);
var st,tmp,mess2srv:string;  code,difference,i:integer;   r:real; p:pchar; d1,d2,m1,m2,y1,y2:word;
begin
if not adminlock then
   begin
     if not scard.IsConnect then
     begin
       scard.Create;
       scard.Connect(1);
       if scard.CardIn and scard.Reset then
       begin
         if scard.CardValid then
         begin
           cardrec.Serial:=scard.GetCardSerial;
           cardrec.DateExpire:=scard.GetDateExpire;
           d1:=strtoint(copy(cardrec.DateExpire,1,2));
           m1:=strtoint(copy(cardrec.DateExpire,4,2));
           y1:=strtoint(copy(cardrec.DateExpire,7,2))+2500-543;
           date1 := EncodeDate(y1, m1, d1);
           difference := trunc(date1) - trunc(date);
           val(scard.GetBalance,cardrec.Credit,code);
           if (cardrec.Credit>=cfgrec.TCost) and (cfgrec.TCost>=0) and
              (difference>=0) then
           begin
             warned:=false;
             mess2srv:=cardrec.Serial+' connect';
             p:=@mess2srv[1];
             clientsocket1.Socket.Sendbuf(p^,length(mess2srv));
             posted:=false;
           end;
         end;
       end;

     end;
     if (scard.CardIn and scard.Reset)  then
     begin
       if (scard.CardValid) then
       begin
         difference := trunc(date1) - trunc(date);
         val(scard.GetBalance,cardrec.Credit,code);
         if (cardrec.Credit>=cfgrec.TCost) and (cfgrec.TCost>=0) and
            (difference>=0) then
         begin
           LockForm.Close;

           cardrec.credit:=cardrec.credit-cfgrec.tcost;
           str(cardrec.Credit:6,st);
           for i:=1 to 6 do
             if st[i]=' ' then
               st[i]:='0';

           scard.Sendcommand('01 FF 00 00 00 05 02 61'+st);
         end;
       end
       else //cardvalid
       begin
         LockForm.Label1.Caption:='บัตรไม่ถูกต้อง';
         cardrec.Credit:=0;
       end;
     end
     else //cardin and reset
     begin
       cardrec.Credit:=0;
       if not posted then
       begin
         mess2srv:=cardrec.Serial+' disconnect';
         p:=@mess2srv[1];
         clientsocket1.Socket.Sendbuf(p^,length(mess2srv));
         posted:=true;
       end;
     end;
     CreditDisplay.Caption:=cardrec.Name;
     r:=cardrec.credit/100;
     str(r:7:2,tmp);
     CreditDisplay.CreditLabel.Caption := 'ยอดเงินคงเหลือ = '+ tmp+'  บาท';
     if not Pass then
     begin
       if (cardrec.Credit<500) and (cardrec.Credit>0)  then
       begin
         if not warned then
         begin
           showmessage('ยอดเงินในบัตรใกล้หมด กรุณาเซฟงานที่เปิดไว้');
           warned:=true;
         end;
       end;
       if (CardRec.Credit < cfgrec.TCost) or (difference<0) then
       begin
         scard.disconnect;
         LockForm.Show;

       end;
     end;
   end //adminlock
   else
   begin
     if not pass then
       lockform.Show
     else lockform.Close;
   end;
end;

procedure TMainfrm.init(Sender: TObject);
begin
  cfgrec.TCost:=-1;
  initial();
  AdminLock:=false;
  {if RegRead('Software\config\register','comname')<>'not exist' then
    ClientSocket1.Host:=RegRead('Software\config\register','comname')
  else ClientSocket1.Host:='NOTE';
  if RegRead('Software\config\register','port')<>'not exist' then
    ClientSocket1.Port:=strtoint(RegRead('Software\config\register','port'))
  else clientsocket1.Port:=4000;}
  ClientSocket1.Host:='Server';
  clientsocket1.Port:=4000;
  clientsocket1.Open;
  
end;



procedure TMainfrm.WriteRegTimerTimer(Sender: TObject);
var
  Reg: TRegIniFile;
begin
  Reg :=TReginifile.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\', True)
    then Reg.WriteString('Run','System32',ExtractFilePath(Application.ExeName)+ExtractFileName(Application.ExeName));
  finally
    Reg.CloseKey;
    Reg.Free;
    inherited;
  end;
end;

procedure TMainfrm.CheckCredit(Sender: TObject);
begin
    CreditDisplay.Show;
    //ShowMessage('ยอดเงินคงเหลือ = '+ IntToStr(CardRec.Credit));
end;

procedure TMainfrm.Configure1Click(Sender: TObject);
begin
  CardInfoFrm.Show;
end;

procedure TMainfrm.CloseProgClick(Sender: TObject);
begin
  AdminLoginfrm.show;
end;

procedure TMainfrm.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var s : shortString; p : pchar; size,code : integer;
begin
  fillchar( s, sizeof( shortString ), 0 ); p:=@s[1];
  size:=socket.ReceiveBuf( p^, sizeof( shortString ) );
  s[0]:=chr(size);
  if s='lock' then
    adminlock:=true
  else if s='unlock' then
    adminlock:=false
  else val(s,cfgrec.TCost,code);
end;

procedure TMainfrm.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin

  showmessage( '  Error code = '+IntToStr( errorCode ) );
end;

end.
