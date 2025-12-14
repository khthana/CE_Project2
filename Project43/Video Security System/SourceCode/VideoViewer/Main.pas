unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Menus, ExtCtrls, ComCtrls, jpeg, ScktComp, Unit1,
  CommInt, Unit2;

const
   MaxPixelCount = 19200;// Arbitrary large constant for any bitmap

type
   TRGBTripleArray  = ARRAY[0..MaxPixelCount-1] OF TRGBTriple;
   pRGBTripleArray = ^TRGBTripleArray;
  TForm1 = class(TForm)
    Btn_Right: TBitBtn;
    Btn_Left: TBitBtn;
    Btn_Play: TBitBtn;
    MainMenu: TMainMenu;
    Btn_Pause: TBitBtn;
    Btn_Record: TBitBtn;
    Stb: TStatusBar;
    Edt_date: TEdit;
    Panel1: TPanel;
    Image: TImage;
    Timer1: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Comm1: TComm;
    Memo1: TMemo;
    Timer5: TTimer;
    Panel2: TPanel;
    Btn_tPlay: TBitBtn;
    Btn_Connect: TButton;
    Btn_Setting: TButton;
    About2: TMenuItem;
    Btn_Disconnect: TButton;
    Timer7: TTimer;
    Timer6: TTimer;
    Timeout: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Btn_PlayClick(Sender: TObject);
    procedure Btn_PauseClick(Sender: TObject);
    procedure Btn_RecordClick(Sender: TObject);
    procedure Btn_LeftClick(Sender: TObject);
    procedure Btn_RightClick(Sender: TObject);
    procedure Btn_ConnectClick(Sender: TObject);
    procedure Btn_SettingClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure TimeoutTimer(Sender: TObject);
    procedure Btn_DisconnectClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    str : string;
    PROCEDURE UpdateYUV;
  end;

var
  FormMain : TForm1;
  PicData : array[0..20000] of Byte;
  Stream : Tfilestream;
  aclSendData : tdata;//array[0..500] of Byte;

implementation

uses Bluetooth, SaveFile;

{$R *.DFM}

PROCEDURE TForm1.UpdateYUV;
    CONST
      YRowCount     = 120;
      YColumnCount  = 160;
    VAR
      Bitmap      :  TBitmap;
      JPEGImage   :  TJPEGImage;
      BufferY     :  ARRAY[0..YColumnCount-1]    OF BYTE;
      Filename    :  STRING;
      FilePointer :  INTEGER;
      i           :  INTEGER;
      InFileY     :  STRING;          // 'YVU12.Stream' or 'YVU9.Stream'
      j           :  INTEGER;
      OutFile     :  STRING;          // 'WeatherLady' or 'NewsGuy'
      Row         :  pRGBTripleArray;
      StreamY     :  TFileStream;
      Y           :  BYTE;
      count       : Integer;

  BEGIN
    Y := 0;
    Bitmap := TBitmap.Create;
    JPEGImage := TJPEGImage.Create;
    TRY
      Bitmap.Width  := YColumnCount;
      Bitmap.Height := YRowCount;
      Bitmap.PixelFormat := pf24Bit;

      FOR j := 0 TO YRowCount-1 DO
      BEGIN
        Row := Bitmap.Scanline[j];
        FOR i := 0 TO YColumnCount-1 DO
        BEGIN
          Y := PicData[(160*j)+i];
          WITH Row[i] DO
          BEGIN
             rgbtBlue  := Y;
             rgbtGreen := Y;
             rgbtRed   := Y;
          END
        END
      END;
      //Image.Picture.Graphic := Bitmap;
      JPEGImage.Assign(Bitmap);
      JPEGImage.CompressionQuality := FormSaveFile.SpinEdit2.Value;
      Image.Picture.Graphic := JPEGImage;
    FINALLY
      Bitmap.Free;
      JPEGImage.Free;
    END;
  Image.Width  := YColumnCount*2;
  Image.Height := YRowCount*2;
  Image.Stretch := true;
END {UpdateYUV};

procedure TForm1.Timer1Timer(Sender: TObject);
var
   s1,s2 : string;
begin
   s1 := DateTimeToStr(Now);
   s2 := FormatDateTime('dd/mm/yyyy hh:mm:ss ',StrToDateTime(s1));
   Edt_date.Text := s2;
   if con_complete = FALSE then
   Stb.Panels.Items[0].Text := 'Not Connect';
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
   FormUnit1.Timer;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
   i : integer;
begin
   if (con_complete = TRUE) and (getPicComplete=TRUE) then
      begin
         UpdateYUV;
         getPicComplete := FALSE;
      end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
   s1,s2 : string;
begin
   s1 := DateTimeToStr(Now);
   s2 := FormatDateTime('"D"ddmmyy"T"hhmmss ',StrToDateTime(s1));
   Image.Picture.Graphic.SaveToFile(FormSaveFile.directory+'\'+s2+'.jpg');
   memo1.Lines.Add(FormSaveFile.directory+'\'+s2+'.jpg');
   Stb.Panels.Items[1].Text := 'Save... '+FormSaveFile.directory+'\'+s2+'.jpg';
   {FormUnit2.Usleep(2000000);
   Stb.Panels.Items[1].Text := '';}
end;

procedure TForm1.Btn_PlayClick(Sender: TObject);
begin
   //repeat
   //until getPicComplete = TRUE;
   //if getPicComplete = TRUE and picLine = 0 then
   if con_complete = TRUE then
   begin
      aclSendData[0] := 65;  //'A'
      aclSendData[0] := 65;
      aclSendData[0] := 65;
      aclSendData[0] := 65;
      aclSendData[0] := 65;
      FormUnit2.send_acl_packet(aclSendData,5);
      Timer4.Enabled := TRUE;
      Timer5.Enabled := FALSE;
      Btn_Play.Enabled := FALSE;
      Btn_tPlay.Visible := TRUE;
      Btn_tPlay.BringToFront;
      Stb.Panels.Items[0].Text := 'PLAY';
   end;
end;

procedure TForm1.Btn_PauseClick(Sender: TObject);
begin
   Timer4.Enabled := FALSE;
   aclSendData[0] := 90; //'Z'
   aclSendData[0] := 90; //'Z'
   aclSendData[0] := 90; //'Z'
   aclSendData[0] := 90; //'Z'
   aclSendData[0] := 90; //'Z'
   FormUnit2.send_acl_packet(aclSendData,5);
   Btn_Play.Enabled := TRUE;
   Btn_tPlay.SendToBack;
   Timer5.Enabled := FALSE;
   Stb.Panels.Items[0].Text := 'PAUSE';
end;

procedure TForm1.Btn_RecordClick(Sender: TObject);
begin
   if not(Btn_Play.Enabled) then
   begin
      Stb.Panels.Items[0].Text := 'RECORD';
      Timer5.Enabled := TRUE;
   end;
end;

procedure TForm1.Btn_LeftClick(Sender: TObject);
begin
   aclSendData[0] := 76; //'L'
   aclSendData[0] := 76; //'L'
   aclSendData[0] := 76; //'L'
   aclSendData[0] := 76; //'L'
   aclSendData[0] := 76; //'L'
   FormUnit2.send_acl_packet(aclSendData,5);
end;

procedure TForm1.Btn_RightClick(Sender: TObject);
begin
   aclSendData[0] := 82; //'R'
   aclSendData[0] := 82; //'R'
   aclSendData[0] := 82; //'R'
   aclSendData[0] := 82; //'R'
   aclSendData[0] := 82; //'R'
   FormUnit2.send_acl_packet(aclSendData,5);
end;

procedure TForm1.Btn_ConnectClick(Sender: TObject);
begin
   Stb.Panels.Items[0].Text := 'Connection : In process ...';
   Btn_Connect.Enabled := FALSE;
   FormUnit1.Click;
   Timer3.Enabled := TRUE;
   Timeout.Enabled := TRUE;
end;

procedure TForm1.Btn_SettingClick(Sender: TObject);
begin
   FormSaveFile.ShowModal;
end;

procedure TForm1.About2Click(Sender: TObject);
begin
   ShowMessage('                     Video Viewer V1.0'+#13#10+#13#10+
   '  By  '+'Mr.Norrakit Kuhaapirom'+#13#10+
   '        Mr.Itsavapan Eiamprasertkul'+#13#10+
   '        Mr.Anirut Poksuk'+#13#10+#13#10+
   '  Advisor Assit.Prof. Apinetr Unakul'+#13#10+#13#10+
   '                           Computer Engineering'+#13#10+
   '  King Mongkut''s Institute of Technology Ladkrabang');
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
   if con_complete = TRUE then
   begin
      Timer6.Enabled := FALSE;
      Timer7.Enabled := TRUE;
      Timeout.Enabled := FALSE;
      Btn_Disconnect.Enabled := TRUE;
   end;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
begin
   Timer7.Enabled := FALSE;
   Stb.Panels.Items[0].Text := 'Connect successfully !';
end;

procedure TForm1.TimeoutTimer(Sender: TObject);
begin
   Timeout.Enabled := FALSE;
   if con_complete = FALSE then
   begin
      Showmessage('Press button connect again !');
      Btn_Connect.Enabled := TRUE;
      Stb.Panels.Items[0].Text := '';
   end;
end;

procedure TForm1.Btn_DisconnectClick(Sender: TObject);
begin
   Timer3.Enabled := FALSE;
   FormUnit2.Disconnection;
   Btn_Connect.Enabled := TRUE;
   Btn_Disconnect.Enabled := FALSE;
   Stb.Panels.Items[0].Text := 'Disconnect complete !';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
   x : integer;
begin
   if discon_complete = TRUE then
   begin
      Comm1.Close;
      Stb.Panels.Items[0].Text := 'Disconnect complete !';
      Btn_Connect.Enabled := TRUE;
      Btn_Disconnect.Enabled := FALSE;
   end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if con_complete = TRUE then
   begin
      Timer3.Enabled := FALSE;
      FormUnit2.Disconnection;
   end;
end;

end.
