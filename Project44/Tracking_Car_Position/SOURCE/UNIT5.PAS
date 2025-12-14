unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, DBCtrls, QuickRpt, QRCtrls;

type
  TForm5 = class(TForm)
    DataSource1: TDataSource;
    Button1: TButton;
    report: TTable;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses car_tracking;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var i:integer;
    itemindex1 : integer;
begin
  report.first;
  itemindex1 := Listbox1.itemindex;
  for i:=1 to itemindex1 do
  begin
    report.next;
  end;
  form1.track_id:= report.fieldvalues['r_id'];
  report.filter := 'r_id = '+ inttostr(report.fieldvalues['r_id']);
  report.filtered := true;
  form1.Ltrack_id.caption := report.fieldvalues['r_id'];
  form1.Lcar_id.caption := report.fieldvalues['carid'];
  form1.Ldriver.caption := report.fieldvalues['driver'];
  form1.Lstart_date.caption := report.fieldvalues['startdate'];
  form1.Lstart_time.caption := report.fieldvalues['starttime']+' น.';
  form1.Lend_date.caption := report.fieldvalues['enddate'];
  form1.Lend_time.caption := report.fieldvalues['endtime']+' น.';
  report.Filtered:=false;
  form1.eversim := false;
  form1.toolbutton6.enabled := true;  
  form5.close;

end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  report.first;
  while (not report.eof)do
  begin
  ListBox1.Items.Add('Tracking ID'+inttostr(report.fieldvalues['r_id'])+'  เส้นทาง '+report.fieldvalues['route']+'  วันที่ '+report.fieldvalues['startdate']);
  report.next;
  end;
end;
end.
