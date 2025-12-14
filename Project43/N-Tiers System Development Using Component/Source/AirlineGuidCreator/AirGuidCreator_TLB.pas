unit AirGuidCreator_TLB;

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
// File generated on 19/04/01 3:53:14 AM from Type Library described below.

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
// Type Lib: D:\Project\SourceCode\AirlineGuidCreator\AirGuidCreator.tlb (1)
// IID\LCID: {BFE9695D-5698-4BC0-9D18-4071DC0439AD}\0
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
  AirGuidCreatorMajorVersion = 1;
  AirGuidCreatorMinorVersion = 0;

  LIBID_AirGuidCreator: TGUID = '{BFE9695D-5698-4BC0-9D18-4071DC0439AD}';

  IID_IAirlineGuidCreator: TGUID = '{3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}';
  CLASS_AirlineGuidCreator: TGUID = '{416EB8A1-91D7-4AFB-A1BB-4DE33CECCCE5}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAirlineGuidCreator = interface;
  IAirlineGuidCreatorDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AirlineGuidCreator = IAirlineGuidCreator;


// *********************************************************************//
// Interface: IAirlineGuidCreator
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}
// *********************************************************************//
  IAirlineGuidCreator = interface(IDispatch)
    ['{3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}']
    function  CreateGuid: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAirlineGuidCreatorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}
// *********************************************************************//
  IAirlineGuidCreatorDisp = dispinterface
    ['{3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}']
    function  CreateGuid: WideString; dispid 1;
  end;

// *********************************************************************//
// The Class CoAirlineGuidCreator provides a Create and CreateRemote method to          
// create instances of the default interface IAirlineGuidCreator exposed by              
// the CoClass AirlineGuidCreator. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAirlineGuidCreator = class
    class function Create: IAirlineGuidCreator;
    class function CreateRemote(const MachineName: string): IAirlineGuidCreator;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAirlineGuidCreator
// Help String      : AirlineGuidCreator Object
// Default Interface: IAirlineGuidCreator
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAirlineGuidCreatorProperties= class;
{$ENDIF}
  TAirlineGuidCreator = class(TOleServer)
  private
    FIntf:        IAirlineGuidCreator;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAirlineGuidCreatorProperties;
    function      GetServerProperties: TAirlineGuidCreatorProperties;
{$ENDIF}
    function      GetDefaultInterface: IAirlineGuidCreator;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAirlineGuidCreator);
    procedure Disconnect; override;
    function  CreateGuid: WideString;
    property  DefaultInterface: IAirlineGuidCreator read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAirlineGuidCreatorProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAirlineGuidCreator
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAirlineGuidCreatorProperties = class(TPersistent)
  private
    FServer:    TAirlineGuidCreator;
    function    GetDefaultInterface: IAirlineGuidCreator;
    constructor Create(AServer: TAirlineGuidCreator);
  protected
  public
    property DefaultInterface: IAirlineGuidCreator read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoAirlineGuidCreator.Create: IAirlineGuidCreator;
begin
  Result := CreateComObject(CLASS_AirlineGuidCreator) as IAirlineGuidCreator;
end;

class function CoAirlineGuidCreator.CreateRemote(const MachineName: string): IAirlineGuidCreator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AirlineGuidCreator) as IAirlineGuidCreator;
end;

procedure TAirlineGuidCreator.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{416EB8A1-91D7-4AFB-A1BB-4DE33CECCCE5}';
    IntfIID:   '{3A3F1215-9AE2-4BFD-84E8-81A9DE64F340}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAirlineGuidCreator.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAirlineGuidCreator;
  end;
end;

procedure TAirlineGuidCreator.ConnectTo(svrIntf: IAirlineGuidCreator);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAirlineGuidCreator.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAirlineGuidCreator.GetDefaultInterface: IAirlineGuidCreator;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAirlineGuidCreator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAirlineGuidCreatorProperties.Create(Self);
{$ENDIF}
end;

destructor TAirlineGuidCreator.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAirlineGuidCreator.GetServerProperties: TAirlineGuidCreatorProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TAirlineGuidCreator.CreateGuid: WideString;
begin
  Result := DefaultInterface.CreateGuid;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAirlineGuidCreatorProperties.Create(AServer: TAirlineGuidCreator);
begin
  inherited Create;
  FServer := AServer;
end;

function TAirlineGuidCreatorProperties.GetDefaultInterface: IAirlineGuidCreator;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TAirlineGuidCreator]);
end;

end.
