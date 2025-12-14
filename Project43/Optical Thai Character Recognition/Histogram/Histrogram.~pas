unit Histrogram;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Jpeg, ExtDlgs, ExtCtrls, StdCtrls, Math, Buttons;

type
  PixArray = Array of Array of Word;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure Open1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pix: PixArray;
  PixWidth: Word;
  PixHeight: Word;
  MyLine: Array of SmallInt;

  Form1: TForm1;

implementation

uses ShowHistrogram;

{$R *.DFM}

procedure TForm1.Open1Click(Sender: TObject);
var CurrentFile : ShortString ;
    X, Y : Integer;
    PixColor : Integer;
    Count : Integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    CurrentFile := OpenPictureDialog1.FileName;
    Image1.Picture.LoadFromFile(CurrentFile);
    PixWidth := Image1.Width;
    PixHeight := Image1.Height;
    SetLength(Pix, PixWidth, PixHeight);
    Count:=0;
    for Y:=0 to PixHeight-1 do
      for X:=0 to PixWidth-1 do
      begin
        PixColor := Image1.Canvas.Pixels[X,Y];
        If PixColor>0 then PixColor := 0 else
        begin
          PixColor := 1; Inc(Count)
        end;
        Pix[X,Y] := PixColor;
      end;
    Edit1.Text := InttoStr(Count);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var X, Y : Integer;
    Count, Max, I, Margin : Integer;
begin
  SetLength(MyLine,PixHeight);
  for Y:=0 to PixHeight-1 do
  begin
    Count := 0;
    for X:=0 to PixWidth-1 do
    begin
      If Pix[X,Y]=1 then Inc(Count);
    end;
    MyLine[Y] := Count;
  end;

  Max := 0;
  For Y := 0 to PixHeight-1 do
    If Max<MyLine[Y] then Max := MyLine[Y];
  Margin := (PixWidth-Max) div 2;
  Form2.Image1.Width := PixHeight;
  Form2.Image1.Height := PixWidth;
  For Y := 0 to PixHeight-1 do
    if MyLine[Y]>0 then
      For I := 1 to MyLine[Y] do
        Form2.Image1.Canvas.Pixels[Y,PixWidth-Margin-I]:= 0;
  Form2.ShowModal;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Self.Close
end;

end.
