unit User_Course_TLB;

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
// File generated on 25/2/2002 23:31:59 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Projects\Program\TLB\User_Course.tlb (1)
// LIBID: {D4077B3D-B950-490E-A48E-CF723B04AC87}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TCourse) : Registry key CLSID\{BADC235A-78C2-4606-B8AF-B78E86783769}\ToolboxBitmap32 not found
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
  User_CourseMajorVersion = 1;
  User_CourseMinorVersion = 0;

  LIBID_User_Course: TGUID = '{D4077B3D-B950-490E-A48E-CF723B04AC87}';

  DIID_CCourse: TGUID = '{A1BB9A71-E204-41E1-845D-E2D436A96616}';
  CLASS_Course: TGUID = '{BADC235A-78C2-4606-B8AF-B78E86783769}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CCourse = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Course = CCourse;


// *********************************************************************//
// DispIntf:  CCourse
// Flags:     (4112) Hidden Dispatchable
// GUID:      {A1BB9A71-E204-41E1-845D-E2D436A96616}
// *********************************************************************//
  CCourse = dispinterface
    ['{A1BB9A71-E204-41E1-845D-E2D436A96616}']
    property Categories: IDispatch dispid 61;
    property CourseLevel: Integer dispid 62;
    property DeleteTag: Integer dispid 41;
    property English: IDispatch dispid 63;
    property ExtCourseID: WideString dispid 64;
    property IsOf: IDispatch dispid 65;
    property Objective: WideString dispid 66;
    property Period: WideString dispid 67;
    property PostGraduate: IDispatch dispid 68;
    property Require: Double dispid 69;
    property Thai: IDispatch dispid 70;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 74;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 78;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 79;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 80;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 83;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 86;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 87;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CategoriesGet: IDispatch; dispid 117;
    function CategoriesGetObject(force: Integer): OleVariant; dispid 118;
    function CategoriesGetObjectId(force: Integer): WideString; dispid 119;
    function CategoriesIsModified: Integer; dispid 121;
    function CategoriesNewObject: IDispatch; dispid 123;
    function CategoriesSet(const newvalue: WideString): OleVariant; dispid 125;
    function CategoriesSetModified(newvalue: Integer): Integer; dispid 126;
    function CheckDependency: OleVariant; dispid 57;
    function CourseLevelDisplayToLogical(const SYS_val: WideString): Integer; dispid 130;
    function CourseLevelGet: Integer; dispid 131;
    function CourseLevelIsModified: Integer; dispid 135;
    function CourseLevelIsValid(const value: WideString): OleVariant; dispid 136;
    function CourseLevelIsValidDT(SYS_val: Integer): Integer; dispid 137;
    function CourseLevelLogicalToDisplay(SYS_val: Integer): WideString; dispid 138;
    function CourseLevelNormalize(const SYS_val: WideString): Integer; dispid 140;
    function CourseLevelSet(const newvalue: WideString): OleVariant; dispid 142;
    function CourseLevelSetModified(newvalue: Integer): Integer; dispid 143;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 147;
    function DeleteTagGet: Integer; dispid 148;
    function DeleteTagIsModified: Integer; dispid 152;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 153;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 154;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 155;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 157;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 159;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 160;
    function EnglishGet: IDispatch; dispid 164;
    function EnglishGetObject(force: Integer): OleVariant; dispid 165;
    function EnglishGetObjectId(force: Integer): WideString; dispid 166;
    function EnglishIsModified: Integer; dispid 168;
    function EnglishIsValid(const value: WideString): OleVariant; dispid 169;
    function EnglishNewObject: IDispatch; dispid 170;
    function EnglishSet(const newvalue: WideString): OleVariant; dispid 172;
    function EnglishSetModified(newvalue: Integer): Integer; dispid 173;
    function EnglishSetObject(newvalue: OleVariant): OleVariant; dispid 174;
    function EnglishSetObjectId(const newid: WideString): OleVariant; dispid 175;
    function ExtCourseIDDisplayToLogical(const SYS_val: WideString): WideString; dispid 177;
    function ExtCourseIDGet: WideString; dispid 178;
    function ExtCourseIDIsModified: Integer; dispid 182;
    function ExtCourseIDIsValid(const value: WideString): OleVariant; dispid 183;
    function ExtCourseIDIsValidDT(const SYS_val: WideString): Integer; dispid 184;
    function ExtCourseIDLogicalToDisplay(const SYS_val: WideString): WideString; dispid 185;
    function ExtCourseIDNormalize(const SYS_val: WideString): WideString; dispid 187;
    function ExtCourseIDSet(const newvalue: WideString): OleVariant; dispid 189;
    function ExtCourseIDSetModified(newvalue: Integer): Integer; dispid 190;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 285;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 286;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 287;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 289;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 290;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 291;
    function GetClassName: WideString; dispid 88;
    function GetParentClass: WideString; dispid 89;
    function IsOfGet: IDispatch; dispid 194;
    function IsOfGetObject(force: Integer): OleVariant; dispid 195;
    function IsOfGetObjectId(force: Integer): WideString; dispid 196;
    function IsOfIsModified: Integer; dispid 198;
    function IsOfIsValid(const value: WideString): OleVariant; dispid 199;
    function IsOfNewObject: IDispatch; dispid 200;
    function IsOfSet(const newvalue: WideString): OleVariant; dispid 202;
    function IsOfSetModified(newvalue: Integer): Integer; dispid 203;
    function IsOfSetObject(newvalue: OleVariant): OleVariant; dispid 204;
    function IsOfSetObjectId(const newid: WideString): OleVariant; dispid 205;
    function ObjectiveGet: WideString; dispid 207;
    function ObjectiveIsModified: Integer; dispid 211;
    function ObjectiveIsValid(const value: WideString): OleVariant; dispid 212;
    function ObjectiveSet(const newvalue: WideString): OleVariant; dispid 215;
    function ObjectiveSetModified(newvalue: Integer): Integer; dispid 216;
    function PeriodDisplayToLogical(const SYS_val: WideString): WideString; dispid 220;
    function PeriodGet: WideString; dispid 221;
    function PeriodIsModified: Integer; dispid 225;
    function PeriodIsValid(const value: WideString): OleVariant; dispid 226;
    function PeriodIsValidDT(const SYS_val: WideString): Integer; dispid 227;
    function PeriodLogicalToDisplay(const SYS_val: WideString): WideString; dispid 228;
    function PeriodNormalize(const SYS_val: WideString): WideString; dispid 230;
    function PeriodSet(const newvalue: WideString): OleVariant; dispid 232;
    function PeriodSetModified(newvalue: Integer): Integer; dispid 233;
    function PostGraduateDisplayToLogical(const SYS_val: WideString): WideString; dispid 237;
    function PostGraduateGet: IDispatch; dispid 238;
    function PostGraduateGetObject(force: Integer): OleVariant; dispid 239;
    function PostGraduateGetObjectId(force: Integer): WideString; dispid 240;
    function PostGraduateIsModified: Integer; dispid 242;
    function PostGraduateIsValidDT(const SYS_val: WideString): Integer; dispid 244;
    function PostGraduateLogicalToDisplay(const SYS_val: WideString): WideString; dispid 245;
    function PostGraduateNewObject: IDispatch; dispid 246;
    function PostGraduateNormalize(const SYS_val: WideString): WideString; dispid 247;
    function PostGraduateSet(const newvalue: WideString): OleVariant; dispid 249;
    function PostGraduateSetModified(newvalue: Integer): Integer; dispid 250;
    procedure PrepareDeleting; dispid 60;
    function QueryDetailsClose(qHandle: OleVariant): OleVariant; dispid 292;
    function QueryDetailsExecute(var qHandle: OleVariant): OleVariant; dispid 293;
    function QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 294;
    function QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                   SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 295;
    function QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant; dispid 296;
    function QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 297;
    function QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant; dispid 298;
    function QueryIsOfClose(qHandle: OleVariant): OleVariant; dispid 299;
    function QueryIsOfExecute(var qHandle: OleVariant; const departmentid: IDispatch): OleVariant; dispid 300;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 301;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 302;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 303;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 304;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant; dispid 305;
    function RequireDisplayToLogical(const SYS_val: WideString): Double; dispid 254;
    function RequireGet: Double; dispid 255;
    function RequireIsModified: Integer; dispid 259;
    function RequireIsValid(const value: WideString): OleVariant; dispid 260;
    function RequireIsValidDT(SYS_val: Double): Integer; dispid 261;
    function RequireLogicalToDisplay(SYS_val: Double): WideString; dispid 262;
    function RequireNormalize(const SYS_val: WideString): Double; dispid 264;
    function RequireSet(const newvalue: WideString): OleVariant; dispid 266;
    function RequireSetModified(newvalue: Integer): Integer; dispid 267;
    function ThaiGet: IDispatch; dispid 271;
    function ThaiGetObject(force: Integer): OleVariant; dispid 272;
    function ThaiGetObjectId(force: Integer): WideString; dispid 273;
    function ThaiIsModified: Integer; dispid 275;
    function ThaiIsValid(const value: WideString): OleVariant; dispid 276;
    function ThaiNewObject: IDispatch; dispid 277;
    function ThaiSet(const newvalue: WideString): OleVariant; dispid 279;
    function ThaiSetModified(newvalue: Integer): Integer; dispid 280;
    function ThaiSetObject(newvalue: OleVariant): OleVariant; dispid 281;
    function ThaiSetObjectId(const newid: WideString): OleVariant; dispid 282;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCourse
// Help String      : Cache Object: User.Course CoClass
// Default Interface: CCourse
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCourse = class(TOleControl)
  private
    FIntf: CCourse;
    function  GetControlInterface: CCourse;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Categories: IDispatch;
    procedure Set_Categories(const Value: IDispatch);
    function Get_English: IDispatch;
    procedure Set_English(const Value: IDispatch);
    function Get_IsOf: IDispatch;
    procedure Set_IsOf(const Value: IDispatch);
    function Get_PostGraduate: IDispatch;
    procedure Set_PostGraduate(const Value: IDispatch);
    function Get_Thai: IDispatch;
    procedure Set_Thai(const Value: IDispatch);
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
    function CategoriesGet: IDispatch;
    function CategoriesGetObject(force: Integer): OleVariant;
    function CategoriesGetObjectId(force: Integer): WideString;
    function CategoriesIsModified: Integer;
    function CategoriesNewObject: IDispatch;
    function CategoriesSet(const newvalue: WideString): OleVariant;
    function CategoriesSetModified(newvalue: Integer): Integer;
    function CheckDependency: OleVariant;
    function CourseLevelDisplayToLogical(const SYS_val: WideString): Integer;
    function CourseLevelGet: Integer;
    function CourseLevelIsModified: Integer;
    function CourseLevelIsValid(const value: WideString): OleVariant;
    function CourseLevelIsValidDT(SYS_val: Integer): Integer;
    function CourseLevelLogicalToDisplay(SYS_val: Integer): WideString;
    function CourseLevelNormalize(const SYS_val: WideString): Integer;
    function CourseLevelSet(const newvalue: WideString): OleVariant;
    function CourseLevelSetModified(newvalue: Integer): Integer;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
    function DeleteTagGet: Integer;
    function DeleteTagIsModified: Integer;
    function DeleteTagIsValid(const value: WideString): OleVariant;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
    function DeleteTagNormalize(const SYS_val: WideString): Integer;
    function DeleteTagSet(const newvalue: WideString): OleVariant;
    function DeleteTagSetModified(newvalue: Integer): Integer;
    function EnglishGet: IDispatch;
    function EnglishGetObject(force: Integer): OleVariant;
    function EnglishGetObjectId(force: Integer): WideString;
    function EnglishIsModified: Integer;
    function EnglishIsValid(const value: WideString): OleVariant;
    function EnglishNewObject: IDispatch;
    function EnglishSet(const newvalue: WideString): OleVariant;
    function EnglishSetModified(newvalue: Integer): Integer;
    function EnglishSetObject(newvalue: OleVariant): OleVariant;
    function EnglishSetObjectId(const newid: WideString): OleVariant;
    function ExtCourseIDDisplayToLogical(const SYS_val: WideString): WideString;
    function ExtCourseIDGet: WideString;
    function ExtCourseIDIsModified: Integer;
    function ExtCourseIDIsValid(const value: WideString): OleVariant;
    function ExtCourseIDIsValidDT(const SYS_val: WideString): Integer;
    function ExtCourseIDLogicalToDisplay(const SYS_val: WideString): WideString;
    function ExtCourseIDNormalize(const SYS_val: WideString): WideString;
    function ExtCourseIDSet(const newvalue: WideString): OleVariant;
    function ExtCourseIDSetModified(newvalue: Integer): Integer;
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
    function ObjectiveGet: WideString;
    function ObjectiveIsModified: Integer;
    function ObjectiveIsValid(const value: WideString): OleVariant;
    function ObjectiveSet(const newvalue: WideString): OleVariant;
    function ObjectiveSetModified(newvalue: Integer): Integer;
    function PeriodDisplayToLogical(const SYS_val: WideString): WideString;
    function PeriodGet: WideString;
    function PeriodIsModified: Integer;
    function PeriodIsValid(const value: WideString): OleVariant;
    function PeriodIsValidDT(const SYS_val: WideString): Integer;
    function PeriodLogicalToDisplay(const SYS_val: WideString): WideString;
    function PeriodNormalize(const SYS_val: WideString): WideString;
    function PeriodSet(const newvalue: WideString): OleVariant;
    function PeriodSetModified(newvalue: Integer): Integer;
    function PostGraduateDisplayToLogical(const SYS_val: WideString): WideString;
    function PostGraduateGet: IDispatch;
    function PostGraduateGetObject(force: Integer): OleVariant;
    function PostGraduateGetObjectId(force: Integer): WideString;
    function PostGraduateIsModified: Integer;
    function PostGraduateIsValidDT(const SYS_val: WideString): Integer;
    function PostGraduateLogicalToDisplay(const SYS_val: WideString): WideString;
    function PostGraduateNewObject: IDispatch;
    function PostGraduateNormalize(const SYS_val: WideString): WideString;
    function PostGraduateSet(const newvalue: WideString): OleVariant;
    function PostGraduateSetModified(newvalue: Integer): Integer;
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
    function QueryIsOfClose(qHandle: OleVariant): OleVariant;
    function QueryIsOfExecute(var qHandle: OleVariant; const departmentid: IDispatch): OleVariant;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant;
    function RequireDisplayToLogical(const SYS_val: WideString): Double;
    function RequireGet: Double;
    function RequireIsModified: Integer;
    function RequireIsValid(const value: WideString): OleVariant;
    function RequireIsValidDT(SYS_val: Double): Integer;
    function RequireLogicalToDisplay(SYS_val: Double): WideString;
    function RequireNormalize(const SYS_val: WideString): Double;
    function RequireSet(const newvalue: WideString): OleVariant;
    function RequireSetModified(newvalue: Integer): Integer;
    function ThaiGet: IDispatch;
    function ThaiGetObject(force: Integer): OleVariant;
    function ThaiGetObjectId(force: Integer): WideString;
    function ThaiIsModified: Integer;
    function ThaiIsValid(const value: WideString): OleVariant;
    function ThaiNewObject: IDispatch;
    function ThaiSet(const newvalue: WideString): OleVariant;
    function ThaiSetModified(newvalue: Integer): Integer;
    function ThaiSetObject(newvalue: OleVariant): OleVariant;
    function ThaiSetObjectId(const newid: WideString): OleVariant;
    property  ControlInterface: CCourse read GetControlInterface;
    property  DefaultInterface: CCourse read GetControlInterface;
    property Categories: IDispatch index 61 read GetIDispatchProp write SetIDispatchProp;
    property English: IDispatch index 63 read GetIDispatchProp write SetIDispatchProp;
    property IsOf: IDispatch index 65 read GetIDispatchProp write SetIDispatchProp;
    property PostGraduate: IDispatch index 68 read GetIDispatchProp write SetIDispatchProp;
    property Thai: IDispatch index 70 read GetIDispatchProp write SetIDispatchProp;
  published
    property CourseLevel: Integer index 62 read GetIntegerProp write SetIntegerProp stored False;
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property ExtCourseID: WideString index 64 read GetWideStringProp write SetWideStringProp stored False;
    property Objective: WideString index 66 read GetWideStringProp write SetWideStringProp stored False;
    property Period: WideString index 67 read GetWideStringProp write SetWideStringProp stored False;
    property Require: Double index 69 read GetDoubleProp write SetDoubleProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TCourse.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{BADC235A-78C2-4606-B8AF-B78E86783769}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TCourse.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CCourse;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCourse.GetControlInterface: CCourse;
begin
  CreateControl;
  Result := FIntf;
end;

function TCourse.Get_Categories: IDispatch;
begin
  Result := DefaultInterface.Categories;
end;

procedure TCourse.Set_Categories(const Value: IDispatch);
begin
  DefaultInterface.Categories := Value;
end;

function TCourse.Get_English: IDispatch;
begin
  Result := DefaultInterface.English;
end;

procedure TCourse.Set_English(const Value: IDispatch);
begin
  DefaultInterface.English := Value;
end;

function TCourse.Get_IsOf: IDispatch;
begin
  Result := DefaultInterface.IsOf;
end;

procedure TCourse.Set_IsOf(const Value: IDispatch);
begin
  DefaultInterface.IsOf := Value;
end;

function TCourse.Get_PostGraduate: IDispatch;
begin
  Result := DefaultInterface.PostGraduate;
end;

procedure TCourse.Set_PostGraduate(const Value: IDispatch);
begin
  DefaultInterface.PostGraduate := Value;
end;

function TCourse.Get_Thai: IDispatch;
begin
  Result := DefaultInterface.Thai;
end;

procedure TCourse.Set_Thai(const Value: IDispatch);
begin
  DefaultInterface.Thai := Value;
end;

function TCourse.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TCourse.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TCourse.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TCourse.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TCourse.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TCourse.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                  var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TCourse.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TCourse.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TCourse.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TCourse.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TCourse.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TCourse.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TCourse.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TCourse.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TCourse.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TCourse.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TCourse.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TCourse.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TCourse.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TCourse.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TCourse.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TCourse.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TCourse.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TCourse.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TCourse.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TCourse.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TCourse.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TCourse.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TCourse.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TCourse.CategoriesGet: IDispatch;
begin
  Result := DefaultInterface.CategoriesGet;
end;

function TCourse.CategoriesGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.CategoriesGetObject(force);
end;

function TCourse.CategoriesGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.CategoriesGetObjectId(force);
end;

function TCourse.CategoriesIsModified: Integer;
begin
  Result := DefaultInterface.CategoriesIsModified;
end;

function TCourse.CategoriesNewObject: IDispatch;
begin
  Result := DefaultInterface.CategoriesNewObject;
end;

function TCourse.CategoriesSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.CategoriesSet(newvalue);
end;

function TCourse.CategoriesSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.CategoriesSetModified(newvalue);
end;

function TCourse.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TCourse.CourseLevelDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.CourseLevelDisplayToLogical(SYS_val);
end;

function TCourse.CourseLevelGet: Integer;
begin
  Result := DefaultInterface.CourseLevelGet;
end;

function TCourse.CourseLevelIsModified: Integer;
begin
  Result := DefaultInterface.CourseLevelIsModified;
end;

function TCourse.CourseLevelIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.CourseLevelIsValid(value);
end;

function TCourse.CourseLevelIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.CourseLevelIsValidDT(SYS_val);
end;

function TCourse.CourseLevelLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.CourseLevelLogicalToDisplay(SYS_val);
end;

function TCourse.CourseLevelNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.CourseLevelNormalize(SYS_val);
end;

function TCourse.CourseLevelSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.CourseLevelSet(newvalue);
end;

function TCourse.CourseLevelSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.CourseLevelSetModified(newvalue);
end;

function TCourse.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TCourse.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TCourse.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TCourse.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TCourse.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TCourse.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TCourse.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TCourse.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TCourse.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TCourse.EnglishGet: IDispatch;
begin
  Result := DefaultInterface.EnglishGet;
end;

function TCourse.EnglishGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.EnglishGetObject(force);
end;

function TCourse.EnglishGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.EnglishGetObjectId(force);
end;

function TCourse.EnglishIsModified: Integer;
begin
  Result := DefaultInterface.EnglishIsModified;
end;

function TCourse.EnglishIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishIsValid(value);
end;

function TCourse.EnglishNewObject: IDispatch;
begin
  Result := DefaultInterface.EnglishNewObject;
end;

function TCourse.EnglishSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishSet(newvalue);
end;

function TCourse.EnglishSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.EnglishSetModified(newvalue);
end;

function TCourse.EnglishSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.EnglishSetObject(newvalue);
end;

function TCourse.EnglishSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishSetObjectId(newid);
end;

function TCourse.ExtCourseIDDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtCourseIDDisplayToLogical(SYS_val);
end;

function TCourse.ExtCourseIDGet: WideString;
begin
  Result := DefaultInterface.ExtCourseIDGet;
end;

function TCourse.ExtCourseIDIsModified: Integer;
begin
  Result := DefaultInterface.ExtCourseIDIsModified;
end;

function TCourse.ExtCourseIDIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtCourseIDIsValid(value);
end;

function TCourse.ExtCourseIDIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ExtCourseIDIsValidDT(SYS_val);
end;

function TCourse.ExtCourseIDLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtCourseIDLogicalToDisplay(SYS_val);
end;

function TCourse.ExtCourseIDNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtCourseIDNormalize(SYS_val);
end;

function TCourse.ExtCourseIDSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtCourseIDSet(newvalue);
end;

function TCourse.ExtCourseIDSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ExtCourseIDSetModified(newvalue);
end;

function TCourse.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TCourse.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TCourse.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TCourse.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                 var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TCourse.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                               var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TCourse.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                               containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TCourse.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TCourse.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

function TCourse.IsOfGet: IDispatch;
begin
  Result := DefaultInterface.IsOfGet;
end;

function TCourse.IsOfGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.IsOfGetObject(force);
end;

function TCourse.IsOfGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.IsOfGetObjectId(force);
end;

function TCourse.IsOfIsModified: Integer;
begin
  Result := DefaultInterface.IsOfIsModified;
end;

function TCourse.IsOfIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfIsValid(value);
end;

function TCourse.IsOfNewObject: IDispatch;
begin
  Result := DefaultInterface.IsOfNewObject;
end;

function TCourse.IsOfSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSet(newvalue);
end;

function TCourse.IsOfSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.IsOfSetModified(newvalue);
end;

function TCourse.IsOfSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObject(newvalue);
end;

function TCourse.IsOfSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObjectId(newid);
end;

function TCourse.ObjectiveGet: WideString;
begin
  Result := DefaultInterface.ObjectiveGet;
end;

function TCourse.ObjectiveIsModified: Integer;
begin
  Result := DefaultInterface.ObjectiveIsModified;
end;

function TCourse.ObjectiveIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ObjectiveIsValid(value);
end;

function TCourse.ObjectiveSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ObjectiveSet(newvalue);
end;

function TCourse.ObjectiveSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ObjectiveSetModified(newvalue);
end;

function TCourse.PeriodDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PeriodDisplayToLogical(SYS_val);
end;

function TCourse.PeriodGet: WideString;
begin
  Result := DefaultInterface.PeriodGet;
end;

function TCourse.PeriodIsModified: Integer;
begin
  Result := DefaultInterface.PeriodIsModified;
end;

function TCourse.PeriodIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.PeriodIsValid(value);
end;

function TCourse.PeriodIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.PeriodIsValidDT(SYS_val);
end;

function TCourse.PeriodLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PeriodLogicalToDisplay(SYS_val);
end;

function TCourse.PeriodNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PeriodNormalize(SYS_val);
end;

function TCourse.PeriodSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.PeriodSet(newvalue);
end;

function TCourse.PeriodSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.PeriodSetModified(newvalue);
end;

function TCourse.PostGraduateDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PostGraduateDisplayToLogical(SYS_val);
end;

function TCourse.PostGraduateGet: IDispatch;
begin
  Result := DefaultInterface.PostGraduateGet;
end;

function TCourse.PostGraduateGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.PostGraduateGetObject(force);
end;

function TCourse.PostGraduateGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.PostGraduateGetObjectId(force);
end;

function TCourse.PostGraduateIsModified: Integer;
begin
  Result := DefaultInterface.PostGraduateIsModified;
end;

function TCourse.PostGraduateIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.PostGraduateIsValidDT(SYS_val);
end;

function TCourse.PostGraduateLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PostGraduateLogicalToDisplay(SYS_val);
end;

function TCourse.PostGraduateNewObject: IDispatch;
begin
  Result := DefaultInterface.PostGraduateNewObject;
end;

function TCourse.PostGraduateNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.PostGraduateNormalize(SYS_val);
end;

function TCourse.PostGraduateSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.PostGraduateSet(newvalue);
end;

function TCourse.PostGraduateSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.PostGraduateSetModified(newvalue);
end;

procedure TCourse.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TCourse.QueryDetailsClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsClose(qHandle);
end;

function TCourse.QueryDetailsExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsExecute(qHandle);
end;

function TCourse.QueryDetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetch(qHandle, Row, AtEnd);
end;

function TCourse.QueryDetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                       SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TCourse.QueryDetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                       var RowSet: IDispatch; var ReturnCount: Integer; 
                                       var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TCourse.QueryDetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                     var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TCourse.QueryDetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                     containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryDetailsPrepare(qHandle, statement, containid, optional);
end;

function TCourse.QueryIsOfClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfClose(qHandle);
end;

function TCourse.QueryIsOfExecute(var qHandle: OleVariant; const departmentid: IDispatch): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfExecute(qHandle, departmentid);
end;

function TCourse.QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetch(qHandle, Row, AtEnd);
end;

function TCourse.QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                    SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TCourse.QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                    var RowSet: IDispatch; var ReturnCount: Integer; 
                                    var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TCourse.QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                  var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TCourse.QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                                  containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfPrepare(qHandle, statement, containid, optional);
end;

function TCourse.RequireDisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.RequireDisplayToLogical(SYS_val);
end;

function TCourse.RequireGet: Double;
begin
  Result := DefaultInterface.RequireGet;
end;

function TCourse.RequireIsModified: Integer;
begin
  Result := DefaultInterface.RequireIsModified;
end;

function TCourse.RequireIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.RequireIsValid(value);
end;

function TCourse.RequireIsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.RequireIsValidDT(SYS_val);
end;

function TCourse.RequireLogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.RequireLogicalToDisplay(SYS_val);
end;

function TCourse.RequireNormalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.RequireNormalize(SYS_val);
end;

function TCourse.RequireSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.RequireSet(newvalue);
end;

function TCourse.RequireSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.RequireSetModified(newvalue);
end;

function TCourse.ThaiGet: IDispatch;
begin
  Result := DefaultInterface.ThaiGet;
end;

function TCourse.ThaiGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.ThaiGetObject(force);
end;

function TCourse.ThaiGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.ThaiGetObjectId(force);
end;

function TCourse.ThaiIsModified: Integer;
begin
  Result := DefaultInterface.ThaiIsModified;
end;

function TCourse.ThaiIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiIsValid(value);
end;

function TCourse.ThaiNewObject: IDispatch;
begin
  Result := DefaultInterface.ThaiNewObject;
end;

function TCourse.ThaiSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiSet(newvalue);
end;

function TCourse.ThaiSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ThaiSetModified(newvalue);
end;

function TCourse.ThaiSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ThaiSetObject(newvalue);
end;

function TCourse.ThaiSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiSetObjectId(newid);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCourse]);
end;

end.
