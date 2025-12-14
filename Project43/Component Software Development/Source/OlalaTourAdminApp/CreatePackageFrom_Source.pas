unit CreatePackageFrom_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, AddHotelToPackageFrom_Source, AddRestaurantToPackageFrom_Source,
  AddPlaceToPackageFrom_Source, AddAircraftToPackageForm_Source, PackageSystem_TLB,
  AddBusToPackageForm_Source;

type
  TfrmCreatePackage = class(TForm)
    grbPlace: TGroupBox;
    grbAircarft: TGroupBox;
    grbBus: TGroupBox;
    grbHotel: TGroupBox;
    grbRestaurant: TGroupBox;
    stgPlace: TStringGrid;
    stgHotel: TStringGrid;
    stgAircraft: TStringGrid;
    stgRestaurant: TStringGrid;
    stgBus: TStringGrid;
    btnAddPlace: TButton;
    btnAddAircraft: TButton;
    btnBus: TButton;
    btnHotel: TButton;
    btnRestaurant: TButton;
    btnCreatePackage: TButton;
    btnClose: TButton;
    edtAdminID: TEdit;
    edtPackageName: TEdit;
    edtDescription: TEdit;
    edtArriveTime: TEdit;
    edtDepartTime: TEdit;
    edtTotalPrice: TEdit;
    labAdminID: TLabel;
    labArriveTime: TLabel;
    labDescription: TLabel;
    labPackageName: TLabel;
    labDepartTime: TLabel;
    labTotalPrice: TLabel;
    procedure btnHotelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRestaurantClick(Sender: TObject);
    procedure btnAddPlaceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCreatePackageClick(Sender: TObject);
    procedure btnAddAircraftClick(Sender: TObject);
    procedure btnBusClick(Sender: TObject);
  private
    HotelRow,totalBook,RestaurantRow,PlaceRow, AircraftRow, BusRow: integer;
    HotelBook,BookingString,RestaurantBook,PlaceBook,AircraftBook,BusBook: WideString;
    PackageBooking: _PackageManager;
    { Private declarations }
  public
    HotelID,HotelBookCheckInTime,HotelBookCheckOutTime,
    HotelPricePerDay, HotelDescription,NumberOfSingleBed,
    NumberOfCoupleBed,RoomClass,Floor,RoomAmount: WideString;

    RestaurantID, Meal, ReserveDate, SeatAmount: WideString;

    PlaceID,PlaceArriveTime,PlaceDepartTime: WideString;

    BusCompanyID,BusModelID,NumberOfBus,BusStartDate,BusNumberOfDay: WideString;

    AirTotalSeat, AirFlightID, AirSrcIdx, AirDstIdx, AirDepartDate, AirClassType,AirPrice : WideString;

    AdminID : WideString;

    { Public declarations }
    procedure UpdateHotelGrid(StringGrid1: TStringGrid);
    procedure UpdateRestaurantGrid(StringGrid1: TStringGrid);
    procedure UpdatePlaceGrid(StringGrid1: TStringGrid);
    procedure UpdateAircraftGrid(StringGrid1: TStringGrid);
    procedure UpdateBusGrid(StringGrid1: TStringGrid);

  end;

var
  frmCreatePackage: TfrmCreatePackage;

implementation

{$R *.DFM}

procedure TfrmCreatePackage.btnHotelClick(Sender: TObject);
begin
  frmAddHotelToPackage.ShowModal;
end;

procedure TfrmCreatePackage.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCreatePackage.btnRestaurantClick(Sender: TObject);
begin
  frmAddRestaurantToPackage.ShowModal;
end;

procedure TfrmCreatePackage.btnAddPlaceClick(Sender: TObject);
begin
  frmAddPlaceToPackage.ShowModal;
end;

procedure TfrmCreatePackage.UpdateHotelGrid(StringGrid1: TStringGrid);
begin

    StringGrid1.ColCount := 10;
    StringGrid1.RowCount := HotelRow+1;

    StringGrid1.Cells[0, 0] := 'Hotel ID';
    StringGrid1.Cells[1, 0] := 'Book check in time';
    StringGrid1.Cells[2, 0] := 'Book check out time';
    StringGrid1.Cells[3, 0] := 'Price per day';
    StringGrid1.Cells[4, 0] := 'Description';
    StringGrid1.Cells[5, 0] := 'Number of single bed';
    StringGrid1.Cells[6, 0] := 'Number of couple bed';
    StringGrid1.Cells[7, 0] := 'Room class';
    StringGrid1.Cells[8, 0] := 'Floor';
    StringGrid1.Cells[9, 0] := 'Room amount';

    StringGrid1.Cells[0, HotelRow] := HotelID;
    StringGrid1.Cells[1, HotelRow] := HotelBookCheckInTime;
    StringGrid1.Cells[2, HotelRow] := HotelBookCheckOutTime;
    StringGrid1.Cells[3, HotelRow] := HotelPricePerDay;
    StringGrid1.Cells[4, HotelRow] := HotelDescription;
    StringGrid1.Cells[5, HotelRow] := NumberOfSingleBed;
    StringGrid1.Cells[6, HotelRow] := NumberOfCoupleBed;
    StringGrid1.Cells[7, HotelRow] := RoomClass;
    StringGrid1.Cells[8, HotelRow] := Floor;
    StringGrid1.Cells[9, HotelRow] := RoomAmount;
    INC(HotelRow);

    HotelBook:= HotelBook + 'PH['+HotelBookCheckInTime+','+HotelBookCheckOutTime+','+
                HotelID+','+HotelPricePerDay+','+HotelDescription+','+NumberOfSingleBed+','+
                NumberOfCoupleBed+','+RoomClass+','+Floor+','+RoomAmount+']';

    totalBook:= totalBook+1;
    ShowMessage(HotelBook);
end;

procedure TfrmCreatePackage.FormCreate(Sender: TObject);
begin
  PackageBooking:= CoPackageManager.Create;
  totalBook:=0;
  BookingString:='';
  HotelRow:=1;
  HotelBook:='';
  RestaurantRow:=1;
  RestaurantBook:='';
  PlaceRow:= 1;
  PlaceBook:='';
  AircraftRow:=1;
  AircraftBook:='';
  BusRow:=1;
  BusBook:='';
end;

procedure TfrmCreatePackage.btnCreatePackageClick(Sender: TObject);
var
  strResult: WideString;
begin
  BookingString:= edtAdminID.Text+','+edtPackageName.Text+','+edtDescription.Text+','+
                edtArriveTime.Text+','+edtDepartTime.Text+','+edtTotalPrice.Text+','+
                IntToStr(totalBook)+'{'+AircraftBook+BusBook+HotelBook+RestaurantBook+PlaceBook+'}';
  ShowMessage(BookingString);
  PackageBooking.Create(BookingString,strResult);
  ShowMessage(strResult);
end;

procedure TfrmCreatePackage.UpdateRestaurantGrid(StringGrid1: TStringGrid);
begin

    StringGrid1.ColCount := 4;
    StringGrid1.RowCount := RestaurantRow+1;

    StringGrid1.Cells[0, 0] := 'Restaurant ID';
    StringGrid1.Cells[1, 0] := 'Meal';
    StringGrid1.Cells[2, 0] := 'Reserve date';
    StringGrid1.Cells[3, 0] := 'Seat Amount';


    StringGrid1.Cells[0, RestaurantRow] := RestaurantID;
    StringGrid1.Cells[1, RestaurantRow] := Meal;
    StringGrid1.Cells[2, RestaurantRow] := ReserveDate;
    StringGrid1.Cells[3, RestaurantRow] := SeatAmount;


    INC(RestaurantRow);

    RestaurantBook:= RestaurantBook + 'PR['+RestaurantID+','+Meal+','+
                        ReserveDate+','+SeatAmount+']';

    totalBook:= totalBook+1;
    ShowMessage(RestaurantBook);
end;

procedure TfrmCreatePackage.UpdatePlaceGrid(StringGrid1: TStringGrid);
begin

    StringGrid1.ColCount := 3;
    StringGrid1.RowCount := PlaceRow+1;

    StringGrid1.Cells[0, 0] := 'Place ID';
    StringGrid1.Cells[1, 0] := 'Arrive Time';
    StringGrid1.Cells[2, 0] := 'Depart Time';

    StringGrid1.Cells[0, PlaceRow] := PlaceID;
    StringGrid1.Cells[1, PlaceRow] := PlaceArriveTime;
    StringGrid1.Cells[2, PlaceRow] := PlaceDepartTime;

    INC(PlaceRow);

    PlaceBook:= PlaceBook + 'PP['+ PlaceID+','+PlaceArriveTime+','+
                        PlaceDepartTime+']';


    totalBook:= totalBook+1;
    ShowMessage(PlaceBook);

end;

procedure TfrmCreatePackage.btnAddAircraftClick(Sender: TObject);
begin
  frmAddAircraftToPackage.ShowModal;
end;

procedure TfrmCreatePackage.UpdateAircraftGrid(StringGrid1: TStringGrid);
begin

    StringGrid1.ColCount := 7;
    StringGrid1.RowCount := AircraftRow+1;

    StringGrid1.Cells[0, 0] := 'Total seat';
    StringGrid1.Cells[1, 0] := 'Flight ID';
    StringGrid1.Cells[2, 0] := 'SrcIdx';
    StringGrid1.Cells[3, 0] := 'DstIdx';
    StringGrid1.Cells[4, 0] := 'Depart date';
    StringGrid1.Cells[5, 0] := 'Class type';
    StringGrid1.Cells[6, 0] := 'Price';

    StringGrid1.Cells[0, AircraftRow] := AirTotalSeat;
    StringGrid1.Cells[1, AircraftRow] := AirFlightID;
    StringGrid1.Cells[2, AircraftRow] := AirSrcIdx;
    StringGrid1.Cells[3, AircraftRow] := AirDstIdx;
    StringGrid1.Cells[4, AircraftRow] := AirDepartDate;
    StringGrid1.Cells[5, AircraftRow] := AirClassType;
    StringGrid1.Cells[6, AircraftRow] := AirPrice;

    INC(AircraftRow);

    AircraftBook:= AircraftBook + 'PA['+ AirTotalSeat+','+AirFlightID+','+AirSrcIdx+
                ','+AirDstIdx+','+AirDepartDate+','+AirClassType+','+AirPrice+']';

    totalBook:= totalBook+1;
    ShowMessage(AircraftBook);

end;

procedure TfrmCreatePackage.btnBusClick(Sender: TObject);
begin
  frmAddBusToPackage.ShowModal;
end;

procedure TfrmCreatePackage.UpdateBusGrid(StringGrid1: TStringGrid);
begin

    StringGrid1.ColCount := 5;
    StringGrid1.RowCount := BusRow+1;

    StringGrid1.Cells[0, 0] := 'Company ID';
    StringGrid1.Cells[1, 0] := 'Model ID';
    StringGrid1.Cells[2, 0] := 'Number of bus';
    StringGrid1.Cells[3, 0] := 'Start date';
    StringGrid1.Cells[4, 0] := 'Number of day';

    StringGrid1.Cells[0, BusRow] := BusCompanyID;
    StringGrid1.Cells[1, BusRow] := BusModelID;
    StringGrid1.Cells[2, BusRow] := NumberOfBus;
    StringGrid1.Cells[3, BusRow] := BusStartDate;
    StringGrid1.Cells[4, BusRow] := BusNumberOfDay;

    INC(BusRow);

    BusBook:= BusBook + 'PB['+BusCompanyID+','+BusModelID+','+
                        NumberOfBus+','+BusStartDate+','+BusNumberOfDay+']';

    totalBook:= totalBook+1;
    ShowMessage(BusBook);

end;

end.
