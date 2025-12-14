unit ShowGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TfrmGraph = class(TForm)
    btnClose: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGraph: TfrmGraph;

implementation

{$R *.dfm}

procedure TfrmGraph.btnCloseClick(Sender: TObject);
begin
    frmGraph.Close;
end;

end.
