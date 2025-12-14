unit AddAircraftToPackageForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ExtCtrls, OlalaAgency_TLB;

type
  TfrmAddAircraftToPackage = class(TForm)
    grbSearch: TGroupBox;
    edtNumberOfSeat: TEdit;
    edtGoingDate: TEdit;
    chkSmoking: TCheckBox;
    chkNonStopFlight: TCheckBox;
    btnSearch: TButton;
    btnClose: TButton;
    labNumberOfSeat: TLabel;
    labGoingDate: TLabel;
    labClassType: TLabel;
    labFrom: TLabel;
    labAirline: TLabel;
    labTo: TLabel;
    grbAddToPackage: TGroupBox;
    edtNumberOfSeatAdd: TEdit;
    edtFromAdd: TEdit;
    edtToAdd: TEdit;
    edtGoingDateAdd: TEdit;
    edtClassTypeAdd: TEdit;
    labNumberOfSeatAdd: TLabel;
    labGoingDateAdd: TLabel;
    labClassTypeAdd: TLabel;
    labFromAdd: TLabel;
    labToAdd: TLabel;
    btnAddToPackage: TButton;
    cmbSeatType: TComboBox;
    labSeatType: TLabel;
    stgView: TStringGrid;
    edtFrom: TEdit;
    edtTo: TEdit;
    edtClassType: TEdit;
    edtAirline: TEdit;
    grbAirline: TGroupBox;
    grbAirport: TGroupBox;
    stgAirline: TStringGrid;
    stgAirport: TStringGrid;
    edtPriceAdd: TEdit;
    labPriceAdd: TLabel;
    edtFlightAdd: TEdit;
    labFlightAdd: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure stgViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddToPackageClick(Sender: TObject);
  private
    aircraft: _OlalaAgencyViewer;
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    { Private declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);
    
  public
    { Public declarations }    
  end;

var
  frmAddAircraftToPackage: TfrmAddAircraftToPackage;

implementation

uses CreatePackageFrom_Source;

{$R *.DFM}

procedure TfrmAddAircraftToPackage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddAircraftToPackage.FormCreate(Sender: TObject);
var
  airlineMessage,airportMessage: WideString;
begin
  aircraft:= CoOlalaAgencyViewer.Create;
  OleVar:= aircraft.QueryAirline('',airlineMessage);
  UpdateGrid(stgAirline);
  OleVar.Close;
  OleVar:= aircraft.QueryAirport('',airportMessage);
  UpdateGrid(stgAirport);
  OleVar.Close;
end;

procedure TfrmAddAircraftToPackage.UpdateGrid(StringGrid1: TStringGrid);
var
  Row, Col : Integer;
begin
  if OleVar.EOF and OleVar.BOF then
    strResult := 'Log is Empty!!'
  else begin
    OleVar.MoveFirst;

    // Get Total Row of RecordSet
    TotalRow := 0;
    while not OleVar.EOF do
    begin
      INC(TotalRow);
      OleVar.MoveNext;
    end;

    StringGrid1.ColCount := OleVar.Fields.Count;
    StringGrid1.RowCount := TotalRow + 1;

    strResult := 'Total Result :' + IntToStr(TotalRow) + ' Rows.';

    for Col := 0 to OleVar.Fields.Count - 1 do
      StringGrid1.Cells[Col, 0] := OleVar.Fields.Item[Col].Name;

    OleVar.MoveFirst;
    Row := 1;
    while not OleVar.EOF do
    begin
      for Col := 0 to OleVar.Fields.Count - 1 do
        StringGrid1.Cells[Col, Row] := VarToStr(OleVar.Fields.Item[Col].Value);
      INC(Row);
      OleVar.MoveNext;
    end;
  end;
 // StatusBar1.SimpleText := strResult;
end;

procedure TfrmAddAircraftToPackage.btnSearchClick(Sender: TObject);
var
  retMessage: WideString;
begin
  OleVar:= aircraft.QueryFlight(edtFrom.Text,edtTo.Text,StrToInt(edtNumberOfSeat.Text),
                retMessage,edtGoingDate.Text,StrToInt(edtAirline.Text),
                StrToInt(edtClassType.Text),cmbSeatType.ItemIndex,chkSmoking.Checked,
                chkNonStopFlight.Checked,0);
  UpdateGrid(stgView);
  OleVar.Close;
end;

procedure TfrmAddAircraftToPackage.stgViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  stgView.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgView.MouseToCell(X, Y, Column, Row);
    edtFlightAdd.Text :=  stgView.Cells[1, Row];
    edtPriceAdd.Text:=  stgView.Cells[10, Row];
    edtNumberOfSeatAdd.Text:= edtNumberOfSeat.Text;
    edtFromAdd.Text:= stgView.Cells[7, Row];
    edtToAdd.Text:= stgView.Cells[8, Row];
    edtClassTypeAdd.Text:= stgView.Cells[4, Row];
    edtGoingDateAdd.Text:= edtGoingDate.Text;
  end;
end;

procedure TfrmAddAircraftToPackage.btnAddToPackageClick(Sender: TObject);
begin
  frmCreatePackage.AirTotalSeat:= edtNumberOfSeatAdd.Text;
  frmCreatePackage.AirFlightID:= edtFlightAdd.Text;
  frmCreatePackage.AirSrcIdx:= edtFromAdd.Text;
  frmCreatePackage.AirDstIdx:= edtToAdd.Text;
  frmCreatePackage.AirDepartDate:= edtGoingDateAdd.Text;
  frmCreatePackage.AirClassType:= edtClassTypeAdd.Text;
  frmCreatePackage.AirPrice:= edtPriceAdd.Text;

  frmCreatePackage.UpdateAircraftGrid(frmCreatePackage.stgAircraft);
end;

end.
