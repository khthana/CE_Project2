unit User_CourseDescription_TLB;

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
// File generated on 26/2/2002 0:45:54 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Projects\Program\TLB\User_CourseDescription.tlb (1)
// LIBID: {5229DA71-D874-4D3C-9889-D2721E70DFC4}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TCourseDescription) : Registry key CLSID\{D2B6AECD-E28E-4C07-A2C8-271C8317106C}\ToolboxBitmap32 not found
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
  User_CourseDescriptionMajorVersion = 1;
  User_CourseDescriptionMinorVersion = 0;

  LIBID_User_CourseDescription: TGUID = '{5229DA71-D874-4D3C-9889-D2721E70DFC4}';

  DIID_CCourseDescription: TGUID = '{B4D80F07-1928-4FA7-9340-8BA4C9EABF63}';
  CLASS_CourseDescription: TGUID = '{D2B6AECD-E28E-4C07-A2C8-271C8317106C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CCourseDescription = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CourseDescription = CCourseDescription;


// *********************************************************************//
// DispIntf:  CCourseDescription
// Flags:     (4112) Hidden Dispatchable
// GUID:      {B4D80F07-1928-4FA7-9340-8BA4C9EABF63}
// *********************************************************************//
  CCourseDescription = dispinterface
    ['{B4D80F07-1928-4FA7-9340-8BA4C9EABF63}']
    property FullName: WideString dispid 14;
    property Name: WideString dispid 15;
    property ShortName: WideString dispid 16;
    function SYS_ClassName(FullName: OleVariant): WideString; dispid 1;
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
    function FullNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 21;
    function FullNameGet: WideString; dispid 22;
    function FullNameIsModified: Integer; dispid 26;
    function FullNameIsValid(const value: WideString): OleVariant; dispid 27;
    function FullNameIsValidDT(const SYS_val: WideString): Integer; dispid 28;
    function FullNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 29;
    function FullNameNormalize(const SYS_val: WideString): WideString; dispid 31;
    function FullNameSet(const newvalue: WideString): OleVariant; dispid 33;
    function FullNameSetModified(newvalue: Integer): Integer; dispid 34;
    function LogicalToOdbc(const SYS_val: WideString): WideString; dispid 19;
    function NameDisplayToLogical(const SYS_val: WideString): WideString; dispid 38;
    function NameGet: WideString; dispid 39;
    function NameIsModified: Integer; dispid 43;
    function NameIsValid(const value: WideString): OleVariant; dispid 44;
    function NameIsValidDT(const SYS_val: WideString): Integer; dispid 45;
    function NameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 46;
    function NameNormalize(const SYS_val: WideString): WideString; dispid 48;
    function NameSet(const newvalue: WideString): OleVariant; dispid 50;
    function NameSetModified(newvalue: Integer): Integer; dispid 51;
    function OdbcToLogical(const SYS_val: WideString): WideString; dispid 20;
    function ShortNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 55;
    function ShortNameGet: WideString; dispid 56;
    function ShortNameIsModified: Integer; dispid 60;
    function ShortNameIsValid(const value: WideString): OleVariant; dispid 61;
    function ShortNameIsValidDT(const SYS_val: WideString): Integer; dispid 62;
    function ShortNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 63;
    function ShortNameNormalize(const SYS_val: WideString): WideString; dispid 65;
    function ShortNameSet(const newvalue: WideString): OleVariant; dispid 67;
    function ShortNameSetModified(newvalue: Integer): Integer; dispid 68;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCourseDescription
// Help String      : Cache Object: User.CourseDescription CoClass
// Default Interface: CCourseDescription
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCourseDescription = class(TOleControl)
  private
    FIntf: CCourseDescription;
    function  GetControlInterface: CCourseDescription;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function SYS_ClassName(FullName: OleVariant): WideString;
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
    function FullNameDisplayToLogical(const SYS_val: WideString): WideString;
    function FullNameGet: WideString;
    function FullNameIsModified: Integer;
    function FullNameIsValid(const value: WideString): OleVariant;
    function FullNameIsValidDT(const SYS_val: WideString): Integer;
    function FullNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function FullNameNormalize(const SYS_val: WideString): WideString;
    function FullNameSet(const newvalue: WideString): OleVariant;
    function FullNameSetModified(newvalue: Integer): Integer;
    function LogicalToOdbc(const SYS_val: WideString): WideString;
    function NameDisplayToLogical(const SYS_val: WideString): WideString;
    function NameGet: WideString;
    function NameIsModified: Integer;
    function NameIsValid(const value: WideString): OleVariant;
    function NameIsValidDT(const SYS_val: WideString): Integer;
    function NameLogicalToDisplay(const SYS_val: WideString): WideString;
    function NameNormalize(const SYS_val: WideString): WideString;
    function NameSet(const newvalue: WideString): OleVariant;
    function NameSetModified(newvalue: Integer): Integer;
    function OdbcToLogical(const SYS_val: WideString): WideString;
    function ShortNameDisplayToLogical(const SYS_val: WideString): WideString;
    function ShortNameGet: WideString;
    function ShortNameIsModified: Integer;
    function ShortNameIsValid(const value: WideString): OleVariant;
    function ShortNameIsValidDT(const SYS_val: WideString): Integer;
    function ShortNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function ShortNameNormalize(const SYS_val: WideString): WideString;
    function ShortNameSet(const newvalue: WideString): OleVariant;
    function ShortNameSetModified(newvalue: Integer): Integer;
    property  ControlInterface: CCourseDescription read GetControlInterface;
    property  DefaultInterface: CCourseDescription read GetControlInterface;
  published
    property FullName: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property ShortName: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TCourseDescription.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{D2B6AECD-E28E-4C07-A2C8-271C8317106C}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TCourseDescription.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CCourseDescription;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCourseDescription.GetControlInterface: CCourseDescription;
begin
  CreateControl;
  Result := FIntf;
end;

function TCourseDescription.SYS_ClassName(FullName: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(FullName);
end;

function TCourseDescription.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TCourseDescription.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

procedure TCourseDescription.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TCourseDescription.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TCourseDescription.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TCourseDescription.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TCourseDescription.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TCourseDescription.SYS_Open(initvalue: OleVariant): IDispatch;
begin
  Result := DefaultInterface.SYS_Open(initvalue);
end;

function TCourseDescription.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TCourseDescription.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TCourseDescription.FullNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.FullNameDisplayToLogical(SYS_val);
end;

function TCourseDescription.FullNameGet: WideString;
begin
  Result := DefaultInterface.FullNameGet;
end;

function TCourseDescription.FullNameIsModified: Integer;
begin
  Result := DefaultInterface.FullNameIsModified;
end;

function TCourseDescription.FullNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.FullNameIsValid(value);
end;

function TCourseDescription.FullNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.FullNameIsValidDT(SYS_val);
end;

function TCourseDescription.FullNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.FullNameLogicalToDisplay(SYS_val);
end;

function TCourseDescription.FullNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.FullNameNormalize(SYS_val);
end;

function TCourseDescription.FullNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.FullNameSet(newvalue);
end;

function TCourseDescription.FullNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.FullNameSetModified(newvalue);
end;

function TCourseDescription.LogicalToOdbc(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.LogicalToOdbc(SYS_val);
end;

function TCourseDescription.NameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameDisplayToLogical(SYS_val);
end;

function TCourseDescription.NameGet: WideString;
begin
  Result := DefaultInterface.NameGet;
end;

function TCourseDescription.NameIsModified: Integer;
begin
  Result := DefaultInterface.NameIsModified;
end;

function TCourseDescription.NameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.NameIsValid(value);
end;

function TCourseDescription.NameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.NameIsValidDT(SYS_val);
end;

function TCourseDescription.NameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameLogicalToDisplay(SYS_val);
end;

function TCourseDescription.NameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameNormalize(SYS_val);
end;

function TCourseDescription.NameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.NameSet(newvalue);
end;

function TCourseDescription.NameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.NameSetModified(newvalue);
end;

function TCourseDescription.OdbcToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.OdbcToLogical(SYS_val);
end;

function TCourseDescription.ShortNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ShortNameDisplayToLogical(SYS_val);
end;

function TCourseDescription.ShortNameGet: WideString;
begin
  Result := DefaultInterface.ShortNameGet;
end;

function TCourseDescription.ShortNameIsModified: Integer;
begin
  Result := DefaultInterface.ShortNameIsModified;
end;

function TCourseDescription.ShortNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ShortNameIsValid(value);
end;

function TCourseDescription.ShortNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ShortNameIsValidDT(SYS_val);
end;

function TCourseDescription.ShortNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ShortNameLogicalToDisplay(SYS_val);
end;

function TCourseDescription.ShortNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ShortNameNormalize(SYS_val);
end;

function TCourseDescription.ShortNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ShortNameSet(newvalue);
end;

function TCourseDescription.ShortNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ShortNameSetModified(newvalue);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCourseDescription]);
end;

end.
