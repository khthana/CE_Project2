unit AddRestaurantToPackageFrom_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, OlalaAgency_TLB;

type
  TfrmAddRestaurantToPackage = class(TForm)
    grbSearch: TGroupBox;
    grbAddRestaurantToPackage: TGroupBox;
    stgView: TStringGrid;
    edtName: TEdit;
    edtAddress: TEdit;
    edtDescription: TEdit;
    edtClass: TEdit;
    btnSearch: TButton;
    labName: TLabel;
    labAddress: TLabel;
    labDescription: TLabel;
    labClass: TLabel;
    btnClose: TButton;
    edtRestaurantID: TEdit;
    edtReserveDate: TEdit;
    edtMeal: TEdit;
    edtSeatAmount: TEdit;
    btnAddToPackage: TButton;
    labRestaurantID: TLabel;
    labReserveDate: TLabel;
    labMeal: TLabel;
    labSeatAmount: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure stgViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddToPackageClick(Sender: TObject);
  private
    restaurant: _OlalaAgencyViewer;
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    { Private declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);

  public
    { Public declarations }
  end;

var
  frmAddRestaurantToPackage: TfrmAddRestaurantToPackage;

implementation

uses CreatePackageFrom_Source;

{$R *.DFM}

procedure TfrmAddRestaurantToPackage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddRestaurantToPackage.FormCreate(Sender: TObject);
begin
  restaurant:= CoOlalaAgencyViewer.Create;
end;

procedure TfrmAddRestaurantToPackage.btnSearchClick(Sender: TObject);
begin
  OleVar:= restaurant.QueryRestaurant(edtName.Text,edtDescription.Text,edtAddress.Text,
                StrToInt(edtClass.Text),strResult);
  UpdateGrid(stgView);
  OleVar.Close;
end;

procedure TfrmAddRestaurantToPackage.UpdateGrid(StringGrid1: TStringGrid);
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

procedure TfrmAddRestaurantToPackage.stgViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  stgView.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgView.MouseToCell(X, Y, Column, Row);
    edtRestaurantID.Text :=  stgView.Cells[0, Row];
  end;
end;

procedure TfrmAddRestaurantToPackage.btnAddToPackageClick(Sender: TObject);
begin
  frmCreatePackage.RestaurantID:= edtRestaurantID.Text;
  frmCreatePackage.Meal:= edtMeal.Text;
  frmCreatePackage.ReserveDate:= edtReserveDate.Text;
  frmCreatePackage.SeatAmount:= edtSeatAmount.Text;

  frmCreatePackage.UpdateRestaurantGrid(frmCreatePackage.stgRestaurant);
end;

end.
