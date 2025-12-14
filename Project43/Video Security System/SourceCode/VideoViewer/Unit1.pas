unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CommInt, ExtCtrls, Unit2;

type
  pktStates = (WAIT_FOR_PACKET_TYPE,WAIT_FOR_EVENT_TYPE,WAIT_FOR_EVENT_LENGTH,
              WAIT_FOR_EVENT_PARAM,WAIT_FOR_ACL_CON_FLAG1,WAIT_FOR_ACL_CON_FLAG2,
              WAIT_FOR_ACL_HCI_LEN1,WAIT_FOR_ACL_HCI_LEN2,WAIT_FOR_ACL_L2CAP_LEN1,
              WAIT_FOR_ACL_L2CAP_LEN2,WAIT_FOR_ACL_L2CAP_CID1,
              WAIT_FOR_ACL_L2CAP_CID2,WAIT_FOR_ACL_DATA);
  TFormUnit1 = class(TForm)

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Click;
    procedure Timer;
  end;

var
  FormUnit1 : TFormUnit1;
  state : pktStates;
  buf   : array [0..1023] of byte;
  STOP  : boolean;
  packetType  : byte;
  eventType   : byte;
  eventLen    : byte;
  posParam    : byte;
  eventParam  : array [0..255] of byte;
  aclDataBuf  : tdata;
  aclDataBuf2 : array [0..599] of byte;
  aclDataLen  : integer;
  getPacketResult,getAclResult : boolean;
  new_bd   : array [0..5] of byte;
  con_complete : boolean;
  discon_complete : boolean;

  j : integer;
  dataLen,strLen : integer;
  x : integer;

  a,i,c,res,num,ext  : integer;
  count,count2 : integer;
  picLine : integer;
  dataOverallLen : integer;
  aclDataTemp : array [0..19200] of byte;
  getPicComplete : boolean;

implementation
uses main;

procedure TFormUnit1.Click;
begin
   FormMain.Comm1.Open;
   FormMain.Comm1.SetRTSState(true);
   FormMain.Comm1.SetDTRState(true);

   picLine := 0;
   dataOverallLen := 0;
   getPicComplete := FALSE;

   FormMain.Memo1.Lines.Add('Reset');
   FormUnit2.usleep(2000000);
   FormUnit2.init_stack(57600);
   con_complete := FALSE;
   discon_complete := FALSE;
   FormUnit2.create_connection;
   FormUnit2.usleep(1000000);
   state := WAIT_FOR_PACKET_TYPE;
   posParam := 0;
   getPacketResult := FALSE;
   getAclResult := FALSE;
end;

procedure TFormUnit1.Timer;
begin
   i:=FormMain.Comm1.read(buf[0],1024);
      if (i>0) then
      begin
         for count := 0 to i-1 do
         begin
            case state of
            WAIT_FOR_PACKET_TYPE :
               begin
                  if (buf[count] = EVENT_PKT) then
                  begin
                     packetType := EVENT_PKT;
                     state := WAIT_FOR_EVENT_TYPE;
                  end
                  else if (buf[count] = ACL_PKT) then
                  begin
                     packetType := ACL_PKT;
                     state := WAIT_FOR_ACL_CON_FLAG1;
                  end;
               end;

             WAIT_FOR_EVENT_TYPE :
               begin
                  if (buf[count]= INQUIRY_COMPLETE)
                  then eventType := INQUIRY_COMPLETE
                  else if (buf[count] = INQUIRY_RESULT)
                  then eventType := INQUIRY_RESULT
                  else if (buf[count] = CONNECTION_COMPLETE)
                  then eventType := CONNECTION_COMPLETE
                  else if (buf[count] = CONNECTION_REQUEST)
                  then eventType := CONNECTION_REQUEST
                  else if (buf[count] = DISCONNECTION_COMPLETE)
                  then eventType := DISCONNECTION_COMPLETE
                  else if (buf[count] = COMMAND_COMPLETE)
                  then eventType := COMMAND_COMPLETE
                  else if (buf[count] = COMMAND_STATUS)
                  then eventType := COMMAND_STATUS;
                  state := WAIT_FOR_EVENT_LENGTH;
               end;

            WAIT_FOR_EVENT_LENGTH :
               begin
                  eventLen := buf[count];
                  state := WAIT_FOR_EVENT_PARAM;
               end;

            WAIT_FOR_EVENT_PARAM :
               begin
                  eventParam[posParam] := buf[count];
                  posParam := posParam+1;
                  if (posParam=eventLen) then
                  begin
                     getPacketResult := True;
                     state := WAIT_FOR_PACKET_TYPE;
                     posParam := 0;
                  end;
               end;

            WAIT_FOR_ACL_CON_FLAG1 :
                  state := WAIT_FOR_ACL_CON_FLAG2;

            WAIT_FOR_ACL_CON_FLAG2 :
                  state := WAIT_FOR_ACL_HCI_LEN1;

            WAIT_FOR_ACL_HCI_LEN1 :
                  state := WAIT_FOR_ACL_HCI_LEN2;

            WAIT_FOR_ACL_HCI_LEN2 :
                  state := WAIT_FOR_ACL_L2CAP_LEN1;

            WAIT_FOR_ACL_L2CAP_LEN1 :
               begin
                  aclDataLen := buf[count];
                  state := WAIT_FOR_ACL_L2CAP_LEN2;
               end;

            WAIT_FOR_ACL_L2CAP_LEN2 :
               begin
                  aclDataLen := aclDataLen + (buf[count] * 256);
                  state := WAIT_FOR_ACL_L2CAP_CID1;
               end;

            WAIT_FOR_ACL_L2CAP_CID1 :
                  state := WAIT_FOR_ACL_L2CAP_CID2;

            WAIT_FOR_ACL_L2CAP_CID2 :
                  state := WAIT_FOR_ACL_DATA;

            WAIT_FOR_ACL_DATA :
               begin
                  aclDataBuf2[posParam] := buf[count];
                  posParam := posParam+1;
                  if (posParam=(aclDataLen)) then
                  begin
                     state := WAIT_FOR_PACKET_TYPE;
                     posParam := 0;
                     getAclResult := True;
                  end;
               end;
            end;

            if (getPacketResult = True)then
            begin
              if (eventType = COMMAND_COMPLETE) then
               begin
                  if (eventParam[3] = $00)then

                  {Form3.Memo1.Lines.Add('Command succeeded !')}

               end
               else if (eventType = CONNECTION_REQUEST) then
               begin

               end
               else if (eventType = CONNECTION_COMPLETE) then
               begin
                  if (eventParam[0]=$00) then
                  begin
                     FormMain.Memo1.Lines.Add('CONNECTION STATUS :'+' Successfully completed.');
                     con_complete := TRUE;
                  end;
               end
               else if (eventType = DISCONNECT) then
               begin
                  if (eventParam[0]=$00) then
                  begin
                     FormMain.Memo1.Lines.Add('DISCONNECT STATUS :'+' Successfully completed.');
                     con_complete := FALSE;
                     discon_complete := TRUE;
                  end;
               end;
               getPacketResult := FALSE;
            end;
            if (getAclResult = True) then
            begin
               for i:=0 to aclDataLen-1 do
                  {//aclDataTemp[(picLine*160)+i] := aclDataBuf2[i];}
                  picData[(picLine*160)+i] := aclDataBuf2[i];
               picLine := picLine +1;
               if(picLine>=120) then
               begin
                  picLine := 0;
                  getPicComplete := TRUE;
               end;
               getAclResult := FALSE;
            end;
         end;
      end;

      {if (con_complete = TRUE) and (getPicComplete=TRUE) then
      begin
         Form3.Memo1.Lines.Add('Finish !');
         for i:=0 to 19199 do
            //Form3.Memo1.Lines.Add(inttostr(aclDataTemp[i]));
            Form3.Memo1.Lines.Add(inttostr(picData[i]));
            getPicComplete := FALSE;
      end;}
end;
end.
