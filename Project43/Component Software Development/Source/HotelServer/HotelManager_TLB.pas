unit HotelManager_TLB;

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
// File generated on 04/29/01 9:30:38 from Type Library described below.

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
// Type Lib: D:\ball\OlalaProject\HotelProject2\Server\HotelManager.tlb (1)
// IID\LCID: {8DFA2A22-287C-4D3F-8AC5-2F61EB7BA18F}\0
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
  HotelManagerMajorVersion = 1;
  HotelManagerMinorVersion = 0;

  LIBID_HotelManager: TGUID = '{8DFA2A22-287C-4D3F-8AC5-2F61EB7BA18F}';

  IID_IHotel: TGUID = '{F556F631-3D7B-411B-9942-BBB0758A49A4}';
  CLASS_Hotel: TGUID = '{572B3146-7724-432B-9B14-BDFC0EB22BA9}';
  IID_IHotelCustomer: TGUID = '{EE9AFB8D-2852-4086-BA5E-889041368EE8}';
  CLASS_HotelCustomer: TGUID = '{68CCCBB1-5431-400E-B9E1-5C4684C9FEDD}';
  IID_IHotelRoom: TGUID = '{C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}';
  CLASS_HotelRoom: TGUID = '{BC68642D-8CAC-4DBF-A2DB-3980AEEDD62E}';
  IID_IHotelBooking: TGUID = '{C91F88C1-ADFD-49E3-9187-F3C2DBF72067}';
  CLASS_HotelBooking: TGUID = '{0D5BE497-170C-4336-9D04-D20966ECA778}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IHotel = interface;
  IHotelDisp = dispinterface;
  IHotelCustomer = interface;
  IHotelCustomerDisp = dispinterface;
  IHotelRoom = interface;
  IHotelRoomDisp = dispinterface;
  IHotelBooking = interface;
  IHotelBookingDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Hotel = IHotel;
  HotelCustomer = IHotelCustomer;
  HotelRoom = IHotelRoom;
  HotelBooking = IHotelBooking;


// *********************************************************************//
// Interface: IHotel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F556F631-3D7B-411B-9942-BBB0758A49A4}
// *********************************************************************//
  IHotel = interface(IDispatch)
    ['{F556F631-3D7B-411B-9942-BBB0758A49A4}']
    function  findByNameDescriptionAddressStar(const name: WideString; 
                                               const description: WideString; 
                                               const address: WideString; star: SYSINT): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IHotelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F556F631-3D7B-411B-9942-BBB0758A49A4}
// *********************************************************************//
  IHotelDisp = dispinterface
    ['{F556F631-3D7B-411B-9942-BBB0758A49A4}']
    function  findByNameDescriptionAddressStar(const name: WideString; 
                                               const description: WideString; 
                                               const address: WideString; star: SYSINT): OleVariant; dispid 1;
  end;

// *********************************************************************//
// Interface: IHotelCustomer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE9AFB8D-2852-4086-BA5E-889041368EE8}
// *********************************************************************//
  IHotelCustomer = interface(IDispatch)
    ['{EE9AFB8D-2852-4086-BA5E-889041368EE8}']
    function  createCustomer(const FirstName: WideString; const LastName: WideString; 
                             const address: WideString; gender: SYSINT; 
                             const telephoneNo: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IHotelCustomerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE9AFB8D-2852-4086-BA5E-889041368EE8}
// *********************************************************************//
  IHotelCustomerDisp = dispinterface
    ['{EE9AFB8D-2852-4086-BA5E-889041368EE8}']
    function  createCustomer(const FirstName: WideString; const LastName: WideString; 
                             const address: WideString; gender: SYSINT; 
                             const telephoneNo: WideString): WideString; dispid 1;
  end;

// *********************************************************************//
// Interface: IHotelRoom
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}
// *********************************************************************//
  IHotelRoom = interface(IDispatch)
    ['{C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}']
    function  findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(const hotelID: WideString; 
                                                                                                  PricePerDay: Currency; 
                                                                                                  const description: WideString; 
                                                                                                  NumberOfsingleBed: SYSINT; 
                                                                                                  NumberOfCoupleBed: SYSINT; 
                                                                                                  RoomClass: SYSINT; 
                                                                                                  Floor: SYSINT): OleVariant; safecall;
    function  findRoomProperty(const hotelID: WideString): OleVariant; safecall;
    function  getPricePerDay(const RoomNo: WideString; const hotelID: WideString): Currency; safecall;
    function  getDescription(const RoomNo: WideString; const hotelID: WideString): WideString; safecall;
    function  getRoomClass(const RoomNo: WideString; const hotelID: WideString): SYSINT; safecall;
    function  getFloor(const RoomNo: WideString; const hotelID: WideString): SYSINT; safecall;
    function  getNumberOfSingleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT; safecall;
    function  getNumberOfCoupleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT; safecall;
    function  getNumberOfMaximumGuest(const RoomNo: WideString; const hotelID: WideString): SYSINT; safecall;
    function  getTelephoneNo(const RoomNo: WideString; const hotelID: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IHotelRoomDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}
// *********************************************************************//
  IHotelRoomDisp = dispinterface
    ['{C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}']
    function  findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(const hotelID: WideString; 
                                                                                                  PricePerDay: Currency; 
                                                                                                  const description: WideString; 
                                                                                                  NumberOfsingleBed: SYSINT; 
                                                                                                  NumberOfCoupleBed: SYSINT; 
                                                                                                  RoomClass: SYSINT; 
                                                                                                  Floor: SYSINT): OleVariant; dispid 1;
    function  findRoomProperty(const hotelID: WideString): OleVariant; dispid 2;
    function  getPricePerDay(const RoomNo: WideString; const hotelID: WideString): Currency; dispid 3;
    function  getDescription(const RoomNo: WideString; const hotelID: WideString): WideString; dispid 4;
    function  getRoomClass(const RoomNo: WideString; const hotelID: WideString): SYSINT; dispid 5;
    function  getFloor(const RoomNo: WideString; const hotelID: WideString): SYSINT; dispid 6;
    function  getNumberOfSingleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT; dispid 7;
    function  getNumberOfCoupleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT; dispid 8;
    function  getNumberOfMaximumGuest(const RoomNo: WideString; const hotelID: WideString): SYSINT; dispid 9;
    function  getTelephoneNo(const RoomNo: WideString; const hotelID: WideString): WideString; dispid 10;
  end;

// *********************************************************************//
// Interface: IHotelBooking
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C91F88C1-ADFD-49E3-9187-F3C2DBF72067}
// *********************************************************************//
  IHotelBooking = interface(IDispatch)
    ['{C91F88C1-ADFD-49E3-9187-F3C2DBF72067}']
    function  getBookCheckInTime(const subBookingID: WideString): TDateTime; safecall;
    function  getBookCheckOutTime(const subBookingID: WideString): TDateTime; safecall;
    function  getRoomNo(const subBookingID: WideString): WideString; safecall;
    function  getHotelID(const subBookingID: WideString): WideString; safecall;
    function  getCustomerID(const subBookingID: WideString): WideString; safecall;
    function  getConfirmation(const BookingID: WideString): SYSINT; safecall;
    function  getPrice(const BookingID: WideString): Currency; safecall;
    function  getSubBookingID(const BookingID: WideString): OleVariant; safecall;
    function  Confirm(const BookingID: WideString): WideString; safecall;
    function  Cancel(const BookingID: WideString): WideString; safecall;
    function  Modify(const BookingID: WideString; const subBookingID: WideString; 
                     BookCheckInTime: TDateTime; BookCheckOutTime: TDateTime; 
                     const hotelID: WideString; PricePerDay: Currency; 
                     const description: WideString; NumberOfsingleBed: SYSINT; 
                     NumberOfCoupleBed: SYSINT; RoomClass: SYSINT; Floor: SYSINT; 
                     const CustomerID: WideString): WideString; safecall;
    function  Create(rsReserve: OleVariant; out strResult: WideString): OleVariant; safecall;
    function  viewBooking(const BookingID: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IHotelBookingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C91F88C1-ADFD-49E3-9187-F3C2DBF72067}
// *********************************************************************//
  IHotelBookingDisp = dispinterface
    ['{C91F88C1-ADFD-49E3-9187-F3C2DBF72067}']
    function  getBookCheckInTime(const subBookingID: WideString): TDateTime; dispid 1;
    function  getBookCheckOutTime(const subBookingID: WideString): TDateTime; dispid 2;
    function  getRoomNo(const subBookingID: WideString): WideString; dispid 3;
    function  getHotelID(const subBookingID: WideString): WideString; dispid 4;
    function  getCustomerID(const subBookingID: WideString): WideString; dispid 5;
    function  getConfirmation(const BookingID: WideString): SYSINT; dispid 6;
    function  getPrice(const BookingID: WideString): Currency; dispid 7;
    function  getSubBookingID(const BookingID: WideString): OleVariant; dispid 8;
    function  Confirm(const BookingID: WideString): WideString; dispid 9;
    function  Cancel(const BookingID: WideString): WideString; dispid 10;
    function  Modify(const BookingID: WideString; const subBookingID: WideString; 
                     BookCheckInTime: TDateTime; BookCheckOutTime: TDateTime; 
                     const hotelID: WideString; PricePerDay: Currency; 
                     const description: WideString; NumberOfsingleBed: SYSINT; 
                     NumberOfCoupleBed: SYSINT; RoomClass: SYSINT; Floor: SYSINT; 
                     const CustomerID: WideString): WideString; dispid 11;
    function  Create(rsReserve: OleVariant; out strResult: WideString): OleVariant; dispid 12;
    function  viewBooking(const BookingID: WideString): OleVariant; dispid 13;
  end;

// *********************************************************************//
// The Class CoHotel provides a Create and CreateRemote method to          
// create instances of the default interface IHotel exposed by              
// the CoClass Hotel. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHotel = class
    class function Create: IHotel;
    class function CreateRemote(const MachineName: string): IHotel;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THotel
// Help String      : Hotel Object
// Default Interface: IHotel
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THotelProperties= class;
{$ENDIF}
  THotel = class(TOleServer)
  private
    FIntf:        IHotel;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THotelProperties;
    function      GetServerProperties: THotelProperties;
{$ENDIF}
    function      GetDefaultInterface: IHotel;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHotel);
    procedure Disconnect; override;
    function  findByNameDescriptionAddressStar(const name: WideString; 
                                               const description: WideString; 
                                               const address: WideString; star: SYSINT): OleVariant;
    property  DefaultInterface: IHotel read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THotelProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THotel
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THotelProperties = class(TPersistent)
  private
    FServer:    THotel;
    function    GetDefaultInterface: IHotel;
    constructor Create(AServer: THotel);
  protected
  public
    property DefaultInterface: IHotel read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHotelCustomer provides a Create and CreateRemote method to          
// create instances of the default interface IHotelCustomer exposed by              
// the CoClass HotelCustomer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHotelCustomer = class
    class function Create: IHotelCustomer;
    class function CreateRemote(const MachineName: string): IHotelCustomer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THotelCustomer
// Help String      : Customer Object
// Default Interface: IHotelCustomer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THotelCustomerProperties= class;
{$ENDIF}
  THotelCustomer = class(TOleServer)
  private
    FIntf:        IHotelCustomer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THotelCustomerProperties;
    function      GetServerProperties: THotelCustomerProperties;
{$ENDIF}
    function      GetDefaultInterface: IHotelCustomer;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHotelCustomer);
    procedure Disconnect; override;
    function  createCustomer(const FirstName: WideString; const LastName: WideString; 
                             const address: WideString; gender: SYSINT; 
                             const telephoneNo: WideString): WideString;
    property  DefaultInterface: IHotelCustomer read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THotelCustomerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THotelCustomer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THotelCustomerProperties = class(TPersistent)
  private
    FServer:    THotelCustomer;
    function    GetDefaultInterface: IHotelCustomer;
    constructor Create(AServer: THotelCustomer);
  protected
  public
    property DefaultInterface: IHotelCustomer read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHotelRoom provides a Create and CreateRemote method to          
// create instances of the default interface IHotelRoom exposed by              
// the CoClass HotelRoom. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHotelRoom = class
    class function Create: IHotelRoom;
    class function CreateRemote(const MachineName: string): IHotelRoom;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THotelRoom
// Help String      : HotelRoom Object
// Default Interface: IHotelRoom
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THotelRoomProperties= class;
{$ENDIF}
  THotelRoom = class(TOleServer)
  private
    FIntf:        IHotelRoom;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THotelRoomProperties;
    function      GetServerProperties: THotelRoomProperties;
{$ENDIF}
    function      GetDefaultInterface: IHotelRoom;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHotelRoom);
    procedure Disconnect; override;
    function  findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(const hotelID: WideString; 
                                                                                                  PricePerDay: Currency; 
                                                                                                  const description: WideString; 
                                                                                                  NumberOfsingleBed: SYSINT; 
                                                                                                  NumberOfCoupleBed: SYSINT; 
                                                                                                  RoomClass: SYSINT; 
                                                                                                  Floor: SYSINT): OleVariant;
    function  findRoomProperty(const hotelID: WideString): OleVariant;
    function  getPricePerDay(const RoomNo: WideString; const hotelID: WideString): Currency;
    function  getDescription(const RoomNo: WideString; const hotelID: WideString): WideString;
    function  getRoomClass(const RoomNo: WideString; const hotelID: WideString): SYSINT;
    function  getFloor(const RoomNo: WideString; const hotelID: WideString): SYSINT;
    function  getNumberOfSingleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT;
    function  getNumberOfCoupleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT;
    function  getNumberOfMaximumGuest(const RoomNo: WideString; const hotelID: WideString): SYSINT;
    function  getTelephoneNo(const RoomNo: WideString; const hotelID: WideString): WideString;
    property  DefaultInterface: IHotelRoom read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THotelRoomProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THotelRoom
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THotelRoomProperties = class(TPersistent)
  private
    FServer:    THotelRoom;
    function    GetDefaultInterface: IHotelRoom;
    constructor Create(AServer: THotelRoom);
  protected
  public
    property DefaultInterface: IHotelRoom read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHotelBooking provides a Create and CreateRemote method to          
// create instances of the default interface IHotelBooking exposed by              
// the CoClass HotelBooking. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHotelBooking = class
    class function Create: IHotelBooking;
    class function CreateRemote(const MachineName: string): IHotelBooking;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THotelBooking
// Help String      : HotelBooking Object
// Default Interface: IHotelBooking
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THotelBookingProperties= class;
{$ENDIF}
  THotelBooking = class(TOleServer)
  private
    FIntf:        IHotelBooking;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THotelBookingProperties;
    function      GetServerProperties: THotelBookingProperties;
{$ENDIF}
    function      GetDefaultInterface: IHotelBooking;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHotelBooking);
    procedure Disconnect; override;
    function  getBookCheckInTime(const subBookingID: WideString): TDateTime;
    function  getBookCheckOutTime(const subBookingID: WideString): TDateTime;
    function  getRoomNo(const subBookingID: WideString): WideString;
    function  getHotelID(const subBookingID: WideString): WideString;
    function  getCustomerID(const subBookingID: WideString): WideString;
    function  getConfirmation(const BookingID: WideString): SYSINT;
    function  getPrice(const BookingID: WideString): Currency;
    function  getSubBookingID(const BookingID: WideString): OleVariant;
    function  Confirm(const BookingID: WideString): WideString;
    function  Cancel(const BookingID: WideString): WideString;
    function  Modify(const BookingID: WideString; const subBookingID: WideString; 
                     BookCheckInTime: TDateTime; BookCheckOutTime: TDateTime; 
                     const hotelID: WideString; PricePerDay: Currency; 
                     const description: WideString; NumberOfsingleBed: SYSINT; 
                     NumberOfCoupleBed: SYSINT; RoomClass: SYSINT; Floor: SYSINT; 
                     const CustomerID: WideString): WideString;
    function  Create1(rsReserve: OleVariant; out strResult: WideString): OleVariant;
    function  viewBooking(const BookingID: WideString): OleVariant;
    property  DefaultInterface: IHotelBooking read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THotelBookingProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THotelBooking
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THotelBookingProperties = class(TPersistent)
  private
    FServer:    THotelBooking;
    function    GetDefaultInterface: IHotelBooking;
    constructor Create(AServer: THotelBooking);
  protected
  public
    property DefaultInterface: IHotelBooking read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoHotel.Create: IHotel;
begin
  Result := CreateComObject(CLASS_Hotel) as IHotel;
end;

class function CoHotel.CreateRemote(const MachineName: string): IHotel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Hotel) as IHotel;
end;

procedure THotel.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{572B3146-7724-432B-9B14-BDFC0EB22BA9}';
    IntfIID:   '{F556F631-3D7B-411B-9942-BBB0758A49A4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THotel.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHotel;
  end;
end;

procedure THotel.ConnectTo(svrIntf: IHotel);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THotel.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THotel.GetDefaultInterface: IHotel;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THotel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THotelProperties.Create(Self);
{$ENDIF}
end;

destructor THotel.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THotel.GetServerProperties: THotelProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  THotel.findByNameDescriptionAddressStar(const name: WideString; 
                                                  const description: WideString; 
                                                  const address: WideString; star: SYSINT): OleVariant;
begin
  Result := DefaultInterface.findByNameDescriptionAddressStar(name, description, address, star);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THotelProperties.Create(AServer: THotel);
begin
  inherited Create;
  FServer := AServer;
end;

function THotelProperties.GetDefaultInterface: IHotel;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoHotelCustomer.Create: IHotelCustomer;
begin
  Result := CreateComObject(CLASS_HotelCustomer) as IHotelCustomer;
end;

class function CoHotelCustomer.CreateRemote(const MachineName: string): IHotelCustomer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HotelCustomer) as IHotelCustomer;
end;

procedure THotelCustomer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{68CCCBB1-5431-400E-B9E1-5C4684C9FEDD}';
    IntfIID:   '{EE9AFB8D-2852-4086-BA5E-889041368EE8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THotelCustomer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHotelCustomer;
  end;
end;

procedure THotelCustomer.ConnectTo(svrIntf: IHotelCustomer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THotelCustomer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THotelCustomer.GetDefaultInterface: IHotelCustomer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THotelCustomer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THotelCustomerProperties.Create(Self);
{$ENDIF}
end;

destructor THotelCustomer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THotelCustomer.GetServerProperties: THotelCustomerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  THotelCustomer.createCustomer(const FirstName: WideString; const LastName: WideString; 
                                        const address: WideString; gender: SYSINT; 
                                        const telephoneNo: WideString): WideString;
begin
  Result := DefaultInterface.createCustomer(FirstName, LastName, address, gender, telephoneNo);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THotelCustomerProperties.Create(AServer: THotelCustomer);
begin
  inherited Create;
  FServer := AServer;
end;

function THotelCustomerProperties.GetDefaultInterface: IHotelCustomer;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoHotelRoom.Create: IHotelRoom;
begin
  Result := CreateComObject(CLASS_HotelRoom) as IHotelRoom;
end;

class function CoHotelRoom.CreateRemote(const MachineName: string): IHotelRoom;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HotelRoom) as IHotelRoom;
end;

procedure THotelRoom.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{BC68642D-8CAC-4DBF-A2DB-3980AEEDD62E}';
    IntfIID:   '{C57BB349-FA85-4151-81AC-0EA7AE1C3F8C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THotelRoom.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHotelRoom;
  end;
end;

procedure THotelRoom.ConnectTo(svrIntf: IHotelRoom);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THotelRoom.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THotelRoom.GetDefaultInterface: IHotelRoom;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THotelRoom.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THotelRoomProperties.Create(Self);
{$ENDIF}
end;

destructor THotelRoom.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THotelRoom.GetServerProperties: THotelRoomProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  THotelRoom.findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(const hotelID: WideString; 
                                                                                                         PricePerDay: Currency; 
                                                                                                         const description: WideString; 
                                                                                                         NumberOfsingleBed: SYSINT; 
                                                                                                         NumberOfCoupleBed: SYSINT; 
                                                                                                         RoomClass: SYSINT; 
                                                                                                         Floor: SYSINT): OleVariant;
begin
  Result := DefaultInterface.findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(hotelID, 
                                                                                                                 PricePerDay, 
                                                                                                                 description, 
                                                                                                                 NumberOfsingleBed, 
                                                                                                                 NumberOfCoupleBed, 
                                                                                                                 RoomClass, 
                                                                                                                 Floor);
end;

function  THotelRoom.findRoomProperty(const hotelID: WideString): OleVariant;
begin
  Result := DefaultInterface.findRoomProperty(hotelID);
end;

function  THotelRoom.getPricePerDay(const RoomNo: WideString; const hotelID: WideString): Currency;
begin
  Result := DefaultInterface.getPricePerDay(RoomNo, hotelID);
end;

function  THotelRoom.getDescription(const RoomNo: WideString; const hotelID: WideString): WideString;
begin
  Result := DefaultInterface.getDescription(RoomNo, hotelID);
end;

function  THotelRoom.getRoomClass(const RoomNo: WideString; const hotelID: WideString): SYSINT;
begin
  Result := DefaultInterface.getRoomClass(RoomNo, hotelID);
end;

function  THotelRoom.getFloor(const RoomNo: WideString; const hotelID: WideString): SYSINT;
begin
  Result := DefaultInterface.getFloor(RoomNo, hotelID);
end;

function  THotelRoom.getNumberOfSingleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT;
begin
  Result := DefaultInterface.getNumberOfSingleBed(RoomNo, hotelID);
end;

function  THotelRoom.getNumberOfCoupleBed(const RoomNo: WideString; const hotelID: WideString): SYSINT;
begin
  Result := DefaultInterface.getNumberOfCoupleBed(RoomNo, hotelID);
end;

function  THotelRoom.getNumberOfMaximumGuest(const RoomNo: WideString; const hotelID: WideString): SYSINT;
begin
  Result := DefaultInterface.getNumberOfMaximumGuest(RoomNo, hotelID);
end;

function  THotelRoom.getTelephoneNo(const RoomNo: WideString; const hotelID: WideString): WideString;
begin
  Result := DefaultInterface.getTelephoneNo(RoomNo, hotelID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THotelRoomProperties.Create(AServer: THotelRoom);
begin
  inherited Create;
  FServer := AServer;
end;

function THotelRoomProperties.GetDefaultInterface: IHotelRoom;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoHotelBooking.Create: IHotelBooking;
begin
  Result := CreateComObject(CLASS_HotelBooking) as IHotelBooking;
end;

class function CoHotelBooking.CreateRemote(const MachineName: string): IHotelBooking;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HotelBooking) as IHotelBooking;
end;

procedure THotelBooking.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0D5BE497-170C-4336-9D04-D20966ECA778}';
    IntfIID:   '{C91F88C1-ADFD-49E3-9187-F3C2DBF72067}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THotelBooking.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHotelBooking;
  end;
end;

procedure THotelBooking.ConnectTo(svrIntf: IHotelBooking);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THotelBooking.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THotelBooking.GetDefaultInterface: IHotelBooking;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THotelBooking.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THotelBookingProperties.Create(Self);
{$ENDIF}
end;

destructor THotelBooking.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THotelBooking.GetServerProperties: THotelBookingProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  THotelBooking.getBookCheckInTime(const subBookingID: WideString): TDateTime;
begin
  Result := DefaultInterface.getBookCheckInTime(subBookingID);
end;

function  THotelBooking.getBookCheckOutTime(const subBookingID: WideString): TDateTime;
begin
  Result := DefaultInterface.getBookCheckOutTime(subBookingID);
end;

function  THotelBooking.getRoomNo(const subBookingID: WideString): WideString;
begin
  Result := DefaultInterface.getRoomNo(subBookingID);
end;

function  THotelBooking.getHotelID(const subBookingID: WideString): WideString;
begin
  Result := DefaultInterface.getHotelID(subBookingID);
end;

function  THotelBooking.getCustomerID(const subBookingID: WideString): WideString;
begin
  Result := DefaultInterface.getCustomerID(subBookingID);
end;

function  THotelBooking.getConfirmation(const BookingID: WideString): SYSINT;
begin
  Result := DefaultInterface.getConfirmation(BookingID);
end;

function  THotelBooking.getPrice(const BookingID: WideString): Currency;
begin
  Result := DefaultInterface.getPrice(BookingID);
end;

function  THotelBooking.getSubBookingID(const BookingID: WideString): OleVariant;
begin
  Result := DefaultInterface.getSubBookingID(BookingID);
end;

function  THotelBooking.Confirm(const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.Confirm(BookingID);
end;

function  THotelBooking.Cancel(const BookingID: WideString): WideString;
begin
  Result := DefaultInterface.Cancel(BookingID);
end;

function  THotelBooking.Modify(const BookingID: WideString; const subBookingID: WideString; 
                               BookCheckInTime: TDateTime; BookCheckOutTime: TDateTime; 
                               const hotelID: WideString; PricePerDay: Currency; 
                               const description: WideString; NumberOfsingleBed: SYSINT; 
                               NumberOfCoupleBed: SYSINT; RoomClass: SYSINT; Floor: SYSINT; 
                               const CustomerID: WideString): WideString;
begin
  Result := DefaultInterface.Modify(BookingID, subBookingID, BookCheckInTime, BookCheckOutTime, 
                                    hotelID, PricePerDay, description, NumberOfsingleBed, 
                                    NumberOfCoupleBed, RoomClass, Floor, CustomerID);
end;

function  THotelBooking.Create1(rsReserve: OleVariant; out strResult: WideString): OleVariant;
begin
  Result := DefaultInterface.Create(rsReserve, strResult);
end;

function  THotelBooking.viewBooking(const BookingID: WideString): OleVariant;
begin
  Result := DefaultInterface.viewBooking(BookingID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THotelBookingProperties.Create(AServer: THotelBooking);
begin
  inherited Create;
  FServer := AServer;
end;

function THotelBookingProperties.GetDefaultInterface: IHotelBooking;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[THotel, THotelCustomer, THotelRoom, THotelBooking]);
end;

end.
