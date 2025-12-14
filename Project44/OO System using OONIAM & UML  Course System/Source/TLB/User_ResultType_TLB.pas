unit User_ResultType_TLB;

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
// File generated on 26/2/2002 22:38:02 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Projects\Program\TLB\User_ResultType.tlb (1)
// LIBID: {7363E27C-8175-46BB-997A-58C5A2E8E31D}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TResultType) : Registry key CLSID\{52102C10-D9AD-4FA9-9EDD-FE4C96EEDAED}\ToolboxBitmap32 not found
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
  User_ResultTypeMajorVersion = 1;
  User_ResultTypeMinorVersion = 0;

  LIBID_User_ResultType: TGUID = '{7363E27C-8175-46BB-997A-58C5A2E8E31D}';

  DIID_CResultType: TGUID = '{827C879B-8C94-4D03-82DC-B6E8B28791D8}';
  CLASS_ResultType: TGUID = '{52102C10-D9AD-4FA9-9EDD-FE4C96EEDAED}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CResultType = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ResultType = CResultType;


// *********************************************************************//
// DispIntf:  CResultType
// Flags:     (4112) Hidden Dispatchable
// GUID:      {827C879B-8C94-4D03-82DC-B6E8B28791D8}
// *********************************************************************//
  CResultType = dispinterface
    ['{827C879B-8C94-4D03-82DC-B6E8B28791D8}']
    property DeleteTag: Integer dispid 41;
    property Description: WideString dispid 61;
    property Display: WideString dispid 62;
    property Weight: Double dispid 63;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 66;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 70;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 71;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 72;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 75;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 78;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 79;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 107;
    function DeleteTagGet: Integer; dispid 108;
    function DeleteTagIsModified: Integer; dispid 112;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 113;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 114;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 115;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 117;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 119;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 120;
    function DescriptionDisplayToLogical(const SYS_val: WideString): WideString; dispid 124;
    function DescriptionGet: WideString; dispid 125;
    function DescriptionIsModified: Integer; dispid 129;
    function DescriptionIsValid(const value: WideString): OleVariant; dispid 130;
    function DescriptionIsValidDT(const SYS_val: WideString): Integer; dispid 131;
    function DescriptionLogicalToDisplay(const SYS_val: WideString): WideString; dispid 132;
    function DescriptionNormalize(const SYS_val: WideString): WideString; dispid 134;
    function DescriptionSet(const newvalue: WideString): OleVariant; dispid 136;
    function DescriptionSetModified(newvalue: Integer): Integer; dispid 137;
    function DetailsClose(qHandle: OleVariant): OleVariant; dispid 176;
    function DetailsExecute(var qHandle: OleVariant): OleVariant; dispid 177;
    function DetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 178;
    function DetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                              var AtEnd: Integer; var SQLCODE: Integer): OleVariant; dispid 179;
    function DetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                              var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 180;
    function DetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                            var qHandle: OleVariant): OleVariant; dispid 181;
    function DetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                            containid: Integer; const optional: WideString): OleVariant; dispid 182;
    function DisplayDisplayToLogical(const SYS_val: WideString): WideString; dispid 141;
    function DisplayGet: WideString; dispid 142;
    function DisplayIsModified: Integer; dispid 146;
    function DisplayIsValid(const value: WideString): OleVariant; dispid 147;
    function DisplayIsValidDT(const SYS_val: WideString): Integer; dispid 148;
    function DisplayLogicalToDisplay(const SYS_val: WideString): WideString; dispid 149;
    function DisplayNormalize(const SYS_val: WideString): WideString; dispid 151;
    function DisplaySet(const newvalue: WideString): OleVariant; dispid 153;
    function DisplaySetModified(newvalue: Integer): Integer; dispid 154;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 183;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 184;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 185;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 187;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 188;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 189;
    function GetClassName: WideString; dispid 58;
    function GetParentClass: WideString; dispid 59;
    procedure PrepareDeleting; dispid 60;
    function WeightDisplayToLogical(const SYS_val: WideString): Double; dispid 158;
    function WeightGet: Double; dispid 159;
    function WeightIsModified: Integer; dispid 163;
    function WeightIsValid(const value: WideString): OleVariant; dispid 164;
    function WeightIsValidDT(SYS_val: Double): Integer; dispid 165;
    function WeightLogicalToDisplay(SYS_val: Double): WideString; dispid 166;
    function WeightNormalize(const SYS_val: WideString): Double; dispid 168;
    function WeightSet(const newvalue: WideString): OleVariant; dispid 170;
    function WeightSetModified(newvalue: Integer): Integer; dispid 171;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TResultType
// Help String      : Cache Object: User.ResultType CoClass
// Default Interface: CResultType
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TResultType = class(TOleControl)
  private
    FIntf: CResultType;
    function  GetControlInterface: CResultType;
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
    function DescriptionDisplayToLogical(const SYS_val: WideString): WideString;
    function DescriptionGet: WideString;
    function DescriptionIsModified: Integer;
    function DescriptionIsValid(const value: WideString): OleVariant;
    function DescriptionIsValidDT(const SYS_val: WideString): Integer;
    function DescriptionLogicalToDisplay(const SYS_val: WideString): WideString;
    function DescriptionNormalize(const SYS_val: WideString): WideString;
    function DescriptionSet(const newvalue: WideString): OleVariant;
    function DescriptionSetModified(newvalue: Integer): Integer;
    function DetailsClose(qHandle: OleVariant): OleVariant;
    function DetailsExecute(var qHandle: OleVariant): OleVariant;
    function DetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
    function DetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; SYS_qacn: Integer; 
                              var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
    function DetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                              var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
    function DetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                            var qHandle: OleVariant): OleVariant;
    function DetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                            containid: Integer; const optional: WideString): OleVariant;
    function DisplayDisplayToLogical(const SYS_val: WideString): WideString;
    function DisplayGet: WideString;
    function DisplayIsModified: Integer;
    function DisplayIsValid(const value: WideString): OleVariant;
    function DisplayIsValidDT(const SYS_val: WideString): Integer;
    function DisplayLogicalToDisplay(const SYS_val: WideString): WideString;
    function DisplayNormalize(const SYS_val: WideString): WideString;
    function DisplaySet(const newvalue: WideString): OleVariant;
    function DisplaySetModified(newvalue: Integer): Integer;
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
    function WeightDisplayToLogical(const SYS_val: WideString): Double;
    function WeightGet: Double;
    function WeightIsModified: Integer;
    function WeightIsValid(const value: WideString): OleVariant;
    function WeightIsValidDT(SYS_val: Double): Integer;
    function WeightLogicalToDisplay(SYS_val: Double): WideString;
    function WeightNormalize(const SYS_val: WideString): Double;
    function WeightSet(const newvalue: WideString): OleVariant;
    function WeightSetModified(newvalue: Integer): Integer;
    property  ControlInterface: CResultType read GetControlInterface;
    property  DefaultInterface: CResultType read GetControlInterface;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property Description: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property Display: WideString index 62 read GetWideStringProp write SetWideStringProp stored False;
    property Weight: Double index 63 read GetDoubleProp write SetDoubleProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TResultType.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{52102C10-D9AD-4FA9-9EDD-FE4C96EEDAED}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TResultType.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CResultType;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TResultType.GetControlInterface: CResultType;
begin
  CreateControl;
  Result := FIntf;
end;

function TResultType.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TResultType.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TResultType.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TResultType.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TResultType.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TResultType.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                      var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TResultType.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TResultType.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TResultType.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TResultType.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TResultType.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TResultType.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TResultType.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TResultType.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TResultType.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TResultType.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TResultType.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TResultType.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TResultType.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TResultType.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TResultType.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TResultType.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TResultType.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TResultType.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TResultType.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TResultType.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TResultType.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TResultType.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TResultType.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TResultType.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TResultType.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TResultType.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TResultType.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TResultType.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TResultType.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TResultType.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TResultType.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TResultType.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TResultType.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TResultType.DescriptionDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionDisplayToLogical(SYS_val);
end;

function TResultType.DescriptionGet: WideString;
begin
  Result := DefaultInterface.DescriptionGet;
end;

function TResultType.DescriptionIsModified: Integer;
begin
  Result := DefaultInterface.DescriptionIsModified;
end;

function TResultType.DescriptionIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DescriptionIsValid(value);
end;

function TResultType.DescriptionIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DescriptionIsValidDT(SYS_val);
end;

function TResultType.DescriptionLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionLogicalToDisplay(SYS_val);
end;

function TResultType.DescriptionNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DescriptionNormalize(SYS_val);
end;

function TResultType.DescriptionSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DescriptionSet(newvalue);
end;

function TResultType.DescriptionSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DescriptionSetModified(newvalue);
end;

function TResultType.DetailsClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.DetailsClose(qHandle);
end;

function TResultType.DetailsExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.DetailsExecute(qHandle);
end;

function TResultType.DetailsFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.DetailsFetch(qHandle, Row, AtEnd);
end;

function TResultType.DetailsFetchODBC(var qHandle: OleVariant; var SYS_d: WideString; 
                                      SYS_qacn: Integer; var AtEnd: Integer; var SQLCODE: Integer): OleVariant;
begin
  Result := DefaultInterface.DetailsFetchODBC(qHandle, SYS_d, SYS_qacn, AtEnd, SQLCODE);
end;

function TResultType.DetailsFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                      var RowSet: IDispatch; var ReturnCount: Integer; 
                                      var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.DetailsFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TResultType.DetailsGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                    var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.DetailsGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TResultType.DetailsPrepare(var qHandle: OleVariant; const statement: WideString; 
                                    containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.DetailsPrepare(qHandle, statement, containid, optional);
end;

function TResultType.DisplayDisplayToLogical(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DisplayDisplayToLogical(SYS_val);
end;

function TResultType.DisplayGet: WideString;
begin
  Result := DefaultInterface.DisplayGet;
end;

function TResultType.DisplayIsModified: Integer;
begin
  Result := DefaultInterface.DisplayIsModified;
end;

function TResultType.DisplayIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DisplayIsValid(value);
end;

function TResultType.DisplayIsValidDT(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DisplayIsValidDT(SYS_val);
end;

function TResultType.DisplayLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DisplayLogicalToDisplay(SYS_val);
end;

function TResultType.DisplayNormalize(const SYS_val: WideString): WideString;
begin
  Result := DefaultInterface.DisplayNormalize(SYS_val);
end;

function TResultType.DisplaySet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DisplaySet(newvalue);
end;

function TResultType.DisplaySetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DisplaySetModified(newvalue);
end;

function TResultType.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TResultType.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TResultType.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TResultType.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                     var RowSet: IDispatch; var ReturnCount: Integer; 
                                     var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TResultType.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                   var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TResultType.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                   containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TResultType.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TResultType.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

procedure TResultType.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function TResultType.WeightDisplayToLogical(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.WeightDisplayToLogical(SYS_val);
end;

function TResultType.WeightGet: Double;
begin
  Result := DefaultInterface.WeightGet;
end;

function TResultType.WeightIsModified: Integer;
begin
  Result := DefaultInterface.WeightIsModified;
end;

function TResultType.WeightIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.WeightIsValid(value);
end;

function TResultType.WeightIsValidDT(SYS_val: Double): Integer;
begin
  Result := DefaultInterface.WeightIsValidDT(SYS_val);
end;

function TResultType.WeightLogicalToDisplay(SYS_val: Double): WideString;
begin
  Result := DefaultInterface.WeightLogicalToDisplay(SYS_val);
end;

function TResultType.WeightNormalize(const SYS_val: WideString): Double;
begin
  Result := DefaultInterface.WeightNormalize(SYS_val);
end;

function TResultType.WeightSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.WeightSet(newvalue);
end;

function TResultType.WeightSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.WeightSetModified(newvalue);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TResultType]);
end;

end.
