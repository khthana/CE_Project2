unit User_Teacher_TLB;

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
// File generated on 16/3/2002 11:17:48 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Project\VC\Utils\Debug\User_Teacher.tlb (1)
// LIBID: {539E916C-7C82-4819-9426-94CAF65A2A7B}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Error creating palette bitmap of (TTeacher) : Registry key CLSID\{48F4E1FB-A081-48A3-BCF4-BF827F3F613B}\ToolboxBitmap32 not found
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
  User_TeacherMajorVersion = 1;
  User_TeacherMinorVersion = 0;

  LIBID_User_Teacher: TGUID = '{539E916C-7C82-4819-9426-94CAF65A2A7B}';

  DIID_CTeacher: TGUID = '{E0284258-3AFC-4CCF-9324-5597174BBABF}';
  CLASS_Teacher: TGUID = '{48F4E1FB-A081-48A3-BCF4-BF827F3F613B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  CTeacher = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Teacher = CTeacher;


// *********************************************************************//
// DispIntf:  CTeacher
// Flags:     (4112) Hidden Dispatchable
// GUID:      {E0284258-3AFC-4CCF-9324-5597174BBABF}
// *********************************************************************//
  CTeacher = dispinterface
    ['{E0284258-3AFC-4CCF-9324-5597174BBABF}']
    property DeleteTag: Integer dispid 41;
    property English: IDispatch dispid 61;
    property ExtTeacherID: WideString dispid 62;
    property IsOf: IDispatch dispid 63;
    property PositionEDU: IDispatch dispid 64;
    property Thai: IDispatch dispid 65;
    function  SYS_BuildIndices(const idxlist: IDispatch): OleVariant; dispid 67;
    function  SYS_CheckUnique(const idxlist: IDispatch): OleVariant; dispid 16;
    function  SYS_ClassName(fullname: OleVariant): WideString; dispid 1;
    function  SYS_Close: OleVariant; dispid 2;
    function  SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant; dispid 17;
    function  SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                               var instancecount: WideString): OleVariant; dispid 19;
    function  SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant; dispid 20;
    function  SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant; dispid 21;
    function  SYS_Exists(oid: OleVariant): OleVariant; dispid 71;
    function  SYS_ExistsId(const id: WideString): OleVariant; dispid 72;
    function  SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant; dispid 24;
    function  SYS_Id: WideString; dispid 25;
    procedure SYS_IncrementCount; dispid 3;
    function  SYS_IsA(const isclass: WideString): Integer; dispid 4;
    function  SYS_IsModified: Integer; dispid 5;
    function  SYS_KillExtent: OleVariant; dispid 73;
    function  SYS_New(const initvalue: WideString): IDispatch; dispid 6;
    function  SYS_NormalizeObject: OleVariant; dispid 7;
    function  SYS_Oid: OleVariant; dispid 30;
    function  SYS_Open(oid: OleVariant; concurrency: Integer): WideString; dispid 31;
    function  SYS_OpenId(const id: WideString; concurrency: Integer): WideString; dispid 32;
    function  SYS_PackageName: WideString; dispid 8;
    function  SYS_PurgeIndices(const idxlist: IDispatch): OleVariant; dispid 76;
    function  SYS_RollBack: OleVariant; dispid 35;
    function  SYS_Save(related: Integer): OleVariant; dispid 36;
    function  SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant; dispid 79;
    function  SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant; dispid 80;
    function  SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant; dispid 40;
    function  SYS_ValidateObject(force: Integer): OleVariant; dispid 10;
    function  CheckDependency: OleVariant; dispid 57;
    function  DeleteTagDisplayToLogical(const SYS_val: WideString): Integer; dispid 108;
    function  DeleteTagGet: Integer; dispid 109;
    function  DeleteTagIsModified: Integer; dispid 113;
    function  DeleteTagIsValid(const value: WideString): OleVariant; dispid 114;
    function  DeleteTagIsValidDT(SYS_val: Integer): Integer; dispid 115;
    function  DeleteTagLogicalToDisplay(SYS_val: Integer): WideString; dispid 116;
    function  DeleteTagNormalize(const SYS_val: WideString): Integer; dispid 118;
    function  DeleteTagSet(const newvalue: WideString): OleVariant; dispid 120;
    function  DeleteTagSetModified(newvalue: Integer): Integer; dispid 121;
    function  EnglishGet: IDispatch; dispid 125;
    function  EnglishGetObject(force: Integer): OleVariant; dispid 126;
    function  EnglishGetObjectId(force: Integer): WideString; dispid 127;
    function  EnglishIsModified: Integer; dispid 129;
    function  EnglishIsValid(const value: WideString): OleVariant; dispid 130;
    function  EnglishNewObject: IDispatch; dispid 131;
    function  EnglishSet(const newvalue: WideString): OleVariant; dispid 133;
    function  EnglishSetModified(newvalue: Integer): Integer; dispid 134;
    function  EnglishSetObject(newvalue: OleVariant): OleVariant; dispid 135;
    function  EnglishSetObjectId(const newid: WideString): OleVariant; dispid 136;
    function  ExtTeacherIDDisplayToLogical(const SYS_val: WideString): WideString; dispid 138;
    function  ExtTeacherIDGet: WideString; dispid 139;
    function  ExtTeacherIDIsModified: Integer; dispid 143;
    function  ExtTeacherIDIsValid(const value: WideString): OleVariant; dispid 144;
    function  ExtTeacherIDIsValidDT(const SYS_val: WideString): Integer; dispid 145;
    function  ExtTeacherIDLogicalToDisplay(const SYS_val: WideString): WideString; dispid 146;
    function  ExtTeacherIDNormalize(const SYS_val: WideString): WideString; dispid 148;
    function  ExtTeacherIDSet(const newvalue: WideString): OleVariant; dispid 150;
    function  ExtTeacherIDSetModified(newvalue: Integer): Integer; dispid 151;
    function  ExtentClose(qHandle: OleVariant): OleVariant; dispid 195;
    function  ExtentExecute(var qHandle: OleVariant): OleVariant; dispid 196;
    function  ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant; dispid 197;
    function  ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; var RowSet: IDispatch; 
                              var ReturnCount: Integer; var AtEnd: Integer): OleVariant; dispid 199;
    function  ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; var idinfo: IDispatch; 
                            var qHandle: OleVariant): OleVariant; dispid 200;
    function  ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                            containid: Integer; const optional: WideString): OleVariant; dispid 201;
    function  GetClassName: WideString; dispid 58;
    function  GetParentClass: WideString; dispid 59;
    function  IsOfGet: IDispatch; dispid 155;
    function  IsOfGetObject(force: Integer): OleVariant; dispid 156;
    function  IsOfGetObjectId(force: Integer): WideString; dispid 157;
    function  IsOfIsModified: Integer; dispid 159;
    function  IsOfIsValid(const value: WideString): OleVariant; dispid 160;
    function  IsOfNewObject: IDispatch; dispid 161;
    function  IsOfSet(const newvalue: WideString): OleVariant; dispid 163;
    function  IsOfSetModified(newvalue: Integer): Integer; dispid 164;
    function  IsOfSetObject(newvalue: OleVariant): OleVariant; dispid 165;
    function  IsOfSetObjectId(const newid: WideString): OleVariant; dispid 166;
    function  PositionEDUGet: IDispatch; dispid 168;
    function  PositionEDUGetObject(force: Integer): OleVariant; dispid 169;
    function  PositionEDUGetObjectId(force: Integer): WideString; dispid 170;
    function  PositionEDUIsModified: Integer; dispid 172;
    function  PositionEDUIsValid(const value: WideString): OleVariant; dispid 173;
    function  PositionEDUNewObject: IDispatch; dispid 174;
    function  PositionEDUSet(const newvalue: WideString): OleVariant; dispid 176;
    function  PositionEDUSetModified(newvalue: Integer): Integer; dispid 177;
    function  PositionEDUSetObject(newvalue: OleVariant): OleVariant; dispid 178;
    function  PositionEDUSetObjectId(const newid: WideString): OleVariant; dispid 179;
    procedure PrepareDeleting; dispid 60;
    function  ThaiGet: IDispatch; dispid 181;
    function  ThaiGetObject(force: Integer): OleVariant; dispid 182;
    function  ThaiGetObjectId(force: Integer): WideString; dispid 183;
    function  ThaiIsModified: Integer; dispid 185;
    function  ThaiIsValid(const value: WideString): OleVariant; dispid 186;
    function  ThaiNewObject: IDispatch; dispid 187;
    function  ThaiSet(const newvalue: WideString): OleVariant; dispid 189;
    function  ThaiSetModified(newvalue: Integer): Integer; dispid 190;
    function  ThaiSetObject(newvalue: OleVariant): OleVariant; dispid 191;
    function  ThaiSetObjectId(const newid: WideString): OleVariant; dispid 192;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTeacher
// Help String      : Cache Object: User.Teacher CoClass
// Default Interface: CTeacher
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TTeacher = class(TOleControl)
  private
    FIntf: CTeacher;
    function  GetControlInterface: CTeacher;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_English: IDispatch;
    procedure Set_English(const Value: IDispatch);
    function Get_IsOf: IDispatch;
    procedure Set_IsOf(const Value: IDispatch);
    function Get_PositionEDU: IDispatch;
    procedure Set_PositionEDU(const Value: IDispatch);
    function Get_Thai: IDispatch;
    procedure Set_Thai(const Value: IDispatch);
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
    function  EnglishGet: IDispatch;
    function  EnglishGetObject(force: Integer): OleVariant;
    function  EnglishGetObjectId(force: Integer): WideString;
    function  EnglishIsModified: Integer;
    function  EnglishIsValid(const value: WideString): OleVariant;
    function  EnglishNewObject: IDispatch;
    function  EnglishSet(const newvalue: WideString): OleVariant;
    function  EnglishSetModified(newvalue: Integer): Integer;
    function  EnglishSetObject(newvalue: OleVariant): OleVariant;
    function  EnglishSetObjectId(const newid: WideString): OleVariant;
    function  ExtTeacherIDDisplayToLogical(const SYS_val: WideString): WideString;
    function  ExtTeacherIDGet: WideString;
    function  ExtTeacherIDIsModified: Integer;
    function  ExtTeacherIDIsValid(const value: WideString): OleVariant;
    function  ExtTeacherIDIsValidDT(const SYS_val: WideString): Integer;
    function  ExtTeacherIDLogicalToDisplay(const SYS_val: WideString): WideString;
    function  ExtTeacherIDNormalize(const SYS_val: WideString): WideString;
    function  ExtTeacherIDSet(const newvalue: WideString): OleVariant;
    function  ExtTeacherIDSetModified(newvalue: Integer): Integer;
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
    function  IsOfGet: IDispatch;
    function  IsOfGetObject(force: Integer): OleVariant;
    function  IsOfGetObjectId(force: Integer): WideString;
    function  IsOfIsModified: Integer;
    function  IsOfIsValid(const value: WideString): OleVariant;
    function  IsOfNewObject: IDispatch;
    function  IsOfSet(const newvalue: WideString): OleVariant;
    function  IsOfSetModified(newvalue: Integer): Integer;
    function  IsOfSetObject(newvalue: OleVariant): OleVariant;
    function  IsOfSetObjectId(const newid: WideString): OleVariant;
    function  PositionEDUGet: IDispatch;
    function  PositionEDUGetObject(force: Integer): OleVariant;
    function  PositionEDUGetObjectId(force: Integer): WideString;
    function  PositionEDUIsModified: Integer;
    function  PositionEDUIsValid(const value: WideString): OleVariant;
    function  PositionEDUNewObject: IDispatch;
    function  PositionEDUSet(const newvalue: WideString): OleVariant;
    function  PositionEDUSetModified(newvalue: Integer): Integer;
    function  PositionEDUSetObject(newvalue: OleVariant): OleVariant;
    function  PositionEDUSetObjectId(const newid: WideString): OleVariant;
    procedure PrepareDeleting;
    function  ThaiGet: IDispatch;
    function  ThaiGetObject(force: Integer): OleVariant;
    function  ThaiGetObjectId(force: Integer): WideString;
    function  ThaiIsModified: Integer;
    function  ThaiIsValid(const value: WideString): OleVariant;
    function  ThaiNewObject: IDispatch;
    function  ThaiSet(const newvalue: WideString): OleVariant;
    function  ThaiSetModified(newvalue: Integer): Integer;
    function  ThaiSetObject(newvalue: OleVariant): OleVariant;
    function  ThaiSetObjectId(const newid: WideString): OleVariant;
    property  ControlInterface: CTeacher read GetControlInterface;
    property  DefaultInterface: CTeacher read GetControlInterface;
    property English: IDispatch index 61 read GetIDispatchProp write SetIDispatchProp;
    property IsOf: IDispatch index 63 read GetIDispatchProp write SetIDispatchProp;
    property PositionEDU: IDispatch index 64 read GetIDispatchProp write SetIDispatchProp;
    property Thai: IDispatch index 65 read GetIDispatchProp write SetIDispatchProp;
  published
    property DeleteTag: Integer index 41 read GetIntegerProp write SetIntegerProp stored False;
    property ExtTeacherID: WideString index 62 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TTeacher.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{48F4E1FB-A081-48A3-BCF4-BF827F3F613B}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TTeacher.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as CTeacher;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTeacher.GetControlInterface: CTeacher;
begin
  CreateControl;
  Result := FIntf;
end;

function TTeacher.Get_English: IDispatch;
begin
  Result := DefaultInterface.English;
end;

procedure TTeacher.Set_English(const Value: IDispatch);
begin
  DefaultInterface.English := Value;
end;

function TTeacher.Get_IsOf: IDispatch;
begin
  Result := DefaultInterface.IsOf;
end;

procedure TTeacher.Set_IsOf(const Value: IDispatch);
begin
  DefaultInterface.IsOf := Value;
end;

function TTeacher.Get_PositionEDU: IDispatch;
begin
  Result := DefaultInterface.PositionEDU;
end;

procedure TTeacher.Set_PositionEDU(const Value: IDispatch);
begin
  DefaultInterface.PositionEDU := Value;
end;

function TTeacher.Get_Thai: IDispatch;
begin
  Result := DefaultInterface.Thai;
end;

procedure TTeacher.Set_Thai(const Value: IDispatch);
begin
  DefaultInterface.Thai := Value;
end;

function  TTeacher.SYS_BuildIndices(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_BuildIndices(idxlist);
end;

function  TTeacher.SYS_CheckUnique(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_CheckUnique(idxlist);
end;

function  TTeacher.SYS_ClassName(fullname: OleVariant): WideString;
begin
  DefaultInterface.SYS_ClassName(fullname);
end;

function  TTeacher.SYS_Close: OleVariant;
begin
  DefaultInterface.SYS_Close;
end;

function  TTeacher.SYS_Delete(oid: OleVariant; concurrency: Integer): OleVariant;
begin
  DefaultInterface.SYS_Delete(oid, concurrency);
end;

function  TTeacher.SYS_DeleteExtent(concurrency: Integer; var deletecount: WideString; 
                                    var instancecount: WideString): OleVariant;
begin
  DefaultInterface.SYS_DeleteExtent(concurrency, deletecount, instancecount);
end;

function  TTeacher.SYS_DeleteId(const id: WideString; concurrency: Integer): OleVariant;
begin
  DefaultInterface.SYS_DeleteId(id, concurrency);
end;

function  TTeacher.SYS_DowngradeConcurrency(const concurrency: WideString): OleVariant;
begin
  DefaultInterface.SYS_DowngradeConcurrency(concurrency);
end;

function  TTeacher.SYS_Exists(oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_Exists(oid);
end;

function  TTeacher.SYS_ExistsId(const id: WideString): OleVariant;
begin
  DefaultInterface.SYS_ExistsId(id);
end;

function  TTeacher.SYS_GetSwizzleObject(force: Integer; var oid: OleVariant): OleVariant;
begin
  DefaultInterface.SYS_GetSwizzleObject(force, oid);
end;

function  TTeacher.SYS_Id: WideString;
begin
  DefaultInterface.SYS_Id;
end;

procedure TTeacher.SYS_IncrementCount;
begin
  DefaultInterface.SYS_IncrementCount;
end;

function  TTeacher.SYS_IsA(const isclass: WideString): Integer;
begin
  DefaultInterface.SYS_IsA(isclass);
end;

function  TTeacher.SYS_IsModified: Integer;
begin
  DefaultInterface.SYS_IsModified;
end;

function  TTeacher.SYS_KillExtent: OleVariant;
begin
  DefaultInterface.SYS_KillExtent;
end;

function  TTeacher.SYS_New(const initvalue: WideString): IDispatch;
begin
  DefaultInterface.SYS_New(initvalue);
end;

function  TTeacher.SYS_NormalizeObject: OleVariant;
begin
  DefaultInterface.SYS_NormalizeObject;
end;

function  TTeacher.SYS_Oid: OleVariant;
begin
  DefaultInterface.SYS_Oid;
end;

function  TTeacher.SYS_Open(oid: OleVariant; concurrency: Integer): WideString;
begin
  DefaultInterface.SYS_Open(oid, concurrency);
end;

function  TTeacher.SYS_OpenId(const id: WideString; concurrency: Integer): WideString;
begin
  DefaultInterface.SYS_OpenId(id, concurrency);
end;

function  TTeacher.SYS_PackageName: WideString;
begin
  DefaultInterface.SYS_PackageName;
end;

function  TTeacher.SYS_PurgeIndices(const idxlist: IDispatch): OleVariant;
begin
  DefaultInterface.SYS_PurgeIndices(idxlist);
end;

function  TTeacher.SYS_RollBack: OleVariant;
begin
  DefaultInterface.SYS_RollBack;
end;

function  TTeacher.SYS_Save(related: Integer): OleVariant;
begin
  DefaultInterface.SYS_Save(related);
end;

function  TTeacher.SYS_SortBegin(const idxlist: IDispatch; excludeunique: Integer): OleVariant;
begin
  DefaultInterface.SYS_SortBegin(idxlist, excludeunique);
end;

function  TTeacher.SYS_SortEnd(const idxlist: IDispatch; commit: Integer): OleVariant;
begin
  DefaultInterface.SYS_SortEnd(idxlist, commit);
end;

function  TTeacher.SYS_UpgradeConcurrency(const concurrency: WideString): OleVariant;
begin
  DefaultInterface.SYS_UpgradeConcurrency(concurrency);
end;

function  TTeacher.SYS_ValidateObject(force: Integer): OleVariant;
begin
  DefaultInterface.SYS_ValidateObject(force);
end;

function  TTeacher.CheckDependency: OleVariant;
begin
  DefaultInterface.CheckDependency;
end;

function  TTeacher.DeleteTagDisplayToLogical(const SYS_val: WideString): Integer;
begin
  DefaultInterface.DeleteTagDisplayToLogical(SYS_val);
end;

function  TTeacher.DeleteTagGet: Integer;
begin
  DefaultInterface.DeleteTagGet;
end;

function  TTeacher.DeleteTagIsModified: Integer;
begin
  DefaultInterface.DeleteTagIsModified;
end;

function  TTeacher.DeleteTagIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.DeleteTagIsValid(value);
end;

function  TTeacher.DeleteTagIsValidDT(SYS_val: Integer): Integer;
begin
  DefaultInterface.DeleteTagIsValidDT(SYS_val);
end;

function  TTeacher.DeleteTagLogicalToDisplay(SYS_val: Integer): WideString;
begin
  DefaultInterface.DeleteTagLogicalToDisplay(SYS_val);
end;

function  TTeacher.DeleteTagNormalize(const SYS_val: WideString): Integer;
begin
  DefaultInterface.DeleteTagNormalize(SYS_val);
end;

function  TTeacher.DeleteTagSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.DeleteTagSet(newvalue);
end;

function  TTeacher.DeleteTagSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.DeleteTagSetModified(newvalue);
end;

function  TTeacher.EnglishGet: IDispatch;
begin
  DefaultInterface.EnglishGet;
end;

function  TTeacher.EnglishGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.EnglishGetObject(force);
end;

function  TTeacher.EnglishGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.EnglishGetObjectId(force);
end;

function  TTeacher.EnglishIsModified: Integer;
begin
  DefaultInterface.EnglishIsModified;
end;

function  TTeacher.EnglishIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.EnglishIsValid(value);
end;

function  TTeacher.EnglishNewObject: IDispatch;
begin
  DefaultInterface.EnglishNewObject;
end;

function  TTeacher.EnglishSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.EnglishSet(newvalue);
end;

function  TTeacher.EnglishSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.EnglishSetModified(newvalue);
end;

function  TTeacher.EnglishSetObject(newvalue: OleVariant): OleVariant;
begin
  DefaultInterface.EnglishSetObject(newvalue);
end;

function  TTeacher.EnglishSetObjectId(const newid: WideString): OleVariant;
begin
  DefaultInterface.EnglishSetObjectId(newid);
end;

function  TTeacher.ExtTeacherIDDisplayToLogical(const SYS_val: WideString): WideString;
begin
  DefaultInterface.ExtTeacherIDDisplayToLogical(SYS_val);
end;

function  TTeacher.ExtTeacherIDGet: WideString;
begin
  DefaultInterface.ExtTeacherIDGet;
end;

function  TTeacher.ExtTeacherIDIsModified: Integer;
begin
  DefaultInterface.ExtTeacherIDIsModified;
end;

function  TTeacher.ExtTeacherIDIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.ExtTeacherIDIsValid(value);
end;

function  TTeacher.ExtTeacherIDIsValidDT(const SYS_val: WideString): Integer;
begin
  DefaultInterface.ExtTeacherIDIsValidDT(SYS_val);
end;

function  TTeacher.ExtTeacherIDLogicalToDisplay(const SYS_val: WideString): WideString;
begin
  DefaultInterface.ExtTeacherIDLogicalToDisplay(SYS_val);
end;

function  TTeacher.ExtTeacherIDNormalize(const SYS_val: WideString): WideString;
begin
  DefaultInterface.ExtTeacherIDNormalize(SYS_val);
end;

function  TTeacher.ExtTeacherIDSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.ExtTeacherIDSet(newvalue);
end;

function  TTeacher.ExtTeacherIDSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.ExtTeacherIDSetModified(newvalue);
end;

function  TTeacher.ExtentClose(qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentClose(qHandle);
end;

function  TTeacher.ExtentExecute(var qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentExecute(qHandle);
end;

function  TTeacher.ExtentFetch(var qHandle: OleVariant; var Row: IDispatch; var AtEnd: Integer): OleVariant;
begin
  DefaultInterface.ExtentFetch(qHandle, Row, AtEnd);
end;

function  TTeacher.ExtentFetchRows(var qHandle: OleVariant; FetchCount: Integer; 
                                   var RowSet: IDispatch; var ReturnCount: Integer; 
                                   var AtEnd: Integer): OleVariant;
begin
  DefaultInterface.ExtentFetchRows(qHandle, FetchCount, RowSet, ReturnCount, AtEnd);
end;

function  TTeacher.ExtentGetInfo(var colinfo: IDispatch; var parminfo: IDispatch; 
                                 var idinfo: IDispatch; var qHandle: OleVariant): OleVariant;
begin
  DefaultInterface.ExtentGetInfo(colinfo, parminfo, idinfo, qHandle);
end;

function  TTeacher.ExtentPrepare(var qHandle: OleVariant; const statement: WideString; 
                                 containid: Integer; const optional: WideString): OleVariant;
begin
  DefaultInterface.ExtentPrepare(qHandle, statement, containid, optional);
end;

function  TTeacher.GetClassName: WideString;
begin
  DefaultInterface.GetClassName;
end;

function  TTeacher.GetParentClass: WideString;
begin
  DefaultInterface.GetParentClass;
end;

function  TTeacher.IsOfGet: IDispatch;
begin
  DefaultInterface.IsOfGet;
end;

function  TTeacher.IsOfGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.IsOfGetObject(force);
end;

function  TTeacher.IsOfGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.IsOfGetObjectId(force);
end;

function  TTeacher.IsOfIsModified: Integer;
begin
  DefaultInterface.IsOfIsModified;
end;

function  TTeacher.IsOfIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.IsOfIsValid(value);
end;

function  TTeacher.IsOfNewObject: IDispatch;
begin
  DefaultInterface.IsOfNewObject;
end;

function  TTeacher.IsOfSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.IsOfSet(newvalue);
end;

function  TTeacher.IsOfSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.IsOfSetModified(newvalue);
end;

function  TTeacher.IsOfSetObject(newvalue: OleVariant): OleVariant;
begin
  DefaultInterface.IsOfSetObject(newvalue);
end;

function  TTeacher.IsOfSetObjectId(const newid: WideString): OleVariant;
begin
  DefaultInterface.IsOfSetObjectId(newid);
end;

function  TTeacher.PositionEDUGet: IDispatch;
begin
  DefaultInterface.PositionEDUGet;
end;

function  TTeacher.PositionEDUGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.PositionEDUGetObject(force);
end;

function  TTeacher.PositionEDUGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.PositionEDUGetObjectId(force);
end;

function  TTeacher.PositionEDUIsModified: Integer;
begin
  DefaultInterface.PositionEDUIsModified;
end;

function  TTeacher.PositionEDUIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.PositionEDUIsValid(value);
end;

function  TTeacher.PositionEDUNewObject: IDispatch;
begin
  DefaultInterface.PositionEDUNewObject;
end;

function  TTeacher.PositionEDUSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.PositionEDUSet(newvalue);
end;

function  TTeacher.PositionEDUSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.PositionEDUSetModified(newvalue);
end;

function  TTeacher.PositionEDUSetObject(newvalue: OleVariant): OleVariant;
begin
  DefaultInterface.PositionEDUSetObject(newvalue);
end;

function  TTeacher.PositionEDUSetObjectId(const newid: WideString): OleVariant;
begin
  DefaultInterface.PositionEDUSetObjectId(newid);
end;

procedure TTeacher.PrepareDeleting;
begin
  DefaultInterface.PrepareDeleting;
end;

function  TTeacher.ThaiGet: IDispatch;
begin
  DefaultInterface.ThaiGet;
end;

function  TTeacher.ThaiGetObject(force: Integer): OleVariant;
begin
  DefaultInterface.ThaiGetObject(force);
end;

function  TTeacher.ThaiGetObjectId(force: Integer): WideString;
begin
  DefaultInterface.ThaiGetObjectId(force);
end;

function  TTeacher.ThaiIsModified: Integer;
begin
  DefaultInterface.ThaiIsModified;
end;

function  TTeacher.ThaiIsValid(const value: WideString): OleVariant;
begin
  DefaultInterface.ThaiIsValid(value);
end;

function  TTeacher.ThaiNewObject: IDispatch;
begin
  DefaultInterface.ThaiNewObject;
end;

function  TTeacher.ThaiSet(const newvalue: WideString): OleVariant;
begin
  DefaultInterface.ThaiSet(newvalue);
end;

function  TTeacher.ThaiSetModified(newvalue: Integer): Integer;
begin
  DefaultInterface.ThaiSetModified(newvalue);
end;

function  TTeacher.ThaiSetObject(newvalue: OleVariant): OleVariant;
begin
  DefaultInterface.ThaiSetObject(newvalue);
end;

function  TTeacher.ThaiSetObjectId(const newid: WideString): OleVariant;
begin
  DefaultInterface.ThaiSetObjectId(newid);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TTeacher]);
end;

end.
