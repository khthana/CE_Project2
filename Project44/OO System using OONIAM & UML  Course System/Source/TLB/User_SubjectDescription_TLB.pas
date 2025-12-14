unit User_SubjectDescription_TLB;

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
// File generated on 26/2/2002 22:29:43 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Projects\Program\TLB\User_SubjectDescription.tlb (1)
// LIBID: {6FD1B278-0ACF-4A31-B4C1-9F4C65279F1F}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TSubjectDescription) : Registry key CLSID\{D2B90371-FD89-4E58-83BD-8EB780A955EE}\ToolboxBitmap32 not found
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
  User_SubjectDescriptionMajorVersion = 1;
  User_SubjectDescriptionMinorVersion = 0;

  LIBID_User_SubjectDescription: TGUID = '{6FD1B278-0ACF-4A31-B4C1-9F4C65279F1F}';

  DIID_CSubjectDescription: TGUID = '{BEBDE44C-E66A-4BB9-B649-2C13AFBC53CE}';
  CLASS_SubjectDescription: TGUID = '{D2B90371-FD89-4E58-83BD-8EB780A955EE}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CSubjectDescription = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SubjectDescription = CSubjectDescription;


// *********************************************************************//
// DispIntf:  CSubjectDescription
// Flags:     (4112) Hidden Dispatchable
// GUID:      {BEBDE44C-E66A-4BB9-B649-2C13AFBC53CE}
// *********************************************************************//
  CSubjectDescription = dispinterface
    ['{BEBDE44C-E66A-4BB9-B649-2C13AFBC53CE}']
    property Code: WideString dispid 14;
    property Description: WideString dispid 15;
    property Name: WideString dispid 16;
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
    function CodeDisplayToLogical(const SYS_val: WideString): WideString; dispid 21;
    function CodeGet: WideString; dispid 22;
    function CodeIsModified: Integer; dispid 26;
    function CodeIsValid(const value: WideString): OleVariant; dispid 27;
    function CodeIsValidDT(const SYS_val: WideString): Integer; dispid 28;
    function CodeLogicalToDisplay(const SYS_val: WideString): WideString; dispid 29;
    function CodeNormalize(const SYS_val: WideString): WideString; dispid 31;
    function CodeSet(const newvalue: WideString): OleVariant; dispid 33;
    function CodeSetModified(newvalue: Integer): Integer; dispid 34;
    function DescriptionDisplayToLogical(const SYS_val: WideString): WideString; dispid 38;
    function DescriptionGet: WideString; dispid 39;
    function DescriptionIsModified: Integer; dispid 43;
    function DescriptionIsValid(const value: WideString): OleVariant; dispid 44;
    function DescriptionIsValidDT(const SYS_val: WideString): Integer; dispid 45;
    function DescriptionLogicalToDisplay(const SYS_val: WideString): WideString; dispid 46;
    function DescriptionNormalize(const SYS_val: WideString): WideString; dispid 48;
    function DescriptionSet(const newvalue: WideString): OleVariant; dispid 50;
    function DescriptionSetModified(newvalue: Integer): Integer; dispid 51;
    function LogicalToOdbc(const SYS_val: WideString): WideString; dispid 19;
    function NameDisplayToLogical(const SYS_val: WideString): WideString; dispid 55;
    function NameGet: WideString; dispid 56;
    function NameIsModified: Integer; dispid 60;
    function NameIsValid(const value: WideString): OleVariant; dispid 61;
    function NameIsValidDT(const SYS_val: WideString): Integer; dispid 62;
    function NameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 63;
    function NameNormalize(const SYS_val: WideString): WideString; dispid 65;
    function NameSet(const newvalue: WideString): OleVariant; dispid 67;
    function NameSetModified(newvalue: Integer): Integer; dispid 68;
    function OdbcToLogical(const SYS_val: WideString): WideString; dispid 20;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSubjectDescription
// Help String      : Cache Object: User.SubjectDescription CoClass
// Default Interface: CSubjectDescription
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TSubjectDescription = class(TOleControl)
  private
    FIntf: CSubjectDescription;
    function  GetControlInterface: CSubjectDescription;
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
    function CodeDisplayToLogical(const SYS_val: WideString): WideString;
    function CodeGet: WideString;
    function CodeIsModified: Integer;
    function CodeIsValid(const value: WideString): OleVariant;
    function CodeIsValidDT(const SYS_val: WideString): Integer;
    function CodeLogicalToDisplay(const SYS_val: WideString): WideString;
    function CodeNormalize(const SYS_val: WideString): WideString;
    function CodeSet(const newvalue: WideString): OleVariant;
    function CodeSetModified(newvalue: Integer): Integer;
    function DescriptionDisplayToLogical(const SYS_val: WideString): WideString;
    function DescriptionGet: WideString;
    function DescriptionIsModified: Integer;
    function DescriptionIsValid(const value: WideString): OleVariant;
    function DescriptionIsValidDT(const SYS_val: WideString): Integer;
    function DescriptionLogicalToDisplay(const SYS_val: WideString): WideString;
    function DescriptionNormalize(const SYS_val: WideString): WideString;
    function DescriptionSet(const newvalue: WideString): OleVariant;
    function DescriptionSetModified(newvalue: Integer): Integer;
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
    property  ControlInterface: CSubjectDescription read GetControlInterface;
    property  DefaultInterface: CSubjectDescription read GetControlInterface;
  published
    property Code: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property Description: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TSubjectDescription.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{D2B90371-FD89-4E58-83BD-8EB780A955EE}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TSubjectDescription.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CSubjectDescription;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSubjectDescription.GetControlInterface: CSubjectDescription;
begin
  CreateControl;
  Result := FIntf;
end;

function TSubjectDescription.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TSubjectDescription.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TSubjectDescription.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

procedure TSubjectDescription.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TSubjectDescription.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TSubjectDescription.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TSubjectDescription.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TSubjectDescription.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TSubjectDescription.SYS_Open(initvalue: OleVariant): IDispatch;
begin
  Result := DefaultInterface.SYS_Open(initvalue);
end;

function TSubjectDescription.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TSubjectDescription.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TSubjectDescription.CodeDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.CodeDisplayToLogical(SYS_val);
end;

function TSubjectDescription.CodeGet: WideString;
begin
  Result := DefaultInterface.CodeGet;
end;

function TSubjectDescription.CodeIsModified: Integer;
begin
  Result := DefaultInterface.CodeIsModified;
end;

function TSubjectDescription.CodeIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.CodeIsValid(value);
end;

function TSubjectDescription.CodeIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.CodeIsValidDT(SYS_val);
end;

function TSubjectDescription.CodeLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.CodeLogicalToDisplay(SYS_val);
end;

function TSubjectDescription.CodeNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.CodeNormalize(SYS_val);
end;

function TSubjectDescription.CodeSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.CodeSet(newvalue);
end;

function TSubjectDescription.CodeSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.CodeSetModified(newvalue);
end;

function TSubjectDescription.DescriptionDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionDisplayToLogical(SYS_val);
end;

function TSubjectDescription.DescriptionGet: WideString;
begin
  Result := DefaultInterface.DescriptionGet;
end;

function TSubjectDescription.DescriptionIsModified: Integer;
begin
  Result := DefaultInterface.DescriptionIsModified;
end;

function TSubjectDescription.DescriptionIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DescriptionIsValid(value);
end;

function TSubjectDescription.DescriptionIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DescriptionIsValidDT(SYS_val);
end;

function TSubjectDescription.DescriptionLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionLogicalToDisplay(SYS_val);
end;

function TSubjectDescription.DescriptionNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionNormalize(SYS_val);
end;

function TSubjectDescription.DescriptionSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DescriptionSet(newvalue);
end;

function TSubjectDescription.DescriptionSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DescriptionSetModified(newvalue);
end;

function TSubjectDescription.LogicalToOdbc(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.LogicalToOdbc(SYS_val);
end;

function TSubjectDescription.NameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameDisplayToLogical(SYS_val);
end;

function TSubjectDescription.NameGet: WideString;
begin
  Result := DefaultInterface.NameGet;
end;

function TSubjectDescription.NameIsModified: Integer;
begin
  Result := DefaultInterface.NameIsModified;
end;

function TSubjectDescription.NameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.NameIsValid(value);
end;

function TSubjectDescription.NameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.NameIsValidDT(SYS_val);
end;

function TSubjectDescription.NameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameLogicalToDisplay(SYS_val);
end;

function TSubjectDescription.NameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameNormalize(SYS_val);
end;

function TSubjectDescription.NameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.NameSet(newvalue);
end;

function TSubjectDescription.NameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.NameSetModified(newvalue);
end;

function TSubjectDescription.OdbcToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.OdbcToLogical(SYS_val);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TSubjectDescription]);
end;

end.
