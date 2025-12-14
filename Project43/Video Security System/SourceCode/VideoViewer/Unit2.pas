unit Unit2;

interface
uses Forms;

const
ACL_LINK = 1;
SCO_LINK = 0;

HCI_ACL_LEN = 160;
HCI_SCO_LEN = 255;
HCI_ACL_NUM = 8;
HCI_SCO_NUM = 2;
NBR_OF_HCI_INBUFFERS = 7;
HCI_IN_SIZE = 17000;
NBR_CMD_BUFS = 10;
LINK_TO = 0;

CMD_PKT = $01;
ACL_PKT = $02;
SCO_PKT = $03;
EVENT_PKT = $04;
ERROR_PKT = $05;
NEG_PKT = $06;

INQUIRY = $01;
INQUIRY_CANCEL = $02;
CREATE_CONNECTION = $05;
DISCONNECT = $06;
HCI_ADD_SCO_LINK = $07;
ACCEPT_CONNECTION_REQUEST = $09;
REJECT_CONNECTION_REQUEST = $0A;
CHANGE_CONNECTION_PACKET_TYPE = $0F;
READ_CLOCK_OFFSET = $01F;

RESET = $03;
FLUSH = $08;
READ_STORED_LINK_KEY = $0D;
WRITE_SCAN_ENABLE = $01A;
WRITE_PAGESCAN_ACTIVITY = $01C;
WRITE_INQUIRYSCAN_ACTIVITY = $01E;
SET_HOST_CONTROLLER_TO_HOST_FLOW_CONTROL = $031;
HOST_BUFFER_SIZE = $033;
HOST_NBR_OF_COMPLETED_PACKETS = $035;
READ_LINK_SUPERVISON_TO = $036;
WRITE_LINK_SUPERVISON_TO = $037;

READ_BUFFER_SIZE = $05;
READ_BD_ADDR = $09;

HCI_LC = $04;
HCI_LP = $08;
HCI_HC = $0c;
HCI_IP = $10;
MANUFACTURER_SPEC = $03f;

INQUIRY_COMPLETE = $01;
INQUIRY_RESULT = $02;
CONNECTION_COMPLETE = $03;
CONNECTION_REQUEST = $04;
DISCONNECTION_COMPLETE = $05;
COMMAND_COMPLETE = $0E;
COMMAND_STATUS = $0F;
FLUSH_OCCURRED = $011;
NBR_OF_COMPLETED_PACKETS = $013;
MODE_CHANGE = $014;
RETURN_LINK_KEYS = $015;
DATA_BUFFER_OVERFLOW = $01A;
MAX_SLOTS_CHANGE = $01B;
READ_CLOCK_OFFSET_COMPLETE = $01C;
CONNECTION_PACKET_TYPE_CHANGED = $01D;
QOS_VIOLATION = $01E;

L2CAP_FRAME_START = $02;
L2CAP_FRAME_CONT = $01;

HCI_HDR_LEN = 1;
ACL_HDR_LEN = 4;
SCO_HDR_LEN  = 3;
CMD_HDR_LEN = 3;
EVENT_HDR_LEN = 2;

DIGI_EVENT = $0FF;

DM1 = $0008;
DM3 = $0400;
DM5 = $4000;
DH1 = $0010;
DH3 = $0800;
DH5 = $8000;

UNKNOWN_HW = 0;
DIGIDONGLE = 1;
ERICSSON_MODULE = 2;

INQUIRY_SCAN_ENABLE = 1;
PAGE_SCAN_ENABLE = 2;

type
   tdata = array [0..500] of byte;
   TFormUnit2 = class(TForm)
    private
    { Private declarations }
    public
    { Public declarations }
    procedure ReadBdAddr;
    procedure Write_scan_enable;
    procedure Usleep(time : integer);
    procedure Init_stack(spd : integer);
    procedure Create_connection;
    procedure Disconnection;
    procedure send_acl_packet(data : tdata;len : integer);
  end;

var
   FormUnit2 : TFormUnit2;
implementation
uses Unit1,main;
{**************************************************************}
procedure TFormUnit2.ReadBdAddr;
var
   cPkt : array [0..270] of byte;
begin
   cPkt[0] := CMD_PKT;
   cPkt[1] := READ_BD_ADDR;
   cPkt[2] := HCI_IP;
   cPkt[3] := 0;
   FormMain.Comm1.Write(cPkt[0],4);
end;

procedure TFormUnit2.Write_scan_enable;
var
   len : word;
   tmp  : cardinal;
   cPkt : array [0..269] of byte;
begin
   cPkt[0] := CMD_PKT;
   cPkt[1] := $1A;
   cPkt[2] := $0C;
   cPkt[3] := 1;
   cPkt[4] := 1; {enable}
   len := cPkt[3]+CMD_HDR_LEN+HCI_HDR_LEN;
   tmp:=FormMain.Comm1.write(cPkt[0],5);
   usleep(1000000);
end;

procedure TFormUnit2.Usleep(time : integer);
var
   i,j : integer;
begin
   for j:=1 to 250 do
   for i:=1 to time do
      begin end;
end;
{**************************************************************}
procedure TformUnit2.Init_stack(spd : integer);
begin
   write_scan_enable;
   usleep(10000);
end;
{**************************************************************}
procedure TFormUnit2.Create_connection;
var
   tmp,len : cardinal;
   psrm : byte;
   psm : byte;
   rol_sw : cardinal;
   cPkt : array [0..269] of byte;
begin
   psrm := $00;
   psm :=$00;
   rol_sw :=$00;
   cPkt[0] := CMD_PKT;
   cPkt[1] := $05;
   cPkt[2] := $04;
   cPkt[3] := 13;
   cPkt[4] := $33;
   cPkt[5] := $33;
   cPkt[6] := $33;
   cPkt[7] := $33;
   cPkt[8] := $33;
   cPkt[9] := $33;
   cPkt[10] := $0018;
   cPkt[11] := $00cc;
   cPkt[12] := psrm;
   cPkt[13] := psm;
   cPkt[14] := $00;
   cPkt[15] := $00;
   cPkt[16] := rol_sw;
   len := cPkt[3]+CMD_HDR_LEN+HCI_HDR_LEN	;
   tmp := FormMain.Comm1.write(cPkt[0],len);
end;

procedure TFormUnit2.Disconnection;
var
   tmp,len : cardinal;
   cPkt : array [0..10] of byte;
begin
   cPkt[0] := CMD_PKT;
   cPkt[1] := $06;
   cPkt[2] := $04;
   cPkt[3] := 3;
   cPkt[4] := $01;
   cPkt[5] := $00;
   cPkt[6] := $13;
   len := cPkt[3]+CMD_HDR_LEN+HCI_HDR_LEN;
   tmp := FormMain.Comm1.Write(cPkt[0],len);
   FormMain.Comm1.Close;
end;


procedure TFormUnit2.send_acl_packet(data : tdata ;len : integer);
var
   i,tmp : integer;
   aclData : array [0..600] of byte;
begin
   aclData[0] := ACL_PKT;
   aclData[1] := $01;
   aclData[2] := $20;
   for i:=0 to len-1 do aclData[9+i] := data[i];
   aclData[5] := len mod 256;
   aclData[6] := len div 256;
   aclData[7] := $41;
   aclData[8] := $00;
   len := len+4;
   aclData[3] := len mod 256;
   aclData[4] := len div 256;
   len := len+5;
   tmp := FormMain.Comm1.Write(aclData[0],len);
end;

end.

