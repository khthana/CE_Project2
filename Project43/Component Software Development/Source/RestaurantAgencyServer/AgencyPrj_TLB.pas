unit AgencyPrj_TLB;

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
// File generated on 4/17/2001 6:32:03 PM from Type Library described below.

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
// Type Lib: D:\ball\OlalaProject\RestaurantProject\Agency\Server\AgencyPrj.tlb (1)
// IID\LCID: {945C1DBC-4A0B-4CA7-8A98-0578E0C10016}\0
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
  AgencyPrjMajorVersion = 1;
  AgencyPrjMinorVersion = 0;

  LIBID_AgencyPrj: TGUID = '{945C1DBC-4A0B-4CA7-8A98-0578E0C10016}';

  IID_IRestaurantAgency: TGUID = '{6D5A0D33-3779-4B59-93F2-43D2E0F040CC}';
  CLASS_RestaurantAgency: TGUID = '{E32BE7A4-AAC0-484F-8A21-E45C4120637F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRestaurantAgency = interface;
  IRestaurantAgencyDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RestaurantAgency = IRestaurantAgency;


// *********************************************************************//
// Interface: IRestaurantAgency
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6D5A0D33-3779-4B59-93F2-43D2E0F040CC}
// *********************************************************************//
  IRestaurantAgency = interface(IDispatch)
    ['{6D5A0D33-3779-4B59-93F2-43D2E0F040CC}']
    function  getAgencyName(const AgencyID: WideString): WideString; safecall;
    procedure setAgencyName(const AgencyID: WideString; const newName: WideString); safecall;
    function  getAddress(const AgencyID: WideString): WideString; safecall;
    procedure setAddress(const AgencyID: WideString; const newAddress: WideString); safecall;
    procedure setTelephoneNo(const AgencyID: WideString; const newTelephoneNo: WideString); safecall;
    function  getTelePhoneNo(const AgencyID: WideString): WideString; safecall;
    function  findByNameAddress(const Name: WideString; const Address: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRestaurantAgencyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6D5A0D33-3779-4B59-93F2-43D2E0F040CC}
// *********************************************************************//
  IRestaurantAgencyDisp = dispinterface
    ['{6D5A0D33-3779-4B59-93F2-43D2E0F040CC}']
    function  getAgencyName(const AgencyID: WideString): WideString; dispid 1;
    procedure setAgencyName(const AgencyID: WideString; const newName: WideString); dispid 2;
    function  getAddress(const AgencyID: WideString): WideString; dispid 3;
    procedure setAddress(const AgencyID: WideString; const newAddress: WideString); dispid 4;
    procedure setTelephoneNo(const AgencyID: WideString; const newTelephoneNo: WideString); dispid 5;
    function  getTelePhoneNo(const AgencyID: WideString): WideString; dispid 6;
    function  findByNameAddress(const Name: WideString; const Address: WideString): OleVariant; dispid 7;
  end;

// *********************************************************************//
// The Class CoRestaurantAgency provides a Create and CreateRemote method to          
// create instances of the default interface IRestaurantAgency exposed by              
// the CoClass RestaurantAgency. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRestaurantAgency = class
    class function Create: IRestaurantAgency;
    class function CreateRemote(const MachineName: string): IRestaurantAgency;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRestaurantAgency
// Help String      : Agency Object
// Default Interface: IRestaurantAgency
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRestaurantAgencyProperties= class;
{$ENDIF}
  TRestaurantAgency = class(TOleServer)
  private
    FIntf:        IRestaurantAgency;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRestaurantAgencyProperties;
    function      GetServerProperties: TRestaurantAgencyProperties;
{$ENDIF}
    function      GetDefaultInterface: IRestaurantAgency;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRestaurantAgency);
    procedure Disconnect; override;
    function  getAgencyName(const AgencyID: WideString): WideString;
    procedure setAgencyName(const AgencyID: WideString; const newName: WideString);
    function  getAddress(const AgencyID: WideString): WideString;
    procedure setAddress(const AgencyID: WideString; const newAddress: WideString);
    procedure setTelephoneNo(const AgencyID: WideString; const newTelephoneNo: WideString);
    function  getTelePhoneNo(const AgencyID: WideString): WideString;
    function  findByNameAddress(const Name: WideString; const Address: WideString): OleVariant;
    property  DefaultInterface: IRestaurantAgency read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRestaurantAgencyProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRestaurantAgency
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRestaurantAgencyProperties = class(TPersistent)
  private
    FServer:    TRestaurantAgency;
    function    GetDefaultInterface: IRestaurantAgency;
    constructor Create(AServer: TRestaurantAgency);
  protected
  public
    property DefaultInterface: IRestaurantAgency read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoRestaurantAgency.Create: IRestaurantAgency;
begin
  Result := CreateComObject(CLASS_RestaurantAgency) as IRestaurantAgency;
end;

class function CoRestaurantAgency.CreateRemote(const MachineName: string): IRestaurantAgency;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RestaurantAgency) as IRestaurantAgency;
end;

procedure TRestaurantAgency.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E32BE7A4-AAC0-484F-8A21-E45C4120637F}';
    IntfIID:   '{6D5A0D33-3779-4B59-93F2-43D2E0F040CC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRestaurantAgency.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRestaurantAgency;
  end;
end;

procedure TRestaurantAgency.ConnectTo(svrIntf: IRestaurantAgency);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRestaurantAgency.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRestaurantAgency.GetDefaultInterface: IRestaurantAgency;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRestaurantAgency.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRestaurantAgencyProperties.Create(Self);
{$ENDIF}
end;

destructor TRestaurantAgency.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRestaurantAgency.GetServerProperties: TRestaurantAgencyProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TRestaurantAgency.getAgencyName(const AgencyID: WideString): WideString;
begin
  Result := DefaultInterface.getAgencyName(AgencyID);
end;

procedure TRestaurantAgency.setAgencyName(const AgencyID: WideString; const newName: WideString);
begin
  DefaultInterface.setAgencyName(AgencyID, newName);
end;

function  TRestaurantAgency.getAddress(const AgencyID: WideString): WideString;
begin
  Result := DefaultInterface.getAddress(AgencyID);
end;

procedure TRestaurantAgency.setAddress(const AgencyID: WideString; const newAddress: WideString);
begin
  DefaultInterface.setAddress(AgencyID, newAddress);
end;

procedure TRestaurantAgency.setTelephoneNo(const AgencyID: WideString; 
                                           const newTelephoneNo: WideString);
begin
  DefaultInterface.setTelephoneNo(AgencyID, newTelephoneNo);
end;

function  TRestaurantAgency.getTelePhoneNo(const AgencyID: WideString): WideString;
begin
  Result := DefaultInterface.getTelePhoneNo(AgencyID);
end;

function  TRestaurantAgency.findByNameAddress(const Name: WideString; const Address: WideString): OleVariant;
begin
  Result := DefaultInterface.findByNameAddress(Name, Address);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRestaurantAgencyProperties.Create(AServer: TRestaurantAgency);
begin
  inherited Create;
  FServer := AServer;
end;

function TRestaurantAgencyProperties.GetDefaultInterface: IRestaurantAgency;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TRestaurantAgency]);
end;

end.
