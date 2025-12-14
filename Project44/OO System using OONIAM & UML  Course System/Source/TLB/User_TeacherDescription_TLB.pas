unit User_TeacherDescription_TLB;

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
// File generated on 16/3/2002 11:18:37 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Project\VC\Utils\Debug\User_TeacherDescription.tlb (1)
// LIBID: {B0CAA2C5-8EDC-4E7D-8F59-4F807E8D3345}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TTeacherDescription) : Registry key CLSID\{B56BB2F1-4BED-4DA2-92C3-6E0F2A7D6946}\ToolboxBitmap32 not found
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
  User_TeacherDescriptionMajorVersion = 1;
  User_TeacherDescriptionMinorVersion = 0;

  LIBID_User_TeacherDescription: TGUID = '{B0CAA2C5-8EDC-4E7D-8F59-4F807E8D3345}';

  DIID_CTeacherDescription: TGUID = '{C432F3A3-A58F-420F-8F53-E0A1B2AFA26F}';
  CLASS_TeacherDescription: TGUID = '{B56BB2F1-4BED-4DA2-92C3-6E0F2A7D6946}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CTeacherDescription = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TeacherDescription = CTeacherDescription;


// *********************************************************************//
// DispIntf:  CTeacherDescription
// Flags:     (4112) Hidden Dispatchable
// GUID:      {C432F3A3-A58F-420F-8F53-E0A1B2AFA26F}
// *********************************************************************//
  CTeacherDescription = dispinterface
    ['{C432F3A3-A58F-420F-8F53-E0A1B2AFA26F}']
    property FirstName: WideString dispid 14;
    property LastName: WideString dispid 15;
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
    function  SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function  FirstNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 20;
    function  FirstNameGet: WideString; dispid 21;
    function  FirstNameIsModified: Integer; dispid 25;
    function  FirstNameIsValid(const value: WideString): OleVariant; dispid 26;
    function  FirstNameIsValidDT(const SYS_val: WideString): Integer; dispid 27;
    function  FirstNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 28;
    function  FirstNameNormalize(const SYS_val: WideString): WideString; dispid 30;
    function  FirstNameSet(const newvalue: WideString): OleVariant; dispid 32;
    function  FirstNameSetModified(newvalue: Integer): Integer; dispid 33;
    function  LastNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 37;
    function  LastNameGet: WideString; dispid 38;
    function  LastNameIsModified: Integer; dispid 42;
    function  LastNameIsValid(const value: WideString): OleVariant; dispid 43;
    function  LastNameIsValidDT(const SYS_val: WideString): Integer; dispid 44;
    function  LastNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 45;
    function  LastNameNormalize(const SYS_val: WideString): WideString; dispid 47;
    function  LastNameSet(const newvalue: WideString): OleVariant; dispid 49;
    function  LastNameSetModified(newvalue: Integer): Integer; dispid 50;
    function  LogicalToOdbc(const SYS_val: WideString): WideString; dispid 18;
    function  OdbcToLogical(const SYS_val: WideString): WideString; dispid 19;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTeacherDescription
// Help String      : Cache Object: User.TeacherDescription CoClass
// Default Interface: CTeacherDescription
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TTeacherDescription = class(TOleControl)
  private
    FIntf: CTeacherDescription;
    function  GetControlInterface: CTeacherDescription;
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
    function  SYS_ValidateObject(force: Integer): OleVariant;
    function  FirstNameDisplayToLogical(const SYS_val: WideString): WideString;
    function  FirstNameGet: WideString;
    function  FirstNameIsModified: Integer;
    function  FirstNameIsValid(const value: WideString): OleVariant;
    function  FirstNameIsValidDT(const SYS_val: WideString): Integer;
    function  FirstNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function  FirstNameNormalize(const SYS_val: WideString): WideString;
    function  FirstNameSet(const newvalue: WideString): OleVariant;
    function  FirstNameSetModified(newvalue: Integer): Integer;
    function  LastNameDisplayToLogical(const SYS_val: WideString): WideString;
    function  LastNameGet: WideString;
    function  LastNameIsModified: Integer;
    function  LastNameIsValid(const value: WideString): OleVariant;
    function  LastNameIsValidDT(const SYS_val: WideString): Integer;
    function  LastNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function  LastNameNormalize(const SYS_val: WideString): WideString;
    function  LastNameSet(const newvalue: WideString): OleVariant;
    function  LastNameSetModified(newvalue: Integer): Integer;
    function  LogicalToOdbc(const SYS_val: WideString): WideString;
    function  OdbcToLogical(const SYS_val: WideString): WideString;
    property  ControlInterface: CTeacherDescription read GetControlInterface;
    property  DefaultInterface: CTeacherDescription read GetControlInterface;
  published
    property FirstName: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property LastName: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TTeacherDescription.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{B56BB2F1-4BED-4DA2-92C3-6E0F2A7D6946}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TTeacherDescription.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CTeacherDescription;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTeacherDescription.GetControlInterface: CTeacherDescription;
begin
  CreateControl;
  Result := FIntf;
end;

function  TTeacherDescription.SYS_ClassName(fullname: OleVariant): WideString;
begin
  DefaultInterface.SYS_ClassName(fullname);
end;

function  TTeacherDescription.SYS_Close: OleVariant;
begin
  DefaultInterface.SYS_Close;
end;

function  TTeacherDescription.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

procedure TTeacherDescription.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function  TTeacherDescription.SYS_IsA(const isclass: WideString): Integer;
begin
  DefaultInterface.SYS_IsA(isclass);
end;

function  TTeacherDescription.SYS_IsModified: Integer;
begin
  DefaultInterface.SYS_IsModified;
end;

function  TTeacherDescription.SYS_New(const initvalue: WideString): IDispatch;
begin
  DefaultInterface.SYS_New(initvalue);
end;

function  TTeacherDescription.SYS_NormalizeObject: OleVariant;
begin
  DefaultInterface.SYS_NormalizeObject;
end;

function  TTeacherDescription.SYS_Open(initvalue: OleVariant): IDispatch;
begin
  DefaultInterface.SYS_Open(initvalue);
end;

function  TTeacherDescription.SYS_PackageName: WideString;
begin
  DefaultInterface.SYS_PackageName;
end;

function  TTeacherDescription.SYS_ValidateObject(force: Integer): OleVariant;
begin
  DefaultInterface.SYS_ValidateObject(force);
end;

function  TTeacherDescription.FirstNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  DefaultInterface.FirstNameDisplayToLogical(SYS_val);
end;

function  TTeacherDescription.FirstNameGet: WideString;
begin
  DefaultInterface.FirstNameGet;
end;

function  TTeacherDescription.FirstNameIsModified: Integer;
begin
  DefaultInterface.FirstNameIsModified;
end;

function  TTeacherDescription.FirstNameIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.FirstNameIsValid(value);
end;

function  TTeacherDescription.FirstNameIsValidDT(const SYS_val: WideString): Integer;
begin
  DefaultInterface.FirstNameIsValidDT(SYS_val);
end;

function  TTeacherDescription.FirstNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  DefaultInterface.FirstNameLogicalToDisplay(SYS_val);
end;

function  TTeacherDescription.FirstNameNormalize(const SYS_val: WideString): WideString;
begin
  DefaultInterface.FirstNameNormalize(SYS_val);
end;

function  TTeacherDescription.FirstNameSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.FirstNameSet(newvalue);
end;

function  TTeacherDescription.FirstNameSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.FirstNameSetModified(newvalue);
end;

function  TTeacherDescription.LastNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  DefaultInterface.LastNameDisplayToLogical(SYS_val);
end;

function  TTeacherDescription.LastNameGet: WideString;
begin
  DefaultInterface.LastNameGet;
end;

function  TTeacherDescription.LastNameIsModified: Integer;
begin
  DefaultInterface.LastNameIsModified;
end;

function  TTeacherDescription.LastNameIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.LastNameIsValid(value);
end;

function  TTeacherDescription.LastNameIsValidDT(const SYS_val: WideString): Integer;
begin
  DefaultInterface.LastNameIsValidDT(SYS_val);
end;

function  TTeacherDescription.LastNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  DefaultInterface.LastNameLogicalToDisplay(SYS_val);
end;

function  TTeacherDescription.LastNameNormalize(const SYS_val: WideString): WideString;
begin
  DefaultInterface.LastNameNormalize(SYS_val);
end;

function  TTeacherDescription.LastNameSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.LastNameSet(newvalue);
end;

function  TTeacherDescription.LastNameSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.LastNameSetModified(newvalue);
end;

function  TTeacherDescription.LogicalToOdbc(const SYS_val: WideString): WideString;
begin
  DefaultInterface.LogicalToOdbc(SYS_val);
end;

function  TTeacherDescription.OdbcToLogical(const SYS_val: WideString): WideString;
begin
  DefaultInterface.OdbcToLogical(SYS_val);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TTeacherDescription]);
end;

end.
