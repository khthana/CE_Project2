 unit FileMerge;

interface

uses
  Classes,Windows;

type
  TFileMerge = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure GetFromPhonemesQueue();
    procedure MergeFile(phone:String);
    procedure AddMemo3Lines();
    procedure setButton2Label();
    procedure setButton4Label();
    procedure EnableMemo1 ;
    procedure playSound();
    procedure setThreadFlag();
    procedure closeMedia();

  end;
type
    String4 = array [1..4]of Char;
    WaveHeader = record

        h1 : String4;        // Label "RIFF"
        h2 : Longword;           // Filesize - 8 bytes --> length field(4 bytes)
        h3 : String4;        // wave chunk identification (4 bytes)
        h4 : String4;        // format sub-chunk identification (4 bytes)
        h5 : Longword;          // length of format sub-chunk (4 byte integer)
        h6 : Smallint;          // format specifier (2 byte integer)
        h7 : Smallint;          // number of channels (2 byte integer)
        h8 : Longword;          // sample rate in Hz (4 byte integer)
        h9 : Longword;          // bytes per second (4 byte integer)
        h10 : Smallint;         // bytes per sample (2 byte integer)
        h11 : Smallint;         // bytes per channel (2 byte integer)
        h12 : String4;       // data sub-chunk identification (4 bytes)
        h13 : Longword;         // length of data sub-chunk (4 byte integer)

     end;

implementation
uses Sdimain,Dialogs,MPlayer;

type myPhone = String[10];
     phoneArray = array[1..50]of myPhone;
const path = 'C:\phoneme\phone\';
      pathDes = 'C:\TVSallFile5_2_1\';
      mixFile = 'mix.wav';

var w1:WaveHeader;
    phonemes:String;
    phone:phoneArray;
    fH1:File of WaveHeader;
    fB1:File of Byte;
    wordEnd, first, phoneEnd:boolean;
    phoneIdx:byte;


{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure FileMerge.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ FileMerge }
//---------------------------- Memo 3 ------------------------------------------

procedure TFileMerge.AddMemo3Lines();
begin
     MainForm.Memo3.Lines.Add(phone[phoneIdx]);
end;


//-------------------- Get phonemes string from queue --------------------------

procedure TFileMerge.GetFromPhonemesQueue();
begin
     phonemes:= MainForm.QueueGet();
end;

//--------------------- set Button2's label ------------------------------------
procedure TFileMerge.setButton2Label();
begin
     MainForm.Button2.Caption := '¾Ù´';
end;
//---------------------- set button 4's label ------------------------------
procedure TFileMerge.setButton4Label();
begin
     MainForm.Button4.Enabled := true;
end;
//---------------------- Enable Memo1 ------------------------------------------
procedure TFileMerge.EnableMemo1();
begin
     MainForm.Memo1.Enabled:= true;
end;

// -------------------------- close the mediaplayer ----------------------
procedure TFileMerge.closeMedia();
begin
     MainForm.MediaPlayer1.Close;
end;
//-------------------- play file wave ------------------
procedure TFileMerge.playSound();
begin
     MainForm.MediaPlayer1.FileName := pathDes + mixFile;
     with MainForm.MediaPlayer1 do
     begin

          Open;
          Wait := true;
          Play;
          Stop;
          Close;
     end;
end;
//-------------------- set thread flag -------------------------
procedure TFileMerge.setThreadFlag() ;
begin
     MainForm.FMFlag:= false;
end;
//-------------------- Merge two wav files into one file -----------------------
procedure TFileMerge.MergeFile(phone:String);
var fH2:File of WaveHeader;
    fB2:File of Byte;
    w2:WaveHeader;
    b2:byte;
begin
     phone := phone + '.wav';
     if (first = true) then
     begin
          try
          AssignFile(fH1,pathDes + mixFile);
          Rewrite(fH1);
          AssignFile(fH2,path + phone);
          Reset(fH2);
          read(fH2,w2);

          w1:=w2;
          write(fH1,w1);

          finally
          close(fH2);
          close(fH1);
          end;
          try
          AssignFile(fB1,pathDes + mixFile);
          Reset(fB1);
          AssignFile(fB2,path + phone);
          Reset(fB2);
          seek(fB1,44);
          seek(fB2,44);
          while not eof(fB2) do
          begin
               read(fB2,b2);
               write(fB1,b2);
          end;
          finally
          CloseFile(fB1);
          CloseFile(fB2);
          end;
          first := false;
     end
     else
     begin
          try
          AssignFile(fH1,pathDes + mixFile);
          Reset(fH1);
          AssignFile(fH2,path + phone);
          Reset(fH2);
          read(fH1,w1);
          read(fH2,w2);

          seek(fH1,0);
          w1.h13 := w1.h13 + w2.h13;
          if wordEnd then
             w1.h2 := w1.h13 + 36;
          write(fH1,w1);
          finally
          close(fH1);
          close(fH2);
          end;
          try
          AssignFile(fb1,pathDes + mixFile);
          Reset(fb1);
          AssignFile(fb2,path + phone);
          Reset(fb2);
          seek(fb1,FileSize(fb1));
          seek(fb2,44);
          while not eof(fb2) do
          begin
               read(fb2,b2);
               write(fb1,b2);
          end;
          finally
          CloseFile(fB1);
          CloseFile(fB2);
          end;
     end;

end;

procedure TFileMerge.Execute;
var
    i,j:integer;
    gotWord:boolean;
begin
  { Place thread code here }
  try

     Synchronize(GetFromPhonemesQueue);//get phonemes from queue and put into 'phonemes'

     first:= true;
     if (phonemes <> 'Stop')then
        gotWord := true;
     while (phonemes <> 'Stop')and not self.Terminated do
     begin

          if phonemes <> '' then
          begin
               i:= 0;
               phoneIdx := 1;
               wordEnd := false;   //written to tmp file to play;
               phoneEnd := false;
            //   ShowMessage('phonemes :'+phonemes);
               repeat
                   for j:= 1 to 50 do
                   phone[j] := '';
                   inc(i);
                   //ShowMessage('collect char:'+phonemes);
                   while (phonemes[i]<> ' ')and(phonemes[i]<> '') do
                   begin
                        phone[phoneIdx] := phone[phoneIdx] + phonemes[i];
                       // ShowMessage('phonemes[i]:'+phonemes[i]);
                        inc(i);
                   end;
                   MergeFile(phone[phoneIdx]);
                   Synchronize(AddMemo3Lines);
                   inc(phoneIdx);
               until (phonemes[i]= #0) or self.Terminated ;
          end;
          Synchronize(GetFromPhonemesQueue);
          if phonemes = 'Stop' then
          begin
               phone[phoneIdx] := phonemes;
               Synchronize(AddMemo3Lines);
          end;
     end;
     if gotWord then
     begin
        Synchronize(playSound);
        Synchronize(setButton4Label);
     end;
     Synchronize(setButton2Label);
     Synchronize(EnableMemo1);
     setThreadFlag();

  finally
     closeMedia();
  end;
end;

end.
