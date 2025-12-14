unit User_Department_TLB;

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
// File generated on 12/2/2002 1:59:48 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\MyProgram\Projects\Program\TLB\User_Department.tlb (1)
// LIBID: {49C1B72D-B3C1-4BAA-BA44-ACCC98859DFD}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TDepartment) : Registry key CLSID\{19829AB6-5E8C-46DD-9BE3-0411275DD7FA}\ToolboxBitmap32 not found
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

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants, User_Faculty_TLB;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  User_DepartmentMajorVersion = 1;
  User_DepartmentMinorVersion = 0;

  LIBID_User_Department: TGUID = '{49C1B72D-B3C1-4BAA-BA44-ACCC98859DFD}';

  DIID_CDepartment: TGUID = '{6F3E06C5-0D2C-444B-9A0E-583E73DCEAF8}';
  CLASS_Department: TGUID = '{19829AB6-5E8C-46DD-9BE3-0411275DD7FA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CDepartment = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Department = CDepartment;


// *********************************************************************//
// DispIntf:  CDepartment
// Flags:     (4112) Hidden Dispatchable
// GUID:      {6F3E06C5-0D2C-444B-9A0E-583E73DCEAF8}
// *********************************************************************//
  CDepartment = dispinterface
    ['{6F3E06C5-0D2C-444B-9A0E-583E73DCEAF8}']
    property DeleteTag: Integer dispid 41;
    property EnglishName: WideString dispid 61;
    property IsOf: IDispatch dispid 62;
    property ThaiName: WideString dispid 63;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 69;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 73;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 74;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 75;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 78;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 81;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 82;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 110;
    function DeleteTagGet: Integer; dispid 111;
    function DeleteTagIsModified: Integer; dispid 115;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 116;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 117;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 118;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 120;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 122;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 123;
    function EnglishNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 127;
    function EnglishNameGet: WideString; dispid 128;
    function EnglishNameIsModified: Integer; dispid 132;
    function EnglishNameIsValid(const value: WideString): OleVariant; dispid 133;
    function EnglishNameIsValidDT(const SYS_val: WideString): Integer; dispid 134;
    function EnglishNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 135;
    function EnglishNameNormalize(const SYS_val: WideString): WideString; dispid 137;
    function EnglishNameSet(const newvalue: WideString): OleVariant; dispid 139;
    function EnglishNameSetModified(newvalue: Integer): Integer; dispid 140;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 175;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 176;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 177;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 179;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 180;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 181;
    function GetClassName: WideString; dispid 58;
    function GetParentClass: WideString; dispid 59;
    function IsOfGet: IDispatch; dispid 144;
    function IsOfGetObject(force: Integer): OleVariant; dispid 145;
    function IsOfGetObjectId(force: Integer): WideString; dispid 146;
    function IsOfIsModified: Integer; dispid 148;
    function IsOfIsValid(const value: WideString): OleVariant; dispid 149;
    function IsOfNewObject: IDispatch; dispid 150;
    function IsOfSet(const newvalue: WideString): OleVariant; dispid 152;
    function IsOfSetModified(newvalue: Integer): Integer; dispid 153;
    function IsOfSetObject(newvalue: OleVariant): OleVariant; dispid 154;
    function IsOfSetObjectId(const newid: WideString): OleVariant; dispid 155;
    procedure PrepareDeleting; dispid 60;
    function QueryCourseCountClose(qHandle: OleVariant): OleVariant; dispid 182;
    function QueryCourseCountExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant; dispid 183;
    function QueryCourseCountFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 184;
    function QueryCourseCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                       SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 185;
    function QueryCourseCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                       var RowSet: IDispatch; var ReturnCount: Integer; 
                                       var AtEnd: Integer): OleVariant; dispid 186;
    function QueryCourseCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                     var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 187;
    function QueryCourseCountPrepare(var qHandle: OleVariant; const statement: WideString; 
                                     containid: Integer; const optional: WideString): OleVariant; dispid 188;
    function QueryDetailsClose(qHandle: OleVariant): OleVariant; dispid 189;
    function QueryDetailsExecute(var qHandle: OleVariant): OleVariant; dispid 190;
    function QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 191;
    function QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                   SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 192;
    function QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant; dispid 193;
    function QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 194;
    function QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant; dispid 195;
    function QueryIsOfClose(qHandle: OleVariant): OleVariant; dispid 196;
    function QueryIsOfExecute(var qHandle: OleVariant; const facID: IDispatch): OleVariant; dispid 197;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 198;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 199;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 200;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 201;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant; dispid 202;
    function QuerySubjectCountClose(qHandle: OleVariant): OleVariant; dispid 203;
    function QuerySubjectCountExecute(var qHandle: OleVariant; const depid: IDispatch): OleVariant; dispid 204;
    function QuerySubjectCountFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 205;
    function QuerySubjectCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                        SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 206;
    function QuerySubjectCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                        var RowSet: IDispatch; var ReturnCount: Integer; 
                                        var AtEnd: Integer): OleVariant; dispid 207;
    function QuerySubjectCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                      var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 208;
    function QuerySubjectCountPrepare(var qHandle: OleVariant; const statement: WideString; 
                                      containid: Integer; const optional: WideString): OleVariant; dispid 209;
    function ThaiNameDisplayToLogical(const SYS_val: WideString): WideString; dispid 157;
    function ThaiNameGet: WideString; dispid 158;
    function ThaiNameIsModified: Integer; dispid 162;
    function ThaiNameIsValid(const value: WideString): OleVariant; dispid 163;
    function ThaiNameIsValidDT(const SYS_val: WideString): Integer; dispid 164;
    function ThaiNameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 165;
    function ThaiNameNormalize(const SYS_val: WideString): WideString; dispid 167;
    function ThaiNameSet(const newvalue: WideString): OleVariant; dispid 169;
    function ThaiNameSetModified(newvalue: Integer): Integer; dispid 170;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDepartment
// Help String      : Cache Object: User.Department CoClass
// Default Interface: CDepartment
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TDepartment = class(TOleControl)
  private
    FIntf: CDepartment;
    function  GetControlInterface: CDepartment;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_IsOf: IDispatch;
    procedure Set_IsOf(const Value: IDispatch);
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
    function IsOfGet: IDispatch;
    function IsOfGetObject(force: Integer): OleVariant;
    function IsOfGetObjectId(force: Integer): WideString;
    function IsOfIsModified: Integer;
    function IsOfIsValid(const value: WideString): OleVariant;
    function IsOfNewObject: IDispatch;
    function IsOfSet(const newvalue: WideString): OleVariant;
    function IsOfSetModified(newvalue: Integer): Integer;
    function IsOfSetObject(newvalue: OleVariant): OleVariant;
    function IsOfSetObjectId(const newid: WideString): OleVariant;
    procedure PrepareDeleting;
    function QueryCourseCountClose(qHandle: OleVariant): OleVariant;
    function QueryCourseCountExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant;
    function QueryCourseCountFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QueryCourseCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                       SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QueryCourseCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                       var RowSet: IDispatch; var ReturnCount: Integer; 
                                       var AtEnd: Integer): OleVariant;
    function QueryCourseCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                     var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QueryCourseCountPrepare(var qHandle: OleVariant; const statement: WideString; 
                                     containid: Integer; const optional: WideString): OleVariant;
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
    function QueryIsOfClose(qHandle: OleVariant): OleVariant;
    function QueryIsOfExecute(var qHandle: OleVariant; const facID: IDispatch): OleVariant;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant;
    function QuerySubjectCountClose(qHandle: OleVariant): OleVariant;
    function QuerySubjectCountExecute(var qHandle: OleVariant; const depid: IDispatch): OleVariant;
    function QuerySubjectCountFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QuerySubjectCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                        SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QuerySubjectCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                        var RowSet: IDispatch; var ReturnCount: Integer; 
                                        var AtEnd: Integer): OleVariant;
    function QuerySubjectCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                      var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QuerySubjectCountPrepare(var qHandle: OleVariant; const statement: WideString; 
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
    property  ControlInterface: CDepartment read GetControlInterface;
    property  DefaultInterface: CDepartment read GetControlInterface;
    property IsOf: IDispatch index 62 read GetIDispatchProp write SetIDispatchProp;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property EnglishName: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property ThaiName: WideString index 63 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TDepartment.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{19829AB6-5E8C-46DD-9BE3-0411275DD7FA}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TDepartment.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CDepartment;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDepartment.GetControlInterface: CDepartment;
begin
  CreateControl;
  Result := FIntf;
end;

function TDepartment.Get_IsOf: IDispatch;
begin
  Result := DefaultInterface.IsOf;
end;

procedure TDepartment.Set_IsOf(const Value: IDispatch);
begin
  DefaultInterface.IsOf := Value;
end;

function TDepartment.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TDepartment.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TDepartment.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TDepartment.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TDepartment.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TDepartment.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                      var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TDepartment.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TDepartment.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TDepartment.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TDepartment.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TDepartment.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TDepartment.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TDepartment.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TDepartment.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TDepartment.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TDepartment.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TDepartment.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TDepartment.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TDepartment.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TDepartment.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TDepartment.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TDepartment.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TDepartment.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TDepartment.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TDepartment.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TDepartment.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TDepartment.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TDepartment.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TDepartment.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TDepartment.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TDepartment.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TDepartment.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TDepartment.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TDepartment.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TDepartment.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TDepartment.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TDepartment.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TDepartment.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TDepartment.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TDepartment.EnglishNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameDisplayToLogical(SYS_val);
end;

function TDepartment.EnglishNameGet: WideString;
begin
  Result := DefaultInterface.EnglishNameGet;
end;

function TDepartment.EnglishNameIsModified: Integer;
begin
  Result := DefaultInterface.EnglishNameIsModified;
end;

function TDepartment.EnglishNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishNameIsValid(value);
end;

function TDepartment.EnglishNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.EnglishNameIsValidDT(SYS_val);
end;

function TDepartment.EnglishNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameLogicalToDisplay(SYS_val);
end;

function TDepartment.EnglishNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.EnglishNameNormalize(SYS_val);
end;

function TDepartment.EnglishNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishNameSet(newvalue);
end;

function TDepartment.EnglishNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.EnglishNameSetModified(newvalue);
end;

function TDepartment.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TDepartment.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TDepartment.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TDepartment.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                     var RowSet: IDispatch; var ReturnCount: Integer; 
                                     var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TDepartment.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                   var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDepartment.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                   containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TDepartment.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TDepartment.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

function TDepartment.IsOfGet: IDispatch;
begin
  Result := DefaultInterface.IsOfGet;
end;

function TDepartment.IsOfGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.IsOfGetObject(force);
end;

function TDepartment.IsOfGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.IsOfGetObjectId(force);
end;

function TDepartment.IsOfIsModified: Integer;
begin
  Result := DefaultInterface.IsOfIsModified;
end;

function TDepartment.IsOfIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfIsValid(value);
end;

function TDepartment.IsOfNewObject: IDispatch;
begin
  Result := DefaultInterface.IsOfNewObject;
end;

function TDepartment.IsOfSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSet(newvalue);
end;

function TDepartment.IsOfSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.IsOfSetModified(newvalue);
end;

function TDepartment.IsOfSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObject(newvalue);
end;

function TDepartment.IsOfSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObjectId(newid);
end;

procedure TDepartment.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TDepartment.QueryCourseCountClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountClose(qHandle);
end;

function TDepartment.QueryCourseCountExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountExecute(qHandle, deptid);
end;

function TDepartment.QueryCourseCountFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                           var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountFetch(qHandle, Row, AtEnd);
end;

function TDepartment.QueryCourseCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                               SYS_qacn: Integer; var AtEnd: Integer; 
                                               var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TDepartment.QueryCourseCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                               var RowSet: IDispatch; var ReturnCount: Integer; 
                                               var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountFetchRows(qHandle, FetchCount, RowSet, ReturnCount, 
                                                       AtEnd);
end;

function TDepartment.QueryCourseCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                             var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDepartment.QueryCourseCountPrepare(var qHandle: OleVariant; const statement: WideString; 
                                             containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryCourseCountPrepare(qHandle, statement, containid, optional);
end;

function TDepartment.QueryDetailsClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsClose(qHandle);
end;

function TDepartment.QueryDetailsExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsExecute(qHandle);
end;

function TDepartment.QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                       var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetch(qHandle, Row, AtEnd);
end;

function TDepartment.QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                           SYS_qacn: Integer; var AtEnd: Integer; 
                                           var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TDepartment.QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                           var RowSet: IDispatch; var ReturnCount: Integer; 
                                           var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TDepartment.QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                         var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDepartment.QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                         containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsPrepare(qHandle, statement, containid, optional);
end;

function TDepartment.QueryIsOfClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfClose(qHandle);
end;

function TDepartment.QueryIsOfExecute(var qHandle: OleVariant; const facID: IDispatch): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfExecute(qHandle, facID);
end;

function TDepartment.QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetch(qHandle, Row, AtEnd);
end;

function TDepartment.QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                        SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TDepartment.QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                        var RowSet: IDispatch; var ReturnCount: Integer; 
                                        var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TDepartment.QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                      var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDepartment.QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                                      containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfPrepare(qHandle, statement, containid, optional);
end;

function TDepartment.QuerySubjectCountClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountClose(qHandle);
end;

function TDepartment.QuerySubjectCountExecute(var qHandle: OleVariant; const depid: IDispatch): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountExecute(qHandle, depid);
end;

function TDepartment.QuerySubjectCountFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                            var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountFetch(qHandle, Row, AtEnd);
end;

function TDepartment.QuerySubjectCountFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                                SYS_qacn: Integer; var AtEnd: Integer; 
                                                var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TDepartment.QuerySubjectCountFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                                var RowSet: IDispatch; var ReturnCount: Integer; 
                                                var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountFetchRows(qHandle, FetchCount, RowSet, ReturnCount, 
                                                        AtEnd);
end;

function TDepartment.QuerySubjectCountGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDepartment.QuerySubjectCountPrepare(var qHandle: OleVariant; const statement: WideString; 
                                              containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QuerySubjectCountPrepare(qHandle, statement, containid, optional);
end;

function TDepartment.ThaiNameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameDisplayToLogical(SYS_val);
end;

function TDepartment.ThaiNameGet: WideString;
begin
  Result := DefaultInterface.ThaiNameGet;
end;

function TDepartment.ThaiNameIsModified: Integer;
begin
  Result := DefaultInterface.ThaiNameIsModified;
end;

function TDepartment.ThaiNameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiNameIsValid(value);
end;

function TDepartment.ThaiNameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ThaiNameIsValidDT(SYS_val);
end;

function TDepartment.ThaiNameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameLogicalToDisplay(SYS_val);
end;

function TDepartment.ThaiNameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ThaiNameNormalize(SYS_val);
end;

function TDepartment.ThaiNameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiNameSet(newvalue);
end;

function TDepartment.ThaiNameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ThaiNameSetModified(newvalue);
end;


procedure Register;
begin
  RegisterComponents('ActiveX',[TDepartment]);
end;

end.
