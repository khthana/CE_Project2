unit AddHotelToPackageFrom_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, OlalaAgency_TLB;

type
  TfrmAddHotelToPackage = class(TForm)
    grbSearchHotel: TGroupBox;
    grbViewHotelProperty: TGroupBox;
    grbAddHotelToPackage: TGroupBox;
    stgSearchHotel: TStringGrid;
    stgViewHotelProperty: TStringGrid;
    edtNameSearch: TEdit;
    edtAddressSearch: TEdit;
    edtDescriptionSearch: TEdit;
    edtClassSearch: TEdit;
    btnSearch: TButton;
    labNameSearch: TLabel;
    labAddressSearch: TLabel;
    labDescriptionSearch: TLabel;
    labClassSearch: TLabel;
    edtHotelIDView: TEdit;
    btnView: TButton;
    labHotelIDView: TLabel;
    edtHotelIDAdd: TEdit;
    edtBookCheckInTimeAdd: TEdit;
    edtBookCheckOutTimeAdd: TEdit;
    edtPricePerDayAdd: TEdit;
    edtDescriptionAdd: TEdit;
    edtNumberOfSingleBedAdd: TEdit;
    edtNumberOfCoupleBedAdd: TEdit;
    edtRoomClassAdd: TEdit;
    edtFloorAdd: TEdit;
    edtRoomAmountAdd: TEdit;
    btnAddToPackage: TButton;
    btnClose: TButton;
    labHotelIDAdd: TLabel;
    labBookCheckInTimeAdd: TLabel;
    labBookCheckOutTimeAdd: TLabel;
    labPricePerDayAdd: TLabel;
    labDescriptionAdd: TLabel;
    labNumberOfSingleBedAdd: TLabel;
    labNumberOfCoupleBedAdd: TLabel;
    labRoomClass: TLabel;
    labFloorAdd: TLabel;
    labRoomAmountAdd: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure stgSearchHotelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnViewClick(Sender: TObject);
    procedure stgViewHotelPropertyMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddToPackageClick(Sender: TObject);
  private
    hotel: _OlalaAgencyViewer;
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;

    { Private declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);

  public
    { Public declarations }
  end;

var
  frmAddHotelToPackage: TfrmAddHotelToPackage;

implementation

uses CreatePackageFrom_Source;

{$R *.DFM}

procedure TfrmAddHotelToPackage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddHotelToPackage.FormCreate(Sender: TObject);
begin
  hotel:= CoOlalaAgencyViewer.Create;
end;

procedure TfrmAddHotelToPackage.btnSearchClick(Sender: TObject);
begin
  OleVar:= hotel.QueryHotel(edtNameSearch.Text,edtDescriptionSearch.Text,
                edtAddressSearch.Text,StrToInt(edtClassSearch.Text),strResult);
  UpdateGrid(stgSearchHotel);
  OleVar.Close;
end;

procedure TfrmAddHotelToPackage.UpdateGrid(StringGrid1: TStringGrid);
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

procedure TfrmAddHotelToPackage.stgSearchHotelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  stgSearchHotel.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgSearchHotel.MouseToCell(X, Y, Column, Row);
    edtHotelIDView.Text := stgSearchHotel.Cells[0, Row];
    edtHotelIDAdd.Text :=  stgSearchHotel.Cells[0, Row];
  end;
end;

procedure TfrmAddHotelToPackage.btnViewClick(Sender: TObject);
begin
  OleVar:= hotel.QueryRoom(edtHotelIDView.Text,strResult);
  UpdateGrid(stgViewHotelProperty);
  OleVar.Close;
end;

procedure TfrmAddHotelToPackage.stgViewHotelPropertyMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  Column, Row: Longint;
begin
  stgViewHotelProperty.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgViewHotelProperty.MouseToCell(X, Y, Column, Row);
    edtPricePerDayAdd.Text := stgViewHotelProperty.Cells[0, Row];
    edtDescriptionAdd.Text := stgViewHotelProperty.Cells[1, Row];
    edtNumberOfSingleBedAdd.Text := stgViewHotelProperty.Cells[2, Row];
    edtNumberOfCoupleBedAdd.Text := stgViewHotelProperty.Cells[3, Row];
    edtRoomClassAdd.Text := stgViewHotelProperty.Cells[4, Row];
  end;
end;

procedure TfrmAddHotelToPackage.btnAddToPackageClick(Sender: TObject);
begin
  frmCreatePackage.HotelID:= edtHotelIDAdd.Text;
  frmCreatePackage.HotelBookCheckInTime:= edtBookCheckInTimeAdd.Text;
  frmCreatePackage.HotelBookCheckOutTime:= edtBookCheckOutTimeAdd.Text;
  frmCreatePackage.HotelPricePerDay := edtPricePerDayAdd.Text;
  frmCreatePackage.HotelDescription:= edtDescriptionAdd.Text;
  frmCreatePackage.NumberOfSingleBed:= edtNumberOfSingleBedAdd.Text;
  frmCreatePackage.NumberOfCoupleBed:= edtNumberOfCoupleBedAdd.Text;
  frmCreatePackage.RoomClass:= edtRoomClassAdd.Text;
  frmCreatePackage.Floor:= edtFloorAdd.Text;
  frmCreatePackage.RoomAmount:= edtRoomAmountAdd.Text;

  frmCreatePackage.UpdateHotelGrid(frmCreatePackage.stgHotel);
  
end;

end.
