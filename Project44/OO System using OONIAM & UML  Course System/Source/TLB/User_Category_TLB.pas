unit User_Category_TLB;

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
// File generated on 19/3/2002 0:05:28 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Project1703\VC\Utils\Debug\User_Category.tlb (1)
// LIBID: {712B2A53-3ADA-45C2-BC9D-497CCB957D09}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TCategory) : Registry key CLSID\{F9346AF9-9082-4390-AEEB-0E5BB0F658D6}\ToolboxBitmap32 not found
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
  User_CategoryMajorVersion = 1;
  User_CategoryMinorVersion = 0;

  LIBID_User_Category: TGUID = '{712B2A53-3ADA-45C2-BC9D-497CCB957D09}';

  DIID_CCategory: TGUID = '{87710967-3837-419B-B5F4-9CEB71B950E5}';
  CLASS_Category: TGUID = '{F9346AF9-9082-4390-AEEB-0E5BB0F658D6}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CCategory = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Category = CCategory;


// *********************************************************************//
// DispIntf:  CCategory
// Flags:     (4112) Hidden Dispatchable
// GUID:      {87710967-3837-419B-B5F4-9CEB71B950E5}
// *********************************************************************//
  CCategory = dispinterface
    ['{87710967-3837-419B-B5F4-9CEB71B950E5}']
    property DeleteTag: Integer dispid 41;
    property MinAvg: Double dispid 63;
    property Name: WideString dispid 64;
    property Required: Double dispid 65;
    property SubjectGrps: IDispatch dispid 66;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 68;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 72;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 73;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 74;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 77;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 80;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 81;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 109;
    function DeleteTagGet: Integer; dispid 110;
    function DeleteTagIsModified: Integer; dispid 114;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 115;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 116;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 117;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 119;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 121;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 122;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 191;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 192;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 193;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 195;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 196;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 197;
    function GetClassName: WideString; dispid 58;
    function GetLucky: Integer; dispid 59;
    function GetParentClass: WideString; dispid 60;
    function MinAvgDisplayToLogical(const SYS_val: WideString): Double; dispid 126;
    function MinAvgGet: Double; dispid 127;
    function MinAvgIsModified: Integer; dispid 131;
    function MinAvgIsValid(const value: WideString): OleVariant; dispid 132;
    function MinAvgIsValidDT(SYS_val: Double): Integer; dispid 133;
    function MinAvgLogicalToDisplay(SYS_val: Double): WideString; dispid 134;
    function MinAvgNormalize(const SYS_val: WideString): Double; dispid 136;
    function MinAvgSet(const newvalue: WideString): OleVariant; dispid 138;
    function MinAvgSetModified(newvalue: Integer): Integer; dispid 139;
    function NameDisplayToLogical(const SYS_val: WideString): WideString; dispid 143;
    function NameGet: WideString; dispid 144;
    function NameIsModified: Integer; dispid 148;
    function NameIsValid(const value: WideString): OleVariant; dispid 149;
    function NameIsValidDT(const SYS_val: WideString): Integer; dispid 150;
    function NameLogicalToDisplay(const SYS_val: WideString): WideString; dispid 151;
    function NameNormalize(const SYS_val: WideString): WideString; dispid 153;
    function NameSet(const newvalue: WideString): OleVariant; dispid 155;
    function NameSetModified(newvalue: Integer): Integer; dispid 156;
    procedure PrepareDeleting; dispid 61;
    function QueryDelete: WideString; dispid 62;
    function RequiredDisplayToLogical(const SYS_val: WideString): Double; dispid 160;
    function RequiredGet: Double; dispid 161;
    function RequiredIsModified: Integer; dispid 165;
    function RequiredIsValid(const value: WideString): OleVariant; dispid 166;
    function RequiredIsValidDT(SYS_val: Double): Integer; dispid 167;
    function RequiredLogicalToDisplay(SYS_val: Double): WideString; dispid 168;
    function RequiredNormalize(const SYS_val: WideString): Double; dispid 170;
    function RequiredSet(const newvalue: WideString): OleVariant; dispid 172;
    function RequiredSetModified(newvalue: Integer): Integer; dispid 173;
    function SubjectGrpsGet: IDispatch; dispid 177;
    function SubjectGrpsGetObject(force: Integer): OleVariant; dispid 178;
    function SubjectGrpsGetObjectId(force: Integer): WideString; dispid 179;
    function SubjectGrpsIsModified: Integer; dispid 181;
    function SubjectGrpsNewObject: IDispatch; dispid 183;
    function SubjectGrpsSet(const newvalue: WideString): OleVariant; dispid 185;
    function SubjectGrpsSetModified(newvalue: Integer): Integer; dispid 186;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCategory
// Help String      : Cache Object: User.Category CoClass
// Default Interface: CCategory
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCategory = class(TOleControl)
  private
    FIntf: CCategory;
    function  GetControlInterface: CCategory;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_SubjectGrps: IDispatch;
    procedure Set_SubjectGrps(const Value: IDispatch);
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
    function GetLucky: Integer;
    function GetParentClass: WideString;
    function MinAvgDisplayToLogical(const SYS_val: WideString): Double;
    function MinAvgGet: Double;
    function MinAvgIsModified: Integer;
    function MinAvgIsValid(const value: WideString): OleVariant;
    function MinAvgIsValidDT(SYS_val: Double): Integer;
    function MinAvgLogicalToDisplay(SYS_val: Double): WideString;
    function MinAvgNormalize(const SYS_val: WideString): Double;
    function MinAvgSet(const newvalue: WideString): OleVariant;
    function MinAvgSetModified(newvalue: Integer): Integer;
    function NameDisplayToLogical(const SYS_val: WideString): WideString;
    function NameGet: WideString;
    function NameIsModified: Integer;
    function NameIsValid(const value: WideString): OleVariant;
    function NameIsValidDT(const SYS_val: WideString): Integer;
    function NameLogicalToDisplay(const SYS_val: WideString): WideString;
    function NameNormalize(const SYS_val: WideString): WideString;
    function NameSet(const newvalue: WideString): OleVariant;
    function NameSetModified(newvalue: Integer): Integer;
    procedure PrepareDeleting;
    function QueryDelete: WideString;
    function RequiredDisplayToLogical(const SYS_val: WideString): Double;
    function RequiredGet: Double;
    function RequiredIsModified: Integer;
    function RequiredIsValid(const value: WideString): OleVariant;
    function RequiredIsValidDT(SYS_val: Double): Integer;
    function RequiredLogicalToDisplay(SYS_val: Double): WideString;
    function RequiredNormalize(const SYS_val: WideString): Double;
    function RequiredSet(const newvalue: WideString): OleVariant;
    function RequiredSetModified(newvalue: Integer): Integer;
    function SubjectGrpsGet: IDispatch;
    function SubjectGrpsGetObject(force: Integer): OleVariant;
    function SubjectGrpsGetObjectId(force: Integer): WideString;
    function SubjectGrpsIsModified: Integer;
    function SubjectGrpsNewObject: IDispatch;
    function SubjectGrpsSet(const newvalue: WideString): OleVariant;
    function SubjectGrpsSetModified(newvalue: Integer): Integer;
    property  ControlInterface: CCategory read GetControlInterface;
    property  DefaultInterface: CCategory read GetControlInterface;
    property SubjectGrps: IDispatch index 66 read GetIDispatchProp write SetIDispatchProp;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property MinAvg: Double index 63 read GetDoubleProp write SetDoubleProp stored False;
    property Name: WideString index 64 read GetWideStringProp write SetWideStringProp stored False;
    property Required: Double index 65 read GetDoubleProp write SetDoubleProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TCategory.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{F9346AF9-9082-4390-AEEB-0E5BB0F658D6}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TCategory.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CCategory;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCategory.GetControlInterface: CCategory;
begin
  CreateControl;
  Result := FIntf;
end;

function TCategory.Get_SubjectGrps: IDispatch;
begin
  Result := DefaultInterface.SubjectGrps;
end;

procedure TCategory.Set_SubjectGrps(const Value: IDispatch);
begin
  DefaultInterface.SubjectGrps := Value;
end;

function TCategory.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TCategory.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TCategory.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TCategory.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TCategory.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TCategory.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                    var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TCategory.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TCategory.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TCategory.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TCategory.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TCategory.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TCategory.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TCategory.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TCategory.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TCategory.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TCategory.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TCategory.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TCategory.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TCategory.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TCategory.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TCategory.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TCategory.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TCategory.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TCategory.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TCategory.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TCategory.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TCategory.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TCategory.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TCategory.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TCategory.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TCategory.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TCategory.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TCategory.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TCategory.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TCategory.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TCategory.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TCategory.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TCategory.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TCategory.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TCategory.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TCategory.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TCategory.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TCategory.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TCategory.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TCategory.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TCategory.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TCategory.GetLucky: Integer;
begin
  Result := DefaultInterface.GetLucky;
end;

function TCategory.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

function TCategory.MinAvgDisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.MinAvgDisplayToLogical(SYS_val);
end;

function TCategory.MinAvgGet: Double;
begin
  Result := DefaultInterface.MinAvgGet;
end;

function TCategory.MinAvgIsModified: Integer;
begin
  Result := DefaultInterface.MinAvgIsModified;
end;

function TCategory.MinAvgIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.MinAvgIsValid(value);
end;

function TCategory.MinAvgIsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.MinAvgIsValidDT(SYS_val);
end;

function TCategory.MinAvgLogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.MinAvgLogicalToDisplay(SYS_val);
end;

function TCategory.MinAvgNormalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.MinAvgNormalize(SYS_val);
end;

function TCategory.MinAvgSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.MinAvgSet(newvalue);
end;

function TCategory.MinAvgSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.MinAvgSetModified(newvalue);
end;

function TCategory.NameDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameDisplayToLogical(SYS_val);
end;

function TCategory.NameGet: WideString;
begin
  Result := DefaultInterface.NameGet;
end;

function TCategory.NameIsModified: Integer;
begin
  Result := DefaultInterface.NameIsModified;
end;

function TCategory.NameIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.NameIsValid(value);
end;

function TCategory.NameIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.NameIsValidDT(SYS_val);
end;

function TCategory.NameLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameLogicalToDisplay(SYS_val);
end;

function TCategory.NameNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.NameNormalize(SYS_val);
end;

function TCategory.NameSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.NameSet(newvalue);
end;

function TCategory.NameSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.NameSetModified(newvalue);
end;

procedure TCategory.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TCategory.QueryDelete: WideString;
begin
  Result := DefaultInterface.QueryDelete;
end;

function TCategory.RequiredDisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.RequiredDisplayToLogical(SYS_val);
end;

function TCategory.RequiredGet: Double;
begin
  Result := DefaultInterface.RequiredGet;
end;

function TCategory.RequiredIsModified: Integer;
begin
  Result := DefaultInterface.RequiredIsModified;
end;

function TCategory.RequiredIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.RequiredIsValid(value);
end;

function TCategory.RequiredIsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.RequiredIsValidDT(SYS_val);
end;

function TCategory.RequiredLogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.RequiredLogicalToDisplay(SYS_val);
end;

function TCategory.RequiredNormalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.RequiredNormalize(SYS_val);
end;

function TCategory.RequiredSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.RequiredSet(newvalue);
end;

function TCategory.RequiredSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.RequiredSetModified(newvalue);
end;

function TCategory.SubjectGrpsGet: IDispatch;
begin
  Result := DefaultInterface.SubjectGrpsGet;
end;

function TCategory.SubjectGrpsGetObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SubjectGrpsGetObject(force);
end;

function TCategory.SubjectGrpsGetObjectId(force: Integer): WideString;
begin
  Result := DefaultInterface.SubjectGrpsGetObjectId(force);
end;

function TCategory.SubjectGrpsIsModified: Integer;
begin
  Result := DefaultInterface.SubjectGrpsIsModified;
end;

function TCategory.SubjectGrpsNewObject: IDispatch;
begin
  Result := DefaultInterface.SubjectGrpsNewObject;
end;

function TCategory.SubjectGrpsSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.SubjectGrpsSet(newvalue);
end;

function TCategory.SubjectGrpsSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.SubjectGrpsSetModified(newvalue);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCategory]);
end;

end.
