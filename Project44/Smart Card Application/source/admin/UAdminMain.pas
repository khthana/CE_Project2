unit UAdminMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp,registry, Menus, StdCtrls;

type

  TMainfrm = class(TForm)
    ServerSocket1: TServerSocket;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    CardInfoMenu: TMenuItem;
    IncBalMenu: TMenuItem;
    RateMenu: TMenuItem;
    LoginMenu: TMenuItem;
    LogoutMenu: TMenuItem;
    ServerMemo: TMemo;
    LockMenu: TMenuItem;
    lockallMenu: TMenuItem;
    unlockMenu: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    Function RegRead (Mykey,MyField : String) : string;
    Procedure RegWrite (Mykey,MyField,MyValue : String);
    procedure RateMenuClick(Sender: TObject);
    procedure LoginMenuClick(Sender: TObject);
    procedure LogoutMenuClick(Sender: TObject);
    procedure CardInfoMenuClick(Sender: TObject);
    procedure IncBalMenuClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure echo(content:shortstring);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure lockallMenuClick(Sender: TObject);
    procedure unlockMenuClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    connectsocket:TcustomWinSocket;
  public
    { Public declarations }

  end;

var
  login:boolean;
  Mainfrm: TMainfrm;

implementation
uses UChangeRate,UloginAdmin,UCardInfo, UIncBal;
{$R *.dfm}

procedure TMainfrm.echo(content:shortstring);
begin
  servermemo.Lines.Add(content);
end;

Function TMainfrm.RegRead (Mykey,MyField : String) : string;
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
      RegWrite('Software\config\register\','rate','10');
    end;
   end 
   else 
   //There is a big error if we get an errormessage by 
   //opening/creating the key
   ShowMessage('Error opening/creating key : '+MyKey);
   CloseKey; 
 end; 
end;

Procedure TMainfrm.RegWrite (Mykey,MyField,MyValue : String);
Var
  Reg : TRegistry; 
begin 
  //Create the Object 
  Reg := TRegistry.Create; 
  with Reg do 
  begin 
  //Sets the destination for our requests 
  RootKey:=HKEY_LOCAL_MACHINE; 
  //Check if we can open our key, if the key doesn't exist, we create it 
  if OpenKey(MyKey,true) then 
    //We don't need to check if the field is available because the 
    //field is created by writing the value 
    Writestring(MyField,MyValue) 
  else 
   //There is a big error if we gets an errormessage by 
   //opening/creating the key 
   ShowMessage('Error opening/creating key : '+MyKey); 
   CloseKey; 
 end; 
end;

procedure TMainfrm.FormCreate(Sender: TObject);
begin
  login:=false;
  serversocket1.Port:=4000;
  serversocket1.Open;

end;

procedure TMainfrm.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  connectsocket:=socket;
  connectsocket.SendText(RegRead('Software\config\register','rate'));
end;

procedure TMainfrm.RateMenuClick(Sender: TObject);
begin
  if login then
    ChangeRatefrm.Show
  else showmessage('กรุณาทำการล็อกอินก่อน');
end;

procedure TMainfrm.LoginMenuClick(Sender: TObject);
begin
  loginfrm.Show;
end;

procedure TMainfrm.LogoutMenuClick(Sender: TObject);
begin
  login:=false;
  Mainfrm.Caption:='Logoff';
end;

procedure TMainfrm.CardInfoMenuClick(Sender: TObject);
begin
   if login then
     CardInfofrm.Show
   else showmessage('กรุณาทำการล็อกอินก่อน');
end;

procedure TMainfrm.IncBalMenuClick(Sender: TObject);
begin
   if login then
     IncBalfrm.Show
   else showmessage('กรุณาทำการล็อกอินก่อน');
end;

procedure TMainfrm.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ServerMemo.Lines.Add('client connect');
end;

procedure TMainfrm.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  servermemo.Lines.Add('client disconnect');
end;

procedure TMainfrm.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var s : shortString; p : pchar; size : integer;
begin
  fillchar( s, sizeof( shortString ), 0 ); p:=@s[1];
  size:=socket.ReceiveBuf( p^, sizeof( shortString ) );
  s[0]:=chr(size);
  Echo( '.....:>'+s+'<' );
end;

procedure TMainfrm.lockallMenuClick(Sender: TObject);
begin
   if login then
    connectsocket.Sendtext('lock');
end;

procedure TMainfrm.unlockMenuClick(Sender: TObject);
begin
   if login then
    connectsocket.Sendtext('unlock');
end;

procedure TMainfrm.Button1Click(Sender: TObject);
begin
  ServerMemo.Clear;
end;

end.
