unit User_Faculty_TLB;

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
// File generated on 12/2/2002 2:13:59 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\MyProgram\Projects\Program\TLB\User_Faculty.tlb (1)
// LIBID: {A54901FE-23DE-4260-8880-AFA3E2F48166}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TFaculty) : Registry key CLSID\{1A34EA8C-2F2F-4925-BD3C-EF83664EF817}\ToolboxBitmap32 not found
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
  User_FacultyMajorVersion = 1;
  User_FacultyMinorVersion = 0;

  LIBID_User_Faculty: TGUID = '{A54901FE-23DE-4260-8880-AFA3E2F48166}';

  DIID_CFaculty: TGUID = '{ECFFABB7-1B15-4A13-A9DC-AF5F0A9612F6}';
  CLASS_Faculty: TGUID = '{1A34EA8C-2F2F-4925-BD3C-EF83664EF817}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CFaculty = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Faculty = CFaculty;


// *********************************************************************//
// DispIntf:  CFaculty
// Flags:     (4112) Hidden Dispatchable
// GUID:      {ECFFABB7-1B15-4A13-A9DC-AF5F0A9612F6}
// *********************************************************************//
  CFaculty = dispinterface
    ['{ECFFABB7-1B15-4A13-A9DC-AF5F0A9612F6}']
    property DeleteTag: Integer dispid 41;
    property EnglishName: WideString dispid 61;
    property ThaiName: WideString dispid 62;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 65;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 69;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 70;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 71;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 74;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 77;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 78;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 106;
    function DeleteTagGet: Integer; dispid 107;
    function DeleteTagIsModified: Integer; dispid 111;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 112;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 113;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 114;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 116;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 118;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 119;
    function EnglishNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 123;
    function EnglishNameGet: WideString; dispid 124;
    function EnglishNameIsModified: Integer; dispid 128;
    function EnglishNameIsValid(const value: WideString): OleVariant; dispid 129;
    function EnglishNameIsValidDT(const SYS_val: WideString): Integer; dispid 130;
    function EnglishNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 131;
    function EnglishNameNormalize(const SYS_val: WideString): WideString; dispid 133;
    function EnglishNameSet(const newvalue: WideString): OleVariant; dispid 135;
    function EnglishNameSetModified(newvalue: Integer): Integer; dispid 136;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 158;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 159;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 160;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 162;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 163;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 164;
    function GetClassName: WideString; dispid 58;
    function GetParentClass: WideString; dispid 59;
    procedure PrepareDeleting; dispid 60;
    function QueryDetailsClose(qHandle: OleVariant): OleVariant; dispid 165;
    function QueryDetailsExecute(var qHandle: OleVariant): OleVariant; dispid 166;
    function QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 167;
    function QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                   SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 168;
    function QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant; dispid 169;
    function QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 170;
    function QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant; dispid 171;
    function ThaiNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 140;
    function ThaiNameGet: WideString; dispid 141;
    function ThaiNameIsModified: Integer; dispid 145;
    function ThaiNameIsValid(const value: WideString): OleVariant; dispid 146;
    function ThaiNameIsValidDT(const SYS_val: WideString): Integer; dispid 147;
    function ThaiNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 148;
    function ThaiNameNormalize(const SYS_val: WideString): WideString; dispid 150;
    function ThaiNameSet(const newvalue: WideString): OleVariant; dispid 152;
    function ThaiNameSetModified(newvalue: Integer): Integer; dispid 153;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TFaculty
// Help String      : Cache Object: User.Faculty CoClass
// Default Interface: CFaculty
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TFaculty = class(TOleControl)
  private
    FIntf: CFaculty;
    function  GetControlInterface: CFaculty;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
    function SYS_ClassName(fullname: OleVariant): WideString;
    function SYS_Close: OleVariant;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
    function SYS_Exists(oid: OleVariant): OleVariant;
    function SYS_ExistsId(const id: WideString): OleVariant;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
    function SYS_Id: WideString;
    procedure SYS_IncrementCount;
    function SYS_IsA(const isclass: WideString): Integer;
    function SYS_IsModified: Integer;
    function SYS_KillExtent: OleVariant;
    function SYS_New(const initvalue: WideString): IDispatch;
    function SYS_NormalizeObject: OleVariant;
    function SYS_Oid: OleVariant;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
    function SYS_PackageName: WideString;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
    function SYS_RollBack: OleVariant;
    function SYS_Save(related: Integer): OleVariant;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
    function SYS_ValidateObject(force: Integer): OleVariant;
    function CheckDependency: OleVariant;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
    function DeleteTagGet: Integer;
    function DeleteTagIsModified: Integer;
    function DeleteTagIsValid(const value: WideString): OleVariant;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
    function DeleteTagNormalize(const SYS_val: WideString): Integer;
    function DeleteTagSet(const newvalue: WideString): OleVariant;
    function DeleteTagSetModified(newvalue: Integer): Integer;
    function EnglishNameDisplayToLogical(const SYS_val: WideString): WideString;
    function EnglishNameGet: WideString;
    function EnglishNameIsModified: Integer;
    function EnglishNameIsValid(const value: WideString): OleVariant;
    function EnglishNameIsValidDT(const SYS_val: WideString): Integer;
    function EnglishNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function EnglishNameNormalize(const SYS_val: WideString): WideString;
    function EnglishNameSet(const newvalue: WideString): OleVariant;
    function EnglishNameSetModified(newvalue: Integer): Integer;
    function ExtentClose(qHandle: OleVariant): OleVariant;
    function ExtentExecute(var qHandle: OleVariant): OleVariant;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant;
    function GetClassName: WideString;
    function GetParentClass: WideString;
    procedure PrepareDeleting;
    function QueryDetailsClose(qHandle: OleVariant): OleVariant;
    function QueryDetailsExecute(var qHandle: OleVariant): OleVariant;
    function QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                   SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant;
    function QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant;
    function ThaiNameDisplayToLogical(const SYS_val: WideString): WideString;
    function ThaiNameGet: WideString;
    function ThaiNameIsModified: Integer;
    function ThaiNameIsValid(const value: WideString): OleVariant;
    function ThaiNameIsValidDT(const SYS_val: WideString): Integer;
    function ThaiNameLogicalToDisplay(const SYS_val: WideString): WideString;
    function ThaiNameNormalize(const SYS_val: WideString): WideString;
    function ThaiNameSet(const newvalue: WideString): OleVariant;
    function ThaiNameSetModified(newvalue: Integer): Integer;
    property  ControlInterface: CFaculty read GetControlInterface;
    property  DefaultInterface: CFaculty read GetControlInterface;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property EnglishName: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property ThaiName: WideString index 62 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TFaculty.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{1A34EA8C-2F2F-4925-BD3C-EF83664EF817}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TFaculty.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CFaculty;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TFaculty.GetControlInterface: CFaculty;
begin
  CreateControl;
  Result := FIntf;
end;

function TFaculty.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TFaculty.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TFaculty.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TFaculty.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TFaculty.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TFaculty.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                   var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TFaculty.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TFaculty.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TFaculty.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TFaculty.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TFaculty.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TFaculty.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TFaculty.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TFaculty.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TFaculty.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TFaculty.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TFaculty.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TFaculty.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TFaculty.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TFaculty.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TFaculty.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TFaculty.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TFaculty.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TFaculty.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TFaculty.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TFaculty.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TFaculty.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TFaculty.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TFaculty.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TFaculty.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TFaculty.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TFaculty.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TFaculty.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TFaculty.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TFaculty.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TFaculty.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TFaculty.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TFaculty.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TFaculty.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TFaculty.EnglishNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameDisplayToLogical(SYS_val);
end;

function TFaculty.EnglishNameGet: WideString;
begin
  Result := DefaultInterface.EnglishNameGet;
end;

function TFaculty.EnglishNameIsModified: Integer;
begin
  Result := DefaultInterface.EnglishNameIsModified;
end;

function TFaculty.EnglishNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishNameIsValid(value);
end;

function TFaculty.EnglishNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.EnglishNameIsValidDT(SYS_val);
end;

function TFaculty.EnglishNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameLogicalToDisplay(SYS_val);
end;

function TFaculty.EnglishNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameNormalize(SYS_val);
end;

function TFaculty.EnglishNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishNameSet(newvalue);
end;

function TFaculty.EnglishNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.EnglishNameSetModified(newvalue);
end;

function TFaculty.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TFaculty.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TFaculty.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TFaculty.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                  var RowSet: IDispatch; var ReturnCount: Integer; 
                                  var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TFaculty.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TFaculty.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TFaculty.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TFaculty.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

procedure TFaculty.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TFaculty.QueryDetailsClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsClose(qHandle);
end;

function TFaculty.QueryDetailsExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsExecute(qHandle);
end;

function TFaculty.QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetch(qHandle, Row, AtEnd);
end;

function TFaculty.QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                        SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TFaculty.QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                        var RowSet: IDispatch; var ReturnCount: Integer; 
                                        var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TFaculty.QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                      var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TFaculty.QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                      containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsPrepare(qHandle, statement, containid, optional);
end;

function TFaculty.ThaiNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameDisplayToLogical(SYS_val);
end;

function TFaculty.ThaiNameGet: WideString;
begin
  Result := DefaultInterface.ThaiNameGet;
end;

function TFaculty.ThaiNameIsModified: Integer;
begin
  Result := DefaultInterface.ThaiNameIsModified;
end;

function TFaculty.ThaiNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiNameIsValid(value);
end;

function TFaculty.ThaiNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ThaiNameIsValidDT(SYS_val);
end;

function TFaculty.ThaiNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameLogicalToDisplay(SYS_val);
end;

function TFaculty.ThaiNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameNormalize(SYS_val);
end;

function TFaculty.ThaiNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiNameSet(newvalue);
end;

function TFaculty.ThaiNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ThaiNameSetModified(newvalue);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TFaculty]);
end;

end.
