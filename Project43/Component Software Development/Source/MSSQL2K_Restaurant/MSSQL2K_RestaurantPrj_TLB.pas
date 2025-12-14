unit MSSQL2K_RestaurantPrj_TLB;

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
// File generated on 3/31/2001 17:52:10 from Type Library described below.

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
// Type Lib: D:\ball\OlalaProject\RestaurantProject\MSSQL2K_Restaurant\Server2\MSSQL2K_RestaurantPrj.tlb (1)
// IID\LCID: {1539535B-62DC-4180-9089-587F144D5687}\0
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
  MSSQL2K_RestaurantPrjMajorVersion = 1;
  MSSQL2K_RestaurantPrjMinorVersion = 0;

  LIBID_MSSQL2K_RestaurantPrj: TGUID = '{1539535B-62DC-4180-9089-587F144D5687}';

  IID_IMSSQL2K_Restaurant: TGUID = '{99446E7D-F136-470E-BE5F-7AD3C6A46829}';
  CLASS_MSSQL2K_Restaurant: TGUID = '{AA961AAD-7F20-4E03-9863-0CA06F0F2BBF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMSSQL2K_Restaurant = interface;
  IMSSQL2K_RestaurantDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MSSQL2K_Restaurant = IMSSQL2K_Restaurant;


// *********************************************************************//
// Interface: IMSSQL2K_Restaurant
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {99446E7D-F136-470E-BE5F-7AD3C6A46829}
// *********************************************************************//
  IMSSQL2K_Restaurant = interface(IDispatch)
    ['{99446E7D-F136-470E-BE5F-7AD3C6A46829}']
    procedure ExecSQL(const sSQL: WideString); safecall;
    function  Query(const sSQL: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMSSQL2K_RestaurantDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {99446E7D-F136-470E-BE5F-7AD3C6A46829}
// *********************************************************************//
  IMSSQL2K_RestaurantDisp = dispinterface
    ['{99446E7D-F136-470E-BE5F-7AD3C6A46829}']
    procedure ExecSQL(const sSQL: WideString); dispid 1;
    function  Query(const sSQL: WideString): OleVariant; dispid 2;
  end;

// *********************************************************************//
// The Class CoMSSQL2K_Restaurant provides a Create and CreateRemote method to          
// create instances of the default interface IMSSQL2K_Restaurant exposed by              
// the CoClass MSSQL2K_Restaurant. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMSSQL2K_Restaurant = class
    class function Create: IMSSQL2K_Restaurant;
    class function CreateRemote(const MachineName: string): IMSSQL2K_Restaurant;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMSSQL2K_Restaurant
// Help String      : MSSQL2K_Restaurant Object
// Default Interface: IMSSQL2K_Restaurant
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMSSQL2K_RestaurantProperties= class;
{$ENDIF}
  TMSSQL2K_Restaurant = class(TOleServer)
  private
    FIntf:        IMSSQL2K_Restaurant;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMSSQL2K_RestaurantProperties;
    function      GetServerProperties: TMSSQL2K_RestaurantProperties;
{$ENDIF}
    function      GetDefaultInterface: IMSSQL2K_Restaurant;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMSSQL2K_Restaurant);
    procedure Disconnect; override;
    procedure ExecSQL(const sSQL: WideString);
    function  Query(const sSQL: WideString): OleVariant;
    property  DefaultInterface: IMSSQL2K_Restaurant read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMSSQL2K_RestaurantProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMSSQL2K_Restaurant
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMSSQL2K_RestaurantProperties = class(TPersistent)
  private
    FServer:    TMSSQL2K_Restaurant;
    function    GetDefaultInterface: IMSSQL2K_Restaurant;
    constructor Create(AServer: TMSSQL2K_Restaurant);
  protected
  public
    property DefaultInterface: IMSSQL2K_Restaurant read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoMSSQL2K_Restaurant.Create: IMSSQL2K_Restaurant;
begin
  Result := CreateComObject(CLASS_MSSQL2K_Restaurant) as IMSSQL2K_Restaurant;
end;

class function CoMSSQL2K_Restaurant.CreateRemote(const MachineName: string): IMSSQL2K_Restaurant;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MSSQL2K_Restaurant) as IMSSQL2K_Restaurant;
end;

procedure TMSSQL2K_Restaurant.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{AA961AAD-7F20-4E03-9863-0CA06F0F2BBF}';
    IntfIID:   '{99446E7D-F136-470E-BE5F-7AD3C6A46829}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMSSQL2K_Restaurant.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMSSQL2K_Restaurant;
  end;
end;

procedure TMSSQL2K_Restaurant.ConnectTo(svrIntf: IMSSQL2K_Restaurant);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMSSQL2K_Restaurant.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMSSQL2K_Restaurant.GetDefaultInterface: IMSSQL2K_Restaurant;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMSSQL2K_Restaurant.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMSSQL2K_RestaurantProperties.Create(Self);
{$ENDIF}
end;

destructor TMSSQL2K_Restaurant.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMSSQL2K_Restaurant.GetServerProperties: TMSSQL2K_RestaurantProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMSSQL2K_Restaurant.ExecSQL(const sSQL: WideString);
begin
  DefaultInterface.ExecSQL(sSQL);
end;

function  TMSSQL2K_Restaurant.Query(const sSQL: WideString): OleVariant;
begin
  Result := DefaultInterface.Query(sSQL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMSSQL2K_RestaurantProperties.Create(AServer: TMSSQL2K_Restaurant);
begin
  inherited Create;
  FServer := AServer;
end;

function TMSSQL2K_RestaurantProperties.GetDefaultInterface: IMSSQL2K_Restaurant;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TMSSQL2K_Restaurant]);
end;

end.
