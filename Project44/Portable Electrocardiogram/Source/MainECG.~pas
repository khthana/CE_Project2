unit MainECG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, VaClasses, VaComm, TeEngine, Series,
  TeeProcs, Chart, Grids, DBGrids, Mask;

type
  TfrmEcg = class(TForm)
    Label1: TLabel;
    btnImpdata: TButton;
    btnAnl: TButton;
    grpDt: TGroupBox;
    btnSetDt: TButton;
    Label2: TLabel;
    Label3: TLabel;
    cmbMon: TComboBox;
    cmbDay: TComboBox;
    cmbYear: TComboBox;
    VaComm: TVaComm;
    cmbCom: TComboBox;
    Label4: TLabel;
    grpInput: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    mmoTime: TMemo;
    mskTime: TMaskEdit;
    btnExit: TButton;
    btnShd: TButton;
    mmohrate: TMemo;
    Label7: TLabel;
    edtTms: TEdit;
    Label8: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSetDtClick(Sender: TObject);
    procedure btnImpdataClick(Sender: TObject);
    procedure cmbComChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnAnlClick(Sender: TObject);
    procedure VaCommRxChar(Sender: TObject; Count: Integer);
    procedure btnShdClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEcg: TfrmEcg;
  dHour,dMin : integer;
  DateDate,DateTime : string;
  DataMemX : array[1..1024] of string;
  DataMemY : array[1..1024] of Byte;
  Recieve_OK : Boolean=false;
  idx_all : integer=0;
  times_for : integer=0;
  function ReturnDate(dd:string;dm:string;dy:string):string;
  function ReturnTime(dt:string{dh:string;dmin:string}):string;
  function incTime(dt:string{;inc:integer}):string;
  procedure send_bit(x:integer);

implementation

uses ShowGraph;

{$R *.dfm}
function ReturnDate(dd:string;dm:string;dy:string):string;
begin
    if StrLen(Pchar(dd))=1 then
        dd:='0'+dd;
    ReturnDate:=dd+'/'+dm+'/'+dy;
end;

function ReturnTime(dt:string):string;      {dh:string;dmin:string}
begin
    {if StrLen(Pchar(dh))=1 then
        dh:='0'+dh;
    if StrLen(Pchar(dmin))=1 then
        dmin:='0'+dmin;
    ReturnTime:=dh+':'+dmin;}
    if (dt[1] <> '1') and (dt[1] <> '2') then
        dt[1]:='0';
    ReturnTime:=dt;
end;

function incTime(dt:string):string;
var dh,dm:integer;
    strh,strm:string;
begin    strh:=dt[1]+dt[2];
    strm:=dt[4]+dt[5];
    dh:=StrToInt(strh);
    dm:=StrToInt(strm);
    dm:=dm+1;
    if dm = 60 then
    begin
        dh:=dh+1;
        dm:=0;
    end;
    if dh = 24 then
    begin
        dh:=0;
    end;
    strh:=IntToStr(dh);
    strm:=IntToStr(dm);
    if Length(strh)=1 then strh:='0'+strh;
    if Length(strm)=1 then strm:='0'+strm;
    incTime:=strh+':'+strm;
end;

procedure send_bit(x:integer);
begin
    frmEcg.VaComm.WriteChar(chr(x));
end;

procedure TfrmEcg.FormCreate(Sender: TObject);
begin
    VaComm.Active;
    VaComm.Open;
end;

procedure TfrmEcg.btnSetDtClick(Sender: TObject);
//var Hour,Min : integer;
begin
    //Hour := StrToInt(edtHr.Text);
    //Min := StrToInt(edtMin.Text);
    {if not((Hour in [0..23]) and (Min in [0..59])) then
        ShowMessage('Error Hours and Minutes')
    else begin
            {dHour:=Hour;
            dMin:=Min;}
    DateDate:=ReturnDate(cmbDay.Text,cmbMon.Text,cmbYear.Text);
    DateTime:=ReturnTime(mskTime.Text);
    frmEcg.btnImpdata.Enabled:=true;
    showmessage(DateDate+#10+#13+DateTime);
//    end;
end;

procedure TfrmEcg.btnImpdataClick(Sender: TObject);
//var id_x : integer;
begin
    btnImpdata.Enabled:=false;
    btnShd.Enabled:=true;
//    btnAnl.Enabled:=true;
//    btnSav.Enabled:=true;
    send_bit(55);
//    for id_x:=1 to idx_all do
//        frmEcg.mmoHrate.Lines.Add(inttostr(DataMemY[id_x]));

//    VaComm.WriteChar(chr(55));
//    for idx:=1 to idx_all do
//        frmEcg.mmoHrate.Lines.Add(inttostr(DataMemY[idx]));
end;

procedure TfrmEcg.cmbComChange(Sender: TObject);
begin
    VaComm.Close;
    VaComm.DeviceName:=cmbCom.Text;
    VaComm.Active;
    VaComm.Open;
    //ShowMessage(cmbCom.Text);
end;

procedure TfrmEcg.btnExitClick(Sender: TObject);
begin
    VaComm.Close;
    frmEcg.Close;
    //Exit;
end;

procedure TfrmEcg.btnAnlClick(Sender: TObject);
var idx : integer;
begin
    //for idx:=1 to 20 do
    //    frmEcg.mmoHrate.Lines.Add(inttostr(DataMemY[idx]));
    {dataMemY[1]:=20;
    DataMemY[2]:=50;}
    for idx:=1 to  idx_all do
        frmGraph.Series1.AddXY(idx,DataMemY[idx],'',clRed);
    frmGraph.Show;
end;

procedure TfrmEcg.VaCommRxChar(Sender: TObject; Count: Integer);
var idx,num_rd : integer;
    db_rd : array[1..1024] of Byte;
begin
    if times_for > 10 then
//    begin
//        for id_x:=1 to idx_all do
//            frmEcg.mmoHrate.Lines.Add(inttostr(DataMemY[id_x]));
        exit;
//    end;
    {if recieve_OK = true then
        exit;}
    frmEcg.mmoTime.Clear;
    frmEcg.mmoHrate.Clear;
    for idx := 1 to 1024 do
        db_rd[idx]:=0;
    num_rd := VaComm.ReadBuf(db_rd,count);
    for idx := 1 to num_rd do
    begin
        if db_rd[idx]<>255 then
        begin
            {if db_rd[idx] = 0 then
            begin
                inc(idx_all);
                DataMemY[idx_all]:=DataMemY[idx_all-1];
            end
            else begin}
                inc(idx_all);
                DataMemY[idx_all]:=db_rd[idx];
            {end;}
        end;
{        if (db_rd[idx]<>0) and (db_rd[idx]<>255) then
        begin
            inc(idx_all);
            DataMemY[idx_all]:=db_rd[idx];
        end;}
{        DateTime:=incTime(DateTime);
        frmEcg.mmoTime.Lines.Add(DateTime);
        frmEcg.mmoHrate.Lines.Add(inttostr(db_rd[idx]));
//        DataMemX[idx]:=DateTime;
        DataMemY[idx]:=db_rd[idx];}
    end;
    inc(times_for);
//    recieve_OK:=true;
end;

procedure TfrmEcg.btnShdClick(Sender: TObject);
var idx :integer;
begin
    btnAnl.Enabled:=true;
    //btnSav.Enabled:=true;
    edtTms.Text:=inttostr(DataMemY[2]-1);
    for idx:=3 to DataMemY[2]-1 do
    begin
        DateTime:=incTime(DateTime);
        //Test:= DateTime+'       '+inttostr(DataMemY[idx]);
        frmEcg.mmoTime.Lines.Add(DateTime);
        frmEcg.mmoHrate.Lines.Add(inttostr(DataMemY[idx]));
    end;
end;

procedure TfrmEcg.Button1Click(Sender: TObject);
begin
    frmEcg.mmoTime.Clear;
    frmEcg.mmoHrate.Clear;
    VaComm.WriteChar(chr(99));
end;

END.
