unit User_SubjectBachelor_TLB;

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
// File generated on 26/2/2002 23:08:34 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Projects\Program\TLB\User_SubjectBachelor.tlb (1)
// LIBID: {4F446ADC-0A50-405A-AF03-A6DD9EF1286A}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TSubjectBachelor) : Registry key CLSID\{02539D13-CB3D-4390-927F-F9D161D31397}\ToolboxBitmap32 not found
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
  User_SubjectBachelorMajorVersion = 1;
  User_SubjectBachelorMinorVersion = 0;

  LIBID_User_SubjectBachelor: TGUID = '{4F446ADC-0A50-405A-AF03-A6DD9EF1286A}';

  DIID_CSubjectBachelor: TGUID = '{5EBF9ACA-ED0D-473F-9AAB-4917E143F15C}';
  CLASS_SubjectBachelor: TGUID = '{02539D13-CB3D-4390-927F-F9D161D31397}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CSubjectBachelor = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SubjectBachelor = CSubjectBachelor;


// *********************************************************************//
// DispIntf:  CSubjectBachelor
// Flags:     (4112) Hidden Dispatchable
// GUID:      {5EBF9ACA-ED0D-473F-9AAB-4917E143F15C}
// *********************************************************************//
  CSubjectBachelor = dispinterface
    ['{5EBF9ACA-ED0D-473F-9AAB-4917E143F15C}']
    property Credit: Double dispid 61;
    property Credit1: Double dispid 62;
    property Credit2: Double dispid 63;
    property DeleteTag: Integer dispid 41;
    property English: IDispatch dispid 64;
    property ExtSubjectID: WideString dispid 65;
    property IsOf: IDispatch dispid 66;
    property PossibleGrades: IDispatch dispid 67;
    property Prerequisites: IDispatch dispid 68;
    property Status: OleVariant dispid 69;
    property SubCourses: IDispatch dispid 70;
    property SubjectLevel: Integer dispid 71;
    property Thai: IDispatch dispid 72;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 76;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 80;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 81;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 82;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 85;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 88;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 89;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function Credit1DisplayToLogical(const SYS_val: WideString): Double; dispid 134;
    function Credit1Get: Double; dispid 135;
    function Credit1IsModified: Integer; dispid 139;
    function Credit1IsValid(const value: WideString): OleVariant; dispid 140;
    function Credit1IsValidDT(SYS_val: Double): Integer; dispid 141;
    function Credit1LogicalToDisplay(SYS_val: Double): WideString; dispid 142;
    function Credit1Normalize(const SYS_val: WideString): Double; dispid 144;
    function Credit1Set(const newvalue: WideString): OleVariant; dispid 146;
    function Credit1SetModified(newvalue: Integer): Integer; dispid 147;
    function Credit2DisplayToLogical(const SYS_val: WideString): Double; dispid 151;
    function Credit2Get: Double; dispid 152;
    function Credit2IsModified: Integer; dispid 156;
    function Credit2IsValid(const value: WideString): OleVariant; dispid 157;
    function Credit2IsValidDT(SYS_val: Double): Integer; dispid 158;
    function Credit2LogicalToDisplay(SYS_val: Double): WideString; dispid 159;
    function Credit2Normalize(const SYS_val: WideString): Double; dispid 161;
    function Credit2Set(const newvalue: WideString): OleVariant; dispid 163;
    function Credit2SetModified(newvalue: Integer): Integer; dispid 164;
    function CreditDisplayToLogical(const SYS_val: WideString): Double; dispid 117;
    function CreditGet: Double; dispid 118;
    function CreditIsModified: Integer; dispid 122;
    function CreditIsValid(const value: WideString): OleVariant; dispid 123;
    function CreditIsValidDT(SYS_val: Double): Integer; dispid 124;
    function CreditLogicalToDisplay(SYS_val: Double): WideString; dispid 125;
    function CreditNormalize(const SYS_val: WideString): Double; dispid 127;
    function CreditSet(const newvalue: WideString): OleVariant; dispid 129;
    function CreditSetModified(newvalue: Integer): Integer; dispid 130;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 168;
    function DeleteTagGet: Integer; dispid 169;
    function DeleteTagIsModified: Integer; dispid 173;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 174;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 175;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 176;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 178;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 180;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 181;
    function EnglishGet: IDispatch; dispid 185;
    function EnglishGetObject(force: Integer): OleVariant; dispid 186;
    function EnglishGetObjectId(force: Integer): WideString; dispid 187;
    function EnglishIsModified: Integer; dispid 189;
    function EnglishIsValid(const value: WideString): OleVariant; dispid 190;
    function EnglishNewObject: IDispatch; dispid 191;
    function EnglishSet(const newvalue: WideString): OleVariant; dispid 193;
    function EnglishSetModified(newvalue: Integer): Integer; dispid 194;
    function EnglishSetObject(newvalue: OleVariant): OleVariant; dispid 195;
    function EnglishSetObjectId(const newid: WideString): OleVariant; dispid 196;
    function ExtSubjectIDDisplayToLogical(const SYS_val: WideString): WideString; dispid 198;
    function ExtSubjectIDGet: WideString; dispid 199;
    function ExtSubjectIDIsModified: Integer; dispid 203;
    function ExtSubjectIDIsValid(const value: WideString): OleVariant; dispid 204;
    function ExtSubjectIDIsValidDT(const SYS_val: WideString): Integer; dispid 205;
    function ExtSubjectIDLogicalToDisplay(const SYS_val: WideString): WideString; dispid 206;
    function ExtSubjectIDNormalize(const SYS_val: WideString): WideString; dispid 208;
    function ExtSubjectIDSet(const newvalue: WideString): OleVariant; dispid 210;
    function ExtSubjectIDSetModified(newvalue: Integer): Integer; dispid 211;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 315;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 316;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 317;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 319;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 320;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 321;
    function GetClassName: WideString; dispid 58;
    function GetParentClass: WideString; dispid 59;
    function IsOfGet: IDispatch; dispid 215;
    function IsOfGetObject(force: Integer): OleVariant; dispid 216;
    function IsOfGetObjectId(force: Integer): WideString; dispid 217;
    function IsOfIsModified: Integer; dispid 219;
    function IsOfIsValid(const value: WideString): OleVariant; dispid 220;
    function IsOfNewObject: IDispatch; dispid 221;
    function IsOfSet(const newvalue: WideString): OleVariant; dispid 223;
    function IsOfSetModified(newvalue: Integer): Integer; dispid 224;
    function IsOfSetObject(newvalue: OleVariant): OleVariant; dispid 225;
    function IsOfSetObjectId(const newid: WideString): OleVariant; dispid 226;
    function PossibleGradesGet: IDispatch; dispid 228;
    function PossibleGradesGetObject(force: Integer): OleVariant; dispid 229;
    function PossibleGradesGetObjectId(force: Integer): WideString; dispid 230;
    function PossibleGradesIsModified: Integer; dispid 232;
    function PossibleGradesNewObject: IDispatch; dispid 234;
    function PossibleGradesSet(const newvalue: WideString): OleVariant; dispid 236;
    function PossibleGradesSetModified(newvalue: Integer): Integer; dispid 237;
    procedure PrepareDeleting; dispid 60;
    function PrerequisitesGet: IDispatch; dispid 241;
    function PrerequisitesGetObject(force: Integer): OleVariant; dispid 242;
    function PrerequisitesGetObjectId(force: Integer): WideString; dispid 243;
    function PrerequisitesIsModified: Integer; dispid 245;
    function PrerequisitesNewObject: IDispatch; dispid 247;
    function PrerequisitesSet(const newvalue: WideString): OleVariant; dispid 249;
    function PrerequisitesSetModified(newvalue: Integer): Integer; dispid 250;
    function QueryIsOfClose(qHandle: OleVariant): OleVariant; dispid 322;
    function QueryIsOfExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant; dispid 323;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 324;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 325;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 326;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 327;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant; dispid 328;
    function QuerySelectClose(qHandle: OleVariant): OleVariant; dispid 329;
    function QuerySelectExecute(var qHandle: OleVariant; const x: WideString): OleVariant; dispid 330;
    function QuerySelectFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 331;
    function QuerySelectFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                  SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 332;
    function QuerySelectFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                  var RowSet: IDispatch; var ReturnCount: Integer; 
                                  var AtEnd: Integer): OleVariant; dispid 333;
    function QuerySelectGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                var idinfo: IDispatch; var qHandle: OleVariant): OleVariant; dispid 334;
    function QuerySelectPrepare(var qHandle: OleVariant; const statement: WideString; 
                                containid: Integer; const optional: WideString): OleVariant; dispid 335;
    function StatusDisplayToLogical(const SYS_val: WideString): OleVariant; dispid 254;
    function StatusGet: OleVariant; dispid 255;
    function StatusIsModified: Integer; dispid 259;
    function StatusIsValid(const value: WideString): OleVariant; dispid 260;
    function StatusIsValidDT(SYS_val: OleVariant): Integer; dispid 261;
    function StatusLogicalToDisplay(SYS_val: OleVariant): WideString; dispid 262;
    function StatusNormalize(const SYS_val: WideString): Integer; dispid 264;
    function StatusSet(const newvalue: WideString): OleVariant; dispid 266;
    function StatusSetModified(newvalue: Integer): Integer; dispid 267;
    function SubCoursesGet: IDispatch; dispid 271;
    function SubCoursesGetObject(force: Integer): OleVariant; dispid 272;
    function SubCoursesGetObjectId(force: Integer): WideString; dispid 273;
    function SubCoursesIsModified: Integer; dispid 275;
    function SubCoursesNewObject: IDispatch; dispid 277;
    function SubCoursesSet(const newvalue: WideString): OleVariant; dispid 279;
    function SubCoursesSetModified(newvalue: Integer): Integer; dispid 280;
    function SubjectLevelDisplayToLogical(const SYS_val: WideString): Integer; dispid 284;
    function SubjectLevelGet: Integer; dispid 285;
    function SubjectLevelIsModified: Integer; dispid 289;
    function SubjectLevelIsValid(const value: WideString): OleVariant; dispid 290;
    function SubjectLevelIsValidDT(SYS_val: Integer): Integer; dispid 291;
    function SubjectLevelLogicalToDisplay(SYS_val: Integer): WideString; dispid 292;
    function SubjectLevelNormalize(const SYS_val: WideString): Integer; dispid 294;
    function SubjectLevelSet(const newvalue: WideString): OleVariant; dispid 296;
    function SubjectLevelSetModified(newvalue: Integer): Integer; dispid 297;
    function ThaiGet: IDispatch; dispid 301;
    function ThaiGetObject(force: Integer): OleVariant; dispid 302;
    function ThaiGetObjectId(force: Integer): WideString; dispid 303;
    function ThaiIsModified: Integer; dispid 305;
    function ThaiIsValid(const value: WideString): OleVariant; dispid 306;
    function ThaiNewObject: IDispatch; dispid 307;
    function ThaiSet(const newvalue: WideString): OleVariant; dispid 309;
    function ThaiSetModified(newvalue: Integer): Integer; dispid 310;
    function ThaiSetObject(newvalue: OleVariant): OleVariant; dispid 311;
    function ThaiSetObjectId(const newid: WideString): OleVariant; dispid 312;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSubjectBachelor
// Help String      : Cache Object: User.SubjectBachelor CoClass
// Default Interface: CSubjectBachelor
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TSubjectBachelor = class(TOleControl)
  private
    FIntf: CSubjectBachelor;
    function  GetControlInterface: CSubjectBachelor;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_English: IDispatch;
    procedure Set_English(const Value: IDispatch);
    function Get_IsOf: IDispatch;
    procedure Set_IsOf(const Value: IDispatch);
    function Get_PossibleGrades: IDispatch;
    procedure Set_PossibleGrades(const Value: IDispatch);
    function Get_Prerequisites: IDispatch;
    procedure Set_Prerequisites(const Value: IDispatch);
    function Get_Status: OleVariant;
    procedure Set_Status(Value: OleVariant);
    function Get_SubCourses: IDispatch;
    procedure Set_SubCourses(const Value: IDispatch);
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
    function CheckDependency: OleVariant;
    function Credit1DisplayToLogical(const SYS_val: WideString): Double;
    function Credit1Get: Double;
    function Credit1IsModified: Integer;
    function Credit1IsValid(const value: WideString): OleVariant;
    function Credit1IsValidDT(SYS_val: Double): Integer;
    function Credit1LogicalToDisplay(SYS_val: Double): WideString;
    function Credit1Normalize(const SYS_val: WideString): Double;
    function Credit1Set(const newvalue: WideString): OleVariant;
    function Credit1SetModified(newvalue: Integer): Integer;
    function Credit2DisplayToLogical(const SYS_val: WideString): Double;
    function Credit2Get: Double;
    function Credit2IsModified: Integer;
    function Credit2IsValid(const value: WideString): OleVariant;
    function Credit2IsValidDT(SYS_val: Double): Integer;
    function Credit2LogicalToDisplay(SYS_val: Double): WideString;
    function Credit2Normalize(const SYS_val: WideString): Double;
    function Credit2Set(const newvalue: WideString): OleVariant;
    function Credit2SetModified(newvalue: Integer): Integer;
    function CreditDisplayToLogical(const SYS_val: WideString): Double;
    function CreditGet: Double;
    function CreditIsModified: Integer;
    function CreditIsValid(const value: WideString): OleVariant;
    function CreditIsValidDT(SYS_val: Double): Integer;
    function CreditLogicalToDisplay(SYS_val: Double): WideString;
    function CreditNormalize(const SYS_val: WideString): Double;
    function CreditSet(const newvalue: WideString): OleVariant;
    function CreditSetModified(newvalue: Integer): Integer;
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
    function ExtSubjectIDDisplayToLogical(const SYS_val: WideString): WideString;
    function ExtSubjectIDGet: WideString;
    function ExtSubjectIDIsModified: Integer;
    function ExtSubjectIDIsValid(const value: WideString): OleVariant;
    function ExtSubjectIDIsValidDT(const SYS_val: WideString): Integer;
    function ExtSubjectIDLogicalToDisplay(const SYS_val: WideString): WideString;
    function ExtSubjectIDNormalize(const SYS_val: WideString): WideString;
    function ExtSubjectIDSet(const newvalue: WideString): OleVariant;
    function ExtSubjectIDSetModified(newvalue: Integer): Integer;
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
    function PossibleGradesGet: IDispatch;
    function PossibleGradesGetObject(force: Integer): OleVariant;
    function PossibleGradesGetObjectId(force: Integer): WideString;
    function PossibleGradesIsModified: Integer;
    function PossibleGradesNewObject: IDispatch;
    function PossibleGradesSet(const newvalue: WideString): OleVariant;
    function PossibleGradesSetModified(newvalue: Integer): Integer;
    procedure PrepareDeleting;
    function PrerequisitesGet: IDispatch;
    function PrerequisitesGetObject(force: Integer): OleVariant;
    function PrerequisitesGetObjectId(force: Integer): WideString;
    function PrerequisitesIsModified: Integer;
    function PrerequisitesNewObject: IDispatch;
    function PrerequisitesSet(const newvalue: WideString): OleVariant;
    function PrerequisitesSetModified(newvalue: Integer): Integer;
    function QueryIsOfClose(qHandle: OleVariant): OleVariant;
    function QueryIsOfExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant;
    function QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                                var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant;
    function QuerySelectClose(qHandle: OleVariant): OleVariant;
    function QuerySelectExecute(var qHandle: OleVariant; const x: WideString): OleVariant;
    function QuerySelectFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function QuerySelectFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                  SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function QuerySelectFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                  var RowSet: IDispatch; var ReturnCount: Integer; 
                                  var AtEnd: Integer): OleVariant;
    function QuerySelectGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
    function QuerySelectPrepare(var qHandle: OleVariant; const statement: WideString; 
                                containid: Integer; const optional: WideString): OleVariant;
    function StatusDisplayToLogical(const SYS_val: WideString): OleVariant;
    function StatusGet: OleVariant;
    function StatusIsModified: Integer;
    function StatusIsValid(const value: WideString): OleVariant;
    function StatusIsValidDT(SYS_val: OleVariant): Integer;
    function StatusLogicalToDisplay(SYS_val: OleVariant): WideString;
    function StatusNormalize(const SYS_val: WideString): Integer;
    function StatusSet(const newvalue: WideString): OleVariant;
    function StatusSetModified(newvalue: Integer): Integer;
    function SubCoursesGet: IDispatch;
    function SubCoursesGetObject(force: Integer): OleVariant;
    function SubCoursesGetObjectId(force: Integer): WideString;
    function SubCoursesIsModified: Integer;
    function SubCoursesNewObject: IDispatch;
    function SubCoursesSet(const newvalue: WideString): OleVariant;
    function SubCoursesSetModified(newvalue: Integer): Integer;
    function SubjectLevelDisplayToLogical(const SYS_val: WideString): Integer;
    function SubjectLevelGet: Integer;
    function SubjectLevelIsModified: Integer;
    function SubjectLevelIsValid(const value: WideString): OleVariant;
    function SubjectLevelIsValidDT(SYS_val: Integer): Integer;
    function SubjectLevelLogicalToDisplay(SYS_val: Integer): WideString;
    function SubjectLevelNormalize(const SYS_val: WideString): Integer;
    function SubjectLevelSet(const newvalue: WideString): OleVariant;
    function SubjectLevelSetModified(newvalue: Integer): Integer;
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
    property  ControlInterface: CSubjectBachelor read GetControlInterface;
    property  DefaultInterface: CSubjectBachelor read GetControlInterface;
    property English: IDispatch index 64 read GetIDispatchProp write SetIDispatchProp;
    property IsOf: IDispatch index 66 read GetIDispatchProp write SetIDispatchProp;
    property PossibleGrades: IDispatch index 67 read GetIDispatchProp write SetIDispatchProp;
    property Prerequisites: IDispatch index 68 read GetIDispatchProp write SetIDispatchProp;
    property Status: OleVariant index 69 read GetOleVariantProp write SetOleVariantProp;
    property SubCourses: IDispatch index 70 read GetIDispatchProp write SetIDispatchProp;
    property Thai: IDispatch index 72 read GetIDispatchProp write SetIDispatchProp;
  published
    property Credit: Double index 61 read GetDoubleProp write SetDoubleProp stored False;
    property Credit1: Double index 62 read GetDoubleProp write SetDoubleProp stored False;
    property Credit2: Double index 63 read GetDoubleProp write SetDoubleProp stored False;
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property ExtSubjectID: WideString index 65 read GetWideStringProp write SetWideStringProp stored False;
    property SubjectLevel: Integer index 71 read GetIntegerProp write SetIntegerProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TSubjectBachelor.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{02539D13-CB3D-4390-927F-F9D161D31397}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TSubjectBachelor.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CSubjectBachelor;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSubjectBachelor.GetControlInterface: CSubjectBachelor;
begin
  CreateControl;
  Result := FIntf;
end;

function TSubjectBachelor.Get_English: IDispatch;
begin
  Result := DefaultInterface.English;
end;

procedure TSubjectBachelor.Set_English(const Value: IDispatch);
begin
  DefaultInterface.English := Value;
end;

function TSubjectBachelor.Get_IsOf: IDispatch;
begin
  Result := DefaultInterface.IsOf;
end;

procedure TSubjectBachelor.Set_IsOf(const Value: IDispatch);
begin
  DefaultInterface.IsOf := Value;
end;

function TSubjectBachelor.Get_PossibleGrades: IDispatch;
begin
  Result := DefaultInterface.PossibleGrades;
end;

procedure TSubjectBachelor.Set_PossibleGrades(const Value: IDispatch);
begin
  DefaultInterface.PossibleGrades := Value;
end;

function TSubjectBachelor.Get_Prerequisites: IDispatch;
begin
  Result := DefaultInterface.Prerequisites;
end;

procedure TSubjectBachelor.Set_Prerequisites(const Value: IDispatch);
begin
  DefaultInterface.Prerequisites := Value;
end;

function TSubjectBachelor.Get_Status: OleVariant;
begin
  Result := DefaultInterface.Status;
end;

procedure TSubjectBachelor.Set_Status(Value: OleVariant);
begin
  DefaultInterface.Status := Value;
end;

function TSubjectBachelor.Get_SubCourses: IDispatch;
begin
  Result := DefaultInterface.SubCourses;
end;

procedure TSubjectBachelor.Set_SubCourses(const Value: IDispatch);
begin
  DefaultInterface.SubCourses := Value;
end;

function TSubjectBachelor.Get_Thai: IDispatch;
begin
  Result := DefaultInterface.Thai;
end;

procedure TSubjectBachelor.Set_Thai(const Value: IDispatch);
begin
  DefaultInterface.Thai := Value;
end;

function TSubjectBachelor.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TSubjectBachelor.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TSubjectBachelor.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TSubjectBachelor.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TSubjectBachelor.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TSubjectBachelor.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                           var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TSubjectBachelor.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TSubjectBachelor.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TSubjectBachelor.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TSubjectBachelor.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TSubjectBachelor.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TSubjectBachelor.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TSubjectBachelor.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TSubjectBachelor.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TSubjectBachelor.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TSubjectBachelor.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TSubjectBachelor.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TSubjectBachelor.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TSubjectBachelor.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TSubjectBachelor.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TSubjectBachelor.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TSubjectBachelor.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TSubjectBachelor.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TSubjectBachelor.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TSubjectBachelor.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TSubjectBachelor.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TSubjectBachelor.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TSubjectBachelor.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TSubjectBachelor.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TSubjectBachelor.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TSubjectBachelor.Credit1DisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.Credit1DisplayToLogical(SYS_val);
end;

function TSubjectBachelor.Credit1Get: Double;
begin
  Result := DefaultInterface.Credit1Get;
end;

function TSubjectBachelor.Credit1IsModified: Integer;
begin
  Result := DefaultInterface.Credit1IsModified;
end;

function TSubjectBachelor.Credit1IsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.Credit1IsValid(value);
end;

function TSubjectBachelor.Credit1IsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.Credit1IsValidDT(SYS_val);
end;

function TSubjectBachelor.Credit1LogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.Credit1LogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.Credit1Normalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.Credit1Normalize(SYS_val);
end;

function TSubjectBachelor.Credit1Set(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.Credit1Set(newvalue);
end;

function TSubjectBachelor.Credit1SetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.Credit1SetModified(newvalue);
end;

function TSubjectBachelor.Credit2DisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.Credit2DisplayToLogical(SYS_val);
end;

function TSubjectBachelor.Credit2Get: Double;
begin
  Result := DefaultInterface.Credit2Get;
end;

function TSubjectBachelor.Credit2IsModified: Integer;
begin
  Result := DefaultInterface.Credit2IsModified;
end;

function TSubjectBachelor.Credit2IsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.Credit2IsValid(value);
end;

function TSubjectBachelor.Credit2IsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.Credit2IsValidDT(SYS_val);
end;

function TSubjectBachelor.Credit2LogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.Credit2LogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.Credit2Normalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.Credit2Normalize(SYS_val);
end;

function TSubjectBachelor.Credit2Set(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.Credit2Set(newvalue);
end;

function TSubjectBachelor.Credit2SetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.Credit2SetModified(newvalue);
end;

function TSubjectBachelor.CreditDisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.CreditDisplayToLogical(SYS_val);
end;

function TSubjectBachelor.CreditGet: Double;
begin
  Result := DefaultInterface.CreditGet;
end;

function TSubjectBachelor.CreditIsModified: Integer;
begin
  Result := DefaultInterface.CreditIsModified;
end;

function TSubjectBachelor.CreditIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.CreditIsValid(value);
end;

function TSubjectBachelor.CreditIsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.CreditIsValidDT(SYS_val);
end;

function TSubjectBachelor.CreditLogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.CreditLogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.CreditNormalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.CreditNormalize(SYS_val);
end;

function TSubjectBachelor.CreditSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.CreditSet(newvalue);
end;

function TSubjectBachelor.CreditSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.CreditSetModified(newvalue);
end;

function TSubjectBachelor.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TSubjectBachelor.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TSubjectBachelor.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TSubjectBachelor.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TSubjectBachelor.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TSubjectBachelor.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TSubjectBachelor.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TSubjectBachelor.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TSubjectBachelor.EnglishGet: IDispatch;
begin
  Result := DefaultInterface.EnglishGet;
end;

function TSubjectBachelor.EnglishGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.EnglishGetObject(force);
end;

function TSubjectBachelor.EnglishGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.EnglishGetObjectId(force);
end;

function TSubjectBachelor.EnglishIsModified: Integer;
begin
  Result := DefaultInterface.EnglishIsModified;
end;

function TSubjectBachelor.EnglishIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishIsValid(value);
end;

function TSubjectBachelor.EnglishNewObject: IDispatch;
begin
  Result := DefaultInterface.EnglishNewObject;
end;

function TSubjectBachelor.EnglishSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishSet(newvalue);
end;

function TSubjectBachelor.EnglishSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.EnglishSetModified(newvalue);
end;

function TSubjectBachelor.EnglishSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.EnglishSetObject(newvalue);
end;

function TSubjectBachelor.EnglishSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.EnglishSetObjectId(newid);
end;

function TSubjectBachelor.ExtSubjectIDDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtSubjectIDDisplayToLogical(SYS_val);
end;

function TSubjectBachelor.ExtSubjectIDGet: WideString;
begin
  Result := DefaultInterface.ExtSubjectIDGet;
end;

function TSubjectBachelor.ExtSubjectIDIsModified: Integer;
begin
  Result := DefaultInterface.ExtSubjectIDIsModified;
end;

function TSubjectBachelor.ExtSubjectIDIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtSubjectIDIsValid(value);
end;

function TSubjectBachelor.ExtSubjectIDIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.ExtSubjectIDIsValidDT(SYS_val);
end;

function TSubjectBachelor.ExtSubjectIDLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtSubjectIDLogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.ExtSubjectIDNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.ExtSubjectIDNormalize(SYS_val);
end;

function TSubjectBachelor.ExtSubjectIDSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtSubjectIDSet(newvalue);
end;

function TSubjectBachelor.ExtSubjectIDSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ExtSubjectIDSetModified(newvalue);
end;

function TSubjectBachelor.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TSubjectBachelor.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TSubjectBachelor.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                      var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TSubjectBachelor.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                          var RowSet: IDispatch; var ReturnCount: Integer; 
                                          var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TSubjectBachelor.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                        var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TSubjectBachelor.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                        containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TSubjectBachelor.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TSubjectBachelor.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

function TSubjectBachelor.IsOfGet: IDispatch;
begin
  Result := DefaultInterface.IsOfGet;
end;

function TSubjectBachelor.IsOfGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.IsOfGetObject(force);
end;

function TSubjectBachelor.IsOfGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.IsOfGetObjectId(force);
end;

function TSubjectBachelor.IsOfIsModified: Integer;
begin
  Result := DefaultInterface.IsOfIsModified;
end;

function TSubjectBachelor.IsOfIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfIsValid(value);
end;

function TSubjectBachelor.IsOfNewObject: IDispatch;
begin
  Result := DefaultInterface.IsOfNewObject;
end;

function TSubjectBachelor.IsOfSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSet(newvalue);
end;

function TSubjectBachelor.IsOfSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.IsOfSetModified(newvalue);
end;

function TSubjectBachelor.IsOfSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObject(newvalue);
end;

function TSubjectBachelor.IsOfSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.IsOfSetObjectId(newid);
end;

function TSubjectBachelor.PossibleGradesGet: IDispatch;
begin
  Result := DefaultInterface.PossibleGradesGet;
end;

function TSubjectBachelor.PossibleGradesGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.PossibleGradesGetObject(force);
end;

function TSubjectBachelor.PossibleGradesGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.PossibleGradesGetObjectId(force);
end;

function TSubjectBachelor.PossibleGradesIsModified: Integer;
begin
  Result := DefaultInterface.PossibleGradesIsModified;
end;

function TSubjectBachelor.PossibleGradesNewObject: IDispatch;
begin
  Result := DefaultInterface.PossibleGradesNewObject;
end;

function TSubjectBachelor.PossibleGradesSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.PossibleGradesSet(newvalue);
end;

function TSubjectBachelor.PossibleGradesSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.PossibleGradesSetModified(newvalue);
end;

procedure TSubjectBachelor.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TSubjectBachelor.PrerequisitesGet: IDispatch;
begin
  Result := DefaultInterface.PrerequisitesGet;
end;

function TSubjectBachelor.PrerequisitesGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.PrerequisitesGetObject(force);
end;

function TSubjectBachelor.PrerequisitesGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.PrerequisitesGetObjectId(force);
end;

function TSubjectBachelor.PrerequisitesIsModified: Integer;
begin
  Result := DefaultInterface.PrerequisitesIsModified;
end;

function TSubjectBachelor.PrerequisitesNewObject: IDispatch;
begin
  Result := DefaultInterface.PrerequisitesNewObject;
end;

function TSubjectBachelor.PrerequisitesSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.PrerequisitesSet(newvalue);
end;

function TSubjectBachelor.PrerequisitesSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.PrerequisitesSetModified(newvalue);
end;

function TSubjectBachelor.QueryIsOfClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfClose(qHandle);
end;

function TSubjectBachelor.QueryIsOfExecute(var qHandle: OleVariant; const deptid: IDispatch): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfExecute(qHandle, deptid);
end;

function TSubjectBachelor.QueryIsOfFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                         var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetch(qHandle, Row, AtEnd);
end;

function TSubjectBachelor.QueryIsOfFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                             SYS_qacn: Integer; var AtEnd: Integer; 
                                             var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TSubjectBachelor.QueryIsOfFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                             var RowSet: IDispatch; var ReturnCount: Integer; 
                                             var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TSubjectBachelor.QueryIsOfGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                           var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TSubjectBachelor.QueryIsOfPrepare(var qHandle: OleVariant; const statement: WideString; 
                                           containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryIsOfPrepare(qHandle, statement, containid, optional);
end;

function TSubjectBachelor.QuerySelectClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QuerySelectClose(qHandle);
end;

function TSubjectBachelor.QuerySelectExecute(var qHandle: OleVariant; const x: WideString): OleVariant;
begin
  Result := DefaultInterface.QuerySelectExecute(qHandle, x);
end;

function TSubjectBachelor.QuerySelectFetch(var qHandle: OleVariant; var Row: IDispatch; 
                                           var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySelectFetch(qHandle, Row, AtEnd);
end;

function TSubjectBachelor.QuerySelectFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                               SYS_qacn: Integer; var AtEnd: Integer; 
                                               var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySelectFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TSubjectBachelor.QuerySelectFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                               var RowSet: IDispatch; var ReturnCount: Integer; 
                                               var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.QuerySelectFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TSubjectBachelor.QuerySelectGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                             var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.QuerySelectGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TSubjectBachelor.QuerySelectPrepare(var qHandle: OleVariant; const statement: WideString; 
                                             containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.QuerySelectPrepare(qHandle, statement, containid, optional);
end;

function TSubjectBachelor.StatusDisplayToLogical(const SYS_val: WideString): OleVariant;
begin
  Result := DefaultInterface.StatusDisplayToLogical(SYS_val);
end;

function TSubjectBachelor.StatusGet: OleVariant;
begin
  Result := DefaultInterface.StatusGet;
end;

function TSubjectBachelor.StatusIsModified: Integer;
begin
  Result := DefaultInterface.StatusIsModified;
end;

function TSubjectBachelor.StatusIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.StatusIsValid(value);
end;

function TSubjectBachelor.StatusIsValidDT(SYS_val: OleVariant): Integer;
begin
  Result := DefaultInterface.StatusIsValidDT(SYS_val);
end;

function TSubjectBachelor.StatusLogicalToDisplay(SYS_val: OleVariant): WideString;
begin
  Result := DefaultInterface.StatusLogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.StatusNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.StatusNormalize(SYS_val);
end;

function TSubjectBachelor.StatusSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.StatusSet(newvalue);
end;

function TSubjectBachelor.StatusSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.StatusSetModified(newvalue);
end;

function TSubjectBachelor.SubCoursesGet: IDispatch;
begin
  Result := DefaultInterface.SubCoursesGet;
end;

function TSubjectBachelor.SubCoursesGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SubCoursesGetObject(force);
end;

function TSubjectBachelor.SubCoursesGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.SubCoursesGetObjectId(force);
end;

function TSubjectBachelor.SubCoursesIsModified: Integer;
begin
  Result := DefaultInterface.SubCoursesIsModified;
end;

function TSubjectBachelor.SubCoursesNewObject: IDispatch;
begin
  Result := DefaultInterface.SubCoursesNewObject;
end;

function TSubjectBachelor.SubCoursesSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.SubCoursesSet(newvalue);
end;

function TSubjectBachelor.SubCoursesSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.SubCoursesSetModified(newvalue);
end;

function TSubjectBachelor.SubjectLevelDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.SubjectLevelDisplayToLogical(SYS_val);
end;

function TSubjectBachelor.SubjectLevelGet: Integer;
begin
  Result := DefaultInterface.SubjectLevelGet;
end;

function TSubjectBachelor.SubjectLevelIsModified: Integer;
begin
  Result := DefaultInterface.SubjectLevelIsModified;
end;

function TSubjectBachelor.SubjectLevelIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.SubjectLevelIsValid(value);
end;

function TSubjectBachelor.SubjectLevelIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.SubjectLevelIsValidDT(SYS_val);
end;

function TSubjectBachelor.SubjectLevelLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.SubjectLevelLogicalToDisplay(SYS_val);
end;

function TSubjectBachelor.SubjectLevelNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.SubjectLevelNormalize(SYS_val);
end;

function TSubjectBachelor.SubjectLevelSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.SubjectLevelSet(newvalue);
end;

function TSubjectBachelor.SubjectLevelSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.SubjectLevelSetModified(newvalue);
end;

function TSubjectBachelor.ThaiGet: IDispatch;
begin
  Result := DefaultInterface.ThaiGet;
end;

function TSubjectBachelor.ThaiGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.ThaiGetObject(force);
end;

function TSubjectBachelor.ThaiGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.ThaiGetObjectId(force);
end;

function TSubjectBachelor.ThaiIsModified: Integer;
begin
  Result := DefaultInterface.ThaiIsModified;
end;

function TSubjectBachelor.ThaiIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiIsValid(value);
end;

function TSubjectBachelor.ThaiNewObject: IDispatch;
begin
  Result := DefaultInterface.ThaiNewObject;
end;

function TSubjectBachelor.ThaiSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiSet(newvalue);
end;

function TSubjectBachelor.ThaiSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.ThaiSetModified(newvalue);
end;

function TSubjectBachelor.ThaiSetObject(newvalue: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ThaiSetObject(newvalue);
end;

function TSubjectBachelor.ThaiSetObjectId(const newid: WideString): OleVariant;
begin
  Result := DefaultInterface.ThaiSetObjectId(newid);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TSubjectBachelor]);
end;

end.
