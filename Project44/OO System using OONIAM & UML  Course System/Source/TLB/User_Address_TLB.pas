unit User_Address_TLB;

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

// PASTLWTR : $Revision:   1.130.3.0.1.0  $
// File generated on 12/2/2002 1:58:14 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\MyProgram\Projects\Program\TLB\User_Address.tlb (1)
// LIBID: {6F8714B0-8AEC-498A-B3C7-DFD37E8FAE15}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TAddress) : Registry key CLSID\{A523F194-BCD6-4DDC-B9A9-EA884322A1DC}\ToolboxBitmap32 not found
// ************************************************************************ //
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
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  User_AddressMajorVersion = 1;
  User_AddressMinorVersion = 0;

  LIBID_User_Address: TGUID = '{6F8714B0-8AEC-498A-B3C7-DFD37E8FAE15}';

  DIID_CAddress: TGUID = '{3132B28D-8564-465B-93AB-AB8E9150A591}';
  CLASS_Address: TGUID = '{A523F194-BCD6-4DDC-B9A9-EA884322A1DC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CAddress = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Address = CAddress;


// *********************************************************************//
// DispIntf:  CAddress
// Flags:     (4112) Hidden Dispatchable
// GUID:      {3132B28D-8564-465B-93AB-AB8E9150A591}
// *********************************************************************//
  CAddress = dispinterface
    ['{3132B28D-8564-465B-93AB-AB8E9150A591}']
    property HouseNo: WideString dispid 14;
    property Province: WideString dispid 15;
    property Street: WideString dispid 16;
    property Zipcode: WideString dispid 17;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 12;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Open(initvalue: OleVariant): IDispatch; dispid 13;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function HouseNoDisplayToLogical(const SYS_val: WideString): WideString; dispid 22;
    function HouseNoGet: WideString; dispid 23;
    function HouseNoIsModified: Integer; dispid 27;
    function HouseNoIsValid(const value: WideString): OleVariant; dispid 28;
    function HouseNoIsValidDT(const SYS_val: WideString): Integer; dispid 29;
    function HouseNoLogicalToDisplay(const SYS_val: WideString): WideString; dispid 30;
    function HouseNoNormalize(const SYS_val: WideString): WideString; dispid 32;
    function HouseNoSet(const newvalue: WideString): OleVariant; dispid 34;
    function HouseNoSetModified(newvalue: Integer): Integer; dispid 35;
    function LogicalToOdbc(const SYS_val: WideString): WideString; dispid 20;
    function OdbcToLogical(const SYS_val: WideString): WideString; dispid 21;
    function ProvinceDisplayToLogical(const SYS_val: WideString): WideString; dispid 39;
    function ProvinceGet: WideString; dispid 40;
    function ProvinceIsModified: Integer; dispid 44;
    function ProvinceIsValid(const value: WideString): OleVariant; dispid 45;
    function ProvinceIsValidDT(const SYS_val: WideString): Integer; dispid 46;
    function ProvinceLogicalToDisplay(const SYS_val: WideString): WideString; dispid 47;
    function ProvinceNormalize(const SYS_val: WideString): WideString; dispid 49;
    function ProvinceSet(const newvalue: WideString): OleVariant; dispid 51;
    function ProvinceSetModified(newvalue: Integer): Integer; dispid 52;
    function StreetDisplayToLogical(const SYS_val: WideString): WideString; dispid 56;
    function StreetGet: WideString; dispid 57;
    function StreetIsModified: Integer; dispid 61;
    function StreetIsValid(const value: WideString): OleVariant; dispid 62;
    function StreetIsValidDT(const SYS_val: WideString): Integer; dispid 63;
    function StreetLogicalToDisplay(const SYS_val: WideString): WideString; dispid 64;
    function StreetNormalize(const SYS_val: WideString): WideString; dispid 66;
    function StreetSet(const newvalue: WideString): OleVariant; dispid 68;
    function StreetSetModified(newvalue: Integer): Integer; dispid 69;
    function ZipcodeDisplayToLogical(const SYS_val: WideString): WideString; dispid 73;
    function ZipcodeGet: WideString; dispid 74;
    function ZipcodeIsModified: Integer; dispid 78;
    function ZipcodeIsValid(const value: WideString): OleVariant; dispid 79;
    function ZipcodeIsValidDT(const SYS_val: WideString): Integer; dispid 80;
    function ZipcodeLogicalToDisplay(const SYS_val: WideString): WideString; dispid 81;
    function ZipcodeNormalize(const SYS_val: WideString): WideString; dispid 83;
    function ZipcodeSet(const newvalue: WideString): OleVariant; dispid 85;
    function ZipcodeSetModified(newvalue: Integer): Integer; dispid 86;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddress
// Help String      : Cache Object: User.Address CoClass
// Default Interface: CAddress
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAddress = class(TOleControl)
  private
    FIntf: CAddress;
    function  GetControlInterface: CAddress;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function SYS_ClassName(fullname: OleVariant): WideString;
    function SYS_Close: OleVariant;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
    procedure SYS_IncrementCount;
    function SYS_IsA(const isclass: WideString): Integer;
    function SYS_IsModified: Integer;
    function SYS_New(const initvalue: WideString): IDispatch;
    function SYS_NormalizeObject: OleVariant;
    function SYS_Open(initvalue: OleVariant): IDispatch;
    function SYS_PackageName: WideString;
    function SYS_ValidateObject(force: Integer): OleVariant;
    function HouseNoDisplayToLogical(const SYS_val: WideString): WideString;
    function HouseNoGet: WideString;
    function HouseNoIsModified: Integer;
    function HouseNoIsValid(const value: WideString): OleVariant;
    function HouseNoIsValidDT(const SYS_val: WideString): Integer;
    function HouseNoLogicalToDisplay(const SYS_val: WideString): WideString;
    function HouseNoNormalize(const SYS_val: WideString): WideString;
    function HouseNoSet(const newvalue: WideString): OleVariant;
    function HouseNoSetModified(newvalue: Integer): Integer;
    function LogicalToOdbc(const SYS_val: WideString): WideString;
    function OdbcToLogical(const SYS_val: WideString): WideString;
    function ProvinceDisplayToLogical(const SYS_val: WideString): WideString;
    function ProvinceGet: WideString;
    function ProvinceIsModified: Integer;
    function ProvinceIsValid(const value: WideString): OleVariant;
    function ProvinceIsValidDT(const SYS_val: WideString): Integer;
    function ProvinceLogicalToDisplay(const SYS_val: WideString): WideString;
    function ProvinceNormalize(const SYS_val: WideString): WideString;
    function ProvinceSet(const newvalue: WideString): OleVariant;
    function ProvinceSetModified(newvalue: Integer): Integer;
    function StreetDisplayToLogical(const SYS_val: WideString): WideString;
    function StreetGet: WideString;
    function StreetIsModified: Integer;
    function StreetIsValid(const value: WideString): OleVariant;
    function StreetIsValidDT(const SYS_val: WideString): Integer;
    function StreetLogicalToDisplay(const SYS_val: WideString): WideString;
    function StreetNormalize(const SYS_val: WideString): WideString;
    function StreetSet(const newvalue: WideString): OleVariant;
    function StreetSetModified(newvalue: Integer): Integer;
    function ZipcodeDisplayToLogical(const SYS_val: WideString): WideString;
    function ZipcodeGet: WideString;
    function ZipcodeIsModified: Integer;
    function ZipcodeIsValid(const value: WideString): OleVariant;
    function ZipcodeIsValidDT(const SYS_val: WideString): Integer;
    function ZipcodeLogicalToDisplay(const SYS_val: WideString): WideString;
    function ZipcodeNormalize(const SYS_val: WideString): WideString;
    function ZipcodeSet(const newvalue: WideString): OleVariant;
    function ZipcodeSetModified(newvalue: Integer): Integer;
    property  ControlInterface: CAddress read GetControlInterface;
    property  DefaultInterface: CAddress read GetControlInterface;
  published
    property HouseNo: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property Province: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property Street: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property Zipcode: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TAddress.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{A523F194-BCD6-4DDC-B9A9-EA884322A1DC}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddress.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CAddress;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddress.GetControlInterface: CAddress;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddress.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TAddress.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TAddress.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

procedure TAddress.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TAddress.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TAddress.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TAddress.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TAddress.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TAddress.SYS_Open(initvalue: OleVariant): IDispatch;
begin
  Result := DefaultInterface.SYS_Open(initvalue);
end;

function TAddress.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TAddress.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TAddress.HouseNoDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.HouseNoDisplayToLogical(SYS_val);
end;

function TAddress.HouseNoGet: WideString;
begin
  Result := DefaultInterface.HouseNoGet;
end;

function TAddress.HouseNoIsModified: Integer;
begin
  Result := DefaultInterface.HouseNoIsModified;
end;

function TAddress.HouseNoIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.HouseNoIsValid(value);
end;

function TAddress.HouseNoIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.HouseNoIsValidDT(SYS_val);
end;

function TAddress.HouseNoLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.HouseNoLogicalToDisplay(SYS_val);
end;

function TAddress.HouseNoNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.HouseNoNormalize(SYS_val);
end;

function TAddress.HouseNoSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.HouseNoSet(newvalue);
end;

function TAddress.HouseNoSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.HouseNoSetModified(newvalue);
end;

function TAddress.LogicalToOdbc(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.LogicalToOdbc(SYS_val);
end;

function TAddress.OdbcToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.OdbcToLogical(SYS_val);
end;

function TAddress.ProvinceDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ProvinceDisplayToLogical(SYS_val);
end;

function TAddress.ProvinceGet: WideString;
begin
  Result := DefaultInterface.ProvinceGet;
end;

function TAddress.ProvinceIsModified: Integer;
begin
  Result := DefaultInterface.ProvinceIsModified;
end;

function TAddress.ProvinceIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ProvinceIsValid(value);
end;

function TAddress.ProvinceIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ProvinceIsValidDT(SYS_val);
end;

function TAddress.ProvinceLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ProvinceLogicalToDisplay(SYS_val);
end;

function TAddress.ProvinceNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ProvinceNormalize(SYS_val);
end;

function TAddress.ProvinceSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ProvinceSet(newvalue);
end;

function TAddress.ProvinceSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ProvinceSetModified(newvalue);
end;

function TAddress.StreetDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.StreetDisplayToLogical(SYS_val);
end;

function TAddress.StreetGet: WideString;
begin
  Result := DefaultInterface.StreetGet;
end;

function TAddress.StreetIsModified: Integer;
begin
  Result := DefaultInterface.StreetIsModified;
end;

function TAddress.StreetIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.StreetIsValid(value);
end;

function TAddress.StreetIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.StreetIsValidDT(SYS_val);
end;

function TAddress.StreetLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.StreetLogicalToDisplay(SYS_val);
end;

function TAddress.StreetNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.StreetNormalize(SYS_val);
end;

function TAddress.StreetSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.StreetSet(newvalue);
end;

function TAddress.StreetSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.StreetSetModified(newvalue);
end;

function TAddress.ZipcodeDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ZipcodeDisplayToLogical(SYS_val);
end;

function TAddress.ZipcodeGet: WideString;
begin
  Result := DefaultInterface.ZipcodeGet;
end;

function TAddress.ZipcodeIsModified: Integer;
begin
  Result := DefaultInterface.ZipcodeIsModified;
end;

function TAddress.ZipcodeIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ZipcodeIsValid(value);
end;

function TAddress.ZipcodeIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ZipcodeIsValidDT(SYS_val);
end;

function TAddress.ZipcodeLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ZipcodeLogicalToDisplay(SYS_val);
end;

function TAddress.ZipcodeNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ZipcodeNormalize(SYS_val);
end;

function TAddress.ZipcodeSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ZipcodeSet(newvalue);
end;

function TAddress.ZipcodeSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ZipcodeSetModified(newvalue);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TAddress]);
end;

end.
