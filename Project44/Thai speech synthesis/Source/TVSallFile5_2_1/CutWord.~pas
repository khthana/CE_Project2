unit CutWord;

interface

uses
  Classes;

type
  TCutWords = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure InitWordBucket();
    function ChooseWord(tmpString:String;bucketIdx:integer;var workingPosition:integer;var startPosition:integer): String;
    procedure PutIntoBucket(word: String;workingPosition: integer);
    procedure setThreadFlag();
    procedure AddADOQuery1SQL();
    procedure RecordCountADOQuery1();
    procedure AddADOQuery2SQL();
    procedure AddADOQuery2SQL3();
    procedure RecordCountADOQuery2();
    procedure CountMemo1Lines();
    procedure LinesMemo();
    procedure AddMemo2Lines();
    Procedure PutIntoQueue();
  end;


implementation

uses Sdimain,dialogs;
var wordBucket: array[1..5] of String;
    bucketEndPtr: array[1..5] of integer;
    currentBucketIdx: integer;

    tmpLinesCount,lineCount,rollCount : integer; // store the result form CountMemo1Lines()
    tmpString,tmpWord,sql1,sql2,sql3,wordBuf,Reading:String; //stroe the result from LinesMemo1(lineCount)
    active:boolean;

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TCutWords.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TCutWords }
//-------------------- set thread flag -------------------------
procedure TCutWords.setThreadFlag();
begin
     MainForm.CWFlag := false;
end;
//------------------- put the phonemes string into the queue -------------------
procedure TCutWords.PutIntoQueue();
var finish:boolean;
begin
     finish := false;
     while not finish  do
     begin
          finish :=MainForm.QueuePut(Reading);
     end ;
end;
//------------------- put the word into the bucket -----------------------------
procedure TCutWords.PutIntoBucket(word: String;workingPosition: integer);
begin
     currentBucketIdx := currentBucketIdx + 1;
     wordBucket[currentBucketIdx]:= word;
     bucketEndPtr[currentBucketIdx]:= workingPosition;

end;
//------------------- Choose one word in the bucket ------------------
function TCutWords.ChooseWord(tmpString:String;bucketIdx:integer;var workingPosition:integer;var startPosition:integer): String;
var tmpChar: Char;
    asc: Longint;
begin
     if bucketIdx > 0 then
     begin
          tmpChar := tmpString[bucketEndPtr[bucketIdx]+1];
          asc:= Ord(tmpChar);
          if ((asc > 207) and (asc < 219) or (asc = 229)) then
             ChooseWord := ChooseWord(tmpString,bucketIdx -1,workingPosition,startPosition)
          else
          begin
              ChooseWord := wordBucket[bucketIdx];
              if currentBucketIdx <> bucketIdx then
              begin
                 startPosition := bucketEndPtr[bucketIdx] + 1;
                 workingPosition := startPosition;
              end
              else
              if (workingPosition <> bucketEndPtr[bucketIdx]+1)then
              begin
                   workingPosition := bucketEndPtr[bucketIdx]+1;
              end;
          end;
     end
     else
         ChooseWord := '';
end;
//------------------- initial  ----------------
procedure TCutWords.InitWordBucket();
var i: integer;
begin
     currentBucketIdx := 0;
     for i:= 1 to 5 do
     begin
          wordBucket[i]:= '';
          bucketEndPtr[i]:= 0;
     end;
end;
//------------------- Add ADOQuery1SQL();
procedure TCutWords.AddADOQuery1SQL();
begin
     with MainForm.ADOQuery1 do
     begin
          close;
          with SQL do
          begin
               Text:= sql1;
          end;
          open;
     end;
end;
//------------------- RecordCount ADOQuery1()--------
procedure TCutWords.RecordCountADOQuery1();
begin
     rollCount :=MainForm.ADOQuery1.RecordCount;
end;
//------------------- Add ADOQuery2SQL();
procedure TCutWords.AddADOQuery2SQL();
begin
     with MainForm.ADOQuery2 do
     begin
          close;
          with SQL do
          begin
               Text:= sql2;
          end;
          open;
     end;
end;
//------------------ Add ADOQuery2sql3()

procedure TCutWords.AddADOQuery2SQL3();
begin
     with MainForm.ADOQuery2 do
     begin
          close;
          with SQL do
          begin
               Text:= sql3;
          end;
          open;
     end;
end;

//------------------- RecordCount ADOQuery2()--------
procedure TCutWords.RecordCountADOQuery2();
begin
     rollCount :=MainForm.ADOQuery2.RecordCount;
end;

//------------------- Count Memo1.Lines()-------
procedure TCutWords.CountMemo1Lines();
begin
     tmpLinesCount := MainForm.Memo1.Lines.Count;

end;
procedure TCutWords.LinesMemo();
begin
     MainForm.getStringFormMemo1(lineCount);
     tmpString := MainForm.msg;
end;
//------------------- Memo2 ----------------------------------------------------
procedure TCutWords.AddMemo2Lines();
begin
     MainForm.Memo2.Lines.Add(tmpWord);
end;

//------------------- CutWord ------------------
procedure TCutWords.Execute;
var lineCharCount, startPosition, workingPosition: integer;
    charBuf: char;
    endLine: Boolean;
    asci:longint;
    asciStr:String;
begin
     InitWordBucket;
     lineCount := 0;
     Synchronize(CountMemo1Lines);
     while ((lineCount <= (tmpLinesCount - 1))and not self.Terminated) do
     begin
          lineCharCount := 1;
          workingPosition := lineCharCount;
          startPosition := lineCharCount;
          wordBuf := '';
          charBuf := Char(0);
          endLine:= False;
          Synchronize(LinesMemo);  // get a line from memo1 and put into tmpString
        if (tmpString <> '') then
        begin
          repeat
                charBuf := tmpString[lineCharCount];
                asci:=Ord(charBuf);
                Str(asci,asciStr);
              //  ShowMessage('ascii of charBuf ='+ asciStr);
                workingPosition := lineCharCount;
                if ((asci = 32) or (asci = 9)) then
                begin
                   //  ShowMessage('ascii of charBuf ='+ asciStr);
                     tmpWord := ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition);
                     Synchronize(AddMemo2Lines); //MainForm.Memo2.Lines.Add(ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition)+ ' + ');
                   //  ShowMessage('can''t read this word :'+wordBuf);
                     if (tmpWord <> '') then
                     begin
                          sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                          tmpWord := '';
                          AddADOQuery2SQL3();
                          Reading := MainForm.ADOQuery2.FieldValues['Read'];
                          Reading := Reading + ' sil';
                          synchronize(PutIntoQueue); //put phoneme into queue;
                     end;
                     wordBuf:='';
                     InitWordBucket;
                     lineCharCount:=lineCharCount+1;
                     workingPosition := lineCharCount;
                     charBuf := tmpString[lineCharCount];
                     asci := Ord(charBuf);
                     while ((asci = 32) or (asci = 9))and (lineCharCount > Length(MainForm.Memo1.Lines[lineCount])) do
                     begin
                          Inc(lineCharCount);
                          Inc(workingPosition);
                          charBuf := tmpString[lineCharCount];
                          asci := Ord(charBuf);
                     end;
                     startPosition := workingPosition;
                end
                else
                if ((asci = 13) or (asci = 10)) then   // carriage return13 and line feed10
                begin
                     ShowMessage('new line');
                end
                else
                if ((asci in [48..57])or (asci in [40..41])or(asci = 46)) then  // number from 0 to 9
                begin
                     if asci = 41 then // before getting the ')' , get the last word
                     begin
                          tmpWord := ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition);
                          Synchronize(AddMemo2Lines);
                          InitWordBucket;
                          if tmpWord <> '' then
                          begin
                               sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                               tmpWord := '';
                               AddADOQuery2SQL3();
                               Reading := MainForm.ADOQuery2.FieldValues['Read'];
                               Reading := Reading + ' sil';
                               synchronize(PutIntoQueue);
                          end
                     end;
                     tmpWord := charBuf;
                     Synchronize(AddMemo2Lines);
                     sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                     tmpWord := '';
                     synchronize(AddADOQuery2SQL3);
                     Reading := MainForm.ADOQuery2.FieldValues['Read'];
                     Reading := Reading + ' sil';
                     synchronize(PutIntoQueue); //put phoneme into queue;
                     lineCharCount := lineCharCount + 1;
                     workingPosition := lineCharCount;
                     startPosition := workingPosition;
                     lineCharCount := workingPosition;
                end
                else
                if (asci in [224..228])then     // front vowel
                begin
                     wordBuf:= wordBuf + charBuf;
                     lineCharCount := lineCharCount + 1;
                     workingPosition := lineCharCount;
                end
                else
                if (asci = 230)then      // mai~ ya mok
                begin
                     tmpWord := ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition);
                     Synchronize(AddMemo2Lines);
                     InitWordBucket;
                     wordBuf := '';
                     if tmpWord <> '' then
                     begin
                          sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                          tmpWord := '';
                          AddADOQuery2SQL3();
                          Reading := MainForm.ADOQuery2.FieldValues['Read'];
                          Reading := Reading + ' sil';
                          synchronize(PutIntoQueue);
                     end;
                     tmpWord := charBuf;
                     Synchronize(AddMemo2Lines);
                     synchronize(PutIntoQueue);
                     lineCharCount := lineCharCount + 1;
                     workingPosition := lineCharCount;
                     tmpWord := '';
                     startPosition := workingPosition;
                end
                else
                begin
                     wordBuf := wordBuf + charBuf;
                     if (asci = 0)then  // if end of file
                     begin
                          tmpWord := ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition);
                          if (tmpWord = '')then
                          begin
                               //ShowMessage('there is no word in database that begin with '+ wordBuf);
                                    (* Inc(lineCharCount);
                                    Inc(workingPosition);  *)
                          end;
                          endLine := true;
                          Synchronize(AddMemo2Lines); //MainForm.Memo2.Lines.Add(tmpWord + ' + ');

                          if (tmpWord <> '') then
                          begin
                               sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                               AddADOQuery2SQL3();
                              //  this code can be replace by "AddADOQuery2SQL3();"
                              { MainForm.ADOQuery2.Close;
                               MainForm.ADOQuery2.SQL.Text := sql3;
                               MainForm.ADOQuery2.Open; //get phoneme
                               }
                               Reading := MainForm.ADOQuery2.FieldValues['Read'];
                               Reading := Reading + ' sil';
                               synchronize(PutIntoQueue); //put phoneme into queue;
                          end;

                          wordBuf:='';
                          InitWordBucket;
                          startPosition := workingPosition;
                          lineCharCount := workingPosition;
                     end
                     else
                   begin

                     // test string in wordbuffer is in DB or not
                     // if there is . then insert that word to bucket
                     // if there is not. then select string from wordbuffer
                    // MainForm.ADOQuery1.Parameters.ParamByName('wordBuf').Value:= wordBuf+'%';

                     sql1:= 'select Words from dict where Words like '''+wordbuf+'%''';
                     sql2:= 'select Words from dict where Words = '''+wordBuf+'''';

                     Synchronize(AddADOQuery1SQL);
                     Synchronize(RecordCountADOQuery1);
                     if( rollCount <> 0)then
                     begin
                          Synchronize(AddADOQuery2SQL);
                          Synchronize(RecordCountADOQuery2);
                          if (rollCount <> 0) then
                          begin
                               PutIntoBucket(wordBuf,workingPosition);
                          end;
                          lineCharCount := lineCharCount + 1;
                          workingPosition := lineCharCount;
                     end
                     else
                     begin
                         if (workingPosition = startPosition) then
                          begin
                              // ShowMessage('there is no word in database that begin with '+ wordBuf);
                               Inc(lineCharCount);
                               Inc(workingPosition);
                          end
                          else
                          begin
                               tmpWord := ChooseWord(tmpString,currentBucketIdx,workingPosition,startPosition);
                               if (tmpWord = '')then
                               begin
                                   // ShowMessage('there is no word in database that begin with '+ wordBuf);
                                    workingPosition := startPosition + 1;
                               end
                               else
                                   Synchronize(AddMemo2Lines);
                          end;
                          if (tmpWord <> '') then
                          begin
                          sql3:= 'select Read from dict where Words = '''+tmpWord+'''';
                          tmpWord := '';
                          AddADOQuery2SQL3();
                          {
                          MainForm.ADOQuery2.Close;
                          MainForm.ADOQuery2.SQL.Text := sql3;
                          MainForm.ADOQuery2.Open; //get phoneme
                          }
                          Reading := MainForm.ADOQuery2.FieldValues['Read'];
                          Reading := Reading + ' sil';
                          synchronize(PutIntoQueue); //put phoneme into queue;
                          end;
                          wordBuf:='';
                          InitWordBucket;
                          startPosition := workingPosition;
                          lineCharCount := workingPosition;

                     end;

                   end;
                end;

          until ( ((lineCharCount > Length(MainForm.Memo1.Lines[lineCount]))and endLine)or self.Terminated);
        end;
          lineCount := lineCount + 1;
          if (lineCount > (tmpLinesCount - 1))then
          begin
               Reading := 'Stop';
               synchronize(PutIntoQueue);
          end;
     end;
     setThreadFlag();
end;

end.
