unit ScanTextU7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Spin, ExtDlgs, Buttons;

type
  // กำหนดโครงสร้างข้อมูลที่เป็น Margin
  TMargin = record
    Left : longint;
    Top : longint;
    Right : longint;
    Bottom : longint;
  end;

  // กำหนดขนาดของ Pattern
  TPattern = array[0..39,0..47] of longint;

  // กำหนดขนาดของ Buffer ของ Block ตัวอักษรที่จะทำการ Map
  TLoadData = array[0..80,0..60] of longint;

  // กำหนดโครงสร้างของ Pattern
  TPatternData = record
    PMargin : TMargin;
    PData : TPattern;
    PRight : longint;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    FontName: TComboBox;
    FontSizeSp: TSpinEdit;
    MapLineBtn: TButton;
    ScanLineBtn: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox2: TScrollBox;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    ScanImage: TImage;
    TabSheet3: TTabSheet;
    ResultText: TMemo;
    OpenPictureDialog1: TOpenPictureDialog;
    LineHighSp: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    FontHighSp: TSpinEdit;
    Panel2: TPanel;
    DisplayFont: TMemo;
    LoadPattern: TButton;
    PttCharC: TComboBox;
    Panel3: TPanel;
    PttImage: TImage;
    ScanColumnBtn: TButton;
    ColumnScanLine: TComboBox;
    ScanTextLine: TComboBox;
    MapAllLineBtn: TButton;
    FontBold: TSpeedButton;
    ListBox1: TListBox;
    DisplayRow: TCheckBox;
    DisplayCol: TCheckBox;
    Recognize: TSpinEdit;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    ImageBlock: TImage;
    Panel7: TPanel;
    ImageUpper1: TImage;
    Panel8: TPanel;
    ImageUpper2: TImage;
    Panel9: TPanel;
    ImageMidle: TImage;
    Panel10: TPanel;
    ImageLower: TImage;
    Label3: TLabel;
    DisplayTextLine: TComboBox;
    Label4: TLabel;
    DisplayTextCol: TComboBox;
    TextBlock: TPanel;
    PrevColBtn: TSpeedButton;
    NextColBtn: TSpeedButton;
    AutoSizeBtn: TButton;
    HistoryHit: TListBox;
    HistDifVal: TListBox;
    HistFontHeight: TListBox;
    FontHeightL: TLabel;
    Label5: TLabel;
    FontSizeL: TLabel;
    Label7: TLabel;
    LineHeightL: TLabel;
    Label8: TLabel;
    HistLineHeight: TListBox;
    Bevel1: TBevel;
    AutoSet: TCheckBox;
    procedure SetDisplayFont;
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeSpChange(Sender: TObject);
    procedure LoadPatternClick(Sender: TObject);
    procedure PttCharCChange(Sender: TObject);
    procedure FontHighSpChange(Sender: TObject);
    procedure LineHighSpChange(Sender: TObject);
    procedure FontBoldClick(Sender: TObject);
    procedure RecognizeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScanImageDblClick(Sender: TObject);
    procedure ScanLineBtnClick(Sender: TObject);
    procedure ScanColumnBtnClick(Sender: TObject);
    procedure MapLineBtnClick(Sender: TObject);
    procedure MapAllLineBtnClick(Sender: TObject);
    procedure DisplayTextLineChange(Sender: TObject);
    procedure DisplayTextColChange(Sender: TObject);
    procedure PrevColBtnClick(Sender: TObject);
    procedure NextColBtnClick(Sender: TObject);
    procedure AutoSizeBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetFontNames;
    procedure ScanColumn(LineNo : longint);
    procedure FindPttBaseLine;
    procedure LoadPttData(AsciiNo : longint);
    procedure LoadScanData(LineNo,SCol,ECol,SRow,ERow : longint);
    function  AsciiMapRight(LineNo,SCol,ECol,SRow,ERow : longint): string;
    function  ScanText(LineNo, StrCol, EndCol : longint): string;
    procedure DisplayBlockScan(BlockCol : longint);
  public
    // กำหนดค่าให้กับ Pattern
    PttFontName : string;
    PttFontSize : longint;
    PttFontColor : TColor;
    PttBgColor : TColor;

    Margin : TMargin;
    FontHigh : longint;
    LineHigh : longint;
    LineCount : longint;
    ColCount : longint;
    ShiftPrev : longint;
    EndLineCol : longint;
    PRecognize : longint;

    // เก็บค่าต่างๆ ไว้ใช้ในการตัดตัวอักษร
    MemShiftPrev : longint;
    MemMidleTop : longint;
    MemReg : boolean;
    MemLower : TRect;
    MemUpper1 : TRect;
    MemUpper2 : TRect;

    // เก็บแถว
    BaseLineArray : array[0..50] of longint;  // Line number of A4 must less then 50 line
    // เก็บ Column ใน 1 แถว
    ColLineArray : array[0..200] of longint;

    // เก็บค่าของ Pattern
    PttBaseL : longint;
    PttChar : TPatternData;
    PttArray : array[32..255] of TPatternData;

    ScanData : TLoadData;
    BlankData : TLoadData;

    ScanTextRun : boolean;

//  Exp:
//    0
//    1       Midle Char
//    :
//    45  Baseline
//    46      Lower Char
//    :
//    55  DownLine
//    56      Upper Char
//    :
//    80  UpperChar


    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// กำหนด Margin
function SetMargin(MLeft,MTop,MRight,MBottom : longint): TMargin;
begin
  with Result do
  begin
    Left := MLeft;
    Top := MTop;
    Right := MRight;
    Bottom := MBottom;
  end;
end;

// Add ชื่อ Font ลงใน Combobox
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: longint; Data: Pointer): longint; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

// โหลด Font ของ Windows
procedure TForm1.GetFontNames;
var DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

// กำหนดค่าให้กับระบบเมื่อผู้ใช้เลือก Font
procedure TForm1.SetDisplayFont;
begin
  FontName.ItemIndex := FontName.Items.IndexOf(PttFontName);
  FontSizeSp.Text := IntToStr(PttFontSize);
  DisplayFont.Font.Name := FontName.Items[FontName.ItemIndex];
  DisplayFont.Font.Size := PttFontSize;

  if FontBold.Down then
    DisplayFont.Font.Style := [fsBold]
  else
    DisplayFont.Font.Style := [];

  PttImage.Canvas.Font.Name := DisplayFont.Font.Name;
  PttImage.Canvas.Font.Size := DisplayFont.Font.Size;
  PttImage.Canvas.Font.Charset := DisplayFont.Font.Charset;
  PttImage.Canvas.Font.Style := DisplayFont.Font.Style;

  ResultText.Font.Name := DisplayFont.Font.Name;
  ResultText.Font.Size := DisplayFont.Font.Size;
  ResultText.Font.Charset := DisplayFont.Font.Charset;
  ResultText.Font.Style := DisplayFont.Font.Style;

  TextBlock.Font.Name := DisplayFont.Font.Name;
  TextBlock.Font.Size := DisplayFont.Font.Size;
  TextBlock.Font.Charset := DisplayFont.Font.Charset;
  TextBlock.Font.Style := DisplayFont.Font.Style;
end;
// แสดงผลเมื่อมีการเปลี่ยน Font ใหม่
procedure TForm1.FontNameChange(Sender: TObject);
begin
  PttFontName := FontName.Items[FontName.ItemIndex];
  SetDisplayFont;
end;

procedure TForm1.FontSizeSpChange(Sender: TObject);
begin
  PttFontSize := StrToInt(FontSizeSp.Text);
  FontHighSp.Value := Round(PttFontSize*0.65);
  //  High of middle charecter estimate 65% of Font Size
  // ความสูงของตัวอักษรตรงกลาง เช่น 'A' จำมีค่าประมาณ 65% ของขนาด Font
  FontHigh := FontHighSp.Value;

  LineHighSp.Value := Round(PttFontSize*1.2);
  // Distance betaween line must more than 20% of Font Size
  // ความสูงของบรรทัดมีค่าไม่ต่ำกว่า 20% ของขนาด Font
  LineHigh := LineHighSp.Value;
  SetDisplayFont;
end;

procedure TForm1.FontHighSpChange(Sender: TObject);
begin
  FontHigh := FontHighSp.Value;
end;

procedure TForm1.LineHighSpChange(Sender: TObject);
begin
  LineHigh := LineHighSp.Value;
end;

procedure TForm1.FontBoldClick(Sender: TObject);
begin
  FontBold.AllowAllUp := not(FontBold.AllowAllUp);
  FontBold.Down := not(FontBold.Down);

  SetDisplayFont;
end;

procedure TForm1.RecognizeChange(Sender: TObject);
begin
  PRecognize := Recognize.Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,j : longint;
    CharStr : string;

  procedure AddChar;
  begin
    if ((i >= 209) and (i <= 217)) or ((i >= 231) and (i <= 237)) then
      CharStr := CharStr + '   ' + Chr(i)
    else CharStr := CharStr + Chr(i);

    if i in [64,96,126,160,206,237] then
    begin
      DisplayFont.Lines.Add(CharStr);
      CharStr := '';
    end;
  end;

begin
  //  แสดงหมายเลขตัวอักษรลงใน Memo
  CharStr := '';
  for i := 32 to 126 do AddChar;

  for i := 161 to 217 do AddChar;

  for i := 223 to 237 do AddChar;

  for i := 240 to 249 do AddChar;

  DisplayFont.Lines.Add(CharStr);
  GetFontNames;
  PttFontName := DisplayFont.Font.Name;
  PttFontSize := -MulDiv(DisplayFont.Font.Height, 72, Screen.PixelsPerInch);
  PttFontColor := clBlack;
  PttBgColor := clWhite;
  RecognizeChange(nil);
  SetDisplayFont;

  // ลบค่าใน Block Pattern
  for i := 0 to 80 do
    for j := 0 to 60 do
      BlankData[i,j] := 0;
end;

// โหลดรูปเข้ามาใหม่
procedure TForm1.ScanImageDblClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    if OpenPictureDialog1.FileName <> '' then
      ScanImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

// โหลด Pattern ที่จะใช้เป็นต้นแบบในการ Map
procedure TForm1.LoadPatternClick(Sender: TObject);
var i : longint;
begin
  Screen.Cursor := crHourGlass;
  PttCharC.Clear;

  // โหลดค่า Ascii เก็บไว้เพื่ออ้างอิงในการโหลด Pattern
  for i := 32 to 126 do
    PttCharC.Items.Add(IntToStr(i));

  for i := 161 to 217 do
    PttCharC.Items.Add(IntToStr(i));

  for i := 223 to 237 do
    PttCharC.Items.Add(IntToStr(i));

  for i := 240 to 249 do
    PttCharC.Items.Add(IntToStr(i));

  // หาว่า Base Line ของ Pattern อยู่ตำแหน่งไหน
  FindPttBaseLine;

  // ทำการโหลด Pattern ทั้งหมดมาเก็บไว้ใน Array
  for i := 32 to 126 do
  begin
    LoadPttData(i);
    PttArray[i] := PttChar;
  end;

  // กำหนดให้ Ascii 32 (Spacebar) มีค่า Margin เท่ากับ Ascii 98 (b)
  PttArray[32].PMargin := PttArray[98].PMargin;  // 98=b

  // ทำการโหลด Pattern ที่เหลือทั้งหมดมาเก็บไว้ใน Array ต่อไป
  for i := 161 to 217 do
  begin
    LoadPttData(i);
    PttArray[i] := PttChar;
  end;

  for i := 223 to 237 do
  begin
    LoadPttData(i);
    PttArray[i] := PttChar;
  end;

  for i := 240 to 249 do
  begin
    LoadPttData(i);
    PttArray[i] := PttChar;
  end;
  Screen.Cursor := crDefault;
end;

// แสดงลักษณะของ Pattern เมื่อผู้ใช้เลือกค่า Ascii
procedure TForm1.PttCharCChange(Sender: TObject);
var Chr : byte;
begin
  if PttCharC.ItemIndex < 0 then Exit;
  Chr := StrToInt(PttCharC.Text);
  PttImage.Canvas.Lock;
  try
    with PttImage.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(PttImage.BoundsRect);
      Font.Color := clBlack;

      if ((Chr >= 209) and (Chr <= 217)) or ((Chr >= 231) and (Chr <= 237)) then
        TextOut(5,3,'   ' + Char(Chr) + ' ')
      else
        TextOut(5,3,Char(Chr));
    end;
  finally
    PttImage.Canvas.Unlock;
  end;
end;

// process ในการคำนวณหา Base Line ของ Pattern
// โดย scan จากด้านล่างขึ้นด้านบนจนพบเนื้อตัวอักษร
procedure TForm1.FindPttBaseLine;
var Row,Col : longint;
begin
  PttCharC.ItemIndex := PttCharC.Items.IndexOf(IntToStr(65));  // 65=A
  if PttCharC.ItemIndex > 0 then
  begin
    PttCharCChange(nil);
    for Row := PttImage.Height - 1 downto 0 do
      for Col := 0 to PttImage.Width - 1 do
        if PttImage.Canvas.Pixels[Col,Row] <> PttBgColor then
        begin
          PttBaseL := Row + 1;
          exit;
        end;
  end;
end;

// Process ในการโหลด Pattern ของตัวอักษร 1 ตัวมาเก็บไว้
// พร้อมทั้งคำนวณหา Margin ของตัวอักษรนั้นด้วย
procedure TForm1.LoadPttData(AsciiNo : longint);
var Row,Col : longint;
    FirstHit : boolean;
begin
  PttCharC.ItemIndex := PttCharC.Items.IndexOf(IntToStr(AsciiNo));
  if PttCharC.ItemIndex > -1 then
  begin
    PttCharCChange(nil);
    PttChar.PMargin := SetMargin(PttImage.Width - 1,PttImage.Height - 1,0,0);
    FirstHit := True;
    for Row := 0 to PttImage.Height - 1 do
      for Col := 0 to PttImage.Width - 1 do
        if PttImage.Canvas.Pixels[Col,Row] <> PttBgColor then
        begin
          PttChar.PData[Col,Row] := 1;

          if FirstHit then
          begin
            PttChar.PMargin.Top := Row;
            FirstHit := False;
          end;

          if Col < PttChar.PMargin.Left then PttChar.PMargin.Left := Col;
          if Col > PttChar.PMargin.Right then PttChar.PMargin.Right := Col;
          if Row > PttChar.PMargin.Bottom then PttChar.PMargin.Bottom := Row;
        end
        else PttChar.PData[Col,Row] := 0;
  end;
end;

// Process ในการ scan ข้อมูลจากรูปเข้ามาเก็บใน Block ScanData
procedure TForm1.LoadScanData(LineNo,SCol,ECol,SRow,ERow : longint);
var Row,Col : longint;
begin
  ScanData := BlankData;
  for Row := SRow to ERow do
    for Col := SCol to ECol do
      if ScanImage.Canvas.Pixels[Col,Row] = PttFontColor then
      begin
//        ScanImage.Canvas.Pixels[Col,Row] := clBlue; // Mark
        ScanData[Col - SCol, Row - SRow] := 1;
      end
      else
        ScanData[Col - SCol, Row - SRow] := 0;
end;

// process ในการ scan หา Base Line ทั้งหมดจากรูป
procedure TForm1.ScanLineBtnClick(Sender: TObject);
var Row,Col,ECol : longint;
    FirstHit : boolean;
    HitT : longint;
    LastHitT,LastBaseL,LastNoHit : longint;
    MLastHitT,MLastBaseL,MLastNoHit : longint;
    RowCheck,RowCheckC : longint;
    NextRowC1,NextRowC2 : longint;
begin
  Screen.Cursor := crHourGlass;
  ColumnScanLine.Clear;
  ScanTextLine.Clear;
  DisplayTextLine.Clear;
  DisplayTextCol.Clear;

  with ScanImage.Picture.Bitmap.Canvas do
  begin
    FirstHit := True;
    Margin := SetMargin(ScanImage.Width,ScanImage.Height,0,0);

    LineCount := 0;
    LastHitT := 0;
    LastBaseL := 0;
    LastNoHit := 0;
    RowCheck := -1;

    MLastHitT := -1;
    MLastBaseL := -1;
    MLastNoHit := -1;

    // การกำหนดค่าในการกระโดดข้ามไป scan line ถัดไป
    RowCheckC := Round(FontHigh*0.2); // Goto Midle Char
    NextRowC1 := Round(FontHigh*0.6); // Goto Base Line
    NextRowC2 := Round(FontHigh*0.8); // Goto NextLine

    Row := 0;
    ECol := ScanImage.Width - 1;
    repeat
      HitT := 0;
      for Col := 0 to ECol do
        if Pixels[Col,Row] = PttFontColor then
        begin
          HitT := HitT + 1;

          // หา Margin ของรูป
          if FirstHit then
          begin
            Margin.Top := Row;
            FirstHit := False;
          end;

          if Col < Margin.Left then Margin.Left := Col;
          if Col > Margin.Right then Margin.Right := Col;
          if Row > Margin.Bottom then Margin.Bottom := Row;
        end;

      Application.ProcessMessages;

      if HitT <= LastHitT*0.2 then
      begin  // Base Line is near HitT decread near 0
             // HitT near 0 except some charecters [gypq estimate <= 20% of Base Line]

        if (Row - LastBaseL >= LineHigh) and
           (Row - LastNoHit  >= FontHigh) then
        begin
          MLastHitT := LastHitT;
          MLastBaseL := LastBaseL;
          MLastNoHit := LastNoHit;
          LastBaseL := Row;
          LastNoHit := Row;

          BaseLineArray[LineCount] := Row;
          LineCount := LineCount + 1;

          RowCheck := Row + RowCheckC;
          Row := RowCheck - 1;
        end;
      end;

      if (RowCheck = Row) then
      begin
        if (HitT >= MLastHitT*1.2) then
        begin  // if Upper char then HitT must more than mid char 20% of MLastHitT
               // And then reset data

          LastBaseL := MLastBaseL;
          LastNoHit := MLastNoHit;
          BaseLineArray[LineCount] := 0;
          LineCount := LineCount - 1;
          Row := Row + NextRowC1 - 1;
        end
        else Row := Row + NextRowC2 - 1;
      end;

      if HitT = 0 then LastNoHit := Row;

      LastHitT := HitT;
      Row := Row + 1;
    until Row > ScanImage.Height - 1;

    Margin.Right := Margin.Right + PttFontSize;
    Margin.Bottom := Margin.Bottom + PttFontSize;
    // Add pixel not scan

    for Row := 0 to LineCount - 1 do
      ColumnScanLine.Items.Add(IntToStr(Row + 1));

    ScanTextLine.Items.Assign(ColumnScanLine.Items);
    DisplayTextLine.Items.Assign(ColumnScanLine.Items);

    if ColumnScanLine.Items.Count > 0 then
    begin
      ColumnScanLine.ItemIndex := 0;
      ScanTextLine.ItemIndex := 0;
      DisplayTextLine.ItemIndex := 0;
      DisplayTextLineChange(nil);
    end;

    if DisplayRow.Checked then
    begin
      Pen.Color := clRed;  // Display Line
      for Row := 0 to LineCount - 1 do
      begin
        MoveTo(Margin.Left,BaseLineArray[Row]);
        LineTo(Margin.Right,BaseLineArray[Row]);
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

// process ในการ scan column ทั้งหมดใน 1 line
procedure TForm1.ScanColumn(LineNo : longint);
var Row,Col : longint;
    SRow,ERow : longint;
    HitT : longint;
    LastHitT : longint;
begin
  with ScanImage.Picture.Bitmap.Canvas do
  begin
    ColCount := 0;
    LastHitT := 0;
    EndLineCol := 0;

    for Col := Margin.Left to Margin.Right do
    begin
      SRow := BaseLineArray[LineNo] - FontHigh + 1;   // 40% Font High
      ERow := BaseLineArray[LineNo] + Round(FontHigh*0.4); // ฐ
      HitT := 0;
      for Row := SRow to ERow do
        if Pixels[Col,Row] = PttFontColor then
          HitT := HitT + 1;

      Application.ProcessMessages;

      if (HitT > 0) and (LastHitT = 0) then
      begin
        ColLineArray[ColCount] := Col;
        ColCount := ColCount + 1;
      end;

      if HitT > 0 then EndLineCol := Col;

      LastHitT := HitT;
    end;

    if DisplayCol.Checked then
    begin
      Pen.Color := clRed;  // Display Column
      for Col := 0 to ColCount - 1 do
      begin
        MoveTo(ColLineArray[Col],BaseLineArray[LineNo] + Round(FontHigh*0.4));
        LineTo(ColLineArray[Col],BaseLineArray[LineNo] + Round(FontHigh*0.2));
      end;
    end;
  end;
end;

procedure TForm1.ScanColumnBtnClick(Sender: TObject);
begin
  if ColumnScanLine.ItemIndex < 0 then Exit;
  ScanColumn(StrToInt(ColumnScanLine.Text) - 1);
end;

// process ในการเปรียบเทียบค่าที่โหลดเข้ามาเก็บไว้ใน ScanData กับ ค่า
// ที่เก็บไว้ใน Pattern เพื่อจะดูว่าค่าที่ได้ควรจะเป็นตัวอะไร
function TForm1.AsciiMapRight(LineNo,SCol,ECol,SRow,ERow : longint): string;
var vSRow,vERow : longint;
    vSCol,vECol : longint;
    AllPos : longint;
    i,SamePos : longint;
    Ascii : longint;
    MapMaxRight : longint;
    MapSamePos : longint;
    LowerAscii : longint;
    UpperAscii1 : longint;
    UpperAscii2 : longint;
    STop,SLeft : longint;
    MemUpRow,UpRow : longint;

    // scan หาขอบบนของ Block ตัวอักษร
    procedure ScanTop;
    var Row,Col : longint;
    begin
      STop := -1;
      for Row := vSRow to vERow do
      begin
        for Col := vSCol to vECol do
          if ScanData[Col,Row] = 1 then
          begin
            STop := Row - vSRow;
            break;
          end;
        if STop > -1 then break;
      end;
    end;

    // scan หาขอบซ้ายของ Block ตัวอักษร
    procedure ScanLeft;
    var Row,Col : longint;
    begin
      SLeft := -1;
      for Col := vSCol to vECol do
      begin
        for Row := vSRow to vERow do
          if ScanData[Col,Row] = 1 then
          begin
            SLeft := Col - vSCol;
            break;
          end;
        if SLeft > -1 then break;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่กลางบรรทัด
    procedure MapMidleAscii;
    var Row,Col : longint;
        vDifT : longint;
    begin
      vSRow := PttBaseL - Round(FontHigh*1.8); // ล้ำไปด้านบนไม่เกิน 80% ของความสูง
      vERow := PttBaseL + Round(FontHigh*0.5); // ล้ำไปด้านล่างไม่เกิน 50% ของความสูง
      vDifT := 0;

      // กำหนดขอบเขตอีกครั้งตามขนาดของตัวอักษร
      if PttArray[Ascii].PMargin.Top > vSRow then
      begin
        vDifT := PttArray[Ascii].PMargin.Top - vSRow;
        vSRow := PttArray[Ascii].PMargin.Top;
      end;

      if PttArray[Ascii].PMargin.Bottom < vERow then
        vERow := PttArray[Ascii].PMargin.Bottom;

      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol,Row - vSRow + vDifT] then
            SamePos := SamePos + 1;

          AllPos := AllPos + 1;
        end;

      if AllPos > 0 then
      begin  // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if (PttArray[Ascii].PRight > MapMaxRight) or
           ((PttArray[Ascii].PRight = MapMaxRight) and (SamePos > MapSamePos)) then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          Result := Chr(Ascii);
        end;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่กลางบรรทัด แบบพิเศษ 1
    procedure MapMidleAscii1;
    var Row,Col : longint;
    begin
      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol,Row - vSRow] then
            SamePos := SamePos + 1;

          AllPos := AllPos + 1;
        end;

      if AllPos > 0 then
      begin  // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if (PttArray[Ascii].PRight > MapMaxRight) or
           ((PttArray[Ascii].PRight > PRecognize) and (SamePos > MapSamePos)) then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          Result := Chr(Ascii);
          MemShiftPrev := ShiftPrev;
          MemMidleTop := vSRow;
        end;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่กลางบรรทัด แบบพิเศษ 2
    procedure MapMidleAscii2;
    var Row,Col : longint;
        vDifT : longint;
    begin
      vSRow := PttBaseL - Round(FontHigh*1.8);
      vERow := PttBaseL + Round(FontHigh*0.5);
      vDifT := 0;

      if PttArray[Ascii].PMargin.Top > vSRow then
      begin
        vDifT := PttArray[Ascii].PMargin.Top - vSRow;
        vSRow := PttArray[Ascii].PMargin.Top;
      end;

      if PttArray[Ascii].PMargin.Bottom < vERow then
        vERow := PttArray[Ascii].PMargin.Bottom;

      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = 1 then
          begin
            if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol,Row - vSRow + vDifT] then
              SamePos := SamePos + 1;

            AllPos := AllPos + 1;
          end;
        end;

      if AllPos > 0 then
      begin // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if PttArray[Ascii].PRight > PRecognize then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          Result := Chr(Ascii);
          MemMidleTop := vSRow;
        end;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่ล่างบรรทัด
    procedure MapLowerAscii;
    var Row,Col : longint;
    begin
      vSRow := PttArray[Ascii].PMargin.Top;
      vERow := PttArray[Ascii].PMargin.Bottom;
      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = 1 then
          begin
            if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol + SLeft,Row - vSRow + STop] then
              SamePos := SamePos + 1;

            AllPos := AllPos + 1;
          end;
        end;

      if AllPos > 0 then
      begin // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if (PttArray[Ascii].PRight > MapMaxRight) or
           ((PttArray[Ascii].PRight = MapMaxRight) and (SamePos > MapSamePos)) then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          LowerAscii := Ascii;

          if MemReg then
          begin
            MemLower.Left := SLeft;
            MemLower.Top := STop;
            MemLower.Right := vECol - vSCol + 1;
            MemLower.Bottom := vERow - vSRow + 1;
          end;
        end;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่บนบรรทัด แบบพิเศษ 1 (บนสุด)
    procedure MapUpperAscii1;
    var Row,Col : longint;
    begin
      vSRow := PttArray[Ascii].PMargin.Top;
      vERow := PttArray[Ascii].PMargin.Bottom;
      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = 1 then
          begin
            if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol + SLeft,Row - vSRow + STop] then
              SamePos := SamePos + 1;

            AllPos := AllPos + 1;
          end;
        end;

      if AllPos > 0 then
      begin // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if PttArray[Ascii].PRight > 70 then
        if (PttArray[Ascii].PRight > MapMaxRight) or
           ((PttArray[Ascii].PRight = MapMaxRight) and (SamePos > MapSamePos)) then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          UpperAscii1 := Ascii;
          MemUpRow := UpRow;

          if MemReg then
          begin
            MemUpper1.Left := SLeft;
            MemUpper1.Top := STop;
            MemUpper1.Right := vECol - vSCol + 1;
            MemUpper1.Bottom := vERow - vSRow + 1;
          end;
        end;
      end;
    end;

    // ตรวจสอบตัวอักษรที่อยู่บนบรรทัด แบบพิเศษ /
    procedure MapUpperAscii2;
    var Row,Col : longint;
    begin
      vSRow := PttArray[Ascii].PMargin.Top;
      vERow := PttArray[Ascii].PMargin.Bottom;
      vSCol := PttArray[Ascii].PMargin.Left;
      vECol := PttArray[Ascii].PMargin.Right;

      AllPos := 0;
      SamePos := 0;
      for Row := vSRow to vERow do
        for Col := vSCol to vECol do
        begin
          if PttArray[Ascii].PData[Col,Row] = 1 then
          begin
            if PttArray[Ascii].PData[Col,Row] = ScanData[Col - vSCol + SLeft,Row - vSRow + STop] then
              SamePos := SamePos + 1;

            AllPos := AllPos + 1;
          end;
        end;

      if AllPos > 0 then
      begin // ตรวจสอบ percent ความถูกต้อง
        PttArray[Ascii].PRight := Round(SamePos*100/AllPos);
        if PttArray[Ascii].PRight > 70 then
        if (PttArray[Ascii].PRight > MapMaxRight) or
           ((PttArray[Ascii].PRight = MapMaxRight) and (SamePos > MapSamePos)) then
        begin
          MapMaxRight := PttArray[Ascii].PRight;
          MapSamePos := SamePos;
          UpperAscii2 := Ascii;

          if MemReg then
          begin
            MemUpper2.Left := SLeft;
            MemUpper2.Top := STop;
            MemUpper2.Right := vECol - vSCol + 1;
            MemUpper2.Bottom := vERow - vSRow + 1;
          end;
        end;
      end;
    end;

    // วน Loop เพื่อตรวจสอบตัวอักษรที่อยู่บนบรรทัด
    procedure LoopMapUpperAscii;
    begin
      vSRow := MemUpRow + 1;
      vERow := Round(FontHigh*0.8);
      vSCol := 0;
      vECol := PttArray[Ord(Result[1])].PMargin.Right - PttArray[Ord(Result[1])].PMargin.Left +
                 Round(FontHigh*0.3);

      ScanTop;
      if STop > -1 then
      begin
        STop := STop + vSRow;

        ScanLeft;

        if SLeft > -1 then
          if Result[1] in ['ป','ฝ','ฟ','ฬ'] then
            if SLeft >= PttArray[Ord(Result[1])].PMargin.Right - PttArray[Ord(Result[1])].PMargin.Left + 1 then
               SLeft := -1;

        if SLeft > -1 then
          MapUpperAscii2;
      end;
    end;

begin
  Result := '';
  MapMaxRight := 0;
  MapSamePos := 0;
  ShiftPrev := 0;

(*
    Ascii 32..126
// !"#$%&'()*+,-./0123456789:;<=>?@'#$D'ABCDEFGHIJKLMNOPQRSTUVWXYZ
//[\]^_`'#$D'abcdefghijklmnopqrstuvwxyz{|}~
    Ascii 161..217
//กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรฤลฦวศษสหฬอฮฯะัาำิีึืุู
    Ascii 223..237
//฿เแโใไๅๆ็่้๊๋์ํ
    Ascii 240..249
//๐๑๒๓๔๕๖๗๘๙  *)

  LoadScanData(LineNo,SCol,ECol,SRow,ERow); // โหบด Block ข้อมูลรูปภาพมาเก็บไว้เพื่อ Map

  for Ascii := 32 to 126 do MapMidleAscii;  // Map ตัวอักษรที่ละชุด
  for Ascii := 161 to 211 do MapMidleAscii;
  for Ascii := 223 to 230 do MapMidleAscii;
  for Ascii := 240 to 249 do MapMidleAscii;

  if MapMaxRight > PRecognize then
  begin
    if Result = 'เ' then  // 224 = เ
    begin
      for Ascii := 226 to 228 do  // โ ใ ไ
      begin
        // หาระยะขอบซ้ายของสระโดยหาจากครึ่งหนึ่งของความสูง (โ ใ ไ)
        for i := PttArray[Ascii].PMargin.Left to PttArray[Ascii].PMargin.Right do
          if PttArray[Ascii].PData[i,PttArray[Ascii].PMargin.Bottom - Round(FontHigh*0.5)] = 1 then // 50% Font high estimate left 'เ'
            break;

        // ได้ระยะขอบด้านซ้ายที่จะต้องเลื่อน
        ShiftPrev := i - PttArray[Ascii].PMargin.Left;

        // ขยายขอบเขตของตัวอักษรที่จะโหลด
        vSCol := SCol - ShiftPrev;
        vECol := vSCol + PttArray[Ascii].PMargin.Right - PttArray[Ascii].PMargin.Left;
        vSRow := SRow + Round(FontHigh*1.8) - PttBaseL + PttArray[Ascii].PMargin.Top;
        vERow := vSRow + PttArray[Ascii].PMargin.Bottom - PttArray[Ascii].PMargin.Top;

        // โหบด Block ข้อมูลรูปภาพมาเก็บไว้เพื่อ Map อีกครั้ง
        LoadScanData(LineNo,vSCol,vECol,vSRow,vERow);

        vSRow := PttArray[Ascii].PMargin.Top;
        vERow := PttArray[Ascii].PMargin.Bottom;

        // Map สระ
        MapMidleAscii1; // ต้องใช้เงื่อนไขในการตรวจสอบแตกต่างจากเดิม MapMidleAscii
      end;

      if Result = 'เ' then ShiftPrev := 0; // ถ้าไม่ใช้สระ (โ ใ ไ) ให้กำหนดระยะขอบเป็นศูนย์เหมือนเดิม
    end;

    // Map ตัวอักษรที่ใกล้เคียงกัน
    if Result = 'พ' then
    begin
      Ascii := Ord('ฬ');
      MapMidleAscii2; // ต้องใช้เงื่อนไขในการตรวจสอบแตกต่างจากเดิม MapMidleAscii
    end;

    // Map ตัวอักษรที่ใกล้เคียงกัน
    if (Result = 'บ') or (Result = 'ผ') or (Result = 'พ') then
    begin
      Ascii := Ord(Result[1]) + 1;
      MapMidleAscii2; // ต้องใช้เงื่อนไขในการตรวจสอบแตกต่างจากเดิม MapMidleAscii
    end;

    // Map ตัวอักษรที่ใกล้เคียงกัน
    if (Result >= 'ก') and (Result <= 'ฮ') then
    begin
      //  Check Lower Ascii
      if not(Result[1] in ['ฎ','ฏ','ฐ','ฤ','ฦ']) then
      begin
        LowerAscii := -1;

        MapMaxRight := 0;
        MapSamePos := 0;

        vSRow := Round(FontHigh*1.8);
        vERow := vSRow + Round(FontHigh*0.5);
        vSCol := 0;
        vECol := PttArray[Ord(Result[1])].PMargin.Right - PttArray[Ord(Result[1])].PMargin.Left;

        ScanTop;
        if STop > -1 then
        begin
          STop := STop + vSRow;

          ScanLeft;

          if SLeft > -1 then
            for Ascii := 216 to 217 do  // ุ ู
              MapLowerAscii;
        end;

        if LowerAscii > -1 then
          if not((LowerAscii = 216) and (Result = 'ญ')) then
            Result := Result + Chr(LowerAscii);
      end;

      // ขยายขอบเขตของตัวอักษรที่จะโหลด เนื่องจากเป็นสระบน
      // ระยะขอบซ้ายมีไม่เกิน 10% ของความสูงตัวอักษร เช่น สระอิ
      // ระยะขอบขวามีไม่เกิน 20% ของความสูงตัวอักษร  เช่น ไม้หันอากาศ
      // ขนาดไม่เกิน 80% ของความสูงตัวอักษร
      LoadScanData(LineNo,SCol - Round(FontHigh*0.1),ECol + Round(FontHigh*0.2),SRow,SRow + Round(FontHigh*0.8));
      //  Check Upper 1
      UpperAscii1 := -1;

      MapMaxRight := 0;
      MapSamePos := 0;

      MemUpRow := -1;
      for Ascii := 232 to 235 do  // ่้๊๋
      begin
        vSRow := 0;
        vERow := 0;

        if PttArray[Ascii].PMargin.Bottom - PttArray[Ascii].PMargin.Top > vERow then
          vERow := PttArray[Ascii].PMargin.Bottom - PttArray[Ascii].PMargin.Top;

        vSCol := 0;
        // ความกว้วงของตัวอักษร = ขอบขวา - ขอบซ้าย + (0.1 + 0.2 =) 0.3 ของความสูง เนื่องจากเริ่มจาก vSCol = 0
        vECol := PttArray[Ord(Result[1])].PMargin.Right - PttArray[Ord(Result[1])].PMargin.Left +
                   Round(FontHigh*0.3);

        ScanTop;
        if STop > -1 then
        begin
          STop := STop + vSRow;

          vERow := vERow + STop;
          UpRow := vERow;
          ScanLeft;

          if SLeft > -1 then
            if Result[1] in ['ป','ฝ','ฟ','ฬ'] then
              if SLeft >= PttArray[Ord(Result[1])].PMargin.Right - PttArray[Ord(Result[1])].PMargin.Left + 1 then
                SLeft := -1;

          if SLeft > -1 then
            MapUpperAscii1;
        end;
      end;

      //  Check Upper 2
      UpperAscii2 := -1;

      MapMaxRight := 0;
      MapSamePos := 0;

      Ascii := 209; // ั
      LoopMapUpperAscii;

      for Ascii := 212 to 215 do // ิีึื
        LoopMapUpperAscii;

      for Ascii := 231 to 237 do // ็่้๊๋์ํ
        LoopMapUpperAscii;

      if UpperAscii2 > -1 then
        Result := Result + Chr(UpperAscii2);

      if UpperAscii1 > -1 then
        Result := Result + Chr(UpperAscii1);
    end;
  end;

  Caption := IntToStr(MapMaxRight);
end;

// ทำการส่งข้อมูลไปแปลโดยจะหาขอบเขตของ Block แล้วส่งไปแปล
// ใน Procedure AsciiMapRight
function  TForm1.ScanText(LineNo, StrCol, EndCol : longint): string;
var Col : longint;
    SCol,ECol : longint;
    SRow,ERow : longint;
    Ascii : string;
    AsciiNo : longint;
    SpaceBar : longint;
    OneSpace : real;
    SkipCol : boolean;
    SpAscii : string;
    ColLimit : real;
    LenStr : longint;
begin
  if ScanTextRun then Exit;
  ScanTextRun := True;
  Screen.Cursor := crHourGlass;

  Result := '';
  ScanColumn(LineNo);
  if EndCol = 0 then EndCol := ColCount - 1;

  OneSpace := FontHigh*0.67; // SpaceBar + Space Betaween Charector
  SkipCol := False;
  SpAscii := '';
  MemReg := True;
  for Col := StrCol to EndCol do
  begin
    if not(SkipCol) then
    begin
      SCol := ColLineArray[Col];
      ECol := ColLineArray[Col] + 80; // ขนาดของ Block ที่กำหนดไว้ในการโหลด

      SRow := BaseLineArray[LineNo] - Round(FontHigh*1.8); // ด้านบนไม่เกิน 1.8 เท่าของความสูงของตัวอักษร
      ERow := BaseLineArray[LineNo] + Round(FontHigh*0.5); // ด้านล่างไม่เกิน 0.5 เท่าของความสูงของตัวอักษร

      if Col < ColCount - 1 then // เปรียบเทียบว่ามีค่ามากกว่า Column ถัดไปหรือไม่ ถ้าใช้ก็ลดขนาดของ Block ลง
      begin
        if ECol > ColLineArray[Col + 1] - 1 then
          ECol := ColLineArray[Col + 1] - 1;
      end
      else ECol := ColLineArray[Col] + FontHigh;  // FontWidt <= FontHigh

      if Col = 0 then // คำนวณหาระยะย่อหน้าของข้อความ
        Result := StringOfChar(' ',Round((ColLineArray[Col] - Margin.Left) / OneSpace));

      // Map ตัวอักษรที่โหลดไว้ใน Block กับ Pattern ตัวอักษรที่เลือกไว้
      Ascii := AsciiMapRight(LineNo,SCol,ECol,SRow,ERow);

      AsciiNo := Ord(Ascii[1]);

      // ถ้าเป็นสระแอก็ให้เลื่อนการตรวจสอบไปอีก 1 ตัวเนื่องจากจะ Map ได้เป็นสระเอสองต้วติดกัน
      if Ascii = 'แ' then SkipCol := True;

      // กรณีที่เป็นการเว้นวรรคของตัวอักษร
      if (SpAscii <> '') and (ShiftPrev > 0) then
        SpAscii := Copy(SpAscii,1,Length(SpAscii) - 1);

      LenStr := Length(Result);
      if LenStr > 0 then
        if Ascii[1] in ['โ','ใ','ไ'] then // เป็นสระที่เยื้องไปด้านซ้าย
        begin
          if Result[LenStr] in ['เ','แ','โ','ใ','ไ','ํ'] then // จึงต้องตัดออก
            Result := Copy(Result,1,LenStr - 1);
        end
        else if Result[LenStr] = 'ํ' then // ตรวจสอบสระ อำ
        begin
          Result := Copy(Result,1,LenStr - 1);
          if Ascii[1] = 'า' then Ascii := 'ำ';
        end;
      Result := Result + SpAscii + Ascii;

      SpAscii := '';

      if Col < ColCount - 1 then // คำนวนการเว้นวรรคข้อความ
        SpaceBar := ColLineArray[Col + 1] - ColLineArray[Col] -
                    (PttArray[AsciiNo].PMargin.Right - PttArray[AsciiNo].PMargin.Left + 1)
      else
        SpaceBar := Round(OneSpace);

      if Round(SpaceBar / OneSpace) > 0 then // คำนวณหาตัวอักษรตัวต่อไปที่ติดกันไม่สามารถแยกออกจากการ scan column ได้
      begin // ต้องแยกออกโดยการ Map อักษรแล้วหาความกว้างตัวอักษรที่ Map ได้แล้ว Cut ส่วนที่เหลือจากนั้นก็วนลูป Map ต่อไปจนหมด Block
        SCol := ColLineArray[Col] + PttArray[AsciiNo].PMargin.Right - PttArray[AsciiNo].PMargin.Left + 1 - ShiftPrev;
        ECol := SCol + 80;

        repeat
          if Col < ColCount - 1 then
          begin
            if ECol > ColLineArray[Col + 1] - 1 then
              ECol := ColLineArray[Col + 1] - 1;
          end
          else ECol := ColLineArray[Col] + FontHigh;  // FontWidt <= FontHigh

          // Map ตัวอักษรที่โหลดไว้ใน Block กับ Pattern ตัวอักษรที่เลือกไว้อีกครั้ง
          Ascii := AsciiMapRight(LineNo,SCol,ECol,SRow,ERow);

          AsciiNo := Ord(Ascii[1]);

          // ถ้าเป็นสระแอก็ให้เลื่อนการตรวจสอบไปอีก 1 ตัวเนื่องจากจะ Map ได้เป็นสระเอสองต้วติดกัน
          if Ascii[1] = 'แ' then SkipCol := True;

          // ตัวอักษรเว้นวรรค
          if Ascii[1] <> ' ' then
            Result := Result + Ascii
          else
            SpAscii := SpAscii + ' ';

          // คำนวณหาขอบซ้ายของตัวอักษรตัวต่อไป
          SCol := SCol + PttArray[AsciiNo].PMargin.Right - PttArray[AsciiNo].PMargin.Left + 1 - ShiftPrev;
          ECol := SCol + 80;

          if Col < ColCount - 1 then
            ColLimit := ColLineArray[Col + 1] - 0.25*FontHigh // ขนาดของตัวอักษรตัวถัดไปนั้นจะต้องมีขนาด
          else                                                // มากกว่าหรือเท่ากับ 25% ของความสูงของตัวอักษร
            ColLimit := EndLineCol;
        until SCol >= ColLimit;
      end;
    end
    else SkipCol := False;
    MemReg := False;
  end;
  ScanTextRun := False;
  Screen.Cursor := crDefault;
end;

// ทำการ Map ตัวอักษรที่ละบรรทัดตามที่เลือก
procedure TForm1.MapLineBtnClick(Sender: TObject);
begin
  if ScanTextLine.ItemIndex < 0 then Exit;
  ResultText.Clear;
  ResultText.Lines.Add(ScanText(StrToInt(ScanTextLine.Text) - 1,0,0));
end;

// ทำการ Map ตัวอักษรทั้งหมดทุกบรรทัด
procedure TForm1.MapAllLineBtnClick(Sender: TObject);
var LineNo : integer;
begin
  ResultText.Clear;
  for LineNo := 0 to LineCount - 1 do
    ResultText.Lines.Add(ScanText(LineNo,0,0));
end;

// แสดงการตัดตัวอักษร
procedure TForm1.DisplayBlockScan(BlockCol : longint);
var LineNo : longint;
    Col,TextLen : longint;
    SCol,ECol : longint;
    SRow,ERow : longint;
    DisplayText : string;
    AsciiNo : longint;
    DestRect : TRect;
    MulX,MulY : longint;
    HaveSpecialC : boolean;
begin
  Screen.Cursor := crHourGlass;
  DisplayText := '';
  LineNo := StrToInt(ColumnScanLine.Text) - 1;
  MemShiftPrev := 0;
  MemMidleTop := 0;

  // ทำการ Map ทีละ 1 column ตามที่เลือก
  DisplayText := ScanText(LineNo,BlockCol,BlockCol + 1);

  // ทำการตัดการเว้นวรรคของข้อความด้านหน้าออก
  while DisplayText[1] = ' ' do
    if DisplayText[1] = ' ' then
      DisplayText := Copy(DisplayText,2,Length(DisplayText));

  HaveSpecialC := False;
  TextLen := Length(DisplayText);
  for Col := 2 to TextLen do // ตรวจสอบสระบนสระล่างเนื่องจากจะแสดงการตัดทีละ 1 column เท่านั้น จึงมีตัวอักษรสระบนและสระล่างเท่านั้น
    if not(DisplayText[Col] in ['ั','ิ','ี','ึ','ื','ุ','ู','็','่','้','๊','๋','์','ํ']) then
    begin
      if DisplayText[Col] = 'ำ' then
        HaveSpecialC := True;

      DisplayText := Copy(DisplayText,1,Col - 1);

      break;
    end;

  AsciiNo := Ord(DisplayText[1]); // นำตัวอักษรที่ Map ได้ไปแสดงการตัด
  // โดยจะแบ่งการแสดงผลออกเป็น 5 ส่วน
  // ส่วนแรกจะแสดง Block ที่ตัดมาจาก column ที่ scan ได้
  // ส่วนที่สองจะแสดงตัวอักษรตรงกลาง
  // ส่วนที่สามจะแสดงสระล่างของตัวอักษร
  // ส่วนที่สี่จะแสดงสระบนชั้นที่ 2
  // ส่วนที่ห้าจะแสดงสระบนชั้นที่ 1
  // ดังข้างล่าง
  //
  //  ลำดับการเรียง
  //
  //  สระบนชั้นที่ 1
  //  สระบนชั้นที่ 2
  //  ตัวอักษร
  //  สระล่าง
  //

//=================================================  Draw Image Block

  SCol := ColLineArray[BlockCol];
  ECol := ColLineArray[BlockCol] + 80;

  SRow := BaseLineArray[LineNo] - Round(FontHigh*1.8);
  ERow := BaseLineArray[LineNo] + Round(FontHigh*0.5);

  if BlockCol < ColCount - 1 then
  begin
    if ECol > ColLineArray[BlockCol + 1] - 1 then
      ECol := ColLineArray[BlockCol + 1] - 1;
  end
  else ECol := ColLineArray[BlockCol] + FontHigh;  // FontWidt < FontHigh

  if DisplayText[1] in ['โ','ใ','ไ'] then
    SCol := SCol - MemShiftPrev;

  if Length(DisplayText) = 1 then
    ECol := SCol + PttArray[AsciiNo].PMargin.Right - PttArray[AsciiNo].PMargin.Left + 1;

  MulX := ImageBlock.Width Div (ECol - SCol);
  MulY := ImageBlock.Height Div (ERow - SRow);

  with DestRect do
  begin
    Left := 0;
    Top := 0;

    if MulX > MulY then MulX := MulY;

    Right := MulX*(ECol - SCol);
    Bottom := MulX*(ERow - SRow);

    Left := (ImageBlock.Width - Right) Div 2;
    Right := Left + Right;
    Top := (ImageBlock.Height - Bottom) Div 2;
    Bottom := Top + Bottom;
  end;

  with ImageBlock.Canvas do
  begin
    Pen.Color := clRed;
    Brush.Color := clWhite;
    FillRect(ImageBlock.BoundsRect);
    CopyRect(DestRect,ScanImage.Canvas,Rect(SCol,SRow,ECol,ERow));
    Brush.Color := clRed;
    FrameRect(Rect(DestRect.Left - 1, DestRect.Top - 1, DestRect.Right + 1, DestRect.Bottom + 1));
  end;

//=================================================  Draw Midle Char

  SRow := BaseLineArray[LineNo] - PttBaseL + PttArray[AsciiNo].PMargin.Top;
  ERow := SRow + PttArray[AsciiNo].PMargin.Bottom - PttArray[AsciiNo].PMargin.Top + 1;

  ECol := SCol + PttArray[Ord(DisplayText[1])].PMargin.Right - PttArray[Ord(DisplayText[1])].PMargin.Left + 1;

  with DestRect do
  begin
    Left := 0;
    Top := 0;

    Right := MulX*(ECol - SCol);
    Bottom := MulX*(ERow - SRow);

    Left := (ImageMidle.Width - Right) Div 2;
    Right := Left + Right;
    Top := (ImageMidle.Height - Bottom) Div 2;
    Bottom := Top + Bottom;
  end;

  with ImageMidle.Canvas do
  begin
    Pen.Color := clRed;
    Brush.Color := clWhite;
    FillRect(ImageMidle.BoundsRect);
    CopyRect(DestRect,ScanImage.Canvas,Rect(SCol,SRow,ECol,ERow));
    Brush.Color := clRed;
    FrameRect(Rect(DestRect.Left - 1, DestRect.Top - 1, DestRect.Right + 1, DestRect.Bottom + 1));
  end;

//================================================= Draw Lower

  SCol := ColLineArray[BlockCol];
  SRow := BaseLineArray[LineNo] - Round(FontHigh*1.8);

  SCol := SCol + MemLower.Left;
  ECol := SCol + MemLower.Right;
  SRow := SRow + MemLower.Top;
  ERow := SRow + MemLower.Bottom;

  with DestRect do
  begin
    Left := 0;
    Top := 0;

    Right := MulX*(ECol - SCol);
    Bottom := MulX*(ERow - SRow);

    Left := (ImageLower.Width - Right) Div 2;
    Right := Left + Right;
    Top := (ImageLower.Height - Bottom) Div 2;
    Bottom := Top + Bottom;
  end;

  with ImageLower.Canvas do
  begin
    Pen.Color := clRed;
    Brush.Color := clWhite;
    FillRect(ImageLower.BoundsRect);
    if DisplayText[2] in ['ุ','ู'] then
    begin
      CopyRect(DestRect,ScanImage.Canvas,Rect(SCol,SRow,ECol,ERow));
      Brush.Color := clRed;
      FrameRect(Rect(DestRect.Left - 1, DestRect.Top - 1, DestRect.Right + 1, DestRect.Bottom + 1));
    end;
  end;

//================================================= Draw Upper 2

  SCol := ColLineArray[BlockCol];
  SRow := BaseLineArray[LineNo] - Round(FontHigh*1.8);

  SCol := SCol - Round(FontHigh*0.1) + MemUpper2.Left;// - ShiftPrev;
  ECol := SCol + MemUpper2.Right;
  SRow := SRow + MemUpper2.Top;
  ERow := SRow + MemUpper2.Bottom;

  with DestRect do
  begin
    Left := 0;
    Top := 0;

    Right := MulX*(ECol - SCol);
    Bottom := MulX*(ERow - SRow);

    Left := (ImageUpper2.Width - Right) Div 2;
    Right := Left + Right;
    Top := (ImageUpper2.Height - Bottom) Div 2;
    Bottom := Top + Bottom;
  end;

  with ImageUpper2.Canvas do
  begin
    Pen.Color := clRed;
    Brush.Color := clWhite;
    FillRect(ImageUpper2.BoundsRect);
    if (Length(DisplayText) > 2) or ((Length(DisplayText) > 1) and not(DisplayText[2] in ['ุ','ู'])) or
       HaveSpecialC then
    begin
      CopyRect(DestRect,ScanImage.Canvas,Rect(SCol,SRow,ECol,ERow));
      Brush.Color := clRed;
      FrameRect(Rect(DestRect.Left - 1, DestRect.Top - 1, DestRect.Right + 1, DestRect.Bottom + 1));
    end;
  end;

//================================================= Draw Upper 1

  SCol := ColLineArray[BlockCol];
  SRow := BaseLineArray[LineNo] - Round(FontHigh*1.8);

  SCol := SCol - Round(FontHigh*0.1) + MemUpper1.Left;
  ECol := SCol + MemUpper1.Right;
  SRow := SRow + MemUpper1.Top;
  ERow := SRow + MemUpper1.Bottom;

  with DestRect do
  begin
    Left := 0;
    Top := 0;

    Right := MulX*(ECol - SCol);
    Bottom := MulX*(ERow - SRow);

    Left := (ImageUpper1.Width - Right) Div 2;
    Right := Left + Right;
    Top := (ImageUpper1.Height - Bottom) Div 2;
    Bottom := Top + Bottom;
  end;

  with ImageUpper1.Canvas do
  begin
    Pen.Color := clRed;
    Brush.Color := clWhite;
    FillRect(ImageUpper1.BoundsRect);
    if (Length(DisplayText) > 3) or ((Length(DisplayText) > 2) and not(DisplayText[2] in ['ุ','ู'])) then
    begin
      CopyRect(DestRect,ScanImage.Canvas,Rect(SCol,SRow,ECol,ERow));
      Brush.Color := clRed;
      FrameRect(Rect(DestRect.Left - 1, DestRect.Top - 1, DestRect.Right + 1, DestRect.Bottom + 1));
    end;
  end;

//=================================================

  TextBlock.Caption := DisplayText;
  Screen.Cursor := crDefault;
end;

// แสดงการตัดตัวอักษรเมื่อมีการเปลี่ยนบรรทัด
procedure TForm1.DisplayTextLineChange(Sender: TObject);
var Col : longint;
begin
  DisplayTextCol.Clear;
  if DisplayTextLine.ItemIndex < 0 then Exit;
  ColumnScanLine.ItemIndex := DisplayTextLine.ItemIndex;
  ScanColumn(StrToInt(DisplayTextLine.Text) - 1);

  for Col := 0 to ColCount - 1 do
    DisplayTextCol.Items.Add(IntToStr(Col + 1));

  if DisplayTextCol.Items.Count > 0 then
    DisplayTextCol.ItemIndex := 0;

  if DisplayTextCol.ItemIndex >= 0 then
    DisplayBlockScan(StrToInt(DisplayTextCol.Text) - 1);
end;

// แสดงการตัดตัวอักษรเมื่อมีการเปลี่ยน column
procedure TForm1.DisplayTextColChange(Sender: TObject);
begin
  if DisplayTextCol.ItemIndex >= 0 then
    DisplayBlockScan(StrToInt(DisplayTextCol.Text) - 1);
end;

// แสดงการตัดตัวอักษรเมื่อมีการเปลี่ยน column ก่อนหน้านี้
procedure TForm1.PrevColBtnClick(Sender: TObject);
begin
  if DisplayTextCol.ItemIndex > 0 then
  begin
    DisplayTextCol.ItemIndex := DisplayTextCol.ItemIndex - 1;
    DisplayTextColChange(nil);
  end;
end;

// แสดงการตัดตัวอักษรเมื่อมีการเปลี่ยน column ถัดไป
procedure TForm1.NextColBtnClick(Sender: TObject);
begin
  if DisplayTextCol.ItemIndex < DisplayTextCol.Items.Count - 1 then
  begin
    DisplayTextCol.ItemIndex := DisplayTextCol.ItemIndex + 1;
    DisplayTextColChange(nil);
  end;
end;

// คำนวณหาความสูงของตัวอักษรโดยอัตโนมัติ
procedure TForm1.AutoSizeBtnClick(Sender: TObject);
var i,HitT : longint;
    Col,ECol : longint;
    Row : longint;
    NextVal,PrevVal : longint;
    DiffVal : longint;
    SkipNext : boolean;
    FontHeight : integer;
    Count,StaticCount : integer;
    LastHeight : integer;
    LineHeight : integer;
    BaseL,TopL : longint;

  function  FindFontSize: integer; // คำนวณความสูงของตัวอักษร
  var Found : boolean;
      R,C : longint;
  begin
    BaseL := 0;
    TopL := 0;
    Found := False;
    for R := PttImage.Height - 1 downto 0 do // หาขอบล่าง
    begin
      for C := 0 to PttImage.Width - 1 do
        if PttImage.Canvas.Pixels[C,R] <> PttBgColor then
        begin
          BaseL := R + 1;
          Found := True;
          break;
        end;
      if Found then break;
    end;

    Found := False;
    for R := 0 to PttImage.Height - 1 do // หาขอบบน
    begin
      for C := 0 to PttImage.Width - 1 do
        if PttImage.Canvas.Pixels[C,R] <> PttBgColor then
        begin
          TopL := R + 1;
          Found := True;
          break;
        end;
      if Found then break;
    end;
    Result := BaseL - TopL + 1; // หาความสูง
  end;

begin
  Screen.Cursor := crHourGlass;
  HistoryHit.Clear;
  HistDifVal.Clear;
  HistFontHeight.Clear;
  HistLineHeight.Clear;

  ECol := ScanImage.Width - 1;
  Row := 0;
  with ScanImage.Picture.Bitmap.Canvas do
  begin
    // scan หาการ Hit ของแต่ละบรรทัดแล้วเก็บค่าไว้ใน List box
    repeat
      HitT := 0;
      for Col := 0 to ECol do
        if Pixels[Col,Row] = PttFontColor then
          HitT := HitT + 1;

      Application.ProcessMessages;

      HistoryHit.Items.Add(IntToStr(HitT));

      Row := Row + 1;
    until Row > ScanImage.Height - 1;

    SkipNext := False;
    FontHeight := 1;
    LineHeight := 1;
    for Row := 1 to HistoryHit.Items.Count - 2 do
    begin
      if not(SkipNext) then
      begin
        NextVal := StrToInt(HistoryHit.Items[Row + 1]);
        PrevVal := StrToInt(HistoryHit.Items[Row - 1]);
        DiffVal := (NextVal - PrevVal) Div 2;   // ทำการหาค่าความชันของแต่ละแถวที่ scan ได้จากขั้นตอนแรก
        HistDifVal.Items.Add(IntToStr(DiffVal)); // เก็บค่าความชันลง List box

        if DiffVal > 40 then // ถ้าความชันมากกว่า 40 แสดงว่าเป็นบรรทัดด้านบน
        begin
{          Pen.Color := clBlue;  // Display Line
          MoveTo(Left,Row);
          LineTo(Width,Row); }
          SkipNext := True;
          HistLineHeight.Items.Add(IntToStr(LineHeight)); // เก็บค่าความสูงของบรรทัดในบรรทัดนั้นลง List box
          FontHeight := 1;
          LineHeight := 1;
        end
        else if DiffVal < -40 then // ถ้าความชันน้อยกว่า -40 แสดงว่าเป็นบรรทัดด้านล่าง
        begin
{          Pen.Color := clRed;  // Display Line
          MoveTo(Left,Row);
          LineTo(Width,Row); }
          SkipNext := True;
          HistFontHeight.Items.Add(IntToStr(FontHeight)); // เก็บค่าความสูงของ Font ในบรรทัดนั้นลง List box
        end;
        FontHeight := FontHeight + 1;
        LineHeight := LineHeight + 1;
      end
      else SkipNext := False;
    end;

    FontHeight := 0;
    LastHeight := 0;
    Count := 0;
    StaticCount := 0;
    for Row := 0 to HistFontHeight.Items.Count - 1 do // คำนวณหาความสูงของ Font จาก List box ที่เก็บไว้
    begin
      if LastHeight <> StrToInt(HistFontHeight.Items[Row]) then
      begin
        Count := 0;
        LastHeight := StrToInt(HistFontHeight.Items[Row]);
      end
      else Count := Count + 1;

      if StaticCount < Count then
      begin
        StaticCount := Count;
        FontHeight := StrToInt(HistFontHeight.Items[Row]);
      end;
    end;

    LineHeight := 0;
    LastHeight := 0;
    Count := 0;
    StaticCount := 0;
    for Row := 0 to HistLineHeight.Items.Count - 1 do // คำนวณหาความสูงของบรรทัดจาก List box ที่เก็บไว้
    begin
      if LastHeight <> StrToInt(HistLineHeight.Items[Row]) then
      begin
        Count := 0;
        LastHeight := StrToInt(HistLineHeight.Items[Row]);
      end
      else Count := Count + 1;

      if StaticCount < Count then
      begin
        StaticCount := Count;
        LineHeight := StrToInt(HistLineHeight.Items[Row]);
      end;
    end;
  end;

  PttImage.Canvas.Font := DisplayFont.Font;
  for i := 10 to 24 do // ไล่คำนวณหาขนาดของตัวอักษรจากความสูงของตัวอักษรที่ได้มา
  begin
    PttImage.Canvas.Brush.Color := clWhite;
    PttImage.Canvas.FillRect(Rect(0,0,PttImage.Width,PttImage.Height));
    PttImage.Canvas.Font.Size:= i;
    PttImage.Canvas.TextOut(5,5,'ก');

    if FindFontSize = FontHeight then
    begin
      FontSizeL.Caption := IntToStr(i);

      // Find English Font Height
      PttImage.Canvas.Brush.Color := clWhite;
      PttImage.Canvas.FillRect(Rect(0,0,PttImage.Width,PttImage.Height));
      PttImage.Canvas.Font.Size:= i;
      PttImage.Canvas.TextOut(5,5,'A');
      FontHeightL.Caption := IntToStr(FindFontSize + 1);

      LineHeightL.Caption := IntToStr(LineHeight);

      if AutoSet.Checked then // กำหนดค่าที่ได้ไว้สำหรับโหลด Pattern
      begin
        FontSizeSp.Value := StrToInt(FontSizeL.Caption);
        FontSizeSpChange(nil);
        FontHighSp.Value := StrToInt(FontHeightL.Caption);
        LineHighSp.Value := StrToInt(LineHeightL.Caption);
      end;
      break;
    end;
  end;

  Screen.Cursor := crDefault;
end;


end.
