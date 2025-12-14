unit Restaurant_BookingPrj_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 04/29/01 9:44:16 from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: D:\ball\OlalaProject\RestaurantProject\Restaurant_Booking\Server\Restaurant_BookingPrj.tlb (1)
// IID\LCID: {8FD76257-3A90-45FA-A8B6-A456B92767DE}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Restaurant_BookingPrjMajorVersion = 1;
  Restaurant_BookingPrjMinorVersion = 0;

  LIBID_Restaurant_BookingPrj: TGUID = '{8FD76257-3A90-45FA-A8B6-A456B92767DE}';

  IID_IRestaurant_Booking: TGUID = '{07033B6E-B448-4A94-857C-117E4563D774}';
  CLASS_Restaurant_Booking: TGUID = '{6D9762B7-C2DE-4280-AA3D-03B5DB97A109}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRestaurant_Booking = interface;
  IRestaurant_BookingDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Restaurant_Booking = IRestaurant_Booking;


// *********************************************************************//
// Interface: IRestaurant_Booking
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {07033B6E-B448-4A94-857C-117E4563D774}
// *********************************************************************//
  IRestaurant_Booking = interface(IDispatch)
    ['{07033B6E-B448-4A94-857C-117E4563D774}']
    function  getRestaurantID(const subBookingID: WideString): WideString; safecall;
    function  getAgencyID(const BookingID: WideString): WideString; safecall;
    function  getConfirmation(const BookingID: WideString): SYSINT; safecall;
    function  getNoOfReserveSeat(const subBookingID: WideString): SYSINT; safecall;
    function  getMeal(const subBookingID: WideString): SYSINT; safecall;
    function  getReserveDate(const subBookingID: WideString): TDateTime; safecall;
    function  Create(const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                     NoOfReserveSeat: SYSINT; const BookingID: WideString): WideString; safecall;
    function  Confirm(const BookingID: WideString): WideString; safecall;
    function  Cancel(const BookingID: WideString): WideString; safecall;
    function  Modify(const BookingID: WideString; const subBooking: WideString; 
                     const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                     NoOfReserveSeat: SYSINT): WideString; safecall;
    function  CreateReserve(rsReserve: OleVariant; out strResult: WideString): OleVariant; safecall;
    function  getSubBookingID(const BookingID: WideString): OleVariant; safecall;
    function  viewBooking(const BookingID: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRestaurant_BookingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {07033B6E-B448-4A94-857C-117E4563D774}
// *********************************************************************//
  IRestaurant_BookingDisp = dispinterface
    ['{07033B6E-B448-4A94-857C-117E4563D774}']
    function  getRestaurantID(const subBookingID: WideString): WideString; dispid 1;
    function  getAgencyID(const BookingID: WideString): WideString; dispid 2;
    function  getConfirmation(const BookingID: WideString): SYSINT; dispid 3;
    function  getNoOfReserveSeat(const subBookingID: WideString): SYSINT; dispid 4;
    function  getMeal(const subBookingID: WideString): SYSINT; dispid 5;
    function  getReserveDate(const subBookingID: WideString): TDateTime; dispid 6;
    function  Create(const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                     NoOfReserveSeat: SYSINT; const BookingID: WideString): WideString; dispid 7;
    function  Confirm(const BookingID: WideString): WideString; dispid 8;
    function  Cancel(const BookingID: WideString): WideString; dispid 9;
    function  Modify(const BookingID: WideString; const subBooking: WideString; 
                     const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                     NoOfReserveSeat: SYSINT): WideString; dispid 10;
    function  CreateReserve(rsReserve: OleVariant; out strResult: WideString): OleVariant; dispid 11;
    function  getSubBookingID(const BookingID: WideString): OleVariant; dispid 12;
    function  viewBooking(const BookingID: WideString): OleVariant; dispid 13;
  end;

// *********************************************************************//
// The Class CoRestaurant_Booking provides a Create and CreateRemote method to          
// create instances of the default interface IRestaurant_Booking exposed by              
// the CoClass Restaurant_Booking. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRestaurant_Booking = class
    class function Create: IRestaurant_Booking;
    class function CreateRemote(const MachineName: string): IRestaurant_Booking;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRestaurant_Booking
// Help String      : Restaurant_Booking Object
// Default Interface: IRestaurant_Booking
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRestaurant_BookingProperties= class;
{$ENDIF}
  TRestaurant_Booking = class(TOleServer)
  private
    FIntf:        IRestaurant_Booking;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRestaurant_BookingProperties;
    function      GetServerProperties: TRestaurant_BookingProperties;
{$ENDIF}
    function      GetDefaultInterface: IRestaurant_Booking;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRestaurant_Booking);
    procedure Disconnect; override;
    function  getRestaurantID(const subBookingID: WideString): WideString;
    function  getAgencyID(const BookingID: WideString): WideString;
    function  getConfirmation(const BookingID: WideString): SYSINT;
    function  getNoOfReserveSeat(const subBookingID: WideString): SYSINT;
    function  getMeal(const subBookingID: WideString): SYSINT;
    function  getReserveDate(const subBookingID: WideString): TDateTime;
    function  Create1(const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                      NoOfReserveSeat: SYSINT; const BookingID: WideString): WideString;
    function  Confirm(const BookingID: WideString): WideString;
    function  Cancel(const BookingID: WideString): WideString;
    function  Modify(const BookingID: WideString; const subBooking: WideString; 
                     const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                     NoOfReserveSeat: SYSINT): WideString;
    function  CreateReserve(rsReserve: OleVariant; out strResult: WideString): OleVariant;
    function  getSubBookingID(const BookingID: WideString): OleVariant;
    function  viewBooking(const BookingID: WideString): OleVariant;
    property  DefaultInterface: IRestaurant_Booking read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRestaurant_BookingProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRestaurant_Booking
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRestaurant_BookingProperties = class(TPersistent)
  private
    FServer:    TRestaurant_Booking;
    function    GetDefaultInterface: IRestaurant_Booking;
    constructor Create(AServer: TRestaurant_Booking);
  protected
  public
    property DefaultInterface: IRestaurant_Booking read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoRestaurant_Booking.Create: IRestaurant_Booking;
begin
  Result := CreateComObject(CLASS_Restaurant_Booking) as IRestaurant_Booking;
end;

class function CoRestaurant_Booking.CreateRemote(const MachineName: string): IRestaurant_Booking;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Restaurant_Booking) as IRestaurant_Booking;
end;

procedure TRestaurant_Booking.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6D9762B7-C2DE-4280-AA3D-03B5DB97A109}';
    IntfIID:   '{07033B6E-B448-4A94-857C-117E4563D774}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRestaurant_Booking.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRestaurant_Booking;
  end;
end;

procedure TRestaurant_Booking.ConnectTo(svrIntf: IRestaurant_Booking);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRestaurant_Booking.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRestaurant_Booking.GetDefaultInterface: IRestaurant_Booking;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRestaurant_Booking.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRestaurant_BookingProperties.Create(Self);
{$ENDIF}
end;

destructor TRestaurant_Booking.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRestaurant_Booking.GetServerProperties: TRestaurant_BookingProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TRestaurant_Booking.getRestaurantID(const subBookingID: WideString): WideString;
begin
  Result := DefaultInterface.getRestaurantID(subBookingID);
end;

function  TRestaurant_Booking.getAgencyID(const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.getAgencyID(BookingID);
end;

function  TRestaurant_Booking.getConfirmation(const BookingID: WideString): SYSINT;
begin
  Result := DefaultInterface.getConfirmation(BookingID);
end;

function  TRestaurant_Booking.getNoOfReserveSeat(const subBookingID: WideString): SYSINT;
begin
  Result := DefaultInterface.getNoOfReserveSeat(subBookingID);
end;

function  TRestaurant_Booking.getMeal(const subBookingID: WideString): SYSINT;
begin
  Result := DefaultInterface.getMeal(subBookingID);
end;

function  TRestaurant_Booking.getReserveDate(const subBookingID: WideString): TDateTime;
begin
  Result := DefaultInterface.getReserveDate(subBookingID);
end;

function  TRestaurant_Booking.Create1(const RestaurantID: WideString; Meal: SYSINT; 
                                      ReserveDate: TDateTime; NoOfReserveSeat: SYSINT; 
                                      const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.Create(RestaurantID, Meal, ReserveDate, NoOfReserveSeat, BookingID);
end;

function  TRestaurant_Booking.Confirm(const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.Confirm(BookingID);
end;

function  TRestaurant_Booking.Cancel(const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.Cancel(BookingID);
end;

function  TRestaurant_Booking.Modify(const BookingID: WideString; const subBooking: WideString; 
                                     const RestaurantID: WideString; Meal: SYSINT; 
                                     ReserveDate: TDateTime; NoOfReserveSeat: SYSINT): WideString;
begin
  Result := DefaultInterface.Modify(BookingID, subBooking, RestaurantID, Meal, ReserveDate, 
                                    NoOfReserveSeat);
end;

function  TRestaurant_Booking.CreateReserve(rsReserve: OleVariant; out strResult: WideString): OleVariant;
begin
  Result := DefaultInterface.CreateReserve(rsReserve, strResult);
end;

function  TRestaurant_Booking.getSubBookingID(const BookingID: WideString): OleVariant;
begin
  Result := DefaultInterface.getSubBookingID(BookingID);
end;

function  TRestaurant_Booking.viewBooking(const BookingID: WideString): OleVariant;
begin
  Result := DefaultInterface.viewBooking(BookingID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRestaurant_BookingProperties.Create(AServer: TRestaurant_Booking);
begin
  inherited Create;
  FServer := AServer;
end;

function TRestaurant_BookingProperties.GetDefaultInterface: IRestaurant_Booking;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TRestaurant_Booking]);
end;

end.
