unit OlalaGuidCreator_TLB;

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
// File generated on 19/04/01 9:47:40 PM from Type Library described below.

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
// Type Lib: D:\Project\SourceCode\OlalaTour\OlalaGuidCreator\OlalaGuidCreator.tlb (1)
// IID\LCID: {CA56C4C9-93EB-46BA-8D3E-538454F9B0DD}\0
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
  OlalaGuidCreatorMajorVersion = 1;
  OlalaGuidCreatorMinorVersion = 0;

  LIBID_OlalaGuidCreator: TGUID = '{CA56C4C9-93EB-46BA-8D3E-538454F9B0DD}';

  IID_IOlalaGuidCreator: TGUID = '{98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}';
  CLASS_OlalaGuidCreator: TGUID = '{CB7A7572-F987-4EA2-8D4D-AFE93A8F1E3B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IOlalaGuidCreator = interface;
  IOlalaGuidCreatorDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  OlalaGuidCreator = IOlalaGuidCreator;


// *********************************************************************//
// Interface: IOlalaGuidCreator
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}
// *********************************************************************//
  IOlalaGuidCreator = interface(IDispatch)
    ['{98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}']
    function  Create: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOlalaGuidCreatorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}
// *********************************************************************//
  IOlalaGuidCreatorDisp = dispinterface
    ['{98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}']
    function  Create: WideString; dispid 1;
  end;

// *********************************************************************//
// The Class CoOlalaGuidCreator provides a Create and CreateRemote method to          
// create instances of the default interface IOlalaGuidCreator exposed by              
// the CoClass OlalaGuidCreator. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOlalaGuidCreator = class
    class function Create: IOlalaGuidCreator;
    class function CreateRemote(const MachineName: string): IOlalaGuidCreator;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOlalaGuidCreator
// Help String      : OlalaGuidCreator Object
// Default Interface: IOlalaGuidCreator
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOlalaGuidCreatorProperties= class;
{$ENDIF}
  TOlalaGuidCreator = class(TOleServer)
  private
    FIntf:        IOlalaGuidCreator;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TOlalaGuidCreatorProperties;
    function      GetServerProperties: TOlalaGuidCreatorProperties;
{$ENDIF}
    function      GetDefaultInterface: IOlalaGuidCreator;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOlalaGuidCreator);
    procedure Disconnect; override;
    function  Create1: WideString;
    property  DefaultInterface: IOlalaGuidCreator read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOlalaGuidCreatorProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOlalaGuidCreator
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOlalaGuidCreatorProperties = class(TPersistent)
  private
    FServer:    TOlalaGuidCreator;
    function    GetDefaultInterface: IOlalaGuidCreator;
    constructor Create(AServer: TOlalaGuidCreator);
  protected
  public
    property DefaultInterface: IOlalaGuidCreator read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoOlalaGuidCreator.Create: IOlalaGuidCreator;
begin
  Result := CreateComObject(CLASS_OlalaGuidCreator) as IOlalaGuidCreator;
end;

class function CoOlalaGuidCreator.CreateRemote(const MachineName: string): IOlalaGuidCreator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OlalaGuidCreator) as IOlalaGuidCreator;
end;

procedure TOlalaGuidCreator.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{CB7A7572-F987-4EA2-8D4D-AFE93A8F1E3B}';
    IntfIID:   '{98F3AFCC-EDB4-48A1-BA31-105A0448AE1D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOlalaGuidCreator.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOlalaGuidCreator;
  end;
end;

procedure TOlalaGuidCreator.ConnectTo(svrIntf: IOlalaGuidCreator);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOlalaGuidCreator.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOlalaGuidCreator.GetDefaultInterface: IOlalaGuidCreator;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TOlalaGuidCreator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOlalaGuidCreatorProperties.Create(Self);
{$ENDIF}
end;

destructor TOlalaGuidCreator.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOlalaGuidCreator.GetServerProperties: TOlalaGuidCreatorProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TOlalaGuidCreator.Create1: WideString;
begin
  Result := DefaultInterface.Create;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOlalaGuidCreatorProperties.Create(AServer: TOlalaGuidCreator);
begin
  inherited Create;
  FServer := AServer;
end;

function TOlalaGuidCreatorProperties.GetDefaultInterface: IOlalaGuidCreator;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TOlalaGuidCreator]);
end;

end.
