unit ViewPackageFrom_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, PackageSystem_TLB;

type
  TfrmViewPackage = class(TForm)
    grbAirCraft: TGroupBox;
    grbBus: TGroupBox;
    grbHotel: TGroupBox;
    grbRestaurant: TGroupBox;
    stgHotel: TStringGrid;
    stgAircraft: TStringGrid;
    stgRestaurant: TStringGrid;
    stgBus: TStringGrid;
    edtPackageID: TEdit;
    btnView: TButton;
    labPackageID: TLabel;
    btnClose: TButton;
    edtPackageName: TEdit;
    edtDescription: TEdit;
    edtDepartTime: TEdit;
    edtArriveTime: TEdit;
    edtTotalPrice: TEdit;
    labPackageName: TLabel;
    labDescription: TLabel;
    labDepartTime: TLabel;
    labArriveTime: TLabel;
    labTotalPrice: TLabel;
    edtConfirmed: TEdit;
    labConfirmed: TLabel;
    grbPlace: TGroupBox;
    stgPlace: TStringGrid;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
  private
    viewPackage: _PackageManager;
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    aircraftBookingID,busBookingID,hotelBookingID,restaurantBookingID: WideString;
    { Private declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);

  public
    { Public declarations }
  end;

var
  frmViewPackage: TfrmViewPackage;

implementation

{$R *.DFM}

procedure TfrmViewPackage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewPackage.FormCreate(Sender: TObject);
begin
  viewPackage:= CoPackageManager.Create;
end;

procedure TfrmViewPackage.UpdateGrid(StringGrid1: TStringGrid);
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

procedure TfrmViewPackage.btnViewClick(Sender: TObject);
begin
  OleVar:= viewPackage.ViewGroupBookingID(edtPackageID.Text,strResult);
  aircraftBookingID:=VarToStr(OleVar.fields.item[0].value);
  busBookingID:= VarToStr(OleVar.fields.item[1].value);
  hotelBookingID:= VarToStr(OleVar.fields.item[2].value);
  restaurantBookingID:= VarToStr(OleVar.fields.item[3].value);
  OleVar.Close;

  OleVar:= viewPackage.ViewPackagePlace(edtPackageID.Text,strResult);
  UpdateGrid(stgPlace);
  OleVar.Close;

  if hotelBookingID<>'' then
  begin
    OleVar:= viewPackage.ViewReserveHotelRoomForPackageTour(hotelBookingID,strResult);
    UpdateGrid(stgHotel);
    OleVar.Close;
  end;

  if restaurantBookingID<>'' then
  begin
    OleVar:= viewPackage.ViewReserveRestaurantForPackageTour(restaurantBookingID,strResult);
    UpdateGrid(stgRestaurant);
    OleVar.Close;
  end;

end;

end.
