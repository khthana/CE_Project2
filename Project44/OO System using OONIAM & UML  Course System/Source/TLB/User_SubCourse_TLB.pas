unit User_SubCourse_TLB;

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
// File generated on 16/3/2002 22:01:15 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Project\VC\Utils\Debug\User_SubCourse.tlb (1)
// LIBID: {3AF1681F-EE16-41AE-A973-08CE3399A2CC}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TSubCourse) : Registry key CLSID\{8DA42EBB-5A00-48C1-8255-10772494B308}\ToolboxBitmap32 not found
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
  User_SubCourseMajorVersion = 1;
  User_SubCourseMinorVersion = 0;

  LIBID_User_SubCourse: TGUID = '{3AF1681F-EE16-41AE-A973-08CE3399A2CC}';

  DIID_CSubCourse: TGUID = '{F9B66E93-C11A-4F15-884B-A28B00CC0BBA}';
  CLASS_SubCourse: TGUID = '{8DA42EBB-5A00-48C1-8255-10772494B308}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CSubCourse = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SubCourse = CSubCourse;


// *********************************************************************//
// DispIntf:  CSubCourse
// Flags:     (4112) Hidden Dispatchable
// GUID:      {F9B66E93-C11A-4F15-884B-A28B00CC0BBA}
// *********************************************************************//
  CSubCourse = dispinterface
    ['{F9B66E93-C11A-4F15-884B-A28B00CC0BBA}']
    property DeleteTag: Integer dispid 41;
    property Schedules: IDispatch dispid 61;
    property SectionNo: Integer dispid 62;
    property StudentInClass: Integer dispid 63;
    property Teacher: IDispatch dispid 64;
    function  SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 66;
    function  SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function  SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function  SYS_Close: OleVariant; dispid 2;
    function  SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function  SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                               var instancecount: WideString): OleVariant; dispid 19;
    function  SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function  SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function  SYS_Exists(oid: OleVariant): OleVariant; dispid 70;
    function  SYS_ExistsId(const id: WideString): OleVariant; dispid 71;
    function  SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function  SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function  SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function  SYS_IsModified: Integer; dispid 5;
    function  SYS_KillExtent: OleVariant; dispid 72;
    function  SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function  SYS_NormalizeObject: OleVariant; dispid 7;
    function  SYS_Oid: OleVariant; dispid 30;
    function  SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function  SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function  SYS_PackageName: WideString; dispid 8;
    function  SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 75;
    function  SYS_RollBack: OleVariant; dispid 35;
    function  SYS_Save(related: Integer): OleVariant; dispid 36;
    function  SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 78;
    function  SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 79;
    function  SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function  SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function  CheckDependency: OleVariant; dispid 57;
    function  DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 107;
    function  DeleteTagGet: Integer; dispid 108;
    function  DeleteTagIsModified: Integer; dispid 112;
    function  DeleteTagIsValid(const value: WideString): OleVariant; dispid 113;
    function  DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 114;
    function  DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 115;
    function  DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 117;
    function  DeleteTagSet(const newvalue: WideString): OleVariant; dispid 119;
    function  DeleteTagSetModified(newvalue: Integer): Integer; dispid 120;
    function  ExtentClose(qHandle: OleVariant): OleVariant; dispid 185;
    function  ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 186;
    function  ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 187;
    function  ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                              var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 189;
    function  ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                            var qHandle: OleVariant): OleVariant; dispid 190;
    function  ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                            containid: Integer; const optional: WideString): OleVariant; dispid 191;
    function  GetClassName: WideString; dispid 58;
    function  GetParentClass: WideString; dispid 59;
    procedure PrepareDeleting; dispid 60;
    function  SchedulesGet: IDispatch; dispid 124;
    function  SchedulesGetObject(force: Integer): OleVariant; dispid 125;
    function  SchedulesGetObjectId(force: Integer): WideString; dispid 126;
    function  SchedulesIsModified: Integer; dispid 128;
    function  SchedulesNewObject: IDispatch; dispid 130;
    function  SchedulesSet(const newvalue: WideString): OleVariant; dispid 132;
    function  SchedulesSetModified(newvalue: Integer): Integer; dispid 133;
    function  SectionNoDisplayToLogical(const SYS_val: WideString): Integer; dispid 137;
    function  SectionNoGet: Integer; dispid 138;
    function  SectionNoIsModified: Integer; dispid 142;
    function  SectionNoIsValid(const value: WideString): OleVariant; dispid 143;
    function  SectionNoIsValidDT(SYS_val: Integer): Integer; dispid 144;
    function  SectionNoLogicalToDisplay(SYS_val: Integer): WideString; dispid 145;
    function  SectionNoNormalize(const SYS_val: WideString): Integer; dispid 147;
    function  SectionNoSet(const newvalue: WideString): OleVariant; dispid 149;
    function  SectionNoSetModified(newvalue: Integer): Integer; dispid 150;
    function  StudentInClassDisplayToLogical(const SYS_val: WideString): Integer; dispid 154;
    function  StudentInClassGet: Integer; dispid 155;
    function  StudentInClassIsModified: Integer; dispid 159;
    function  StudentInClassIsValid(const value: WideString): OleVariant; dispid 160;
    function  StudentInClassIsValidDT(SYS_val: Integer): Integer; dispid 161;
    function  StudentInClassLogicalToDisplay(SYS_val: Integer): WideString; dispid 162;
    function  StudentInClassNormalize(const SYS_val: WideString): Integer; dispid 164;
    function  StudentInClassSet(const newvalue: WideString): OleVariant; dispid 166;
    function  StudentInClassSetModified(newvalue: Integer): Integer; dispid 167;
    function  TeacherGet: IDispatch; dispid 171;
    function  TeacherGetObject(force: Integer): OleVariant; dispid 172;
    function  TeacherGetObjectId(force: Integer): WideString; dispid 173;
    function  TeacherIsModified: Integer; dispid 175;
    function  TeacherIsValid(const value: WideString): OleVariant; dispid 176;
    function  TeacherNewObject: IDispatch; dispid 177;
    function  TeacherSet(const newvalue: WideString): OleVariant; dispid 179;
    function  TeacherSetModified(newvalue: Integer): Integer; dispid 180;
    function  TeacherSetObject(newvalue: OleVariant): OleVariant; dispid 181;
    function  TeacherSetObjectId(const newid: WideString): OleVariant; dispid 182;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSubCourse
// Help String      : Cache Object: User.SubCourse CoClass
// Default Interface: CSubCourse
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TSubCourse = class(TOleControl)
  private
    FIntf: CSubCourse;
    function  GetControlInterface: CSubCourse;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Schedules: IDispatch;
    procedure Set_Schedules(const Value: IDispatch);
    function Get_Teacher: IDispatch;
    procedure Set_Teacher(const Value: IDispatch);
  public
    function  SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
    function  SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
    function  SYS_ClassName(fullname: OleVariant): WideString;
    function  SYS_Close: OleVariant;
    function  SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
    function  SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                               var instancecount: WideString): OleVariant;
    function  SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
    function  SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
    function  SYS_Exists(oid: OleVariant): OleVariant;
    function  SYS_ExistsId(const id: WideString): OleVariant;
    function  SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
    function  SYS_Id: WideString;
    procedure SYS_IncrementCount;
    function  SYS_IsA(const isclass: WideString): Integer;
    function  SYS_IsModified: Integer;
    function  SYS_KillExtent: OleVariant;
    function  SYS_New(const initvalue: WideString): IDispatch;
    function  SYS_NormalizeObject: OleVariant;
    function  SYS_Oid: OleVariant;
    function  SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
    function  SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
    function  SYS_PackageName: WideString;
    function  SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
    function  SYS_RollBack: OleVariant;
    function  SYS_Save(related: Integer): OleVariant;
    function  SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
    function  SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
    function  SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
    function  SYS_ValidateObject(force: Integer): OleVariant;
    function  CheckDependency: OleVariant;
    function  DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
    function  DeleteTagGet: Integer;
    function  DeleteTagIsModified: Integer;
    function  DeleteTagIsValid(const value: WideString): OleVariant;
    function  DeleteTagIsValidDT(SYS_val: Integer): Integer;
    function  DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
    function  DeleteTagNormalize(const SYS_val: WideString): Integer;
    function  DeleteTagSet(const newvalue: WideString): OleVariant;
    function  DeleteTagSetModified(newvalue: Integer): Integer;
    function  ExtentClose(qHandle: OleVariant): OleVariant;
    function  ExtentExecute(var qHandle: OleVariant): OleVariant;
    function  ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function  ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                              var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function  ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                            var qHandle: OleVariant): OleVariant;
    function  ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                            containid: Integer; const optional: WideString): OleVariant;
    function  GetClassName: WideString;
    function  GetParentClass: WideString;
    procedure PrepareDeleting;
    function  SchedulesGet: IDispatch;
    function  SchedulesGetObject(force: Integer): OleVariant;
    function  SchedulesGetObjectId(force: Integer): WideString;
    function  SchedulesIsModified: Integer;
    function  SchedulesNewObject: IDispatch;
    function  SchedulesSet(const newvalue: WideString): OleVariant;
    function  SchedulesSetModified(newvalue: Integer): Integer;
    function  SectionNoDisplayToLogical(const SYS_val: WideString): Integer;
    function  SectionNoGet: Integer;
    function  SectionNoIsModified: Integer;
    function  SectionNoIsValid(const value: WideString): OleVariant;
    function  SectionNoIsValidDT(SYS_val: Integer): Integer;
    function  SectionNoLogicalToDisplay(SYS_val: Integer): WideString;
    function  SectionNoNormalize(const SYS_val: WideString): Integer;
    function  SectionNoSet(const newvalue: WideString): OleVariant;
    function  SectionNoSetModified(newvalue: Integer): Integer;
    function  StudentInClassDisplayToLogical(const SYS_val: WideString): Integer;
    function  StudentInClassGet: Integer;
    function  StudentInClassIsModified: Integer;
    function  StudentInClassIsValid(const value: WideString): OleVariant;
    function  StudentInClassIsValidDT(SYS_val: Integer): Integer;
    function  StudentInClassLogicalToDisplay(SYS_val: Integer): WideString;
    function  StudentInClassNormalize(const SYS_val: WideString): Integer;
    function  StudentInClassSet(const newvalue: WideString): OleVariant;
    function  StudentInClassSetModified(newvalue: Integer): Integer;
    function  TeacherGet: IDispatch;
    function  TeacherGetObject(force: Integer): OleVariant;
    function  TeacherGetObjectId(force: Integer): WideString;
    function  TeacherIsModified: Integer;
    function  TeacherIsValid(const value: WideString): OleVariant;
    function  TeacherNewObject: IDispatch;
    function  TeacherSet(const newvalue: WideString): OleVariant;
    function  TeacherSetModified(newvalue: Integer): Integer;
    function  TeacherSetObject(newvalue: OleVariant): OleVariant;
    function  TeacherSetObjectId(const newid: WideString): OleVariant;
    property  ControlInterface: CSubCourse read GetControlInterface;
    property  DefaultInterface: CSubCourse read GetControlInterface;
    property Schedules: IDispatch index 61 read GetIDispatchProp write SetIDispatchProp;
    property Teacher: IDispatch index 64 read GetIDispatchProp write SetIDispatchProp;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property SectionNo: Integer index 62 read GetIntegerProp write SetIntegerProp stored False;
    property StudentInClass: Integer index 63 read GetIntegerProp write SetIntegerProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TSubCourse.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{8DA42EBB-5A00-48C1-8255-10772494B308}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TSubCourse.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CSubCourse;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSubCourse.GetControlInterface: CSubCourse;
begin
  CreateControl;
  Result := FIntf;
end;

function TSubCourse.Get_Schedules: IDispatch;
begin
  Result := DefaultInterface.Schedules;
end;

procedure TSubCourse.Set_Schedules(const Value: IDispatch);
begin
  DefaultInterface.Schedules := Value;
end;

function TSubCourse.Get_Teacher: IDispatch;
begin
  Result := DefaultInterface.Teacher;
end;

procedure TSubCourse.Set_Teacher(const Value: IDispatch);
begin
  DefaultInterface.Teacher := Value;
end;

function  TSubCourse.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_BuildIndices(idxlist);
end;

function  TSubCourse.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_CheckUnique(idxlist);
end;

function  TSubCourse.SYS_ClassName(fullname: OleVariant): WideString;
begin
  DefaultInterface.SYS_ClassName(fullname);
end;

function  TSubCourse.SYS_Close: OleVariant;
begin
  DefaultInterface.SYS_Close;
end;

function  TSubCourse.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  DefaultInterface.SYS_Delete(oid, concurrency);
end;

function  TSubCourse.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                      var instancecount: WideString): OleVariant;
begin
  DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function  TSubCourse.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function  TSubCourse.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function  TSubCourse.SYS_Exists(oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_Exists(oid);
end;

function  TSubCourse.SYS_ExistsId(const id: WideString): OleVariant;
begin
  DefaultInterface.SYS_ExistsId(id);
end;

function  TSubCourse.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function  TSubCourse.SYS_Id: WideString;
begin
  DefaultInterface.SYS_Id;
end;

procedure TSubCourse.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function  TSubCourse.SYS_IsA(const isclass: WideString): Integer;
begin
  DefaultInterface.SYS_IsA(isclass);
end;

function  TSubCourse.SYS_IsModified: Integer;
begin
  DefaultInterface.SYS_IsModified;
end;

function  TSubCourse.SYS_KillExtent: OleVariant;
begin
  DefaultInterface.SYS_KillExtent;
end;

function  TSubCourse.SYS_New(const initvalue: WideString): IDispatch;
begin
  DefaultInterface.SYS_New(initvalue);
end;

function  TSubCourse.SYS_NormalizeObject: OleVariant;
begin
  DefaultInterface.SYS_NormalizeObject;
end;

function  TSubCourse.SYS_Oid: OleVariant;
begin
  DefaultInterface.SYS_Oid;
end;

function  TSubCourse.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  DefaultInterface.SYS_Open(oid, concurrency);
end;

function  TSubCourse.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  DefaultInterface.SYS_OpenId(id, concurrency);
end;

function  TSubCourse.SYS_PackageName: WideString;
begin
  DefaultInterface.SYS_PackageName;
end;

function  TSubCourse.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function  TSubCourse.SYS_RollBack: OleVariant;
begin
  DefaultInterface.SYS_RollBack;
end;

function  TSubCourse.SYS_Save(related: Integer): OleVariant;
begin
  DefaultInterface.SYS_Save(related);
end;

function  TSubCourse.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function  TSubCourse.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function  TSubCourse.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function  TSubCourse.SYS_ValidateObject(force: Integer): OleVariant;
begin
  DefaultInterface.SYS_ValidateObject(force);
end;

function  TSubCourse.CheckDependency: OleVariant;
begin
  DefaultInterface.CheckDependency;
end;

function  TSubCourse.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function  TSubCourse.DeleteTagGet: Integer;
begin
  DefaultInterface.DeleteTagGet;
end;

function  TSubCourse.DeleteTagIsModified: Integer;
begin
  DefaultInterface.DeleteTagIsModified;
end;

function  TSubCourse.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.DeleteTagIsValid(value);
end;

function  TSubCourse.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function  TSubCourse.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function  TSubCourse.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function  TSubCourse.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.DeleteTagSet(newvalue);
end;

function  TSubCourse.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.DeleteTagSetModified(newvalue);
end;

function  TSubCourse.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentClose(qHandle);
end;

function  TSubCourse.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentExecute(qHandle);
end;

function  TSubCourse.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function  TSubCourse.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                     var RowSet: IDispatch; var ReturnCount: Integer; 
                                     var AtEnd: Integer): OleVariant;
begin
  DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function  TSubCourse.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                   var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function  TSubCourse.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                   containid: Integer; const optional: WideString): OleVariant;
begin
  DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function  TSubCourse.GetClassName: WideString;
begin
  DefaultInterface.GetClassName;
end;

function  TSubCourse.GetParentClass: WideString;
begin
  DefaultInterface.GetParentClass;
end;

procedure TSubCourse.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function  TSubCourse.SchedulesGet: IDispatch;
begin
  DefaultInterface.SchedulesGet;
end;

function  TSubCourse.SchedulesGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.SchedulesGetObject(force);
end;

function  TSubCourse.SchedulesGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.SchedulesGetObjectId(force);
end;

function  TSubCourse.SchedulesIsModified: Integer;
begin
  DefaultInterface.SchedulesIsModified;
end;

function  TSubCourse.SchedulesNewObject: IDispatch;
begin
  DefaultInterface.SchedulesNewObject;
end;

function  TSubCourse.SchedulesSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.SchedulesSet(newvalue);
end;

function  TSubCourse.SchedulesSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.SchedulesSetModified(newvalue);
end;

function  TSubCourse.SectionNoDisplayToLogical(const SYS_val: WideString): Integer;
begin
  DefaultInterface.SectionNoDisplayToLogical(SYS_val);
end;

function  TSubCourse.SectionNoGet: Integer;
begin
  DefaultInterface.SectionNoGet;
end;

function  TSubCourse.SectionNoIsModified: Integer;
begin
  DefaultInterface.SectionNoIsModified;
end;

function  TSubCourse.SectionNoIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.SectionNoIsValid(value);
end;

function  TSubCourse.SectionNoIsValidDT(SYS_val: Integer): Integer;
begin
  DefaultInterface.SectionNoIsValidDT(SYS_val);
end;

function  TSubCourse.SectionNoLogicalToDisplay(SYS_val: Integer): WideString;
begin
  DefaultInterface.SectionNoLogicalToDisplay(SYS_val);
end;

function  TSubCourse.SectionNoNormalize(const SYS_val: WideString): Integer;
begin
  DefaultInterface.SectionNoNormalize(SYS_val);
end;

function  TSubCourse.SectionNoSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.SectionNoSet(newvalue);
end;

function  TSubCourse.SectionNoSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.SectionNoSetModified(newvalue);
end;

function  TSubCourse.StudentInClassDisplayToLogical(const SYS_val: WideString): Integer;
begin
  DefaultInterface.StudentInClassDisplayToLogical(SYS_val);
end;

function  TSubCourse.StudentInClassGet: Integer;
begin
  DefaultInterface.StudentInClassGet;
end;

function  TSubCourse.StudentInClassIsModified: Integer;
begin
  DefaultInterface.StudentInClassIsModified;
end;

function  TSubCourse.StudentInClassIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.StudentInClassIsValid(value);
end;

function  TSubCourse.StudentInClassIsValidDT(SYS_val: Integer): Integer;
begin
  DefaultInterface.StudentInClassIsValidDT(SYS_val);
end;

function  TSubCourse.StudentInClassLogicalToDisplay(SYS_val: Integer): WideString;
begin
  DefaultInterface.StudentInClassLogicalToDisplay(SYS_val);
end;

function  TSubCourse.StudentInClassNormalize(const SYS_val: WideString): Integer;
begin
  DefaultInterface.StudentInClassNormalize(SYS_val);
end;

function  TSubCourse.StudentInClassSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.StudentInClassSet(newvalue);
end;

function  TSubCourse.StudentInClassSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.StudentInClassSetModified(newvalue);
end;

function  TSubCourse.TeacherGet: IDispatch;
begin
  DefaultInterface.TeacherGet;
end;

function  TSubCourse.TeacherGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.TeacherGetObject(force);
end;

function  TSubCourse.TeacherGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.TeacherGetObjectId(force);
end;

function  TSubCourse.TeacherIsModified: Integer;
begin
  DefaultInterface.TeacherIsModified;
end;

function  TSubCourse.TeacherIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.TeacherIsValid(value);
end;

function  TSubCourse.TeacherNewObject: IDispatch;
begin
  DefaultInterface.TeacherNewObject;
end;

function  TSubCourse.TeacherSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.TeacherSet(newvalue);
end;

function  TSubCourse.TeacherSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.TeacherSetModified(newvalue);
end;

function  TSubCourse.TeacherSetObject(newvalue: OleVariant): OleVariant;
begin
  DefaultInterface.TeacherSetObject(newvalue);
end;

function  TSubCourse.TeacherSetObjectId(const newid: WideString): OleVariant;
begin
  DefaultInterface.TeacherSetObjectId(newid);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TSubCourse]);
end;

end.
