unit Guitar_Tuner_Code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, CPortCtl, CPort, XPMan, MPlayer,
  ExtDlgs;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Filse1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    TunerGroupBox: TGroupBox;
    C_Panel: TPanel;
    D_Panel: TPanel;
    E_Panel: TPanel;
    F_Panel: TPanel;
    G_Panel: TPanel;
    A_Panel: TPanel;
    B_Panel: TPanel;
    GroupBox1: TGroupBox;
    Lok_Panel: TPanel;
    Cok_Panel: TPanel;
    Rok_Panel: TPanel;
    GroupBox2: TGroupBox;
    ComPort: TComPort;
    ComTerminal: TComTerminal;
    ComComboBox1: TComComboBox;
    ComComboBox2: TComComboBox;
    ConnectCheckBox: TCheckBox;
    GroupBox3: TGroupBox;
    LEDTimer: TTimer;
    TempoTimer: TTimer;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Tempo_Status: TPanel;
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    S_Panel: TPanel;
    Button5: TButton;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    PlayTimer: TTimer;
    TempoEdit: TEdit;
    Label2: TLabel;
    procedure Exit1Click(Sender: TObject);
    procedure ConnectCheckBoxClick(Sender: TObject);
    procedure ClearNote;
    procedure ComTerminalChar(Sender: TObject; Ch: Char);
    procedure NoteProgress(Rx: String);
    procedure LEDTimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TempoTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Plot_Staff(cmp:String);
    procedure New1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure PlayTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Rx : String;
  CMD  : Boolean;
  Room : Integer;
  Play : Boolean;
  F1     : TextFile;
implementation

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TForm1.ConnectCheckBoxClick(Sender: TObject);
begin
  if ConnectCheckBox.Checked = True then
    ComPort.Connected := True
  else
    ComPort.Connected := False;
end;
//------------------------------------------------------------------------------
procedure TForm1.ClearNote;
begin
  C_Panel.Font.Color   := clBtnFace;
  D_Panel.Font.Color   := clBtnFace;
  E_Panel.Font.Color   := clBtnFace;
  F_Panel.Font.Color   := clBtnFace;
  G_Panel.Font.Color   := clBtnFace;
  A_Panel.Font.Color   := clBtnFace;
  B_Panel.Font.Color   := clBtnFace;
  Lok_Panel.Font.Color := clBtnFace;
  Cok_Panel.Font.Color := clBtnFace;
  Rok_Panel.Font.Color := clBtnFace;
  S_Panel.Font.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TForm1.NoteProgress(Rx: String);
begin
  if          Pos('C', Rx) > 0 then begin
    ClearNote;
    C_Panel.Font.Color := clRed;
  end else if Pos('D', Rx) > 0 then begin
    ClearNote;
    D_Panel.Font.Color := clRed;
  end else if Pos('E', Rx) > 0 then begin
    ClearNote;
    E_Panel.Font.Color := clRed;
  end else if Pos('F', Rx) > 0 then begin
    ClearNote;
    F_Panel.Font.Color := clRed;
  end else if Pos('G', Rx) > 0 then begin
    ClearNote;
    G_Panel.Font.Color := clRed;
  end else if Pos('A', Rx) > 0 then begin
    ClearNote;
    A_Panel.Font.Color := clRed;
  end else if Pos('B', Rx) > 0 then begin
    ClearNote;
    B_Panel.Font.Color := clRed;
  end;

  if Pos('#', Rx) > 0 then
  begin
    S_Panel.Font.Color := clGreen;
  end;

  if          Pos('>', Rx) > 0 then begin
    Lok_Panel.Font.Color := clRed;
  end else if Pos('<', Rx) > 0 then begin
    Rok_Panel.Font.Color := clRed;
  end else begin
    Cok_Panel.Font.Color := clRed;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.ComTerminalChar(Sender: TObject; Ch: Char);
begin
  if (Ch = #13) and (Rx <> '') then
  begin
    Rx  := Trim(Rx);
    if CMD = True then
    begin
      CMD := False;
      NoteProgress(Rx);
      Plot_Staff(Rx);
      Memo1.Lines.Append(Rx);
    end
    else
      NoteProgress(Rx);
    Rx := '';
  end else Rx := Rx + Ch;
end;
//------------------------------------------------------------------------------
procedure TForm1.LEDTimerTimer(Sender: TObject);
begin
  ClearNote;
  LEDTimer.Enabled := False;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button2Click(Sender: TObject);
begin
  TempoTimer.Interval := TempoTimer.Interval - 100;
  TempoEdit.Text := IntToStr(TempoTimer.Interval);
  PlayTimer.Interval := TempoTimer.Interval;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button3Click(Sender: TObject);
begin
  if MediaPlayer1.FileName <> '' then TempoTimer.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TForm1.TempoTimerTimer(Sender: TObject);
begin
  if Tempo_Status.Font.Color <> clGray then
    Tempo_Status.Font.Color := clGray
  else
    Tempo_Status.Font.Color := clRed;
  if CMD = True then
  begin
    Plot_Staff('S');
    Memo1.Lines.Append('S');
  end;
  CMD := True;
  MediaPlayer1.Play;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button1Click(Sender: TObject);
begin
  TempoTimer.Interval := TempoTimer.Interval + 100;
  TempoEdit.Text := IntToStr(TempoTimer.Interval);
  PlayTimer.Interval := TempoTimer.Interval;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button4Click(Sender: TObject);
begin
  PlayTimer.Interval := TempoTimer.Interval;
  AssignFile(F1, OpenDialog1.Filename);
  Reset(F1);
  PlayTimer.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button5Click(Sender: TObject);
begin
  TempoTimer.Enabled := False;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button6Click(Sender: TObject);
var
  x, y : integer;
begin
 x := 2;
  for y := 0 to Image1.Height-1 do
    Memo1.Lines.Append(IntToStr(y)+'='+IntToStr(Image1.Canvas.Pixels[x,y] and $FF));
end;
//------------------------------------------------------------------------------
procedure TForm1.Plot_Staff(cmp:String);
var
  BitMap : TBitMap;
  x,y,shx,shy : Integer;
  Z : Byte;
  sharp : Boolean;
begin
 cmp := StringReplace(cmp, '<', '', [rfReplaceAll]);
 cmp := StringReplace(cmp, '>', '', [rfReplaceAll]);
 if Room >= 12 then
  begin
    Room := 0;
    OpenPictureDialog1.FileName := 'staff.bmp';
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  sharp := False;
  OpenPictureDialog1.FileName := 'note.bmp';
  shx := (50*Room)+50;
  if          cmp = 'C' then begin
    shy := 53+4;
    OpenPictureDialog1.FileName := 'note_.bmp';
  end else if cmp = 'D' then begin
    shy := 53;
  end else if cmp = 'E' then begin
    shy := 45+4;
  end else if cmp = 'F' then begin
    shy := 45;
  end else if cmp = 'G' then begin
    shy := 38+4;
  end else if cmp = 'A' then begin
    shy := 38;
  end else if cmp = 'B' then begin
    shy := 31+4;
  end else if cmp = 'S' then begin
    shy := 31;
    OpenPictureDialog1.FileName := 'stop.bmp';
  end else if cmp = 'C#' then begin
    shy := 53+4;
    OpenPictureDialog1.FileName := 'note_.bmp';
    sharp := True;
  end else if cmp = 'D#' then begin
    shy := 53;
    sharp := True;
  end else if cmp = 'E#' then begin
    shy := 45+4;
    sharp := True;
  end else if cmp = 'F#' then begin
    shy := 45;
    sharp := True;
  end else if cmp = 'G#' then begin
    shy := 38+4;
    sharp := True;
  end else if cmp = 'A#' then begin
    shy := 38;
    sharp := True;
  end else if cmp = 'B#' then begin
    shy := 31+4;
    sharp := True;
  end else
    shy := 0;
  BitMap := TBitMap.create;
  BitMap.LoadFromFile(OpenPictureDialog1.FileName);
  for x:=0 to BitMap.Width-1 do
    for y:=0 to BitMap.Height-1 do
    begin
      Z := (Image1.Canvas.Pixels[x+shx,y+shy] and  BitMap.Canvas.Pixels[x,y]) and $FF;
      Image1.Canvas.Pixels[x+shx,y+shy] := RGB(Z,Z,Z);
    end;
  BitMap.Free;
  if sharp = True then
  begin
    shx := shx + 10;
    OpenPictureDialog1.FileName := 'sharp.bmp';
    BitMap := TBitMap.create;
    BitMap.LoadFromFile(OpenPictureDialog1.FileName);
    for x:=0 to BitMap.Width-1 do
      for y:=0 to BitMap.Height-1 do
      begin
        Z := (Image1.Canvas.Pixels[x+shx,y+shy] and  BitMap.Canvas.Pixels[x,y]) and $FF;
        Image1.Canvas.Pixels[x+shx,y+shy] := RGB(Z,Z,Z);
      end;
    BitMap.Free;
  end;
  Room := Room + 1;
end;
//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  TempoEdit.Text := IntToStr(TempoTimer.Interval);
  Room := 0;
  MediaPlayer1.FileName := 'tempo.wav';
  MediaPlayer1.Open;
end;
//------------------------------------------------------------------------------
procedure TForm1.New1Click(Sender: TObject);
begin
  Room := 0;
  Play := False;
  OpenPictureDialog1.FileName := 'staff.bmp';
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  Memo1.Clear;
end;
//------------------------------------------------------------------------------
procedure TForm1.SaveAs1Click(Sender: TObject);
begin
  TempoTimer.Enabled := False;
  if SaveDialog1.Execute then Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;
//------------------------------------------------------------------------------
procedure TForm1.Open1Click(Sender: TObject);
begin
  TempoTimer.Enabled := False;
  if OpenDialog1.Execute then Play := True;
end;
//------------------------------------------------------------------------------
procedure TForm1.PlayTimerTimer(Sender: TObject);
var
  Str : String;
begin
  if Play = True then
  begin
//    MediaPlayer1.Play;
    if not Eof(F1) then
    begin
      Readln(F1, Str);
      Plot_Staff(Str);
      Memo1.Lines.Append(Str);
//      MediaPlayer1.Close;
      if Pos('#', Str) > 0 then
      begin
        if Pos('A', Str) > 0 then begin
          MediaPlayer1.FileName := 'A#.wav';
        end else if Pos('C', Str) > 0 then begin
          MediaPlayer1.FileName := 'C#.wav';
        end else if Pos('D', Str) > 0 then begin
          MediaPlayer1.FileName := 'D#.wav';
        end else if Pos('F', Str) > 0 then begin
          MediaPlayer1.FileName := 'F#.wav';
        end else if Pos('G', Str) > 0 then begin
          MediaPlayer1.FileName := 'G#.wav';
        end else begin
          MediaPlayer1.FileName := 'Tempo.wav';
        end;
      end
      else
      begin
        if Pos('A', Str) > 0 then begin
          MediaPlayer1.FileName := 'A.wav';
        end else if Pos('B', Str) > 0 then begin
          MediaPlayer1.FileName := 'B.wav';
        end else if Pos('C', Str) > 0 then begin
          MediaPlayer1.FileName := 'C.wav';
        end else if Pos('D', Str) > 0 then begin
          MediaPlayer1.FileName := 'D.wav';
        end else if Pos('E', Str) > 0 then begin
          MediaPlayer1.FileName := 'E.wav';
        end else if Pos('F', Str) > 0 then begin
          MediaPlayer1.FileName := 'F.wav';
        end else if Pos('G', Str) > 0 then begin
          MediaPlayer1.FileName := 'G.wav';
        end else begin
          MediaPlayer1.FileName := 'Tempo.wav';
        end;
      end;
      MediaPlayer1.Open;
      MediaPlayer1.Play;
    end
    else
    begin
      CloseFile(F1);
      PlayTimer.Enabled := False;
    end;
  end;
end;
//------------------------------------------------------------------------------
end.
