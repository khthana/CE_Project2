unit ArrayOfObjects_TLB;

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

// PASTLWTR : $Revision:   1.130  $
// File generated on 9/18/2001 10:50:25 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Program\VisualC++\Debug\ArrayOfObjects.tlb (1)
// LIBID: {C1180FB2-F55E-4D53-9299-E517289AFBA6}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TSYS_ArrayOfObjects) : Registry key CLSID\{A9C28A00-BB7B-428A-AE12-3F7ECC559B25}\ToolboxBitmap32 not found
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

uses ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants, 
Windows;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ArrayOfObjectsMajorVersion = 1;
  ArrayOfObjectsMinorVersion = 0;

  LIBID_ArrayOfObjects: TGUID = '{C1180FB2-F55E-4D53-9299-E517289AFBA6}';

  DIID_CSYS_ArrayOfObjects: TGUID = '{4412F57B-928F-465D-89C6-E92B46B33A36}';
  CLASS_SYS_ArrayOfObjects: TGUID = '{A9C28A00-BB7B-428A-AE12-3F7ECC559B25}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CSYS_ArrayOfObjects = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SYS_ArrayOfObjects = CSYS_ArrayOfObjects;


// *********************************************************************//
// DispIntf:  CSYS_ArrayOfObjects
// Flags:     (4112) Hidden Dispatchable
// GUID:      {4412F57B-928F-465D-89C6-E92B46B33A36}
// *********************************************************************//
  CSYS_ArrayOfObjects = dispinterface
    ['{4412F57B-928F-465D-89C6-E92B46B33A36}']
    property ElementType: WideString dispid 18;
    function  SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function  SYS_Close: OleVariant; dispid 2;
    function  SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 12;
    procedure SYS_IncrementCount; dispid 3;
    function  SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function  SYS_IsModified: Integer; dispid 5;
    function  SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function  SYS_NormalizeObject: OleVariant; dispid 7;
    function  SYS_Open(initvalue: OleVariant): IDispatch; dispid 13;
    function  SYS_PackageName: WideString; dispid 8;
    function  SYS_UnSwizzleAt(const key: WideString; force: Integer): OleVariant; dispid 25;
    function  SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function  Clear: OleVariant; dispid 26;
    function  Count: Integer; dispid 27;
    function  Define(const key: WideString): OleVariant; dispid 28;
    function  ElementTypeGet: WideString; dispid 59;
    function  ElementTypeIsValid(const value: WideString): OleVariant; dispid 64;
    function  ElementTypeSet(const newvalue: WideString): OleVariant; dispid 67;
    function  Find(element: OleVariant; const key: WideString): WideString; dispid 29;
    function  GetAt(const key: WideString): IDispatch; dispid 30;
    function  GetNext(var key: WideString): IDispatch; dispid 31;
    function  GetObjectAt(const key: WideString; force: Integer): OleVariant; dispid 32;
    function  GetObjectIdAt(const key: WideString; force: Integer): WideString; dispid 33;
    function  GetObjectIdNext(var key: WideString): WideString; dispid 34;
    function  GetObjectIdPrevious(var key: WideString): WideString; dispid 35;
    function  GetObjectNext(var key: WideString): OleVariant; dispid 36;
    function  GetObjectPrevious(var key: WideString): OleVariant; dispid 37;
    function  GetPrevious(var key: WideString): IDispatch; dispid 38;
    function  IsDefined(const key: WideString): OleVariant; dispid 39;
    function  LogicalToOdbc(const SYS_val: WideString): WideString; dispid 15;
    function  Next(const key: WideString): WideString; dispid 40;
    function  OdbcToLogical(const SYS_val: WideString): WideString; dispid 16;
    function  Previous(const key: WideString): WideString; dispid 41;
    function  RemoveAt(const key: WideString): OleVariant; dispid 42;
    function  SetAt(const oref: IDispatch; const key: WideString): OleVariant; dispid 43;
    function  SetObjectAt(oid: OleVariant; const key: WideString): OleVariant; dispid 44;
    function  SetObjectIdAt(const id: WideString; const key: WideString): OleVariant; dispid 45;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSYS_ArrayOfObjects
// Help String      : Cache Object: %Library.ArrayOfObjects CoClass
// Default Interface: CSYS_ArrayOfObjects
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TSYS_ArrayOfObjects = class(TOleControl)
  private
    FIntf: CSYS_ArrayOfObjects;
    function  GetControlInterface: CSYS_ArrayOfObjects;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function  SYS_ClassName(fullname: OleVariant): WideString;
    function  SYS_Close: OleVariant;
    function  SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
    procedure SYS_IncrementCount;
    function  SYS_IsA(const isclass: WideString): Integer;
    function  SYS_IsModified: Integer;
    function  SYS_New(const initvalue: WideString): IDispatch;
    function  SYS_NormalizeObject: OleVariant;
    function  SYS_Open(initvalue: OleVariant): IDispatch;
    function  SYS_PackageName: WideString;
    function  SYS_UnSwizzleAt(const key: WideString; force: Integer): OleVariant;
    function  SYS_ValidateObject(force: Integer): OleVariant;
    function  Clear: OleVariant;
    function  Count: Integer;
    function  Define(const key: WideString): OleVariant;
    function  ElementTypeGet: WideString;
    function  ElementTypeIsValid(const value: WideString): OleVariant;
    function  ElementTypeSet(const newvalue: WideString): OleVariant;
    function  Find(element: OleVariant; const key: WideString): WideString;
    function  GetAt(const key: WideString): IDispatch;
    function  GetNext(var key: WideString): IDispatch;
    function  GetObjectAt(const key: WideString; force: Integer): OleVariant;
    function  GetObjectIdAt(const key: WideString; force: Integer): WideString;
    function  GetObjectIdNext(var key: WideString): WideString;
    function  GetObjectIdPrevious(var key: WideString): WideString;
    function  GetObjectNext(var key: WideString): OleVariant;
    function  GetObjectPrevious(var key: WideString): OleVariant;
    function  GetPrevious(var key: WideString): IDispatch;
    function  IsDefined(const key: WideString): OleVariant;
    function  LogicalToOdbc(const SYS_val: WideString): WideString;
    function  Next(const key: WideString): WideString;
    function  OdbcToLogical(const SYS_val: WideString): WideString;
    function  Previous(const key: WideString): WideString;
    function  RemoveAt(const key: WideString): OleVariant;
    function  SetAt(const oref: IDispatch; const key: WideString): OleVariant;
    function  SetObjectAt(oid: OleVariant; const key: WideString): OleVariant;
    function  SetObjectIdAt(const id: WideString; const key: WideString): OleVariant;
    property  ControlInterface: CSYS_ArrayOfObjects read GetControlInterface;
    property  DefaultInterface: CSYS_ArrayOfObjects read GetControlInterface;
  published
    property ElementType: WideString index 18 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Cache';

implementation

uses ComObj;

procedure TSYS_ArrayOfObjects.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{A9C28A00-BB7B-428A-AE12-3F7ECC559B25}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TSYS_ArrayOfObjects.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CSYS_ArrayOfObjects;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSYS_ArrayOfObjects.GetControlInterface: CSYS_ArrayOfObjects;
begin
  CreateControl;
  Result := FIntf;
end;

function  TSYS_ArrayOfObjects.SYS_ClassName(fullname: OleVariant): WideString;
begin
  DefaultInterface.SYS_ClassName(fullname);
end;

function  TSYS_ArrayOfObjects.SYS_Close: OleVariant;
begin
  DefaultInterface.SYS_Close;
end;

function  TSYS_ArrayOfObjects.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

procedure TSYS_ArrayOfObjects.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function  TSYS_ArrayOfObjects.SYS_IsA(const isclass: WideString): Integer;
begin
  DefaultInterface.SYS_IsA(isclass);
end;

function  TSYS_ArrayOfObjects.SYS_IsModified: Integer;
begin
  DefaultInterface.SYS_IsModified;
end;

function  TSYS_ArrayOfObjects.SYS_New(const initvalue: WideString): IDispatch;
begin
  DefaultInterface.SYS_New(initvalue);
end;

function  TSYS_ArrayOfObjects.SYS_NormalizeObject: OleVariant;
begin
  DefaultInterface.SYS_NormalizeObject;
end;

function  TSYS_ArrayOfObjects.SYS_Open(initvalue: OleVariant): IDispatch;
begin
  DefaultInterface.SYS_Open(initvalue);
end;

function  TSYS_ArrayOfObjects.SYS_PackageName: WideString;
begin
  DefaultInterface.SYS_PackageName;
end;

function  TSYS_ArrayOfObjects.SYS_UnSwizzleAt(const key: WideString; force: Integer): OleVariant;
begin
  DefaultInterface.SYS_UnSwizzleAt(key, force);
end;

function  TSYS_ArrayOfObjects.SYS_ValidateObject(force: Integer): OleVariant;
begin
  DefaultInterface.SYS_ValidateObject(force);
end;

function  TSYS_ArrayOfObjects.Clear: OleVariant;
begin
  DefaultInterface.Clear;
end;

function  TSYS_ArrayOfObjects.Count: Integer;
begin
  DefaultInterface.Count;
end;

function  TSYS_ArrayOfObjects.Define(const key: WideString): OleVariant;
begin
  DefaultInterface.Define(key);
end;

function  TSYS_ArrayOfObjects.ElementTypeGet: WideString;
begin
  DefaultInterface.ElementTypeGet;
end;

function  TSYS_ArrayOfObjects.ElementTypeIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.ElementTypeIsValid(value);
end;

function  TSYS_ArrayOfObjects.ElementTypeSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.ElementTypeSet(newvalue);
end;

function  TSYS_ArrayOfObjects.Find(element: OleVariant; const key: WideString): WideString;
begin
  DefaultInterface.Find(element, key);
end;

function  TSYS_ArrayOfObjects.GetAt(const key: WideString): IDispatch;
begin
  DefaultInterface.GetAt(key);
end;

function  TSYS_ArrayOfObjects.GetNext(var key: WideString): IDispatch;
begin
  DefaultInterface.GetNext(key);
end;

function  TSYS_ArrayOfObjects.GetObjectAt(const key: WideString; force: Integer): OleVariant;
begin
  DefaultInterface.GetObjectAt(key, force);
end;

function  TSYS_ArrayOfObjects.GetObjectIdAt(const key: WideString; force: Integer): WideString;
begin
  DefaultInterface.GetObjectIdAt(key, force);
end;

function  TSYS_ArrayOfObjects.GetObjectIdNext(var key: WideString): WideString;
begin
  DefaultInterface.GetObjectIdNext(key);
end;

function  TSYS_ArrayOfObjects.GetObjectIdPrevious(var key: WideString): WideString;
begin
  DefaultInterface.GetObjectIdPrevious(key);
end;

function  TSYS_ArrayOfObjects.GetObjectNext(var key: WideString): OleVariant;
begin
  DefaultInterface.GetObjectNext(key);
end;

function  TSYS_ArrayOfObjects.GetObjectPrevious(var key: WideString): OleVariant;
begin
  DefaultInterface.GetObjectPrevious(key);
end;

function  TSYS_ArrayOfObjects.GetPrevious(var key: WideString): IDispatch;
begin
  DefaultInterface.GetPrevious(key);
end;

function  TSYS_ArrayOfObjects.IsDefined(const key: WideString): OleVariant;
begin
  DefaultInterface.IsDefined(key);
end;

function  TSYS_ArrayOfObjects.LogicalToOdbc(const SYS_val: WideString): WideString;
begin
  DefaultInterface.LogicalToOdbc(SYS_val);
end;

function  TSYS_ArrayOfObjects.Next(const key: WideString): WideString;
begin
  DefaultInterface.Next(key);
end;

function  TSYS_ArrayOfObjects.OdbcToLogical(const SYS_val: WideString): WideString;
begin
  DefaultInterface.OdbcToLogical(SYS_val);
end;

function  TSYS_ArrayOfObjects.Previous(const key: WideString): WideString;
begin
  DefaultInterface.Previous(key);
end;

function  TSYS_ArrayOfObjects.RemoveAt(const key: WideString): OleVariant;
begin
  DefaultInterface.RemoveAt(key);
end;

function  TSYS_ArrayOfObjects.SetAt(const oref: IDispatch; const key: WideString): OleVariant;
begin
  DefaultInterface.SetAt(oref, key);
end;

function  TSYS_ArrayOfObjects.SetObjectAt(oid: OleVariant; const key: WideString): OleVariant;
begin
  DefaultInterface.SetObjectAt(oid, key);
end;

function  TSYS_ArrayOfObjects.SetObjectIdAt(const id: WideString; const key: WideString): OleVariant;
begin
  DefaultInterface.SetObjectIdAt(id, key);
end;

procedure Register;
begin
  RegisterComponents('Cache',[TSYS_ArrayOfObjects]);
end;

end.
