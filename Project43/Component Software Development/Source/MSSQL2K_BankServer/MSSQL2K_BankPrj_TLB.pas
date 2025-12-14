unit MSSQL2K_BankPrj_TLB;

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
// File generated on 16/4/01 15:05:38 from Type Library described below.

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
// Type Lib: C:\projectProgram\OlalaProject\BankProject\MSSQL2K_Bank\Server\MSSQL2K_BankPrj.tlb (1)
// IID\LCID: {80E94320-3279-11D5-8C7C-B49BE349D911}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
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
  MSSQL2K_BankPrjMajorVersion = 1;
  MSSQL2K_BankPrjMinorVersion = 0;

  LIBID_MSSQL2K_BankPrj: TGUID = '{80E94320-3279-11D5-8C7C-B49BE349D911}';

  IID_IMSSQL2K_Bank: TGUID = '{80E94321-3279-11D5-8C7C-B49BE349D911}';
  CLASS_MSSQL2K_Bank: TGUID = '{80E94323-3279-11D5-8C7C-B49BE349D911}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMSSQL2K_Bank = interface;
  IMSSQL2K_BankDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MSSQL2K_Bank = IMSSQL2K_Bank;


// *********************************************************************//
// Interface: IMSSQL2K_Bank
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {80E94321-3279-11D5-8C7C-B49BE349D911}
// *********************************************************************//
  IMSSQL2K_Bank = interface(IDispatch)
    ['{80E94321-3279-11D5-8C7C-B49BE349D911}']
    function  Query(const sSQL: WideString): OleVariant; safecall;
    procedure ExecSQL(const sSQL: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMSSQL2K_BankDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {80E94321-3279-11D5-8C7C-B49BE349D911}
// *********************************************************************//
  IMSSQL2K_BankDisp = dispinterface
    ['{80E94321-3279-11D5-8C7C-B49BE349D911}']
    function  Query(const sSQL: WideString): OleVariant; dispid 1;
    procedure ExecSQL(const sSQL: WideString); dispid 2;
  end;

// *********************************************************************//
// The Class CoMSSQL2K_Bank provides a Create and CreateRemote method to          
// create instances of the default interface IMSSQL2K_Bank exposed by              
// the CoClass MSSQL2K_Bank. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMSSQL2K_Bank = class
    class function Create: IMSSQL2K_Bank;
    class function CreateRemote(const MachineName: string): IMSSQL2K_Bank;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMSSQL2K_Bank
// Help String      : MSSQL2K_Bank Object
// Default Interface: IMSSQL2K_Bank
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMSSQL2K_BankProperties= class;
{$ENDIF}
  TMSSQL2K_Bank = class(TOleServer)
  private
    FIntf:        IMSSQL2K_Bank;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMSSQL2K_BankProperties;
    function      GetServerProperties: TMSSQL2K_BankProperties;
{$ENDIF}
    function      GetDefaultInterface: IMSSQL2K_Bank;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMSSQL2K_Bank);
    procedure Disconnect; override;
    function  Query(const sSQL: WideString): OleVariant;
    procedure ExecSQL(const sSQL: WideString);
    property  DefaultInterface: IMSSQL2K_Bank read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMSSQL2K_BankProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMSSQL2K_Bank
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMSSQL2K_BankProperties = class(TPersistent)
  private
    FServer:    TMSSQL2K_Bank;
    function    GetDefaultInterface: IMSSQL2K_Bank;
    constructor Create(AServer: TMSSQL2K_Bank);
  protected
  public
    property DefaultInterface: IMSSQL2K_Bank read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoMSSQL2K_Bank.Create: IMSSQL2K_Bank;
begin
  Result := CreateComObject(CLASS_MSSQL2K_Bank) as IMSSQL2K_Bank;
end;

class function CoMSSQL2K_Bank.CreateRemote(const MachineName: string): IMSSQL2K_Bank;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MSSQL2K_Bank) as IMSSQL2K_Bank;
end;

procedure TMSSQL2K_Bank.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{80E94323-3279-11D5-8C7C-B49BE349D911}';
    IntfIID:   '{80E94321-3279-11D5-8C7C-B49BE349D911}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMSSQL2K_Bank.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMSSQL2K_Bank;
  end;
end;

procedure TMSSQL2K_Bank.ConnectTo(svrIntf: IMSSQL2K_Bank);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMSSQL2K_Bank.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMSSQL2K_Bank.GetDefaultInterface: IMSSQL2K_Bank;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMSSQL2K_Bank.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMSSQL2K_BankProperties.Create(Self);
{$ENDIF}
end;

destructor TMSSQL2K_Bank.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMSSQL2K_Bank.GetServerProperties: TMSSQL2K_BankProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TMSSQL2K_Bank.Query(const sSQL: WideString): OleVariant;
begin
  Result := DefaultInterface.Query(sSQL);
end;

procedure TMSSQL2K_Bank.ExecSQL(const sSQL: WideString);
begin
  DefaultInterface.ExecSQL(sSQL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMSSQL2K_BankProperties.Create(AServer: TMSSQL2K_Bank);
begin
  inherited Create;
  FServer := AServer;
end;

function TMSSQL2K_BankProperties.GetDefaultInterface: IMSSQL2K_Bank;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TMSSQL2K_Bank]);
end;

end.
