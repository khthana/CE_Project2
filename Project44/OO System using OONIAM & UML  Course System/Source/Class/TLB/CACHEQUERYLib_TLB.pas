unit CACHEQUERYLib_TLB;

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
// File generated on 12/12/2001 21:21:53 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\CacheSys\Bin\CacheQuery.ocx (1)
// LIBID: {C37EFBE6-BC76-11D2-B65D-0000F87C2780}
// LCID: 0
// Helpfile: C:\CacheSys\Bin\CacheQuery.hlp
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
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
  CACHEQUERYLibMajorVersion = 1;
  CACHEQUERYLibMinorVersion = 0;

  LIBID_CACHEQUERYLib: TGUID = '{C37EFBE6-BC76-11D2-B65D-0000F87C2780}';

  DIID__DCacheQuery: TGUID = '{C37EFBE7-BC76-11D2-B65D-0000F87C2780}';
  DIID__DCacheQueryEvents: TGUID = '{C37EFBE8-BC76-11D2-B65D-0000F87C2780}';
  CLASS_CacheQuery: TGUID = '{C37EFBE9-BC76-11D2-B65D-0000F87C2780}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DCacheQuery = dispinterface;
  _DCacheQueryEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CacheQuery = _DCacheQuery;


// *********************************************************************//
// DispIntf:  _DCacheQuery
// Flags:     (4112) Hidden Dispatchable
// GUID:      {C37EFBE7-BC76-11D2-B65D-0000F87C2780}
// *********************************************************************//
  _DCacheQuery = dispinterface
    ['{C37EFBE7-BC76-11D2-B65D-0000F87C2780}']
    property ClassName: WideString dispid 1;
    property QueryName: WideString dispid 2;
    property Factory: IDispatch dispid 10;
    property WaitForUserInput: WordBool dispid 3;
    property QuerySelection: WordBool dispid 4;
    property Title: WideString dispid 5;
    property AutoResize: WordBool dispid 6;
    property HideId: WordBool dispid 7;
    property HideSelection: WordBool dispid 8;
    property MaxToDisplay: Integer dispid 9;
    function  FindId: WideString; dispid 11;
    procedure SetParam(Index: Smallint; const ParamValue: WideString); dispid 12;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  _DCacheQueryEvents
// Flags:     (4096) Dispatchable
// GUID:      {C37EFBE8-BC76-11D2-B65D-0000F87C2780}
// *********************************************************************//
  _DCacheQueryEvents = dispinterface
    ['{C37EFBE8-BC76-11D2-B65D-0000F87C2780}']
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCacheQuery
// Help String      : CacheQuery Control
// Default Interface: _DCacheQuery
// Def. Intf. DISP? : Yes
// Event   Interface: _DCacheQueryEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCacheQuery = class(TOleControl)
  private
    FIntf: _DCacheQuery;
    function  GetControlInterface: _DCacheQuery;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Factory: IDispatch;
    procedure Set_Factory(const Value: IDispatch);
  public
    function  FindId: WideString;
    procedure SetParam(Index: Smallint; const ParamValue: WideString);
    procedure AboutBox;
    property  ControlInterface: _DCacheQuery read GetControlInterface;
    property  DefaultInterface: _DCacheQuery read GetControlInterface;
    property Factory: IDispatch index 10 read GetIDispatchProp write SetIDispatchProp;
  published
    property ClassName: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property QueryName: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property WaitForUserInput: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property QuerySelection: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Title: WideString index 5 read GetWideStringProp write SetWideStringProp stored False;
    property AutoResize: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property HideId: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property HideSelection: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property MaxToDisplay: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TCacheQuery.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{C37EFBE9-BC76-11D2-B65D-0000F87C2780}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004005*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TCacheQuery.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DCacheQuery;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCacheQuery.GetControlInterface: _DCacheQuery;
begin
  CreateControl;
  Result := FIntf;
end;

function TCacheQuery.Get_Factory: IDispatch;
begin
  Result := DefaultInterface.Factory;
end;

procedure TCacheQuery.Set_Factory(const Value: IDispatch);
begin
  DefaultInterface.Factory := Value;
end;

function  TCacheQuery.FindId: WideString;
begin
  DefaultInterface.FindId;
end;

procedure TCacheQuery.SetParam(Index: Smallint; const ParamValue: WideString);
begin
  DefaultInterface.SetParam(Index, ParamValue);
end;

procedure TCacheQuery.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCacheQuery]);
end;

end.
