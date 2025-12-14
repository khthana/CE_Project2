unit User_Dummy_TLB;

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
// File generated on 12/2/2002 2:34:28 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\MyProgram\Projects\Program\TLB\User_Dummy.tlb (1)
// LIBID: {C96E41CE-CF3F-49FE-A939-12368B800F27}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TDummy) : Registry key CLSID\{6923EAA4-DE84-47F7-BB8F-DB6DEB5C81B0}\ToolboxBitmap32 not found
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
  User_DummyMajorVersion = 1;
  User_DummyMinorVersion = 0;

  LIBID_User_Dummy: TGUID = '{C96E41CE-CF3F-49FE-A939-12368B800F27}';

  DIID_CDummy: TGUID = '{B0D82FCA-1D08-4A21-B7A3-004A37E361ED}';
  CLASS_Dummy: TGUID = '{6923EAA4-DE84-47F7-BB8F-DB6DEB5C81B0}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CDummy = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Dummy = CDummy;


// *********************************************************************//
// DispIntf:  CDummy
// Flags:     (4112) Hidden Dispatchable
// GUID:      {B0D82FCA-1D08-4A21-B7A3-004A37E361ED}
// *********************************************************************//
  CDummy = dispinterface
    ['{B0D82FCA-1D08-4A21-B7A3-004A37E361ED}']
    property DeleteTag: Integer dispid 41;
    function SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 43;
    function SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function SYS_Close: OleVariant; dispid 2;
    function SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                              var instancecount: WideString): OleVariant; dispid 19;
    function SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function SYS_Exists(oid: OleVariant): OleVariant; dispid 47;
    function SYS_ExistsId(const id: WideString): OleVariant; dispid 48;
    function SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function SYS_IsModified: Integer; dispid 5;
    function SYS_KillExtent: OleVariant; dispid 49;
    function SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function SYS_NormalizeObject: OleVariant; dispid 7;
    function SYS_Oid: OleVariant; dispid 30;
    function SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function SYS_PackageName: WideString; dispid 8;
    function SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 52;
    function SYS_RollBack: OleVariant; dispid 35;
    function SYS_Save(related: Integer): OleVariant; dispid 36;
    function SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 55;
    function SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 56;
    function SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function CheckDependency: OleVariant; dispid 57;
    function DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 88;
    function DeleteTagGet: Integer; dispid 89;
    function DeleteTagIsModified: Integer; dispid 93;
    function DeleteTagIsValid(const value: WideString): OleVariant; dispid 94;
    function DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 95;
    function DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 96;
    function DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 98;
    function DeleteTagSet(const newvalue: WideString): OleVariant; dispid 100;
    function DeleteTagSetModified(newvalue: Integer): Integer; dispid 101;
    function ExtentClose(qHandle: OleVariant): OleVariant; dispid 106;
    function ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 107;
    function ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 108;
    function ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                             var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 110;
    function ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                           var qHandle: OleVariant): OleVariant; dispid 111;
    function ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                           containid: Integer; const optional: WideString): OleVariant; dispid 112;
    function GetClassName: WideString; dispid 58;
    function GetParentClass: WideString; dispid 59;
    procedure PrepareDeleting; dispid 60;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDummy
// Help String      : Cache Object: User.Dummy CoClass
// Default Interface: CDummy
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TDummy = class(TOleControl)
  private
    FIntf: CDummy;
    function  GetControlInterface: CDummy;
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
    property  ControlInterface: CDummy read GetControlInterface;
    property  DefaultInterface: CDummy read GetControlInterface;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TDummy.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{6923EAA4-DE84-47F7-BB8F-DB6DEB5C81B0}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TDummy.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CDummy;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDummy.GetControlInterface: CDummy;
begin
  CreateControl;
  Result := FIntf;
end;

function TDummy.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_BuildIndices(idxlist);
end;

function TDummy.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_CheckUnique(idxlist);
end;

function TDummy.SYS_ClassName(fullname: OleVariant): WideString;
begin
  Result := DefaultInterface.SYS_ClassName(fullname);
end;

function TDummy.SYS_Close: OleVariant;
begin
  Result := DefaultInterface.SYS_Close;
end;

function TDummy.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Delete(oid, concurrency);
end;

function TDummy.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                 var instancecount: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function TDummy.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function TDummy.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function TDummy.SYS_Exists(oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_Exists(oid);
end;

function TDummy.SYS_ExistsId(const id: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_ExistsId(id);
end;

function TDummy.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function TDummy.SYS_Id: WideString;
begin
  Result := DefaultInterface.SYS_Id;
end;

procedure TDummy.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function TDummy.SYS_IsA(const isclass: WideString): Integer;
begin
  Result := DefaultInterface.SYS_IsA(isclass);
end;

function TDummy.SYS_IsModified: Integer;
begin
  Result := DefaultInterface.SYS_IsModified;
end;

function TDummy.SYS_KillExtent: OleVariant;
begin
  Result := DefaultInterface.SYS_KillExtent;
end;

function TDummy.SYS_New(const initvalue: WideString): IDispatch;
begin
  Result := DefaultInterface.SYS_New(initvalue);
end;

function TDummy.SYS_NormalizeObject: OleVariant;
begin
  Result := DefaultInterface.SYS_NormalizeObject;
end;

function TDummy.SYS_Oid: OleVariant;
begin
  Result := DefaultInterface.SYS_Oid;
end;

function TDummy.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_Open(oid, concurrency);
end;

function TDummy.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  Result := DefaultInterface.SYS_OpenId(id, concurrency);
end;

function TDummy.SYS_PackageName: WideString;
begin
  Result := DefaultInterface.SYS_PackageName;
end;

function TDummy.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  Result := DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function TDummy.SYS_RollBack: OleVariant;
begin
  Result := DefaultInterface.SYS_RollBack;
end;

function TDummy.SYS_Save(related: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_Save(related);
end;

function TDummy.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function TDummy.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function TDummy.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  Result := DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function TDummy.SYS_ValidateObject(force: Integer): OleVariant;
begin
  Result := DefaultInterface.SYS_ValidateObject(force);
end;

function TDummy.CheckDependency: OleVariant;
begin
  Result := DefaultInterface.CheckDependency;
end;

function TDummy.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function TDummy.DeleteTagGet: Integer;
begin
  Result := DefaultInterface.DeleteTagGet;
end;

function TDummy.DeleteTagIsModified: Integer;
begin
  Result := DefaultInterface.DeleteTagIsModified;
end;

function TDummy.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagIsValid(value);
end;

function TDummy.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function TDummy.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  Result := DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function TDummy.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  Result := DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function TDummy.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  Result := DefaultInterface.DeleteTagSet(newvalue);
end;

function TDummy.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  Result := DefaultInterface.DeleteTagSetModified(newvalue);
end;

function TDummy.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentClose(qHandle);
end;

function TDummy.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentExecute(qHandle);
end;

function TDummy.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function TDummy.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                var RowSet: IDispatch; var ReturnCount: Integer; var AtEnd: Integer): OleVariant;
begin
  Result := DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function TDummy.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                              var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function TDummy.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                              containid: Integer; const optional: WideString): OleVariant;
begin
  Result := DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function TDummy.GetClassName: WideString;
begin
  Result := DefaultInterface.GetClassName;
end;

function TDummy.GetParentClass: WideString;
begin
  Result := DefaultInterface.GetParentClass;
end;

procedure TDummy.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TDummy]);
end;

end.
