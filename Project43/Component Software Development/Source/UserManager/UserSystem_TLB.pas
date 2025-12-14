unit UserSystem_TLB;

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
// File generated on 27/04/01 3:32:20 AM from Type Library described below.

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
// Type Lib: D:\Project\SourceCode\OlalaTour\UserManager\UserSystem.tlb (1)
// IID\LCID: {42FC325B-214D-4CCC-8403-BED81BE72119}\0
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
  UserSystemMajorVersion = 1;
  UserSystemMinorVersion = 0;

  LIBID_UserSystem: TGUID = '{42FC325B-214D-4CCC-8403-BED81BE72119}';

  IID_IAdminManager: TGUID = '{F15F509E-20CC-4D04-BD6C-3BDE7A466361}';
  CLASS_AdminManager: TGUID = '{048C2866-C4AD-4871-84BE-421BE9ED999D}';
  IID_IMemberManager: TGUID = '{E325864E-7BBE-4A0E-AD36-A0F9026349D4}';
  CLASS_MemberManager: TGUID = '{2A036860-F981-479C-BACB-D1E385FEBF06}';
  IID_IFoodType: TGUID = '{6A5A1754-CBAF-4600-A854-F7A88439F521}';
  CLASS_FoodType: TGUID = '{681B1391-848A-4C46-A465-71A6A4E8D071}';
  IID_ITravellerManager: TGUID = '{2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}';
  CLASS_TravellerManager: TGUID = '{7FDD4DA8-1735-4F2C-94E4-706CDED5FED0}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAdminManager = interface;
  IAdminManagerDisp = dispinterface;
  IMemberManager = interface;
  IMemberManagerDisp = dispinterface;
  IFoodType = interface;
  IFoodTypeDisp = dispinterface;
  ITravellerManager = interface;
  ITravellerManagerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AdminManager = IAdminManager;
  MemberManager = IMemberManager;
  FoodType = IFoodType;
  TravellerManager = ITravellerManager;


// *********************************************************************//
// Interface: IAdminManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F15F509E-20CC-4D04-BD6C-3BDE7A466361}
// *********************************************************************//
  IAdminManager = interface(IDispatch)
    ['{F15F509E-20CC-4D04-BD6C-3BDE7A466361}']
    function  Create(const LoginName: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const Password: WideString): WideString; safecall;
    procedure Modify(const AdminID: WideString; const LoginName: WideString; 
                     const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const Password: WideString); safecall;
    function  ViewProfile(const AdminID: WideString): OleVariant; safecall;
    function  QueryData(const LoginNameKeyword: WideString; const FirstNameKeyword: WideString; 
                        const LastNameKeyword: WideString; const AddressKeyword: WideString; 
                        const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString): OleVariant; safecall;
    function  Authenticate(const LoginName: WideString; const Password: WideString): WideString; safecall;
    function  GetLoginName(const AdminID: WideString): WideString; safecall;
    procedure Remove(const AdminID: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAdminManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F15F509E-20CC-4D04-BD6C-3BDE7A466361}
// *********************************************************************//
  IAdminManagerDisp = dispinterface
    ['{F15F509E-20CC-4D04-BD6C-3BDE7A466361}']
    function  Create(const LoginName: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const Password: WideString): WideString; dispid 1;
    procedure Modify(const AdminID: WideString; const LoginName: WideString; 
                     const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const Password: WideString); dispid 2;
    function  ViewProfile(const AdminID: WideString): OleVariant; dispid 3;
    function  QueryData(const LoginNameKeyword: WideString; const FirstNameKeyword: WideString; 
                        const LastNameKeyword: WideString; const AddressKeyword: WideString; 
                        const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString): OleVariant; dispid 4;
    function  Authenticate(const LoginName: WideString; const Password: WideString): WideString; dispid 5;
    function  GetLoginName(const AdminID: WideString): WideString; dispid 6;
    procedure Remove(const AdminID: WideString); dispid 7;
  end;

// *********************************************************************//
// Interface: IMemberManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E325864E-7BBE-4A0E-AD36-A0F9026349D4}
// *********************************************************************//
  IMemberManager = interface(IDispatch)
    ['{E325864E-7BBE-4A0E-AD36-A0F9026349D4}']
    function  Create(const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const Password: WideString): WideString; safecall;
    procedure Modify(const MemberID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const Password: WideString); safecall;
    function  ViewProfile(const MemberID: WideString): OleVariant; safecall;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsHotelCustomerID: Shortint): OleVariant; safecall;
    function  Authenticate(const EmailAddress: WideString; const Password: WideString): OleVariant; safecall;
    function  GetTraveller(const MemberID: WideString): OleVariant; safecall;
    function  GetHotelCustomerID(const MemberID: WideString): WideString; safecall;
    procedure SetHotelCustomerID(const MemberID: WideString; const HotelCustomerID: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMemberManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E325864E-7BBE-4A0E-AD36-A0F9026349D4}
// *********************************************************************//
  IMemberManagerDisp = dispinterface
    ['{E325864E-7BBE-4A0E-AD36-A0F9026349D4}']
    function  Create(const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const Password: WideString): WideString; dispid 1;
    procedure Modify(const MemberID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const Password: WideString); dispid 2;
    function  ViewProfile(const MemberID: WideString): OleVariant; dispid 3;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsHotelCustomerID: {??Shortint} OleVariant): OleVariant; dispid 4;
    function  Authenticate(const EmailAddress: WideString; const Password: WideString): OleVariant; dispid 5;
    function  GetTraveller(const MemberID: WideString): OleVariant; dispid 6;
    function  GetHotelCustomerID(const MemberID: WideString): WideString; dispid 7;
    procedure SetHotelCustomerID(const MemberID: WideString; const HotelCustomerID: WideString); dispid 8;
  end;

// *********************************************************************//
// Interface: IFoodType
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6A5A1754-CBAF-4600-A854-F7A88439F521}
// *********************************************************************//
  IFoodType = interface(IDispatch)
    ['{6A5A1754-CBAF-4600-A854-F7A88439F521}']
    function  QueryData(const NameKeyword: WideString): OleVariant; safecall;
    function  View(const FoodTypeID: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IFoodTypeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6A5A1754-CBAF-4600-A854-F7A88439F521}
// *********************************************************************//
  IFoodTypeDisp = dispinterface
    ['{6A5A1754-CBAF-4600-A854-F7A88439F521}']
    function  QueryData(const NameKeyword: WideString): OleVariant; dispid 1;
    function  View(const FoodTypeID: WideString): OleVariant; dispid 2;
  end;

// *********************************************************************//
// Interface: ITravellerManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}
// *********************************************************************//
  ITravellerManager = interface(IDispatch)
    ['{2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}']
    function  Create(const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const FoodTypeID: WideString): WideString; safecall;
    procedure Modify(const TravellerID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const FoodTypeID: WideString); safecall;
    function  ViewProfile(const TravellerID: WideString): OleVariant; safecall;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsBusCompanyCustomerID: Shortint; IsAirlineCustomerID: Shortint; 
                        const FoodTypeIDKeyword: WideString): OleVariant; safecall;
    function  GetBusCompanyCustomerID(const TravellerID: WideString): WideString; safecall;
    function  GetAirlineCustomerID(const TravellerID: WideString): WideString; safecall;
    procedure SetBusCompanyCustomerID(const TravellerID: WideString; 
                                      const BusCompanyCustomerID: WideString); safecall;
    procedure SetAirlineCustomerID(const TravellerID: WideString; 
                                   const AirlineCustomerID: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITravellerManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}
// *********************************************************************//
  ITravellerManagerDisp = dispinterface
    ['{2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}']
    function  Create(const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const FoodTypeID: WideString): WideString; dispid 1;
    procedure Modify(const TravellerID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const FoodTypeID: WideString); dispid 2;
    function  ViewProfile(const TravellerID: WideString): OleVariant; dispid 3;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsBusCompanyCustomerID: {??Shortint} OleVariant; 
                        IsAirlineCustomerID: {??Shortint} OleVariant; 
                        const FoodTypeIDKeyword: WideString): OleVariant; dispid 4;
    function  GetBusCompanyCustomerID(const TravellerID: WideString): WideString; dispid 5;
    function  GetAirlineCustomerID(const TravellerID: WideString): WideString; dispid 6;
    procedure SetBusCompanyCustomerID(const TravellerID: WideString; 
                                      const BusCompanyCustomerID: WideString); dispid 8;
    procedure SetAirlineCustomerID(const TravellerID: WideString; 
                                   const AirlineCustomerID: WideString); dispid 9;
  end;

// *********************************************************************//
// The Class CoAdminManager provides a Create and CreateRemote method to          
// create instances of the default interface IAdminManager exposed by              
// the CoClass AdminManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAdminManager = class
    class function Create: IAdminManager;
    class function CreateRemote(const MachineName: string): IAdminManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAdminManager
// Help String      : AdminManager Object
// Default Interface: IAdminManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAdminManagerProperties= class;
{$ENDIF}
  TAdminManager = class(TOleServer)
  private
    FIntf:        IAdminManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAdminManagerProperties;
    function      GetServerProperties: TAdminManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: IAdminManager;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAdminManager);
    procedure Disconnect; override;
    function  Create1(const LoginName: WideString; const FirstName: WideString; 
                      const LastName: WideString; const Address: WideString; 
                      const TelephoneNo: WideString; const EmailAddress: WideString; 
                      Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                      const Password: WideString): WideString;
    procedure Modify(const AdminID: WideString; const LoginName: WideString; 
                     const FirstName: WideString; const LastName: WideString; 
                     const Address: WideString; const TelephoneNo: WideString; 
                     const EmailAddress: WideString; Gender: Smallint; const BirthDate: WideString; 
                     const Religion: WideString; const Password: WideString);
    function  ViewProfile(const AdminID: WideString): OleVariant;
    function  QueryData(const LoginNameKeyword: WideString; const FirstNameKeyword: WideString; 
                        const LastNameKeyword: WideString; const AddressKeyword: WideString; 
                        const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString): OleVariant;
    function  Authenticate(const LoginName: WideString; const Password: WideString): WideString;
    function  GetLoginName(const AdminID: WideString): WideString;
    procedure Remove(const AdminID: WideString);
    property  DefaultInterface: IAdminManager read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAdminManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAdminManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAdminManagerProperties = class(TPersistent)
  private
    FServer:    TAdminManager;
    function    GetDefaultInterface: IAdminManager;
    constructor Create(AServer: TAdminManager);
  protected
  public
    property DefaultInterface: IAdminManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMemberManager provides a Create and CreateRemote method to          
// create instances of the default interface IMemberManager exposed by              
// the CoClass MemberManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMemberManager = class
    class function Create: IMemberManager;
    class function CreateRemote(const MachineName: string): IMemberManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMemberManager
// Help String      : MemberManager Object
// Default Interface: IMemberManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMemberManagerProperties= class;
{$ENDIF}
  TMemberManager = class(TOleServer)
  private
    FIntf:        IMemberManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMemberManagerProperties;
    function      GetServerProperties: TMemberManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: IMemberManager;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMemberManager);
    procedure Disconnect; override;
    function  Create1(const FirstName: WideString; const LastName: WideString; 
                      const Address: WideString; const TelephoneNo: WideString; 
                      const EmailAddress: WideString; Gender: Smallint; 
                      const BirthDate: WideString; const Religion: WideString; 
                      const Password: WideString): WideString;
    procedure Modify(const MemberID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const Password: WideString);
    function  ViewProfile(const MemberID: WideString): OleVariant;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsHotelCustomerID: Shortint): OleVariant;
    function  Authenticate(const EmailAddress: WideString; const Password: WideString): OleVariant;
    function  GetTraveller(const MemberID: WideString): OleVariant;
    function  GetHotelCustomerID(const MemberID: WideString): WideString;
    procedure SetHotelCustomerID(const MemberID: WideString; const HotelCustomerID: WideString);
    property  DefaultInterface: IMemberManager read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMemberManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMemberManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMemberManagerProperties = class(TPersistent)
  private
    FServer:    TMemberManager;
    function    GetDefaultInterface: IMemberManager;
    constructor Create(AServer: TMemberManager);
  protected
  public
    property DefaultInterface: IMemberManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoFoodType provides a Create and CreateRemote method to          
// create instances of the default interface IFoodType exposed by              
// the CoClass FoodType. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFoodType = class
    class function Create: IFoodType;
    class function CreateRemote(const MachineName: string): IFoodType;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFoodType
// Help String      : FoodType Object
// Default Interface: IFoodType
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFoodTypeProperties= class;
{$ENDIF}
  TFoodType = class(TOleServer)
  private
    FIntf:        IFoodType;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFoodTypeProperties;
    function      GetServerProperties: TFoodTypeProperties;
{$ENDIF}
    function      GetDefaultInterface: IFoodType;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IFoodType);
    procedure Disconnect; override;
    function  QueryData(const NameKeyword: WideString): OleVariant;
    function  View(const FoodTypeID: WideString): OleVariant;
    property  DefaultInterface: IFoodType read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFoodTypeProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFoodType
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFoodTypeProperties = class(TPersistent)
  private
    FServer:    TFoodType;
    function    GetDefaultInterface: IFoodType;
    constructor Create(AServer: TFoodType);
  protected
  public
    property DefaultInterface: IFoodType read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTravellerManager provides a Create and CreateRemote method to          
// create instances of the default interface ITravellerManager exposed by              
// the CoClass TravellerManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTravellerManager = class
    class function Create: ITravellerManager;
    class function CreateRemote(const MachineName: string): ITravellerManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTravellerManager
// Help String      : TravellerManager Object
// Default Interface: ITravellerManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTravellerManagerProperties= class;
{$ENDIF}
  TTravellerManager = class(TOleServer)
  private
    FIntf:        ITravellerManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTravellerManagerProperties;
    function      GetServerProperties: TTravellerManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: ITravellerManager;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITravellerManager);
    procedure Disconnect; override;
    function  Create1(const FirstName: WideString; const LastName: WideString; 
                      const Address: WideString; const TelephoneNo: WideString; 
                      const EmailAddress: WideString; Gender: Smallint; 
                      const BirthDate: WideString; const Religion: WideString; 
                      const FoodTypeID: WideString): WideString;
    procedure Modify(const TravellerID: WideString; const FirstName: WideString; 
                     const LastName: WideString; const Address: WideString; 
                     const TelephoneNo: WideString; const EmailAddress: WideString; 
                     Gender: Smallint; const BirthDate: WideString; const Religion: WideString; 
                     const FoodTypeID: WideString);
    function  ViewProfile(const TravellerID: WideString): OleVariant;
    function  QueryData(const FirstNameKeyword: WideString; const LastNameKeyword: WideString; 
                        const AddressKeyword: WideString; const TelephoneNoKeyword: WideString; 
                        const EmailAddressKeyword: WideString; const GenderKeyword: WideString; 
                        const BirthDateKeyword: WideString; const ReligionKeyword: WideString; 
                        IsBusCompanyCustomerID: Shortint; IsAirlineCustomerID: Shortint; 
                        const FoodTypeIDKeyword: WideString): OleVariant;
    function  GetBusCompanyCustomerID(const TravellerID: WideString): WideString;
    function  GetAirlineCustomerID(const TravellerID: WideString): WideString;
    procedure SetBusCompanyCustomerID(const TravellerID: WideString; 
                                      const BusCompanyCustomerID: WideString);
    procedure SetAirlineCustomerID(const TravellerID: WideString; 
                                   const AirlineCustomerID: WideString);
    property  DefaultInterface: ITravellerManager read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTravellerManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTravellerManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTravellerManagerProperties = class(TPersistent)
  private
    FServer:    TTravellerManager;
    function    GetDefaultInterface: ITravellerManager;
    constructor Create(AServer: TTravellerManager);
  protected
  public
    property DefaultInterface: ITravellerManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoAdminManager.Create: IAdminManager;
begin
  Result := CreateComObject(CLASS_AdminManager) as IAdminManager;
end;

class function CoAdminManager.CreateRemote(const MachineName: string): IAdminManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AdminManager) as IAdminManager;
end;

procedure TAdminManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{048C2866-C4AD-4871-84BE-421BE9ED999D}';
    IntfIID:   '{F15F509E-20CC-4D04-BD6C-3BDE7A466361}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAdminManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAdminManager;
  end;
end;

procedure TAdminManager.ConnectTo(svrIntf: IAdminManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAdminManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAdminManager.GetDefaultInterface: IAdminManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAdminManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAdminManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TAdminManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAdminManager.GetServerProperties: TAdminManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TAdminManager.Create1(const LoginName: WideString; const FirstName: WideString; 
                                const LastName: WideString; const Address: WideString; 
                                const TelephoneNo: WideString; const EmailAddress: WideString; 
                                Gender: Smallint; const BirthDate: WideString; 
                                const Religion: WideString; const Password: WideString): WideString;
begin
  Result := DefaultInterface.Create(LoginName, FirstName, LastName, Address, TelephoneNo, 
                                    EmailAddress, Gender, BirthDate, Religion, Password);
end;

procedure TAdminManager.Modify(const AdminID: WideString; const LoginName: WideString; 
                               const FirstName: WideString; const LastName: WideString; 
                               const Address: WideString; const TelephoneNo: WideString; 
                               const EmailAddress: WideString; Gender: Smallint; 
                               const BirthDate: WideString; const Religion: WideString; 
                               const Password: WideString);
begin
  DefaultInterface.Modify(AdminID, LoginName, FirstName, LastName, Address, TelephoneNo, 
                          EmailAddress, Gender, BirthDate, Religion, Password);
end;

function  TAdminManager.ViewProfile(const AdminID: WideString): OleVariant;
begin
  Result := DefaultInterface.ViewProfile(AdminID);
end;

function  TAdminManager.QueryData(const LoginNameKeyword: WideString; 
                                  const FirstNameKeyword: WideString; 
                                  const LastNameKeyword: WideString; 
                                  const AddressKeyword: WideString; 
                                  const TelephoneNoKeyword: WideString; 
                                  const EmailAddressKeyword: WideString; 
                                  const GenderKeyword: WideString; 
                                  const BirthDateKeyword: WideString; 
                                  const ReligionKeyword: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryData(LoginNameKeyword, FirstNameKeyword, LastNameKeyword, 
                                       AddressKeyword, TelephoneNoKeyword, EmailAddressKeyword, 
                                       GenderKeyword, BirthDateKeyword, ReligionKeyword);
end;

function  TAdminManager.Authenticate(const LoginName: WideString; const Password: WideString): WideString;
begin
  Result := DefaultInterface.Authenticate(LoginName, Password);
end;

function  TAdminManager.GetLoginName(const AdminID: WideString): WideString;
begin
  Result := DefaultInterface.GetLoginName(AdminID);
end;

procedure TAdminManager.Remove(const AdminID: WideString);
begin
  DefaultInterface.Remove(AdminID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAdminManagerProperties.Create(AServer: TAdminManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TAdminManagerProperties.GetDefaultInterface: IAdminManager;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoMemberManager.Create: IMemberManager;
begin
  Result := CreateComObject(CLASS_MemberManager) as IMemberManager;
end;

class function CoMemberManager.CreateRemote(const MachineName: string): IMemberManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MemberManager) as IMemberManager;
end;

procedure TMemberManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{2A036860-F981-479C-BACB-D1E385FEBF06}';
    IntfIID:   '{E325864E-7BBE-4A0E-AD36-A0F9026349D4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMemberManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMemberManager;
  end;
end;

procedure TMemberManager.ConnectTo(svrIntf: IMemberManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMemberManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMemberManager.GetDefaultInterface: IMemberManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMemberManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMemberManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TMemberManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMemberManager.GetServerProperties: TMemberManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TMemberManager.Create1(const FirstName: WideString; const LastName: WideString; 
                                 const Address: WideString; const TelephoneNo: WideString; 
                                 const EmailAddress: WideString; Gender: Smallint; 
                                 const BirthDate: WideString; const Religion: WideString; 
                                 const Password: WideString): WideString;
begin
  Result := DefaultInterface.Create(FirstName, LastName, Address, TelephoneNo, EmailAddress, 
                                    Gender, BirthDate, Religion, Password);
end;

procedure TMemberManager.Modify(const MemberID: WideString; const FirstName: WideString; 
                                const LastName: WideString; const Address: WideString; 
                                const TelephoneNo: WideString; const EmailAddress: WideString; 
                                Gender: Smallint; const BirthDate: WideString; 
                                const Religion: WideString; const Password: WideString);
begin
  DefaultInterface.Modify(MemberID, FirstName, LastName, Address, TelephoneNo, EmailAddress, 
                          Gender, BirthDate, Religion, Password);
end;

function  TMemberManager.ViewProfile(const MemberID: WideString): OleVariant;
begin
  Result := DefaultInterface.ViewProfile(MemberID);
end;

function  TMemberManager.QueryData(const FirstNameKeyword: WideString; 
                                   const LastNameKeyword: WideString; 
                                   const AddressKeyword: WideString; 
                                   const TelephoneNoKeyword: WideString; 
                                   const EmailAddressKeyword: WideString; 
                                   const GenderKeyword: WideString; 
                                   const BirthDateKeyword: WideString; 
                                   const ReligionKeyword: WideString; IsHotelCustomerID: Shortint): OleVariant;
begin
  Result := DefaultInterface.QueryData(FirstNameKeyword, LastNameKeyword, AddressKeyword, 
                                       TelephoneNoKeyword, EmailAddressKeyword, GenderKeyword, 
                                       BirthDateKeyword, ReligionKeyword, IsHotelCustomerID);
end;

function  TMemberManager.Authenticate(const EmailAddress: WideString; const Password: WideString): OleVariant;
begin
  Result := DefaultInterface.Authenticate(EmailAddress, Password);
end;

function  TMemberManager.GetTraveller(const MemberID: WideString): OleVariant;
begin
  Result := DefaultInterface.GetTraveller(MemberID);
end;

function  TMemberManager.GetHotelCustomerID(const MemberID: WideString): WideString;
begin
  Result := DefaultInterface.GetHotelCustomerID(MemberID);
end;

procedure TMemberManager.SetHotelCustomerID(const MemberID: WideString; 
                                            const HotelCustomerID: WideString);
begin
  DefaultInterface.SetHotelCustomerID(MemberID, HotelCustomerID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMemberManagerProperties.Create(AServer: TMemberManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TMemberManagerProperties.GetDefaultInterface: IMemberManager;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoFoodType.Create: IFoodType;
begin
  Result := CreateComObject(CLASS_FoodType) as IFoodType;
end;

class function CoFoodType.CreateRemote(const MachineName: string): IFoodType;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FoodType) as IFoodType;
end;

procedure TFoodType.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{681B1391-848A-4C46-A465-71A6A4E8D071}';
    IntfIID:   '{6A5A1754-CBAF-4600-A854-F7A88439F521}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFoodType.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IFoodType;
  end;
end;

procedure TFoodType.ConnectTo(svrIntf: IFoodType);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFoodType.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFoodType.GetDefaultInterface: IFoodType;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFoodType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFoodTypeProperties.Create(Self);
{$ENDIF}
end;

destructor TFoodType.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFoodType.GetServerProperties: TFoodTypeProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TFoodType.QueryData(const NameKeyword: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryData(NameKeyword);
end;

function  TFoodType.View(const FoodTypeID: WideString): OleVariant;
begin
  Result := DefaultInterface.View(FoodTypeID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFoodTypeProperties.Create(AServer: TFoodType);
begin
  inherited Create;
  FServer := AServer;
end;

function TFoodTypeProperties.GetDefaultInterface: IFoodType;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTravellerManager.Create: ITravellerManager;
begin
  Result := CreateComObject(CLASS_TravellerManager) as ITravellerManager;
end;

class function CoTravellerManager.CreateRemote(const MachineName: string): ITravellerManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TravellerManager) as ITravellerManager;
end;

procedure TTravellerManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7FDD4DA8-1735-4F2C-94E4-706CDED5FED0}';
    IntfIID:   '{2F0D8AAA-A516-40D1-9EE2-B0564D58B1A2}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTravellerManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITravellerManager;
  end;
end;

procedure TTravellerManager.ConnectTo(svrIntf: ITravellerManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTravellerManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTravellerManager.GetDefaultInterface: ITravellerManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTravellerManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTravellerManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TTravellerManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTravellerManager.GetServerProperties: TTravellerManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TTravellerManager.Create1(const FirstName: WideString; const LastName: WideString; 
                                    const Address: WideString; const TelephoneNo: WideString; 
                                    const EmailAddress: WideString; Gender: Smallint; 
                                    const BirthDate: WideString; const Religion: WideString; 
                                    const FoodTypeID: WideString): WideString;
begin
  Result := DefaultInterface.Create(FirstName, LastName, Address, TelephoneNo, EmailAddress, 
                                    Gender, BirthDate, Religion, FoodTypeID);
end;

procedure TTravellerManager.Modify(const TravellerID: WideString; const FirstName: WideString; 
                                   const LastName: WideString; const Address: WideString; 
                                   const TelephoneNo: WideString; const EmailAddress: WideString; 
                                   Gender: Smallint; const BirthDate: WideString; 
                                   const Religion: WideString; const FoodTypeID: WideString);
begin
  DefaultInterface.Modify(TravellerID, FirstName, LastName, Address, TelephoneNo, EmailAddress, 
                          Gender, BirthDate, Religion, FoodTypeID);
end;

function  TTravellerManager.ViewProfile(const TravellerID: WideString): OleVariant;
begin
  Result := DefaultInterface.ViewProfile(TravellerID);
end;

function  TTravellerManager.QueryData(const FirstNameKeyword: WideString; 
                                      const LastNameKeyword: WideString; 
                                      const AddressKeyword: WideString; 
                                      const TelephoneNoKeyword: WideString; 
                                      const EmailAddressKeyword: WideString; 
                                      const GenderKeyword: WideString; 
                                      const BirthDateKeyword: WideString; 
                                      const ReligionKeyword: WideString; 
                                      IsBusCompanyCustomerID: Shortint; 
                                      IsAirlineCustomerID: Shortint; 
                                      const FoodTypeIDKeyword: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryData(FirstNameKeyword, LastNameKeyword, AddressKeyword, 
                                       TelephoneNoKeyword, EmailAddressKeyword, GenderKeyword, 
                                       BirthDateKeyword, ReligionKeyword, IsBusCompanyCustomerID, 
                                       IsAirlineCustomerID, FoodTypeIDKeyword);
end;

function  TTravellerManager.GetBusCompanyCustomerID(const TravellerID: WideString): WideString;
begin
  Result := DefaultInterface.GetBusCompanyCustomerID(TravellerID);
end;

function  TTravellerManager.GetAirlineCustomerID(const TravellerID: WideString): WideString;
begin
  Result := DefaultInterface.GetAirlineCustomerID(TravellerID);
end;

procedure TTravellerManager.SetBusCompanyCustomerID(const TravellerID: WideString; 
                                                    const BusCompanyCustomerID: WideString);
begin
  DefaultInterface.SetBusCompanyCustomerID(TravellerID, BusCompanyCustomerID);
end;

procedure TTravellerManager.SetAirlineCustomerID(const TravellerID: WideString; 
                                                 const AirlineCustomerID: WideString);
begin
  DefaultInterface.SetAirlineCustomerID(TravellerID, AirlineCustomerID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTravellerManagerProperties.Create(AServer: TTravellerManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TTravellerManagerProperties.GetDefaultInterface: ITravellerManager;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TAdminManager, TMemberManager, TFoodType, TTravellerManager]);
end;

end.
