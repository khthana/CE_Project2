unit OlalaTourDBConnector_TLB;

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
// File generated on 3/4/2001 3:07:09 from Type Library described below.

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
// Type Lib: D:\Project\SourceCode\OlalaTour\OlalaTourDBConnector\OlalaTourDBConnector.tlb (1)
// IID\LCID: {AF69AE26-DFF2-4835-A453-C49A9383E7FA}\0
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
  OlalaTourDBConnectorMajorVersion = 1;
  OlalaTourDBConnectorMinorVersion = 0;

  LIBID_OlalaTourDBConnector: TGUID = '{AF69AE26-DFF2-4835-A453-C49A9383E7FA}';

  IID_IOlalaTourDBConnector: TGUID = '{7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}';
  CLASS_OlalaTourDBConnector: TGUID = '{E2577929-4EE3-47CB-88A5-1A1DBAE04D38}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IOlalaTourDBConnector = interface;
  IOlalaTourDBConnectorDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  OlalaTourDBConnector = IOlalaTourDBConnector;


// *********************************************************************//
// Interface: IOlalaTourDBConnector
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}
// *********************************************************************//
  IOlalaTourDBConnector = interface(IDispatch)
    ['{7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}']
    function  QueryCmd(const SQLCmd: WideString): OleVariant; safecall;
    function  ExecSQLCmd(const SQLCmd: WideString): Shortint; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOlalaTourDBConnectorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}
// *********************************************************************//
  IOlalaTourDBConnectorDisp = dispinterface
    ['{7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}']
    function  QueryCmd(const SQLCmd: WideString): OleVariant; dispid 2;
    function  ExecSQLCmd(const SQLCmd: WideString): {??Shortint} OleVariant; dispid 3;
  end;

// *********************************************************************//
// The Class CoOlalaTourDBConnector provides a Create and CreateRemote method to          
// create instances of the default interface IOlalaTourDBConnector exposed by              
// the CoClass OlalaTourDBConnector. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOlalaTourDBConnector = class
    class function Create: IOlalaTourDBConnector;
    class function CreateRemote(const MachineName: string): IOlalaTourDBConnector;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOlalaTourDBConnector
// Help String      : OlalaTourDBConnector Object
// Default Interface: IOlalaTourDBConnector
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOlalaTourDBConnectorProperties= class;
{$ENDIF}
  TOlalaTourDBConnector = class(TOleServer)
  private
    FIntf:        IOlalaTourDBConnector;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TOlalaTourDBConnectorProperties;
    function      GetServerProperties: TOlalaTourDBConnectorProperties;
{$ENDIF}
    function      GetDefaultInterface: IOlalaTourDBConnector;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOlalaTourDBConnector);
    procedure Disconnect; override;
    function  QueryCmd(const SQLCmd: WideString): OleVariant;
    function  ExecSQLCmd(const SQLCmd: WideString): Shortint;
    property  DefaultInterface: IOlalaTourDBConnector read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOlalaTourDBConnectorProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOlalaTourDBConnector
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOlalaTourDBConnectorProperties = class(TPersistent)
  private
    FServer:    TOlalaTourDBConnector;
    function    GetDefaultInterface: IOlalaTourDBConnector;
    constructor Create(AServer: TOlalaTourDBConnector);
  protected
  public
    property DefaultInterface: IOlalaTourDBConnector read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoOlalaTourDBConnector.Create: IOlalaTourDBConnector;
begin
  Result := CreateComObject(CLASS_OlalaTourDBConnector) as IOlalaTourDBConnector;
end;

class function CoOlalaTourDBConnector.CreateRemote(const MachineName: string): IOlalaTourDBConnector;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OlalaTourDBConnector) as IOlalaTourDBConnector;
end;

procedure TOlalaTourDBConnector.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E2577929-4EE3-47CB-88A5-1A1DBAE04D38}';
    IntfIID:   '{7BC78907-9F0C-4DB1-AB06-933A9A6BB5E7}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOlalaTourDBConnector.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOlalaTourDBConnector;
  end;
end;

procedure TOlalaTourDBConnector.ConnectTo(svrIntf: IOlalaTourDBConnector);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOlalaTourDBConnector.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOlalaTourDBConnector.GetDefaultInterface: IOlalaTourDBConnector;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TOlalaTourDBConnector.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOlalaTourDBConnectorProperties.Create(Self);
{$ENDIF}
end;

destructor TOlalaTourDBConnector.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOlalaTourDBConnector.GetServerProperties: TOlalaTourDBConnectorProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TOlalaTourDBConnector.QueryCmd(const SQLCmd: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryCmd(SQLCmd);
end;

function  TOlalaTourDBConnector.ExecSQLCmd(const SQLCmd: WideString): Shortint;
begin
  Result := DefaultInterface.ExecSQLCmd(SQLCmd);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOlalaTourDBConnectorProperties.Create(AServer: TOlalaTourDBConnector);
begin
  inherited Create;
  FServer := AServer;
end;

function TOlalaTourDBConnectorProperties.GetDefaultInterface: IOlalaTourDBConnector;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TOlalaTourDBConnector]);
end;

end.
